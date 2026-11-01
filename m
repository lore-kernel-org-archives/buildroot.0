Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC51A606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C1gidNZ8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82F3340243;
	Sun,  1 Nov 2026 17:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8j3IhdcqTo7; Sun,  1 Nov 2026 17:09:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BF6F24032B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552941;
	b=PZFAYClvJOm+5jhM5biiznRnrH3Yz3oMJ0dFYldB2/g4SXcS6UlmXib/J25bLBsDqDyn
	 J+RQFvTY2FoT7ZUeTye9x34SWCFY93T2o+Y3Yt5aGH3rd85AuBMOfZCBye3t8m8FzeNwt
	 Btgzcj3NGUhBKvYSIABx+WACWSzU1lede7RoPNiiqOIJED5kVNevEyAlLDLl+QO1eZi1Q
	 lqJgp4saiYu08tPIeoXYyyyHfnFs0fORAHN0Cksuj4ITUxUScbjyDu8i+P5IY80MEOT3k
	 noArdoKXOLAgbIH5ZOIEUvwJZedMuJIPK4P5Dk753q0RzpGk1nNY2tQZoNt+ehPc5sQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552941;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=fXggvkfMeg6Jm85C66dN1bjkZqUpPQ5OpWJRSQfK2jjL1G4NfP5A1kAdZu45YY7lCSw1
	 rC+/qm5s3Wv2aECc8Pk7X1fYXYpjyWI3FDT1h1hY3S+4eoHPpX9QNA6qcdy7xznw85ai6
	 xTZdWy+bZEXw82CWxgtVaqNzQMi7h88ZI/xGChalxJ1pzu0PHn5/pS/rs41rDPpdYtfky
	 NtNj+PpCsmMWOexJof/P41DPHQcgAIzFP0EC1OOvDAeCDHNCD2HB5Jb9UC41FbcDf/TBp
	 k8sNwT0N+92gwxfph4N4tmQgD2j+iw8NRCDKkVNg9wsJgUEzWS9tQEpOA/KaDNS0dbg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552941;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C1gidNZ8zN+Kf5u6iYz9bYlyeu2pp3yw5usBxbFiP3MsKsEF4XX9D712bDLvQHkW8
	 /qLfB1UaJElhJavj/8gkAHeDA2wMBEjWdw2b5tCsVO1KlQ7jplVsNQn64+EzI5C3BG
	 BjIsWIjaiHtKWasbcTWyxmAWh3frluUPZtKgDihs0pWYt7C/lpMJvq/HNBgiVWOzkY
	 0XOn5UbzfkK9EoqOHUNq+PAAqVsyFavnDk6H9GjI0VxmT5YBYLDZiXoZQQwZ6bO8WV
	 lGTVBRh07FUA2HvwdaVTKk3zm5IgDaXuD5qyknsMHpJ9qDsve/jZ0zq0yeJ2gyN9hz
	 HrGoCl7kdKA9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF6F24032B;
	Sun,  1 Nov 2026 17:09:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A94323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B82B540357
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDMpjg-Rxszx for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:09:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 29D364032B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552940;
 b=KGAxyRYirs8QnTGau09nxV7rUzDCy4bYiiox6wHhe6vmKpm53G/fLf6kOtlcdXFYliSv
 VVhSr9f8zCTC09IOQNhZ8YuVPq3xp9/69BSuufhtZrJEqXITTFfcIlprEEOpSMAo4Sm6M
 L1sJwC3cnNIMyR2zCatlTxKcmmpkxvHuvw9hq5f99GCp07xtxlNABLTqTsBvpCpbM/yaO
 rQyPCHIkx/5wDhDyo6kWcpsM+9jWKNe9OfkEcpyym4XdzMJbLqdJv8KVjJRpaGCN3sUPo
 B/BSsTQxDbBV9+zHTfWLlL/OnhXAKPKB7y3GOeaPzghRPbyhv4mLTQ1ARTi0H/TI2Zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552940;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=HGf0dEwu9cyyR1Xbdjs7pjqR0TDeHXMGMTt81KkwGapYdY56efgsU5urnXAVs6gU0HPC
 2HVshLRTQDxJCJaq6qWJEDdCzZUJT7cS7i7MtwoV0RmT+VHs1s1IYyP33qjVil9ulBhqn
 p47l4JIJoQf4YY2CgDqH9EAAXvqyeJO9R/WXwMAHizx7ZSs5ocl/fDqSPmlEgHED/n+v0
 QEHUhPUIZZm0X7ZlNFB1jgkcqjDnzKGEeGYcR+26axpHEo+vn8HfkL1QggkTXHSbJLmgV
 DucWR3OLCVeHiz76f2KMk1UxVkL3yxly6LgJU2W/utu54SKR1/haoVelQSYEWKZABwA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iTWS1vE1; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29D364032B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:08:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EA43E13F8A2;
 Sun,  1 Nov 2026 18:08:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:08:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:08:56 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-6-james.hilliard1@gmail.com>
References: <20261031172019.2683287-6-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <bc8c5ae84a6ca0831a0c0a7fbb7da03d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-google-api-core: bump to
 version 2.43.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
