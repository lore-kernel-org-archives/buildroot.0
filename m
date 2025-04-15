Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134F9C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 09:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 841D76113E;
	Tue, 15 Apr 2025 09:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3leMC3nlGMFO; Tue, 15 Apr 2025 09:57:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EABA60837
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EABA60837;
	Tue, 15 Apr 2025 09:57:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82D8A108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 730C1411FB
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpMji4BsY7KZ for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 09:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::42aa;
 helo=smtp-42aa.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 870B240D19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 870B240D19
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::42aa])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 870B240D19
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:57:41 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZcKMm0x0lzZK8;
 Tue, 15 Apr 2025 11:57:40 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZcKMl4FZKz4Vg; Tue, 15 Apr 2025 11:57:39 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Tue, 15 Apr 2025 11:57:27 +0200
Message-Id: <20250415-libcamera-qcam-v2-0-84301a46a144@cherry.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIct/mcC/2WPwWrEMAxEfyX4XBdHsRM7p/5H2YMtyY2h2XTtN
 HRZ8u91dguF9iDECPRm5iYK58RFjM1NZN5SScu5CnhqBE7+/MYyUdUCFBillZbvKaCfOXt5qVu
 yhd6hHhiiE/XpI3NMX3fg6+mhM18+K3d9HH+x1eU/VElTJzjGaJ0jCnrc2gMcfGGJyzyndWx05
 wOSxoHIeuoNQQTVQuxIg4OuB2OU75jEEWFKZV3y9V6xso4MP8b2b5utrea9VWi9toTt8IIT53x
 9Jhanfd+/ARo5je4vAQAA
X-Change-ID: 20250404-libcamera-qcam-e8269c47e2f9
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Peter Seiderer <ps.report@gmx.net>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH v2 0/2] add support for libcamera's qcam
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

This adds support for qcam example GUI from libcamera. It is based on
Qt6 and uses openGL.

Sadly, the qt module from meson is currently broken[1]. The v1 of this
series patched host-meson but the v2 now patches BR_PATH to contain
/libexec from the Buildroot host dir. This was done as suggested by
Peter in the review of v1 to avoid carrying the meson patch that the
meson community isn't too happy about. The downside with the BR_PATH
patch is that /libexec technically shouldn't be used to store binaries
the user (or shell scripts) should execute, and Buildroot is mostly
that. Additionally, meson qt module will say it's looking for runtime
dependencies when looking for the uic, moc, rcc, ... binaries in
/libexec, while they are used at build time, so this is kinda wrong. But
it works. Both approaches make meson find the qt tools, and they are not
exclusive (we can have both).

qcam requires a font to be installed (e.g. cantarell or dejavu)
otherwise characters are renders as square characters.

This is based on top of
https://lore.kernel.org/buildroot/20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de/T/#t

[1] https://github.com/mesonbuild/meson/pull/14381

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- removed host-meson patch in favor of BR_PATH patch in Makefile for
  meson qt6 module to find the qt tools,
- added dependency on QT6BASE_FONTCONFIG which seems to be required,
- added comment that a font needs to be installed,
- Link to v1: https://lore.kernel.org/r/20250408-libcamera-qcam-v1-0-680c8a48dc17@cherry.de

---
Quentin Schulz (2):
      Makefile: add libexec to BR_PATH
      package/libcamera: add Qt6 qcam support

 Makefile                       | 2 +-
 package/libcamera/libcamera.mk | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)
---
base-commit: 43abcd4c7dd8ad65d2f2012f3d4292362550a3ed
change-id: 20250404-libcamera-qcam-e8269c47e2f9
prerequisite-change-id: 20250404-libcamera-0-5-0-b9ecf899ddb4:v1
prerequisite-patch-id: 854e58d76fc57aa774ca0d315ecae56b67c00c8a
prerequisite-patch-id: 4873ac99203f0d789d64aec048249d9ba6a15a82
prerequisite-patch-id: c4d504c6563a911ba550be263063cfd7bf04bcbe
prerequisite-patch-id: 4a74788db759d3b67650f1456ee4d64f9394f50a
prerequisite-patch-id: 73a4b5a3204b1a901da74a3ffe1672055404dd2f
prerequisite-patch-id: 90b567b9a37abb58747d965ea2e0fef41358844b
prerequisite-patch-id: 946aac34b70f001c24fc6fe86caab759a4591359
prerequisite-patch-id: cee428a4219c83704347f6f194694f21093034da
prerequisite-patch-id: 6bbbdc80dc639a1b2918d79ae101e1030f3312bd

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
