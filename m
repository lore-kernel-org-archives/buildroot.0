Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCD1C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CFBE606B0;
	Sun, 28 Apr 2024 18:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIZFnW0lGITA; Sun, 28 Apr 2024 18:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31463606DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31463606DF;
	Sun, 28 Apr 2024 18:27:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B96461BF8C7
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B24A54061E
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALY8Do-zCkVV for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E00340546
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E00340546
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94BC8861F3; Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 20:05:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db37b0e27d3c54d27b854edbc3253d29f512a6ee
X-Git-Newrev: 544684291a6174130575ac6e7ecc978aacb78a92
X-Patchwork-Hint: ignore
Message-Id: <20240428182741.94BC8861F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/axel: bump version to 2.17.14
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=544684291a6174130575ac6e7ecc978aacb78a92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove ac_cv_prog_cc_c99; axel has been updated to autoconf 2.72, whose C99
test is compatible with BR2_USE_WCHAR=n.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/axel/axel.hash | 2 +-
 package/axel/axel.mk   | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index b2ff52876b..4902dd7946 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,2 +1,2 @@
-sha256  6af9c0238ca4fb850baa17878de0361868e3ff6d9302298d83c6d26931c28723  axel-2.17.13.tar.xz
+sha256  938ee7c8c478bf6fcc82359bbf9576f298033e8b13908e53e3ea9c45c1443693  axel-2.17.14.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 90e5156e06..ff96ea94b6 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
