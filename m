Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD94C4345F
	for <buildroot@archiver.kernel.org>; Sat, 13 Apr 2024 04:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED99F41E84;
	Sat, 13 Apr 2024 04:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82zJG8eaDVNH; Sat, 13 Apr 2024 04:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFAC641E9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFAC641E9C;
	Sat, 13 Apr 2024 04:31:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 301651BF29A
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 04:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CB2140153
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 04:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N76UdIjZuXdi for <buildroot@lists.busybox.net>;
 Sat, 13 Apr 2024 04:30:59 +0000 (UTC)
X-Greylist: delayed 314 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 13 Apr 2024 04:30:58 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C1E8040118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1E8040118
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.30.189.100;
 helo=iodev.co.uk; envelope-from=ismael@iodev.co.uk; receiver=<UNKNOWN> 
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1E8040118
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 04:30:58 +0000 (UTC)
Received: from localhost (222.red-83-46-228.dynamicip.rima-tde.net
 [83.46.228.222])
 by iodev.co.uk (Postfix) with ESMTPSA id 7B1C22C65E8;
 Sat, 13 Apr 2024 06:25:42 +0200 (CEST)
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Date: Sat, 13 Apr 2024 06:25:27 +0200
Message-ID: <20240413042539.32743-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam: Yes
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=iodev.co.uk
Subject: [Buildroot] [PATCH] package/axel: bump version to 2.17.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ismael Luceno <ismael@iodev.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove ac_cv_prog_cc_c99; axel has been updated to autoconf 2.72, whose C99
test is compatible with BR2_USE_WCHAR=n.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/axel/axel.hash | 2 +-
 package/axel/axel.mk   | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index b2ff52876b4b..4902dd7946c1 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,2 +1,2 @@
-sha256  6af9c0238ca4fb850baa17878de0361868e3ff6d9302298d83c6d26931c28723  axel-2.17.13.tar.xz
+sha256  938ee7c8c478bf6fcc82359bbf9576f298033e8b13908e53e3ea9c45c1443693  axel-2.17.14.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 90e5156e064b..ff96ea94b676 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.17.13
+AXEL_VERSION = 2.17.14
 AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
@@ -12,10 +12,7 @@ AXEL_LICENSE_FILES = COPYING
 AXEL_CPE_ID_VALID = YES
 AXEL_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
-# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
-# provided by autoconf relies on wchar_t.
 AXEL_CONF_OPTS = \
-	ac_cv_prog_cc_c99=-std=c99 \
 	CFLAGS="$(TARGET_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
