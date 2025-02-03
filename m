Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730B1C02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 18:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B928A60770;
	Mon,  3 Feb 2025 18:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9dRy8imeQuI; Mon,  3 Feb 2025 18:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85687608F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85687608F3;
	Mon,  3 Feb 2025 18:44:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D27551A2
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B31EF6074A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykjC6PhKP-2u for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 18:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B730C60770
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B730C60770
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:44:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A228E86A06; Mon,  3 Feb 2025 18:44:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 19:44:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1526fac50ce698c34f3cffd64d2448fbc54e72d8
X-Git-Newrev: 633bbb40d6cdfb7fee7302d5012253dfb7777952
X-Patchwork-Hint: ignore
Message-Id: <20250203184444.A228E86A06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-engine: bump to version
 3.27.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=633bbb40d6cdfb7fee7302d5012253dfb7777952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Upstream dropped the --enable-impeller-vulkan configuration option.
  - Add a .hash file for the LICENSE file
  - Change the wording of the comment to reflect the addition of the
    .hash file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/flutter-engine/flutter-engine.hash | 1 +
 package/flutter-engine/flutter-engine.mk   | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/flutter-engine/flutter-engine.hash b/package/flutter-engine/flutter-engine.hash
new file mode 100644
index 0000000000..3309082139
--- /dev/null
+++ b/package/flutter-engine/flutter-engine.hash
@@ -0,0 +1 @@
+sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 7f41defe68..a399296247 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -19,9 +19,10 @@
 #  - Create a source tarball.
 #  - Copy the source tarball to the $(FLUTTER_ENGINE_DL_DIR) directory.
 #
-# There is no hash provided, as the gn binary (used for configuration) relies
-# on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.24.4
+# There is no hash provided for the source tarball, as the gn binary
+# (used for configuration) relies on the .git directories. As such, a
+# reproducible tarball is not possible.
+FLUTTER_ENGINE_VERSION = 3.27.1
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
@@ -145,7 +146,7 @@ endif
 
 # There is no --disable-vulkan option
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
-FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan --enable-impeller-vulkan
+FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
