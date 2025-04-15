Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96870C369B4
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 09:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E6341201;
	Tue, 15 Apr 2025 09:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkMNjZS7jY4N; Tue, 15 Apr 2025 09:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4573E41200
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4573E41200;
	Tue, 15 Apr 2025 09:57:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7F9B200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3D4D818D7
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlupGWwx8Gyz for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 09:57:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::bc08;
 helo=smtp-bc08.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F95B81A3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F95B81A3B
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::bc08])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F95B81A3B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:57:43 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZcKMn0yKxzQ1k;
 Tue, 15 Apr 2025 11:57:41 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZcKMm4ySxz6FZ; Tue, 15 Apr 2025 11:57:40 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Tue, 15 Apr 2025 11:57:29 +0200
MIME-Version: 1.0
Message-Id: <20250415-libcamera-qcam-v2-2-84301a46a144@cherry.de>
References: <20250415-libcamera-qcam-v2-0-84301a46a144@cherry.de>
In-Reply-To: <20250415-libcamera-qcam-v2-0-84301a46a144@cherry.de>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH v2 2/2] package/libcamera: add Qt6 qcam support
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

This enables support for Qt6 qcam example application from libcamera.

A font needs to be installed, e.g. cantarell or dejavu will do,
otherwise characters are rendered as square characters.

It seems to depend on UTF-8 as well (via BR2_GENERATE_LOCALE) otherwise
the following messages can be observed:

"""
Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
Qt depends on a UTF-8 locale, but has failed to switch to one.
If this causes problems, reconfigure your locale. See the locale(1) manual
for more information.
"""

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/libcamera/libcamera.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 6877662bdf02df1c7f8ff37039b3096e96e52481..c69ff1b9f8f96b59698f1388162c9ae347a179d6 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -85,6 +85,12 @@ LIBCAMERA_CONF_OPTS += -Dcam=enabled
 LIBCAMERA_DEPENDENCIES += libevent
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS)$(BR2_PACKAGE_QT6BASE_OPENGL)$(BR2_PACKAGE_QT6BASE_FONTCONFIG),yyy)
+LIBCAMERA_CONF_OPTS += -Dqcam=enabled
+# qcam also needs a font, don't forget to add one to your image (e.g. dejavu).
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
