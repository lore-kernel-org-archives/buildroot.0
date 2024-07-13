Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88723C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28C978203B;
	Sat, 13 Jul 2024 20:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HK9mpO019yO; Sat, 13 Jul 2024 20:31:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2193982026
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2193982026;
	Sat, 13 Jul 2024 20:31:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1340A1BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D9C9404E2
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zj4qexOyT4_e for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB89C404BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB89C404BF
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:31:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4D6986667; Sat, 13 Jul 2024 20:31:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:21:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 638474478093831d76ab70e0cb3bd2d65d4a4511
X-Git-Newrev: f82b58d2286fb5b39ef7461b7d26d567fbccdc59
X-Patchwork-Hint: ignore
Message-Id: <20240713203104.C4D6986667@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/blake3: add new host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f82b58d2286fb5b39ef7461b7d26d567fbccdc59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is used and required for ccache update.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                 |  1 +
 package/blake3/blake3.hash |  3 +++
 package/blake3/blake3.mk   | 19 +++++++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7fbefa3302..152789cd5d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1370,6 +1370,7 @@ F:	configs/kontron_bl_imx8mm_defconfig
 F:	configs/kontron_smarc_sal28_defconfig
 F:	configs/kontron_pitx_imx8m_defconfig
 F:	package/altera-stapl/
+F:	package/blake3/
 F:	package/ipmitool/
 F:	package/libnetconf2/
 F:	package/libyang/
diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
new file mode 100644
index 0000000000..2a00d19b02
--- /dev/null
+++ b/package/blake3/blake3.hash
@@ -0,0 +1,3 @@
+# sha256 computed locally
+sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
+sha256  6a94bedb8b707ed97f6e310d0d015ab14e0683ffa0a612b02958581b9cc9fc0e  LICENSE
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
new file mode 100644
index 0000000000..5625046db6
--- /dev/null
+++ b/package/blake3/blake3.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# blake3
+#
+################################################################################
+
+BLAKE3_VERSION = 1.5.1
+BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,$(BLAKE3_VERSION))
+BLAKE3_SUBDIR = c
+BLAKE3_LICENSE = Apache-2.0, CC0-1.0
+BLAKE3_LICENSE_FILES = LICENSE
+
+# We may be a ccache dependency, so we can't use ccache; reset the
+# options set by the cmake infra.
+HOST_BLAKE3_CONF_OPTS += \
+	-UCMAKE_C_COMPILER_LAUNCHER \
+	-UCMAKE_CXX_COMPILER_LAUNCHER
+
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
