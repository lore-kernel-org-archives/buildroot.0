Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA42606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hjqVO/Q4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66DC380D1E;
	Sun,  1 Nov 2026 17:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U07aULCO6SWY; Sun,  1 Nov 2026 17:12:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9FD5280D5B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553130;
	b=dbWoRGclhALavSM5ySkV2JruDimQVuvFVyeUOfahbLo4xCNL36d5ZcC3kLNbEthFu92j
	 JZKUIIKX0XR9DdD6XaJ0ce4LKZ0ALd5OSc++PvyNxDpMl6UXrjYpR/DA8gul1WEyzLCj0
	 /lUKqpj9VEQx0KZ9yvcSL2cvWaAoz+OAyN2G3+RVSmp/0Gc0+jss63lwwhpnrZXWjkQgb
	 t2gaYX3eRPNM0+7nY5x4QdJHL1I9fNA6ZtPvIzpg2OlqPDXg/ifGvrBA1b59x7GOjWAOE
	 KrzH5/1EooAz7H7fDjKISbl23I/nE4T7/Si9ep8+zgLXbiGJURZikPZKzvgBhRjfakg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553130;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=Ae3iWw8JUOUQZNkr0BdhDrlpmTZSRzG90JaDyL7uqcECupKnF/brw1KNtfnmYg3aSolN
	 tWOep/0oTwCfxBDqCJtWU2z15MiTaplgCvBUq1SGqccUG9DU76RsBYoEjvOF6M2jY+VFp
	 5Q5eUFXeh3I9xNgMNZxfXALK6yMbJ9u6liZJAHIWw3QtccYaRq5DwT1qO1xxlw7wE8UIq
	 XplPceZ278f7Nu5rV1Lo/cet00ImkSUsPPt3O8eakyenhZq6IiQXKMLBlQ+Ou5xCg2jV4
	 FUqvJr5Al8Qks1GEpBno9/yxy/ON7l+TVxHCIrfX4IFAJOsWse0RmAkyT0HqsDd+zeQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553130;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hjqVO/Q4fnH8Z0UZuMU6TklhvwTmuyyMm8+Vdu4JDg5NfBdHNiNunS2xxgf9KaSId
	 zxQ3NEHoqFF7u0QqC1fa2PUHyFjRWDKuqBHHtJcW6U1iPw3r34Aj1S3oKDuyFGdsuX
	 ULLf4lVy8lqZLB4i91d4bCreIXi7MzAsxPjgOv710zZ6oAOLrWWVuH07VzSwSFwHXj
	 BpkeyAeoMbskoLzELz7932xEStHgstTy7+etAyimlOFGZNJCc7vvf1ohMgV/NsDHTE
	 mtg2DGQVGmRXV4l2v4Ylu/u6mLhVQ1eSDZiavwLz1gXSdUtG+moZGkooLlKi62BimN
	 yJii1rPhwf2AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FD5280D5B;
	Sun,  1 Nov 2026 17:12:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DAF62AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F70440076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxmMS-Dbt2cG for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:12:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A7A304004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553127;
 b=X2KrY4svBXCDrSCRR4iokIHhcQV9MIVhwJwWKWGpO2N0rp4zRXnib2yj3EtwjxzJ6Nop
 CG2t8s/koU7SEAD0zbmRdFzaRjTJxYsbrlpaH+hA3KKvrK3eyIOZZVyqdVMytzN9Ro4y8
 mEDM8MMyZYbiF0Frb5Tc/iqo7MZNJP8aAEqHPf2lJnsyhtjmN2qNqmLH++wcbxzMLBT58
 nHGYUKbTnCacnq6G+D2aYX5EsU57E7aleYIM0q4gOot975sXPYcV4JXgFhH44pkc0xTr8
 q57MCPI/wDQmZ9siy1wKuNtVfI31kguhMB7GQPl5ldvlruwNmDYBhDvHM9D28yaa4rA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553127;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=i4I25EbspAl4uFtJjZ7zvwdJ6uQrvBj53Sq+hD7Ts6pknOeLczG9PIeiEBbSaOJgh2sg
 F70jX+w4wnpSzCDJqn4yM8rkErxZX2NmvihJ0oq+DfdpI2t4UI95FO1+Rm2qdSvOTNUjn
 pw9vqqwj5WdFfbFtXVRw4xJw0MXdIcmfbTeB4oOKOQ0w+EgQuU0uG5Xosih3X/zbCX6nd
 5OFGCMxoQcSZi5xj4bIRWCvcwavBNglLuvPrdQeVU96lHDfOH9KOcq6Kn3OkvnM+/Kyyb
 OeO7IaG3g65DKOalBtPwTT+yRvCMZrF1HHglMOH46YgAGFeNCIvSoVqlBsgvSn66/QA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EFuL81zi; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7A304004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:12:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4170E5FFAF;
 Sun,  1 Nov 2026 18:12:03 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:12:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:12:03 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20261031172019.2683287-17-james.hilliard1@gmail.com>
References: <20261031172019.2683287-17-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <c91f1f0fba747e71846b8ccc5ef33ecf@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pylru: bump to version 1.3.3
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
