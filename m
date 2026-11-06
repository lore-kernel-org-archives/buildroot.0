Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD8B606A330
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i9YrVrMB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9732780F45;
	Fri,  6 Nov 2026 21:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EsvNk3Ypy1lE; Fri,  6 Nov 2026 21:16:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D898E81403
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999798;
	b=YKV77WGF5Qosw9RnhAgQZBPZIH8gY8l0PuciR/qQhsoz8LRjQn5yYL7SogMgNhXL8abm
	 5GCqf3DKmRNX2zevb6xg4vXJtGRsphC23GcyvtqeY9ru0uDZ4GzqFnjDx077LoBBDVyrE
	 kMuBfJE4UFVt58FC4lnzB5IkRV3D8wbLyjy2Z/FD7B8G2CvrdrW2qm9uK4tCbzVgBYu9f
	 woNDdu4bkHQL6ZRIufng2lCCClTtgdkvMIfpckmrhuuj5KAfifn8ChpDregdEv+IyKq1H
	 hJIjx6KRG6irF3BwXZV+hWufvEB8njyzK7J6FIPoIYHlJfAUMP6uUdofuOYHk7hzs6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999798;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=WDWIOadpPM63fNFH+9QNYaaceQxGqfMVqNOz5+1egQ2pTQLCxM7glK1k7GWEe1xTzxzv
	 xUVvdiHFH9vvZpcTuzQjX1NXpOEbymNdYxoUKsMLANxtG+5rHfrz9I5BX/CR6uHDik2H9
	 qs3HMX8J9YVe6WI91+/DZ8cEV6Vobdjh0Kl0/4UzmoudOYka6GPO+5gSSF8LEYumLIjRc
	 uJd2FOEDwQ2WVmu61h31jpda0aLO6plFCr7V4t6ruUiPBPfnUuBy8eMXGd+Q5PM5SnzjW
	 DsV0r11qREM1/PpwBTPYPX/faE9CRNBxf/o221Aj44pbm6BVOe9LDygbGP1YPQIaaPw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999798;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i9YrVrMBhLstiZ0JFL/Lr+mFExkRxZVyEGky+LvIbTQw8U/4s7VySY/TasLUDZTT9
	 2MQ9Wo9eWHJlu9a3VDA3tVJBReiHeBa0IsmOkZwra3v7OH20uKV2tem6k2+1vklIo6
	 3X9AIiwcWS+O0cyZtA7U5LJoWH+VzaTG1F5cTN3gQPLtJwWHoa7NUpvOfSHjLULOvw
	 G4sDHkTtxIJVTNqQs0vYg8TLdUBvsZwZQWKHOhKN57llh4tCQ4wpudKVOQRanp8USz
	 wzc3Y5d+QnX/Z1wVfyZZjdGfyJeTeXdyK0acwR8Yb4ziCFrlHG9uLQBHOwzyrtlhfM
	 Uq765ZiYPYb6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D898E81403;
	Fri,  6 Nov 2026 21:16:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C578235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 028EA407E2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSMY-i4wIx69 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:16:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DE20D40670
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE20D40670
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:16:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8019E19F57B;
 Fri,  6 Nov 2026 22:16:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:16:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:16:30 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20261106191536.2120153-7-james.hilliard1@gmail.com>
References: <20261106191536.2120153-7-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <9432663da995c0d97be54edf6817af75@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-cython: bump to version 3.3.1
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
