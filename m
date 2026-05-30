Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD93CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A9F42ED0;
	Sat, 30 May 2026 13:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Pmn6EpuhQOw; Sat, 30 May 2026 13:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 126C442DC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149165;
	bh=J0rvWy5sopgSt5eLkRIHXO/V5cN6gWtHg9Gsm5MfSJo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MvRFEV/UTdk2P8FaeDvVDbmQvRp5wLQRszZZ0FJC78z62lQZ5NbeyhCHOpSKtKJcF
	 21rm7W9+fTD/UnSeo0i3k2WJhMcEnpokcOhdmm7i+d6ePsq36nJ/aBx/hJfDJIM480
	 zBp98NECBdJ0aMJOxPNWN7dc4NFlX7eCLYQvofE6wBWyLpGaLfzhC1cJDhNvIb/mr5
	 013fcgygdIgq9/k2DebvGSPvaQdiH4Uw0j1hVxRYl0P7oAt4NEgmZSFSpE/hbdl0b3
	 E0I32w68rBomWoI6+XkFD1OYGAg7TvGUN3UptWyteAIUXjlw0g7cmc0SU/FP+MIt0p
	 oXl+xbdAsawfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 126C442DC7;
	Sat, 30 May 2026 13:52:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A50F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61E6942D4E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVz2nTYH0Ng8 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734C042DF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 734C042DF6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76BD38750B; Sat, 30 May 2026 13:52:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ceec8746a9e60108b758b1fc0f7f7f6557a5371b
X-Git-Newrev: d0e7bea04d7c38a0be8c321e79ab4517ebc06213
X-Patchwork-Hint: ignore
Message-Id: <20260530135221.76BD38750B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openjdk{-bin}: bump
 versions to latest 17.x and 21.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0e7bea04d7c38a0be8c321e79ab4517ebc06213
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

utils/docker-run support/testing/run-tests -k -d dl -o output_folder \
  tests.package.test_openjdk.TestOpenJdk.test_run

passed without issue.

This bump fixes build errors with current gcc 16-snapshot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: update .checkpackageignore entry to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                                 | 4 ++--
 package/openjdk-bin/{17.0.12_7 => 17.0.18_8}/openjdk-bin.hash       | 4 ++--
 package/openjdk-bin/{21.0.4_7 => 21.0.10_7}/openjdk-bin.hash        | 4 ++--
 package/openjdk-bin/openjdk-bin.mk                                  | 6 +++---
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch             | 0
 .../0002-awt-fix-HEADLESS-compilation-without-X11.patch             | 0
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch             | 0
 .../0002-awt-fix-HEADLESS-compilation-without-X11.patch             | 0
 .../0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch | 0
 package/openjdk/openjdk.hash                                        | 4 ++--
 package/openjdk/openjdk.mk                                          | 6 +++---
 11 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b5c30bf691..1e11ea4773 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -699,8 +699,8 @@ package/olsr/0006-build-patch-for-gpsd-3-25.patch lib_patch.Upstream
 package/olsr/S50olsr Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch lib_patch.Upstream
 package/open2300/0001-fix-makefile.patch lib_patch.Upstream
-package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
-package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
+package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
+package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openldap/0001-fix-bignum.patch lib_patch.Upstream
 package/openldap/0002-disable-docs.patch lib_patch.Upstream
 package/openntpd/S49ntp Shellcheck lib_sysv.Variables
