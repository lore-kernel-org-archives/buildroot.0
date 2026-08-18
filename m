Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F838C5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 21:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E519405A6;
	Tue, 18 Aug 2026 21:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwFFQjvCfx66; Tue, 18 Aug 2026 21:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787088018;
	bh=JCeDAlShTJmQcK3jhsEh+ocODR0VJzakBLiFvAzE3cQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nKQjZn8sqqisep2ambZqqIrZ4pU0rHJVTPHQZe2/WhCouyS/QXylnkrDyETl4A0NI
	 So7WpooaOLqMsMTxmBre5KfgX2KQGIpaXBR8sIVTbBszMHsxMAOTS0KbnzawBVmAaj
	 BOr/tXlOfixQFK7BXg+81wZo81w1M+9v5kVtwvPpj8a741SYs+8YxAl3AvRmyrFXMK
	 R414WpE83g8GAPuQ3kcKkGNNGbQrOraqehFWGkN6ldwaVB9rRf8Pqge+CgCM/dfnW/
	 PjtyxTk7nwe/VWjY/HE3abWVNOst+mr78udxX6mOZlE69JeSLEfa45JvPZQETcLF2v
	 Xt+JG2yXyk8TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ADB740599;
	Tue, 18 Aug 2026 21:20:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7AA0265
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A99C3606E8
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4L83s5BYf76 for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 21:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95009606D9
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:20:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CAB694E412A4;
 Tue, 18 Aug 2026 21:20:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 97EC760355;
 Tue, 18 Aug 2026 21:20:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A853011C74F98; 
 Tue, 18 Aug 2026 23:20:08 +0200 (CEST)
Date: Tue, 18 Aug 2026 23:20:08 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Christian Hitz <christian@klarinett.li>, 
 Bernd Kuhls <bernd@kuhls.net>, Baxiche Su <baxiche@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <aoTMfN8a-ebokyfe@windsurf>
References: <20260701133030.866703-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701133030.866703-1-roykollensvendsen@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/qt6: bump version to 6.11.1
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

On Wed, Jul 01, 2026 at 03:30:29PM +0200, Roy Kollen Svendsen wrote:
> For details see [1], [2], [3], [4], [5], [6], [7] and [8].
> 
> [1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.9.2/release-note.md
> [2] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.9.3/release-note.md
> 
> [3] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.10.0/release-note.md
> [4] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.10.1/release-note.md
> [5] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.10.2/release-note.md
> [6] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.10.3/release-note.md
> 
> [7] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.11.0/release-note.md
> [8] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.11.1/release-note.md
> 
> qt6multimedia:
> Removed 0001-ffmpeg8.patch since the fix is included in this version. It
> guarded AV_CODEC_CAP_SUBFRAMES, which FFmpeg deprecated and removed; the
> guard was upstreamed in 6.9.2.
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Thanks a lot, applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
