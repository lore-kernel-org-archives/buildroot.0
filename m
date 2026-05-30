Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A1DCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8EEB85300;
	Sat, 30 May 2026 10:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U81ALe5PDEfv; Sat, 30 May 2026 10:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0149985173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780138449;
	bh=K0la8vfCnAddPuzegCSbgzm8dO0xs6UwlnceNG40tl8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vdx90IB1j3Mlwv1WMGGf6VcPh7GmkRROXDCFEuf2rLGwHXmmtHkA+kjndvEWAas2K
	 GsOsGlp78ew8iOs6ghxocoGZiG+Q0H+hiHDFMHxgo8lOKqeg8uhMdSqQwXRnkG7jek
	 N7T4VItk/cSTSj3U+bVBYcAJ02pAnpiBtI2DnOrs5zPPWiWWGQ6Nnr4Ic7OiPya2Ih
	 SfVuhdFqJpHAiXjefkO2UG95oRLYltQDBt9cxly4Oer7VhY5ysaJYzQs8tib0w7c70
	 6JWDBBkPUqQsA9eefIrkbVvJoFgPi/9p3+4jV08yW+r9jg6NAf2XRyZ2ymJ6vbhkk0
	 z30i00HRdjb1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0149985173;
	Sat, 30 May 2026 10:54:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 592DC12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EEFA61C91
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QADLCV0ntGdF for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AE046F4A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AE046F4A7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C0D48749A; Sat, 30 May 2026 10:53:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:52:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b6a2f494290d85a26798564992ddd1ac46c1a48d
X-Git-Newrev: 7b977650468d0b296d9d9fcc96ef929adc53eed7
X-Patchwork-Hint: ignore
Message-Id: <20260530105352.2C0D48749A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Config.in: remove
 BR2_NEEDS_HOST_JAVA
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7b977650468d0b296d9d9fcc96ef929adc53eed7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Buildroot commit aac3d2b402fd2b8b91f125cf9314f4805b88f72a added a hidden
boolean option that packages which depend on java on the host can select.

Since buildroot commit 5366b8f734fe7aff7e95c1f92627265c5a75becc we can
provide our own host-openjdk-bin package.

Kodi previously used BR2_NEEDS_HOST_JAVA but was switched to host-open-
jdk-bin in this series.
The option BR2_NEEDS_HOST_JAVA is now unused and can be removed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in                            |  5 -----
 support/dependencies/dependencies.sh | 11 -----------
 utils/genrandconfig                  |  2 --
 3 files changed, 18 deletions(-)

diff --git a/Config.in b/Config.in
index 0bfe6d1ab5..ac58c685d1 100644
--- a/Config.in
+++ b/Config.in
@@ -101,11 +101,6 @@ config BR2_HOST_GCC_AT_LEAST_15
 # When adding new entries above, be sure to update
 # the HOSTCC_MAX_VERSION variable in the Makefile.
 
-# Hidden boolean selected by packages in need of Java in order to build
-# (example: kodi)
-config BR2_NEEDS_HOST_JAVA
-	bool
-
 # Hidden boolean selected by pre-built packages for x86, when they
 # need to run on x86-64 machines (example: pre-built external
 # toolchains, binary tools, etc.).
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 9c2aeaf23f..f44723678e 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -217,17 +217,6 @@ if grep -q ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG ; then
 	fi
 fi
 
-if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
-	check_prog_host "java"
-	JAVA_GCJ=$(java -version 2>&1 | grep gcj)
-	if [ ! -z "$JAVA_GCJ" ] ; then
-		echo
-		echo "$JAVA_GCJ is not sufficient to compile your package selection."
-		echo "Please install an OpenJDK/IcedTea/Oracle Java."
-		exit 1 ;
-	fi
-fi
-
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 	if test ! -f /lib/ld-linux.so.2 ; then
 		echo
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 5ebd552a1d..727c8193c4 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -113,8 +113,6 @@ async def fixup_config(sysinfo, configfile):
 
     ROOTFS_SIZE = '5G'
 
-    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not await sysinfo.has("java"):
-        return False
     # libffi not available on ARMv7-M, but propagating libffi arch
     # dependencies in Buildroot is really too much work, so we handle
     # this here.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
