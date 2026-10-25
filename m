Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E3B606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mdo2ElSl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1C706063E;
	Sun, 25 Oct 2026 20:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id su1hTlx4Rl3J; Sun, 25 Oct 2026 20:50:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C0642605F4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961414;
	b=KST6RdWRpkuPvHP8Y2llxOM9DXR/G0whncUxsezyK1OCNX32phPuywROPrUqCfFd4v+P
	 GFMiVaSla7I9Hi6IcD9qHk1m1hf8F7Jx+bngQgZPdQlVdpzahXVRmA9k8PBGdP7fZKLyT
	 I2YJXOTG2s8PMbG5orVsZHKIRcRrbyDXrxx2TU5cRYgTbx/lKp4223zLQzSpJGVVzZxNj
	 lAhG24cMb5Ib5N/h/IcdJPFp8yIiYZxajCzUkkuAy6DmI1eRK0ZHDYKq9UmAyo/WS+kSN
	 uhQDdO25tdW5rfauMrXabB/iWa2lKtGTyiNcX+yzgM3K9yrHil8n09hew90uHqcUZMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961414;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uESwQ0QWjTsTyXY3MWKLXDP8lBsn9/ig9N1Gi0d0uaQ=;
	b=Z27Agw1hLLZ8+PQkEzBasKKPcaY1F42NOb9gKAxyTfB32ylsXmI++8E7/1H0zrDTkNYL
	 KXhoP3a3rH8FE6DndJ8jFYOBW5O6M1xgJNcgW6HMkKbW7XX43jzJKKQd+Ufg5C+V1BEZw
	 fhcGM0ROEsFPf+nFRm2n207NZROJtqkWIv0o/iCIko+EEu/VGKpQP/DL+ITnREL+x47HH
	 QycCh/Yg8ouERkkPjw09wTXH4XbTx6vuyUzjtqdu/d8MldAZjcsWSSBapDeP0UtluwUUN
	 j2ZAwn7aeN35pFXuYwlrdCJ4BeVJR3VhYwIfDg4G5zfBdxOJnPWQmc/dMBh97rPlMMA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961414;
	bh=uESwQ0QWjTsTyXY3MWKLXDP8lBsn9/ig9N1Gi0d0uaQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mdo2ElSl9m8EXg9eJpVXXsZcGjpORBJL4nxQId4YZ1TgA23CdaJ3ounOTGGw8c4jB
	 njaKdrMGqLWZ+FhPWCKiby7Fc7DBVeIv7uyLDrekVrDSvDp/Ozmz5Siq9pqHnRhdIc
	 /Jn9qohFXVHcwhk1s1R9PqS5HiOIgsEmjAh69Hbgnno5UYP15UK/hg/ky/x/bLcioq
	 oHRzDQ7kFaKCnDFTcluM8LUiGJeiFIirPuUYJBjx2o0m1tuRcAWCV3LI3SjR/R6aH9
	 tt25/JUi6vOtNcIAa81bD9NAOIxp2sInAtMqNTU0UgfIXfZ/VggwwaOYp1Q1DgY8U5
	 DdGhJHsFHDVjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0642605F4;
	Sun, 25 Oct 2026 20:50:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88BB7380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F2A940070
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORJ0VRMEifCX for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:50:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D331840057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961412;
 b=JaGg/q+5qfD8Wu3XVs1+XlKVpUmmCpLUN531oLfBWUr2XR5u35r5ocxLW/r4x7Nwzhvf
 0DRSIN+k/S4COJ1lpMCyYv96wsn96hX+EbDtJJLLXP+wbM2G2Hfj/XMbccnS6CQjuz1pp
 ojBmLxGDhHZivCz0y0sfqKQ2XzHk60kezyQZ5ZX7onOvDFl84UN1+sx1wrWcZ3/gVCyCB
 GljvzfpkH9NeHISRW1MFv4BT+LXudK07uDvtYPtIFIZ57wA3biv0buZiC94TXKEVcH5Qf
 Ripb7r0XAZuoKN6+WlTM9Hxn9LdsnBzouJYVXLsAkCiPB9wASnIPaOLq6ko15EPMtjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961412;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Uhctc4SemX5FmkMN02LnyZ+jFzeWHSlRvpFGIuwCgdk=;
 b=Sbqt3s+7z64HVfeKRUd9xICxmB88zMnOHUdQOXiKOqqJvHXoRUfB620B/i2x6/mkzVxg
 vGw1as1uLJq7uqZMrZSc8pkY78eHp9lI7zaHsUEbsiErDqhrVwNBCgOrXSyiaX7z5goUE
 yf6cdeRwncY1ScfIPi18kZOomjzBhC8mfOjfv5drxiOmCtyrBRGdV5Niq9u2451DJpbxw
 aWbkDN30ROmBhk1C0LhXA5tlD4otcIRUnH7kYy5MVedLFQqGsXJOVzXNZeDbbBUv2EmPI
 rLWFR2HzKBQAKPPWeWdqTolPy8ohjv/KCNSvgWJ43AGYEl7SiCU4kq8k2rgpycxmgwQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="Z/mugj1/"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D331840057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:50:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3431AC51477
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:51:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5BF4760740;
 Sun, 25 Oct 2026 20:50:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 58CF410329039; Sun, 25 Oct 2026 21:50:07 +0100 (CET)
Date: Sun, 25 Oct 2026 21:50:06 +0100
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Buildroot development <buildroot@buildroot.org>, 
 Biagio Montaruli <biagio.hkr@gmail.com>
Message-ID: <at5rdrCoFUZmJCbE@windsurf>
References: <f90ec3b4-bd18-4f71-b4fc-eb2c385a9978@grenoble.cnrs.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f90ec3b4-bd18-4f71-b4fc-eb2c385a9978@grenoble.cnrs.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] board/acmesystems/acqua-a5: remove
 linux-headers.hash
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

On Sat, Oct 24, 2026 at 11:15:44PM +0200, Edgar Bonet via buildroot wrote:
> Since commit a8b9c6f9f512 ("configs/acmesystems_acqua_a5_*: switch to
> Bootlin glibc stable toolchain"), the acmesystems_acqua_a5_* defconfigs
> do not build a Buildroot toolchain anymore. Hence they do not depend on
> linux-headers.
> 
> Remove the symlink linux-headers.hash -> ../linux/linux.hash.
> 
> Fixes: a8b9c6f9f512cc3ef18956b53a99b93ba74a9e8f ("configs/acmesystems_acqua_a5_*: switch to Bootlin glibc stable toolchain")
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Series applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
