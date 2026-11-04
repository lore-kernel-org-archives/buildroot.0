Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A51606A339
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JqCxE1Ym
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE227404F8;
	Wed,  4 Nov 2026 21:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OL0z8SgAxyrM; Wed,  4 Nov 2026 21:44:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B4350404C0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793828664;
	b=KO66Fq/PuariIs4eleDzOYi3B9EL4Q1aF+IQKfkO8MsrMxtq4NC1LyieMUf9Gvq9e6hg
	 gC9E4oUKd/n2GENSwhmlC1VnWjyjD8Apz+CCMupF6+aexrgEAK7nYbFl14GXiAJj+3igJ
	 IRmR3mwSXeL+k6jTBp9J/bkXzrjy+23bh8i3506CMhA97uH4Hv/aVuPQ4H7oianCPBAf4
	 uAQZwv1wDiPvZzDSlCJy1IVVStW0bU2YEOn6CIHYMAL3MI7EHpUY7mqf+dWpXbA7pxa2m
	 BZQooVADhYIIrlmTnvWJF6aB3s8tI3H53GcGL3p/64FZHzu/IyGcP/GnI0iF6KBZ2KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793828664;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3gPGDx0Kvo1Y8vNXAPM6p/FOfxE9yjzHPHTDm4/wJ/c=;
	b=o/v/7cW8FJyE7cvUy4iLaHORoDNLerDXRg5ic4va0nUlLQedTNmcmBZ7q2+TcH8Z1Tpw
	 u1LyjYGj7ONq3DzJrDWDD8XU1yk/ZQ/RsmTowEaQkmKf3wNtFLuiv8Yzla2/Vw61ckaVW
	 2v7rGWWhzKHGJlOU0b92NoB/x6t3rl+zT7pMGI7O+1hXSDyy/KNC0nK6Gt6dHqU/YiGa5
	 pEc0YGyn8WwUi1eZQedolzlLCp+DuUup3lCtrGvLAA1oKh9GvCsl1J2J5mASXe6nCZgEZ
	 kIXcagJ9xgf9aHJcm8Yb7402WP4iePhMne94U4FbqhD4aBLAeYuFoFDoAwOarApCAHw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793828664;
	bh=3gPGDx0Kvo1Y8vNXAPM6p/FOfxE9yjzHPHTDm4/wJ/c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JqCxE1YmUBPkPVVaYalwJjLXkIhhjcjfpW3w4Ryt/ul9D3lnSKmsO0oZIUhiTEwzE
	 4QcKM53gp7nkGOD1Sv6SY6dydbvDcARv8psiSTZTbTRs5RWOxe73eFRKGvzrGq0fs2
	 W9Q4/KyoVURqNllJFe0u/ab72VVuegognI2wceW2r5zelB5sdvR9WptEQPTsUH0JZA
	 AoZcWE3HiRYYKpNlEk3JWcRfLGlViyg3pLKJRpyMpYF3tfyW1T99VMHqdmV7hfeycr
	 zWdnAkHunva8PxHH0BAMhaiRrsanWplkJBHPGN3c0JHQ+XI8JqujumxP9mEmNMiiPp
	 PBfLbBQ7pXj7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4350404C0;
	Wed,  4 Nov 2026 21:44:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2220C177B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 076F040217
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0L8srU_QLSWs for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:44:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BC6F840211
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC6F840211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:44:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A30371A07CC;
 Wed,  4 Nov 2026 21:44:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 65D815FD65;
 Wed,  4 Nov 2026 21:44:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D3A510328E67; Wed,  4 Nov 2026 22:44:12 +0100 (CET)
Date: Wed, 4 Nov 2026 22:44:12 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <auum_-YyiPF43KMK@windsurf>
References: <20261103110339.127294-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103110339.127294-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/pulseaudio: fix build failure
 with 64-bit time_t
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 12:03:38PM +0100, Giulio Benetti wrote:
> Fixes:
> https://autobuild.buildroot.net/results/f45/f452fdf42509d56555b31b148edbc2bde2624af3/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Honestly, the patch looks "meh". Instead, can you try
-Doss-support=false (or disabled, I don't know which one is correct
here)? This should disable OSS output support, which we really don't
care about.

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
