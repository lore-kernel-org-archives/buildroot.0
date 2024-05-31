Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269AEC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 13:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB8B5416E5;
	Fri, 31 May 2024 13:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VICfVIfKyaRt; Fri, 31 May 2024 13:42:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FA7F41672
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FA7F41672;
	Fri, 31 May 2024 13:42:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2E8C1D531B
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 13:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D705E80E59
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 13:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozwaDM2fPzA2 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 13:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE2EF843A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE2EF843A5
 for <buildroot@buildroot.org>; Fri, 31 May 2024 13:41:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A3CF87875; Fri, 31 May 2024 13:41:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 15:35:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19cffcb9799aa9150f5e11fd013f37d2a6e84fb4
X-Git-Newrev: 4700e2104f01d3d780dc2657a6ca0db44435f224
X-Patchwork-Hint: ignore
Message-Id: <20240531134154.9A3CF87875@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_aria_*: add hashes for
 at91bootstrap3/Linux/headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=4700e2104f01d3d780dc2657a6ca0db44435f224
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                   | 2 --
 board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash | 2 ++
 board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash   | 1 +
 board/acmesystems/aria-g25/patches/linux/linux.hash                   | 2 ++
 configs/acmesystems_aria_g25_128mb_defconfig                          | 2 ++
 configs/acmesystems_aria_g25_256mb_defconfig                          | 2 ++
 6 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8f5fc0a476..5d15fa8046 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -117,8 +117,6 @@ boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch lib_p
 boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_patch.Upstream
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
 configs/aarch64_efi_defconfig lib_defconfig.ForceCheckHash
-configs/acmesystems_aria_g25_128mb_defconfig lib_defconfig.ForceCheckHash
-configs/acmesystems_aria_g25_256mb_defconfig lib_defconfig.ForceCheckHash
 configs/acmesystems_arietta_g25_128mb_defconfig lib_defconfig.ForceCheckHash
 configs/acmesystems_arietta_g25_256mb_defconfig lib_defconfig.ForceCheckHash
 configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash
new file mode 100644
index 0000000000..6edf3d3345
--- /dev/null
+++ b/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash b/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/acmesystems/aria-g25/patches/linux/linux.hash b/board/acmesystems/aria-g25/patches/linux/linux.hash
new file mode 100644
index 0000000000..81824a41ee
--- /dev/null
+++ b/board/acmesystems/aria-g25/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
index acf24d1fed..261a2c9fa3 100644
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ b/configs/acmesystems_aria_g25_128mb_defconfig
@@ -6,6 +6,8 @@ BR2_arm926t=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # System configuration
+BR2_GLOBAL_PATCH_DIR="board/acmesystems/aria-g25/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
index 2713c3ca79..183c4f7b73 100644
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ b/configs/acmesystems_aria_g25_256mb_defconfig
@@ -6,6 +6,8 @@ BR2_arm926t=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # System configuration
+BR2_GLOBAL_PATCH_DIR="board/acmesystems/aria-g25/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
