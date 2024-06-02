Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A55C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 18:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68EC4402B1;
	Sun,  2 Jun 2024 18:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ATzKRkTjfD0; Sun,  2 Jun 2024 18:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B4DA40544
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B4DA40544;
	Sun,  2 Jun 2024 18:27:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D27EB1BF4DA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBAA182CF1
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFnS-dikT6kH for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 18:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C5B582423
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C5B582423
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 18:27:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0207B878D0; Sun,  2 Jun 2024 18:27:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 2 Jun 2024 20:24:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75da04c817b07a9c426cf2e438b0f8883096f4ef
X-Git-Newrev: 4456bec6ab7c579ec6adc472fdca705a01ad57ed
X-Patchwork-Hint: ignore
Message-Id: <20240602182754.0207B878D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_stmp157_olinuxino_lime: add
 hashes
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4456bec6ab7c579ec6adc472fdca705a01ad57ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                   | 1 -
 board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash | 1 +
 board/olimex/stmp1_olinuxino/patches/linux/linux.hash                 | 2 ++
 board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash                 | 2 ++
 configs/olimex_stmp157_olinuxino_lime_defconfig                       | 4 ++++
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9264f84a15..1c5ab08f5f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -249,7 +249,6 @@ configs/olimex_a20_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_stmp157_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/stmp1_olinuxino/patches/linux/linux.hash b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
new file mode 100644
index 0000000000..8691d5ffd3
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93  linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz
diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..a991a1922f
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6aaa18a9023db29ceaad5bca240605990b68a6bf348aaefad0bee8be8d37648e  uboot-efadf793a0a5924e2c96362dc1df3e56622ebb97-git4.tar.gz
diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index 8bd8e10ca9..ecfa781354 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -5,6 +5,10 @@ BR2_cortex_a7=y
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/olimex/stmp1_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="stmp1-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
