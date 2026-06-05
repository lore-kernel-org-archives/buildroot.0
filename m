Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40BFCD6E7B
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 20:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDE2441E56;
	Fri,  5 Jun 2026 20:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3KJRLi_km7h; Fri,  5 Jun 2026 20:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C153141E58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780689869;
	bh=zyKZubpSomUGh4mpsiu9tA7Ps0d3XC4WPXjNNUA88Uc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lMfBFkrBCVfzk0iXoFIBDlt4tjUQ4SsGwiHyGypVU9bNPMLqgDB7Csu40S/ffbkyX
	 bQKOdxkyYK1I0RR/34DXZj7qvOYeTAa/5fzv7+RsrKxFfKCW505QMED828xU7aM1KQ
	 0+4EPuEzojEK0h2Ozt0P1vpDQhWNUFWo+WpTyQPGnlaV4sN0tOhN+4xFV2v/ZF8bCs
	 AEFEdIunSJm2kE005jojqkGZOHZbbpguw8D2XtOJScXOqIUDJkw1vClMR8kaWczNrJ
	 uL60rHglHpVJ6mEo8No28GwNY9S6PEH14ajzMIpB14n20TSlzihmqMsKCnJ1u27/3q
	 auA8mFJGzJtPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C153141E58;
	Fri,  5 Jun 2026 20:04:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E2DC40A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 20:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 402586104D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 20:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvBnjs5vC6fr for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 20:04:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69F9F6104E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69F9F6104E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 20:04:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6253887B7B; Fri,  5 Jun 2026 20:04:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 21:35:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aef531162ca0ec9422526d9c3e2f66eaf8edb2c8
X-Git-Newrev: a627f004f71c7516f7c01688dfdd039469b13fd4
X-Patchwork-Hint: ignore
Message-Id: <20260605200411.6253887B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing:
 TestExternalToolchainCtngMusl: disable yescrypt
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a627f004f71c7516f7c01688dfdd039469b13fd4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The TestExternalToolchainCtngMusl use a really old toolchain generated
by Crosstool-ng. Since it's used to test our external toolchain infra
we want to keep it.

But this test doesn't build since the last busybox bump to 1.38.0 [1].
Indeed, Busybox 1.38.0 added yescrypt algorithms that requires
explicit_bzero() [2] introduced in Glibc 2.25 [3], uClibc-ng 1.0.47 [4]
and musl 1.1.20 [5].

Add a new busybox config fragment to be used by old toolchains.

While at it, apply the same change for
TestExternalToolchainBuildrootuClibc (uClibc-ng < 1.0.47) and
TestExternalToolchainBuildrootMusl (musl < 1.1.20).

Note: TestExternalToolchainBuildrootuClibc configuration is reused for
TestExternalToolchainCCache.

[1] 5a27004cffb6bb034ff80cfac42a87bbd208755d
[2] https://github.com/vda-linux/busybox_mirror/commit/80e676664e1d7a0b07f14bff44f93d1fef709cf4
[3] https://sourceware.org/git/?p=glibc.git;a=commit;h=ea1bd74defcf9d5291d14972e63105168ca9eb4f
[4] https://github.com/wbx-github/uclibc-ng/commit/9e7b342fde5505c0a1d4968e9d70537ac406f640
[5] https://git.musl-libc.org/cgit/musl/commit/?id=05ac345f895098657cf44d419b5d572161ebaf43

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843888 (TestExternalToolchainCtngMusl)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843887 (TestExternalToolchainCCache)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843886 (TestExternalToolchainBuildrootuClibc)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843885 (TestExternalToolchainBuildrootMusl)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/conf/busybox-for-old-toolchains.cfg |  1 +
 support/testing/tests/toolchain/test_external.py    | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/support/testing/conf/busybox-for-old-toolchains.cfg b/support/testing/conf/busybox-for-old-toolchains.cfg
new file mode 100644
index 0000000000..63fa64f51a
--- /dev/null
+++ b/support/testing/conf/busybox-for-old-toolchains.cfg
@@ -0,0 +1 @@
+# CONFIG_USE_BB_CRYPT_YES is not set
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index aed3664a02..b3bb961aac 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -70,8 +70,10 @@ class TestExternalToolchainArmGnu(TestExternalToolchain):
 
 
 class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
+    busybox_fragment = \
+        infra.filepath("conf/busybox-for-old-toolchains.cfg")
     config = BASIC_CONFIG + \
-        """
+        f"""
         BR2_arm=y
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
@@ -83,6 +85,7 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="{busybox_fragment}"
         """
     toolchain_prefix = "arm-linux"
 
@@ -96,8 +99,10 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
 
 
 class TestExternalToolchainCtngMusl(TestExternalToolchain):
+    busybox_fragment = \
+        infra.filepath("conf/busybox-for-old-toolchains.cfg")
     config = BASIC_CONFIG + \
-        """
+        f"""
         BR2_arm=y
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
@@ -110,6 +115,7 @@ class TestExternalToolchainCtngMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="{busybox_fragment}"
         """
     toolchain_prefix = "arm-ctng-linux-musleabihf"
 
@@ -123,8 +129,10 @@ class TestExternalToolchainCtngMusl(TestExternalToolchain):
 
 
 class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
+    busybox_fragment = \
+        infra.filepath("conf/busybox-for-old-toolchains.cfg")
     config = BASIC_CONFIG + \
-        """
+        f"""
         BR2_arm=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
@@ -135,6 +143,7 @@ class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
         # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="{busybox_fragment}"
         """
     toolchain_prefix = "arm-linux"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
