Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C852BE87849
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 16:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72DB040BD3;
	Tue,  3 Feb 2026 16:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuYU5E98zCur; Tue,  3 Feb 2026 16:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 154F540BC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770137313;
	bh=Ty5XsZffvKzdP5sJlx6gpdL4DtULWcixRNF5ciZNc24=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dy4o/z7zOHWw1tfOFxFvFoOyaFti67pclHl1m4+d2uxBlVKXQPGEHGeegZ6eYQaeD
	 kp5I2Q5WtCZoAnCjh2YkHPpPKy4gv1tqjD4KO630aMES4bH3PE0R6uqJQdteldNaUp
	 u0wVxbFtCjici++Zqlpyo0a2pJ2q1spR7yi0O/z7Z1Mw8Z4db15Y5csOLsxs9/dNJy
	 /gFzzVddEc6nDqtTS7TcuL4pYArjSZBwLPMq1X0PHEGbGCgL+UfrQCiBPX4jF9AeJx
	 gDEcAdOoLsAv2lWWFZDUppNzpBw+kme0aTyRLQhzK6gS9Cn/34sFxfyVEB8EAdhZw6
	 upqXTy1HzTGuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 154F540BC9;
	Tue,  3 Feb 2026 16:48:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DB80F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5408B8230C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQ03G0VinmDD for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 16:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5458A81A34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5458A81A34
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5458A81A34
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:48:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D68444E423E4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:48:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB8C260728;
 Tue,  3 Feb 2026 16:48:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9163119A8888; Tue,  3 Feb 2026 17:48:26 +0100 (CET)
Date: Tue, 3 Feb 2026 17:48:25 +0100
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aYImbY4iyP0uqQUJ@windsurf>
References: <20251028-concurrent-test-pkg-v3-1-ae014d18e5f5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251028-concurrent-test-pkg-v3-1-ae014d18e5f5@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770137307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=i29nlRdd1X6uc0XzyvyM+qtYteC5pk6PVZPnF+gMYME=;
 b=VYHRBfUmGNo7Mf3ds4DcyQkXtNt3qRtXOS4XpCMAsq8uMBG0GDXbTrDqbrZo3xAAQpg5Ui
 wU71A3GEZyIZHtnD9oX+KXjaBqN4Mf/FmPwmXTiJsTQCr+kqmRz9+M4V+4lvfZiL7BMi9+
 k2eO/Ghb/Jv2iEVW7ZkFUKl6RzE4vas7ubYJjdfF2rq1sJx85lwjHEh5lD83qhAXEj/sh8
 VRvgEzDO/OgTwyPISTAs/mpJc6VBaw/FA/NMCqM5MV8tLFMuSVf+3EPCVZS7DvphZCIAQg
 rR529rvU4MZjzcBEwYuIgAKjK45syzn3o5SHwI8gd1NCBcwF+bTt8fnUNpN7TQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VYHRBfUm
Subject: Re: [Buildroot] [PATCH v3] utils/test-pkg: add concurrency parameter
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

Hello Joseph,

On Tue, Oct 28, 2025 at 12:26:10PM -0700, Joseph Kogut wrote:
> Builds run by test-pkg are often not CPU limited, and so running
> multiple builds concurrently has the potential to speed things up quite
> a lot.

Thanks for your patch, and sorry for the delay in getting back to
you. We took advantage of the on-going Buildroot Developers Meeting to
(finally) have a discussion around your contribution. We believe the
feature is definitely useful, however the hand-written implementation
of the parallelization seems a bit tricky. Can you instead use
something like GNU Parallel which is designed for that?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
