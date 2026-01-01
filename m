Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0799EEE24B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 19:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5562060679;
	Thu,  1 Jan 2026 19:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NlPNaWb5aZ0; Thu,  1 Jan 2026 19:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62C9960718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767295193;
	bh=y+0IIavOxD2CFLL0nSuOnXemW9cApafXFGcUmTN5vic=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jM1dKBLqDXHY6Nc0LnBO1QUAPbLTJv5wjQgN4FXvAM7F8IoqcC92cxPwgkughfJXd
	 59jEXrvMIHfF3Y3oqebcPPCiNOEDSZjZUrMtwdygw/1SrIR1dh3WcBV+TZ5IdoS7jP
	 RLuogywFqpRJlEn6+L0cMa/edpS6UsrEAe/2JXbwW4/9Pndhlagk2MgwdBpE2zQQ+2
	 YL2Xptr7t1DTAmlJJHQ/CKVZEulQYnFppz4wBzUea1TlsDbUmMZOccDHweAMjcoNHF
	 5m/zRM5DAumXtN7h2gQbbHh6eLTrW2s9TMyV7lyuo9sLXiMZCr5RtYfmlnAcofhda3
	 W7RdTPg/IZgvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62C9960718;
	Thu,  1 Jan 2026 19:19:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E110C19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6F6460719
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3m79r4KBz-zR for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 19:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA68C60718
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA68C60718
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA68C60718
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 19:19:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F415FA4C1F78;
 Thu,  1 Jan 2026 20:19:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35326)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbOD6-000000006Zs-1Qyt;
 Thu, 01 Jan 2026 19:19:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Jan 2026 20:19:44 +0100
Message-ID: <20260101191948.1714200-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767295189;
 bh=b/OGLISNzMxP6K0H/F7Vqa8zSJbDc1AMQgzs+x2f6OE=;
 h=From:To:Cc:Subject:Date:From;
 b=VGr7hYZh8MnVXWNJo1jYOVIZk9asykngB3yGqD6EJPZDgM7ef1dF6p0vkkdpc02wR
 BImmSnrrwvrj2nFNYoEkuw3pkmTCpodqcCheNDNMkmGq2EZhhZS75HiJGJMevcKNvh
 cOw99PFW29er4TtxZNHIaz1OlVoCEWlGCa87HKBnNNwCZ4a2QqfgGWfOTTYhCRjCwn
 f1rB+6EapGiWFTIgib1umXrRkq886k/7aEmWTq5BeMpQ13as5/vBUXVW5WyUCpL60f
 WgooOdko9k+e/0Uo4onBFc1nj1mXSz3rFEnE9ocFDxoX45ZOXqSSvQJoznUPJ4VT/u
 ldN+mUbDmw6yQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VGr7hYZh
Subject: [Buildroot] [PATCH v2 0/4] Build fixes for ffmpeg 8.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this series adds patches to fix build errors which would occur with the
upcoming bump of ffmpeg from 6.1.3 to 8.0.1, no backports in buildroot
necessary.

All patches are compatible with the current ffmpeg version used in
buildroot and are tested using this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_VLC=y
BR2_PACKAGE_FREERDP=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6MULTIMEDIA=y
BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG=y
BR2_PACKAGE_FREESWITCH=y

To my knowledge the only remaining package which gets broken if the
ffmpeg version bump[1] would be applied without further changes is kodi.
The Kodi project prepares version 22.0 which includes compatibility with
ffmpeg 8.0 and is currently at alpha2 stage.

The current version of libcamera-apps is broken with ffmpeg 8.0 as well
but version 1.10.1 adds compatibility with ffmpeg 8.x while removing
support for older ffmpeg versions like the one used by buildroot:
https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65

../encoder/libav_encoder.hpp:33:2: error: #error "Error: libavcodec API version is too old for the libav encoder!"
   33 | #error "Error: libavcodec API version is too old for the libav encoder!"

Regards, Bernd

[1] https://github.com/bkuhls/buildroot/commit/d8dbe78d03a8d3ded297328a3737fc49ba230cf1

v2: removed libcamera-apps from series

Bernd Kuhls (4):
  package/freerdp: fix build with ffmpeg 8.0
  package/freeswitch: fix build with ffmpeg 8.0
  package/qt6/qt6multimedia: fix build with ffmpeg 8.0
  package/vlc: fix build with ffmpeg 8.0

 .../0005-fix-ffmpeg-deprecations.patch        | 146 +++++++++++++
 .../0006-fix-ffmpeg-deprecation-warning.patch |  34 +++
 .../0007-FF_PROFILE-Depreciation-Fix.patch    |  31 +++
 .../0008-ignore-EAGAIN-for-FFMPEG.patch       |  44 ++++
 package/freerdp/freerdp.mk                    |   4 +-
 package/freeswitch/0004-ffmpeg8.patch         |  52 +++++
 package/qt6/qt6multimedia/0001-ffmpeg8.patch  |  39 ++++
 ...remove-AV_INPUT_BUFFER_MIN_SIZE-usag.patch |  54 +++++
 ...eo-use-frame-flags-instead-of-fields.patch |  38 ++++
 ...ROFILE_xxx-instead-of-FF_PROFILE_xxx.patch | 202 ++++++++++++++++++
 ...AV_LEVEL_xxx-instead-of-FF_LEVEL_xxx.patch |  62 ++++++
 package/vlc/vlc.mk                            |   6 +-
 12 files changed, 710 insertions(+), 2 deletions(-)
 create mode 100644 package/freerdp/0005-fix-ffmpeg-deprecations.patch
 create mode 100644 package/freerdp/0006-fix-ffmpeg-deprecation-warning.patch
 create mode 100644 package/freerdp/0007-FF_PROFILE-Depreciation-Fix.patch
 create mode 100644 package/freerdp/0008-ignore-EAGAIN-for-FFMPEG.patch
 create mode 100644 package/freeswitch/0004-ffmpeg8.patch
 create mode 100644 package/qt6/qt6multimedia/0001-ffmpeg8.patch
 create mode 100644 package/vlc/0011-avcodec-encoder-remove-AV_INPUT_BUFFER_MIN_SIZE-usag.patch
 create mode 100644 package/vlc/0012-avcodec-video-use-frame-flags-instead-of-fields.patch
 create mode 100644 package/vlc/0013-avcodec-use-AV_PROFILE_xxx-instead-of-FF_PROFILE_xxx.patch
 create mode 100644 package/vlc/0014-avcodec-use-AV_LEVEL_xxx-instead-of-FF_LEVEL_xxx.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
