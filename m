Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2460CCA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E153160668;
	Sun,  4 Oct 2026 16:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vldnWNK4SxTg; Sun,  4 Oct 2026 16:00:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F39556068A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129602;
	b=scLrqxqTm4d0G5LktVaDwGPXN+W+hWzrFsI4kw4tKJC4ZpddKZJJ0qpdGce3gZ54/iol
	 RQ468Tvi82qfLBVHg2Rt93yK0BKSjRKOPpHg+HsgByEC/QRqFu8CR9Gnpxy77sWvzRh4F
	 S19wahhhcLDtxEy0+rBJmzFQ/YgJWOdnATvSb0tIZ9Leld63YVkE0k4/VsHGMEY1ssUl8
	 gz/XMMz46hcbIAzT7Ad83jWckWhlAEy4ACqB/gfiNgd9Fbo7VrjtCiS4Fee5CxHmODnyb
	 zweJoyXieB5efstQTvtOG2uIpoWjQ3qXcxunUD1kAqTYGViyRsbD0xnLqeksE5RMCCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129602;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yWqS0Oze4nSAkhGJTKXT24nrZqMAl2evirDjqqiQKqU=;
	b=L4vSskR2E4mSVfymXN+TZTs6CFj4ika+mIdS8s8K1xLlEbIrmMaMg3DhPyijGmyBvR5v
	 /nQHPPlRm5OWkQgM1iciFWmdCsH5bG9okJJ/61wVkfnDd90ZR//zEpMWwwP9+5nHDhltx
	 NP64chIf66X3MaGiuVaDMtsEqcBZP8ttOzl0Kl1DcQ88g4yfVW5jbKXuCVricI8gHAGYz
	 Rn6XCAK8jjf0HmjQ3LOSdtnW7j9c5sfE/r8Xz5j/HETo/0oNVReEz5DA8C/bfkA2rsIcq
	 BLnKIksdAuIl3S8COAdcEh9W4kcRfw1yNJTg/leoZA1FLpPaZsVgpnq8DYdscVyqHqw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129602;
	bh=yWqS0Oze4nSAkhGJTKXT24nrZqMAl2evirDjqqiQKqU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jl0JTRami0DRop5UcLMy6UcO8zKVaJXyWT+DaYmWLGMZiiYaX+N5SXuTHoDPlUCzU
	 98M4mpHUHIGyl1EGhcqVCmenn/ruVQB/ojw+RNAblAjDxVjULDWEi2mnXTuq8mgczY
	 HFy+tb0NaL6HcqTD++JUfTv0zasACBCpI35zICpixQTAZeoBgmw2WacR0yqK+vCTSJ
	 VUaDer4fxTmXzWjjXfEZl6f9DgBSGYhvGsuEF38fIm8j7BmtkJlE/aG+e3iivW4XTV
	 of5HV7Uo7LySM2mBezvlnfPTPSs0i7xiJ/bTXR0CuYutgDk6egtTkA909Y82ipoC5P
	 A6E24tnWAO0IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F39556068A;
	Sun,  4 Oct 2026 16:00:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C560E32F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C317660668
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxsbdWeC2hUR for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:00:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D65CA6060D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129600;
 b=YbI0QpqcwRkyZgSQtLyv1ow3gM42USySmn9G7lQ34Rlu0bfsHO6dIuuLwr178guBOC7j
 X0LbErfY7rx5Ij80HmDrDCeWHGDmnssZzERrqsJqBqQebad3gpIUxhIts36JPLz2tedML
 4pYV0zyCWDPa3Vfw4LArnACnc9z0ZFxp2qJ15ML7ezOh9twvMEOmsm98Kh4wXrHR/62X9
 9dWBJweAtf9s6BDHcrY5yTZAbG/n4ue3uUSOlQqNtSaPnrPngDx3xbPe7Rsw1oditDoC2
 sd6HHgG9aEFH6GRk/ItD/XnnpS4E6UVwzXKFAdFTvmQws87iKYuB5oKylNR9Rc/18sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129600;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1E5AjbwKhEkbrkXziRazcpUvi14ckWUurt1eYMohX90=;
 b=VJJCI1jrqqnHgFXEA+yb8GJDfDqlR+FEKPEVgZprBvAin+lpJM95Ia4+RfIjvFewDWHz
 bWEFm55ta8wL5JG03zYAqk3yztqNusycDp3KLWNoI4Xv+IkH4PGSzh3w1Rul+HiWKTrqI
 fGnXgby4Af9vZ1H7cN/Mnj1WGsYcTGe7EcB7EraMaK3XAUCVywI5jw15YcmTQ6Udg0rPD
 0vd18LIJMlabWlNbsTDJ0etKFzbIjlFczKCcP6xAAGfBpdQbnFVG0+LnMTCfP48sDDVrq
 m8MEA1xhzME8LF5NZSKavzVxsMtdyyvpya72vg3SjzvTT+2Uuu1R644tCG9aWnFseEA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="L9v/gWUe"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D65CA6060D
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 42E364E41163
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 948C3604FE;
 Sun,  4 Oct 2026 15:59:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6855C103283EB; 
 Sun,  4 Oct 2026 17:59:54 +0200 (CEST)
Date: Sun, 4 Oct 2026 17:59:47 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ37tr5kutwimzs@windsurf>
References: <20261003210833.735937-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to
 version 36.2
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

On Sat, Oct 03, 2026 at 03:07:51PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
