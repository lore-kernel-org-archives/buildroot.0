Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E440CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 17:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E9E80F29;
	Tue, 29 Sep 2026 17:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdA41emuEJif; Tue, 29 Sep 2026 17:05:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 61BA480F2C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790701523;
	b=JwI1aCb+tkTsSHXhdqkzrNJdkrCxot3hvfrBABYbcpywOZYZwqnle1dPRvUvf/hjNKaX
	 2NCuFWogjJ0PHkjb1sWCyMHLyRp3+aS++XyweVW9xKteIbndaO20DJwqm9Onov7sXkwoD
	 My+m1j4BZrEQCITPwXE7W6Y7t3wu5TJvRVZDflBAIOShqwqh53LA/DPI5WtMUpEu+0fsC
	 oj3EhNBj0mGryyBNypu/5D4PbhKfe9+68n34LDYWbyP7iJ/KpTIdga4VdaSJ5jwpoA1RJ
	 4Ua8+XD5N2ayY4OYSy8G69P1m4ngxMG7DZf9l1gAvT5OKpRgB6IhV/hKAHFzzRaCEwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790701523;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:Date:
	 To:Cc:Message-ID:References:MIME-Version:Content-Disposition:
	 In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tQqtK0QJAqD1hcK8BKKLJwMSaztkOGJEws2gtTnO4O8=;
	b=ZIBBXd9AVjRi+InLOcJ/TyC75AKF9rbdSSoq5/90f6Pkgw0ZgjULk3Gm2wwW8gxfdFSZ
	 5OlyY6wd0tumhZ/Z8Ivjti46s9rscmgpDp6KGzyKboQvw7p/zT3Hbjkg70GcCEZkbUfaO
	 ZFHNkMdrmCjkignwkKgFRksjAcTTQa9N8+DoUPyAqz42DBuF3OoMsxbEWoiSzaH374erV
	 2qVk99lklWvkZj/3vTBCaeCrfJc22Dga8mD+0zswbO6kBSXc8pcJB32rca9PETlvd/RcC
	 NaE9olC0I1mnCgftlXukjZU1Ck/dsLNpmjwL8wdtsDh0pONt85jME0dOIgVgDTT3FEA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790701523;
	bh=tQqtK0QJAqD1hcK8BKKLJwMSaztkOGJEws2gtTnO4O8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HqnII7Bu3J3FPDY2c2trRWbANALYU+tOTsWdZjMgumX2Jt03yHm4e33SWSrFA+vKQ
	 vbOMnybu8rgf45Sq2gU9nLrZNVtss5vtuZw9mc51tRwY3LEgiqocblzkGZcwKFmOkS
	 rbV9GrjinuSUMSpbPpK/kb8EvJWceD2CNH4XVM0oUqZnADXZQJjQ4imjz9af6XWzME
	 xX/QGSvR17SYwj38mYoBA7rEJbvh+LyzTZ4xXJ7EryxtiigH1sZmgyCGQ9sJ90E0FD
	 1TjOuytGxKr/fW0trYOLOE21GX1RZWm0QCvx7m5jlMGgW7C9Ub4KOkKv9pMQmD48Yj
	 BAzvORNSwz+gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61BA480F2C;
	Tue, 29 Sep 2026 17:05:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7D7E335
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 17:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A865F4024D
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 17:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKxF2F_JDS4l for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 17:05:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0CAD740057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790701520;
 b=mouhGf0YvRdG4S1EhDPo7bs40LjSnY5vF3innFUfoRF+cb8ie7uuK5kwU1/hwZ88JSti
 p82/cwlsIQJnkKAziwrhByWuINIP9c+TaRsfKGNwuVxMFNdtA7D25rj9ZBO1xsSnYHunM
 crPpQk/2FnDvZ9KrCa1aMscIS8fA5nf5K6TW9XG3ZyoBtB8YhCtuPtc0Dg3H//hK7qwzW
 stiZbdb1BLqyga+alT6PoY3IZqpOWsmAFyLR2vzdona1DX6WCUTTy9T56stv3NBXoGnYq
 aaxewIpo1yVHbHdmm4PrARXNvJLwxNM7qRHWX3T8LzZGxcMYIKWiSqrTgcahpA97ydg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790701520;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=BKTFLOs7Tl8XDGHBJlw5x9TREq/3JlM676rISgfCQRs=;
 b=IiEvHuYwFBIvg0AxrlbcScuWgkckM8if4oc4ZElHnsrfAKUsNqL2gjILBLmcf1hBQs2q
 8BCU7lkyIAGgP7eUOn/s8Bl8dbhQw7XjTEMl44G/779fRwtWWOq+ALqwpbsolYW/tBAA1
 n3pY0RQ6Kbl9ZzQzcBpWVekeY6osIJPEqrLDxwYHwMhSa36SJcAlbRE7A56PDnX1EJHWl
 MladSd2o8Ay5RZdHtDrs2yH2f2CkbZSqtgKPqvrn/ow6EWhyy5LqeQFg1xnO1FBIsnFxB
 PlYbWW8/7fR+bTAsURqkoKwh2bna6PzMbfbTxPYmHTYL1VV5sJHhahwjkzeHOZp6Qtw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jh4ib9tZ; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CAD740057
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 17:05:19 +0000 (UTC)
Received: from L30177.local (unknown [78.242.68.224])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E9A9D780389;
 Tue, 29 Sep 2026 19:05:13 +0200 (CEST)
Date: Tue, 29 Sep 2026 19:05:12 +0200
To: Thibaut Collet <thbt.cllt@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	buildroot@buildroot.org
Message-ID: <arvvyLRIyf-OFC3G@L30177.local>
References: <20260928152218.94978-1-thbt.cllt@gmail.com>
 <arrbTcuJn4IUQQvT@windsurf>
 <CABH27u-M+7Cn0MiQRtaZfv7mSwq3sG_1h-Pd5v7ooNTNgcU-+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABH27u-M+7Cn0MiQRtaZfv7mSwq3sG_1h-Pd5v7ooNTNgcU-+A@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] package/lldpd: fix compilation issue with
 kernel 7.3 on aarch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thibaut,

> So removing the uapi include files of lldpd to use the kernel ones is the
> best choice for kernel greater or equal to 4.19 to avoid using outdated
> include files regarding the kernel version.
> Gating the LLDPD_POST_PATCH_HOOKS with 'ifeq
> ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19),y)' will do the job.
> Do you agree with this solution ?

It seems to be a better approach for me.

> 
> Regarding Vincent question:
> 
> > However, could the lldpd's build framework be updated too with a mean to
> avoid such patch ?
> 
> As spotted in the commit log of lldpd use the right header files to be
> compliant with any kernel version and distribution is an endless loop. For
> buildroot rather than relying on modifications inside the lldpd project it
> can be simpler and faster to just remove them. NB for iproute2 that also
> provides some uapi include files the compilation is OK for kernel 7.3 with
> aarch64 as the provided types.h is more recent and __u128 is defined.

ok, right, same issue.

thanks Thibaut,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
