Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D214EC61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97702605EF;
	Sat, 29 Aug 2026 21:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maE3TYuf41SR; Sat, 29 Aug 2026 21:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788039287;
	bh=cEfBncQ4BlVlhzYkQIQJ+WtaTsgui2rbT7Jz1uYxEDU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NTnKAipiV/hv/7t1X75jQArDf5kuZE7lCRJjbUjQjPaOzSnq2phGopfDeZdoAEFYl
	 Fu8hAZ7PW/j1OL4LVrZ9L9xmLgGAm464+gJmM1bfHj4c/ExErnd3qHk8QG0liwwnNR
	 /hak3nFXDflBzW+lYm9arc9wzK6h9B69hBtrXSnOnZ/2mFnXelzRZM6LDO+tKK79E6
	 skckgkML9Godm3B9tbJAxtPvmd8/ooKzcOTUgP3bxxnykrGLqZIqU7JMU7+YqsIdLN
	 H5/+k+5MaKzpvlW8nuSuDn5HnZzJQqyZTcWOJS86GQKjk6Zd02XaS2/eOjJE1/t7ta
	 CQZkOfjn+P3TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5630D605EE;
	Sat, 29 Aug 2026 21:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D03959D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD70680E40
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQFj8VkyvoX8 for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCCC480E3F
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:34:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 41FC34E41427;
 Sat, 29 Aug 2026 21:34:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EC5796053C;
 Sat, 29 Aug 2026 21:34:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 149E211C781D9; 
 Sat, 29 Aug 2026 23:34:36 +0200 (CEST)
Date: Sat, 29 Aug 2026 23:34:36 +0200
To: Alessandro Rubini <rubini@gnudd.com>
Cc: buildroot@buildroot.org
Message-ID: <apNQVTnU4Q-FK7Ix@windsurf>
References: <aohHBg5JtecHVORq@windsurf> <amaDQ/RxzLn24+me@arcana.i.gnudd.com>
 <aoglkraRzHufPBHQ@windsurf> <aognldAvgHC81hyu@windsurf>
 <apHpVO5XvrAs52H1@arcana.i.gnudd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apHpVO5XvrAs52H1@arcana.i.gnudd.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/opencv: fix a webp dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Aug 28, 2026 at 10:02:28PM +0200, Alessandro Rubini wrote:
> When BR2_PACKAGE_OPENCV4_WITH_WEBP=y we need to enable mux and demux
> too, otherwise build fails as follows:
> 
>     CMake Error: The following variables are used in this project,
>          but they are set to NOTFOUND.
>     Please set them or make sure they are set and tested correctly
>          in the CMake files:
>     WEBP_DEMUX_LIBRARY
>     linked by target "opencv_imgcodecs"
>          in directory [...]/build/opencv4-4.13.0/modules/imgcodecs
>     WEBP_MUX_LIBRARY
>     linked by target "opencv_imgcodecs"
>          in directory [...]/build/opencv4-4.13.0/modules/imgcodecs
> 
> The issue already exists in 2025.02.x (thanks Thomas for checking),
> but not in 2023.08.x whence my defconfig originated.
> 
> Signed-off-by: Alessandro Rubini <rubini@gnudd.com>

Applied to master after slightly tweaking the commit message,
especially to add a reference to the autobuilder failure being fixed,
thanks!

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
