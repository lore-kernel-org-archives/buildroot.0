Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38342C369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 15:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E316F60BE9;
	Tue,  8 Apr 2025 15:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGWevyv2tXd6; Tue,  8 Apr 2025 15:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE6A60669
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AE6A60669;
	Tue,  8 Apr 2025 15:25:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FD421F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 15:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20E9F60669
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 15:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bb3gwX4-Qo3X for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 15:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=83.166.143.170;
 helo=smtp-8faa.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34FDB60664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34FDB60664
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch
 [83.166.143.170])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34FDB60664
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 15:25:13 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZX8nM2YNwzPdR;
 Tue,  8 Apr 2025 17:16:55 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZX8nL6kGJz90v; Tue,  8 Apr 2025 17:16:54 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Tue, 08 Apr 2025 17:16:41 +0200
MIME-Version: 1.0
Message-Id: <20250408-libcamera-qcam-v1-2-680c8a48dc17@cherry.de>
References: <20250408-libcamera-qcam-v1-0-680c8a48dc17@cherry.de>
In-Reply-To: <20250408-libcamera-qcam-v1-0-680c8a48dc17@cherry.de>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH RFC 2/2] package/libcamera: initial support for
 Qt6 qcam
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

From: Quentin Schulz <quentin.schulz@cherry.de>

This enables initial support for Qt6 qcam example application from
libcamera.

fontconfig is recommended otherwise the following messages can be
observed:

"""
QFontDatabase: Cannot find font directory /usr/lib/fonts.
Note that Qt no longer ships fonts. Deploy some (from https://dejavu-fonts.github.io/ for example) or switch to fontconfig.
"""

It seems to depend on UTF-8 as well (via BR2_GENERATE_LOCALE) otherwise
the following messages can be observed:

"""
Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
Qt depends on a UTF-8 locale, but has failed to switch to one.
If this causes problems, reconfigure your locale. See the locale(1) manual
for more information.
"""

Finally, while qcam starts and renders a liveview, the characters are
still rendered as square characters for now. Not sure what the issue is.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/libcamera/libcamera.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 6877662bdf02df1c7f8ff37039b3096e96e52481..892f9cf275d9fd117f3a57795220a1673c2455d7 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -85,6 +85,11 @@ LIBCAMERA_CONF_OPTS += -Dcam=enabled
 LIBCAMERA_DEPENDENCIES += libevent
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS)$(BR2_PACKAGE_QT6BASE_OPENGL),yy)
+LIBCAMERA_CONF_OPTS += -Dqcam=enabled
+LIBCAMERA_DEPENDENCIES += qt6base
+endif
+
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 # Optional dependency on libdw
 LIBCAMERA_DEPENDENCIES += elfutils

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
