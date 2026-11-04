Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2E6072FB3
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Pk+KMeXY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44C0240748;
	Wed,  4 Nov 2026 21:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-QfX3XYcojr; Wed,  4 Nov 2026 21:51:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 609C640735
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829098;
	b=AkSd4MaLbBQBc5k5D7NRcIa21mu9vyYjQZ3XsrXtg8trGOaeW/kSTorJ5ExpG7Z5Utyb
	 RqFxY+i14YmcNr9co+md1iO324u0oQ66EWh8jUtBSdjc7SzKz0tp7ssVbBrxmNA1tJw2a
	 tDSddPLJ7OgF07bHMZXrifCmlW55u0oUoeTzFwYrCmcBEyk0PTRJj74Lxn/ce2zPVWDJ/
	 88YaG9WCL5/X6zr1a+BEQr7Rn6Jx7MUDFr82VJpvYC1el4aQ1snzoNgp111K1lkeVbfXs
	 DD1HWqciOn3/IGoKJzw/heJnv0Oig0Yf43pM8FrFJZDxcTgrdW3uT006UoZ9UUp037w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829098;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pVYsEDhVZdsipwTCJLVY8u4nKX+Lom4AQCH/OzfMsaU=;
	b=bKoG3ALHCJKUFPfJFN7bC77uwRHxnzsExMJDooJ1ldCFnKC7tGrWDCdGUUvrH/XYlMzr
	 oJKKjrW+/2y854V3Hi0/Zj4GrHBt08QylM/pMnFM8begS0ajl9Ym26N5G/yZuz66ziwOs
	 a4ydr0wNGGLSdmkNAax0r00nIKqYpPxZ0Djt0v3gu+4nOQ2Wa2WG1ywv5i1ACcAtAnc2V
	 oHUhJNUSOx+M+kNiBMVHHhZioNsLTj1D9rfylkzCLELxB5lx6QxJbLoa7pos4WDOEjAgL
	 DT6LpkOH48W7zNSKLIj+PY4IfY91Ty/JG0DWbq1dppnd5UgJCSK3PH0hqqwLFxtVgIQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829098;
	bh=pVYsEDhVZdsipwTCJLVY8u4nKX+Lom4AQCH/OzfMsaU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pk+KMeXYg1n3ML78rpoIdsdkGeiPkuxGJdzRRbrYJxC+aVCFti2BVheaVT15Q8F1Y
	 TuAwbiCHh4AXArxykTK5AtthdYC0PaO2R7cnSjGQtqfSt20Ac51eYRlQha/mbF2X+q
	 xjSVpf9tngQlXdaZTtGfs9EpEzzdHDu0IOXG8B1/WNLwKzBOYMoMzcAhZHOuItbF3z
	 adOGk+c3QNf2G+8ejQ8sicUZWMRBx/J5V7VIqCsQRqtr6X3iXRmNux3eeVRmpWWbDa
	 nHs9XPIM1GrxEl9wTa85othmUkPZwc+HB1cCKFnWSBwI5GjIDP7zHo2DJOXeNZcemD
	 JbVhuLmoI1qYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 609C640735;
	Wed,  4 Nov 2026 21:51:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1713362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D766240732
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeiBcgj26kxT for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:51:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 89A7A40735
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89A7A40735
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:51:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5BEB01A06D3
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:51:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 273EC5FAEB;
 Wed,  4 Nov 2026 21:51:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 054C310328E67; Wed,  4 Nov 2026 22:51:30 +0100 (CET)
Date: Wed, 4 Nov 2026 22:51:30 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <auuo3wPz9uOvwSEO@windsurf>
References: <20261103110339.127294-1-giulio.benetti@benettiengineering.com>
 <20261103110339.127294-2-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103110339.127294-2-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/efl: bump to version 1.29.0
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

On Tue, Nov 03, 2026 at 12:03:39PM +0100, Giulio Benetti wrote:
> * Deal with pipewire support since starting from version 1.29.0 it's
> enabled by default and can lead to build failure.
> * Drop all the upstreamed patches and renumber the pending ones.
> 
> Release notes:
> https://www.enlightenment.org/news/2026-10-31-efl-1.29.0
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks!

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
