Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86100C7115D
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 18:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4B660DA3;
	Thu, 19 Jun 2025 18:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eG1hYijHNvMK; Thu, 19 Jun 2025 18:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D4BE60DA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D4BE60DA6;
	Thu, 19 Jun 2025 18:46:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84FBCE2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B66A403FB
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EH28B6ZAzUBv for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 18:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89A8140265
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89A8140265
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8024783D32; Thu, 19 Jun 2025 18:46:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 19 Jun 2025 20:43:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb5d3daf644395e0b31e09974fe2f47f130b4f7c
X-Git-Newrev: 6cf4f6cdb663d224bef0b96fedc183b27781a28b
X-Patchwork-Hint: ignore
Message-Id: <20250619184618.8024783D32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gqrx: bump version to 2.17.7
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6cf4f6cdb663d224bef0b96fedc183b27781a28b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For v2.17.7 release note, see:
https://github.com/gqrx-sdr/gqrx/releases/tag/v2.17.7

For all other release notes since 2.15.9, see:
https://github.com/gqrx-sdr/gqrx/releases

This commit also updates the LICENSE-CTK hash after minor
reformatting in commit [1].

[1] https://github.com/gqrx-sdr/gqrx/commit/9857b1b89f38ed77e6b9bd0525e7dd978eda59fa

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Julien:
 - add links to release notes in commit log
 - sort _CONF_OPTS alphabetically in gqrx.mk
 - fix LICENSE-CTK hash
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gqrx/Config.in | 1 -
 package/gqrx/gqrx.hash | 4 ++--
 package/gqrx/gqrx.mk   | 6 ++++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 97f0b7de07..25a8a77d2f 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -25,7 +25,6 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # gnuradio
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_GNURADIO
 	select BR2_PACKAGE_GNURADIO_ANALOG
diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index 567ff947f9..92432bb3e3 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  4a826b468b2fb38a59cbe1f1b566e62c3114509186a7a25ba27dc92833f3eb44  gqrx-2.15.9.tar.gz
+sha256  4aaab8a3c185cd99d6dda56d95b8f1b20128a6acfd2e86e0349d432a5fdcbce4  gqrx-2.17.7.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256  7cc22ce5ee61df62e427ec43b8130de149edee3cafb5af4f18d59b6dc3958faf  LICENSE-CTK
+sha256  2be14537abf3b54a93c7a78b8a8abee377f48106f9d3bc8f82ad061dc3fe67bf  LICENSE-CTK
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index d2518213b8..745edad959 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-GQRX_VERSION = 2.15.9
+GQRX_VERSION = 2.17.7
 GQRX_SITE = $(call github,csete,gqrx,v$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
 GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr libsndfile qt5base qt5svg
 
-GQRX_CONF_OPTS = -DLINUX_AUDIO_BACKEND=Gr-audio
+GQRX_CONF_OPTS = \
+	-DFORCE_QT5=ON \
+	-DLINUX_AUDIO_BACKEND=Gr-audio
 
 # gqrx can use __atomic builtins, so we need to link with
 # libatomic when available
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