diff --git a/package/openjdk-bin/17.0.12_7/openjdk-bin.hash b/package/openjdk-bin/17.0.18_8/openjdk-bin.hash
similarity index 53%
rename from package/openjdk-bin/17.0.12_7/openjdk-bin.hash
rename to package/openjdk-bin/17.0.18_8/openjdk-bin.hash
index 4a7c84eb87..c2169350c1 100644
--- a/package/openjdk-bin/17.0.12_7/openjdk-bin.hash
+++ b/package/openjdk-bin/17.0.18_8/openjdk-bin.hash
@@ -1,6 +1,6 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  9d4dd339bf7e6a9dcba8347661603b74c61ab2a5083ae67bf76da6285da8a778  OpenJDK17U-jdk_x64_linux_hotspot_17.0.12_7.tar.gz
-sha256  8257de06bf37f0c8f19f8d542e2ab5a4e17db3ca5f29d041bd0b02ab265db021  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.12_7.tar.gz
+sha256  0c94cbb54325c40dcf026143eb621562017db5525727f2d9131a11250f72c450  OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz
+sha256  592a6702b3a07a0e0b82cb38aaab149bfce1b0c24d6b57ddb410bd9009333095  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.18_8.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/21.0.4_7/openjdk-bin.hash b/package/openjdk-bin/21.0.10_7/openjdk-bin.hash
similarity index 53%
rename from package/openjdk-bin/21.0.4_7/openjdk-bin.hash
rename to package/openjdk-bin/21.0.10_7/openjdk-bin.hash
index a73bea1a77..8d9efacba1 100644
--- a/package/openjdk-bin/21.0.4_7/openjdk-bin.hash
+++ b/package/openjdk-bin/21.0.10_7/openjdk-bin.hash
@@ -1,6 +1,6 @@
 # From https://github.com/adoptium/temurin21-binaries/releases
-sha256  51fb4d03a4429c39d397d3a03a779077159317616550e4e71624c9843083e7b9  OpenJDK21U-jdk_x64_linux_hotspot_21.0.4_7.tar.gz
-sha256  d768eecddd7a515711659e02caef8516b7b7177fa34880a56398fd9822593a79  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.4_7.tar.gz
+sha256  ea3b9bd464d6dd253e9a7accf59f7ccd2a36e4aa69640b7251e3370caef896a4  OpenJDK21U-jdk_x64_linux_hotspot_21.0.10_7.tar.gz
+sha256  357fee29fb0d5c079f6730db98b28942df13a6eed426f6c61cd4ad703ab27b9a  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.10_7.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index e6c74cf6d8..819bf9052b 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,12 +6,12 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.4
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.10
 HOST_OPENJDK_BIN_VERSION_BUILD = 7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.12
-HOST_OPENJDK_BIN_VERSION_BUILD = 7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.18
+HOST_OPENJDK_BIN_VERSION_BUILD = 8
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/17.0.18+8/0002-awt-fix-HEADLESS-compilation-without-X11.patch
similarity index 100%
rename from package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
rename to package/openjdk/17.0.18+8/0002-awt-fix-HEADLESS-compilation-without-X11.patch
diff --git a/package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/21.0.10+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
similarity index 100%
rename from package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
rename to package/openjdk/21.0.10+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
diff --git a/package/openjdk/21.0.4+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch b/package/openjdk/21.0.10+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
similarity index 100%
rename from package/openjdk/21.0.4+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
rename to package/openjdk/21.0.10+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 209004a292..72a6ff2e27 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b8b37fa6fcc284d91e7458c703ca4c893a1dd5a6e0f6b9e198e7d13cd8efd24d  openjdk-21.0.4+7.tar.gz
-sha256  ccb7d37c24f9f5808f9d25419d93680570dc600f292e68944032338cb4b2c51e  openjdk-17.0.12+7.tar.gz
+sha256  6500906cb7cc49268ce4ca368db3ddf3541b40afd25eecb378e13d5a72f43214  openjdk-21.0.10+7.tar.gz
+sha256  7ebfcc2aafd514c23df3fe5280e1a34630b9b1d429c65a80dd5a4b6e7f177bc3  openjdk-17.0.18+8.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 58b266c4e9..e5d9d5e630 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,13 +6,13 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
-OPENJDK_VERSION_MINOR = 0.4
+OPENJDK_VERSION_MINOR = 0.10
 OPENJDK_VERSION_BUILD = 7
 
 else
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.12
-OPENJDK_VERSION_BUILD = 7
+OPENJDK_VERSION_MINOR = 0.18
+OPENJDK_VERSION_BUILD = 8
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(OPENJDK_VERSION_BUILD)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
