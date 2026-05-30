Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BDBCD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA3085B17;
	Tue,  9 Jun 2026 13:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1w52qXLZhYUL; Tue,  9 Jun 2026 13:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B5C285B24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010240;
	bh=tlY5heTSjqTF/rTnEUVeS/bbwByo9Dr7Z4Bgr4Qa6qs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dkeTKF/DHKY1i8MA6Gtk3c4tiLLi0MV3ej4nn4YT7pnrrH30XEkb/0jzqVJhb2/lZ
	 74hmO4Hp0dQSJiz6Ik1ZgD1KDyb9E0V4acQmbXpFpNHdfdGTVQTGqu2NEeVIFNmZae
	 6zbxza1AO6iKWasgJFSeWR9PhoMMfFV+nyFFOUl/PmXx5ERMpNuQcORgKMC9gPNSgP
	 /3UW+XZrBza9M0486p9K4iTI2Vv8ZGGzAMJne0c4x/YyzMbX2tPaI4r9LGG6oFgAUe
	 IpW/zG59YXwqM6juCdEYlx5GEfCvGL0+bnU156e5mT+W3MDfeHhqnyP83FRnBulVbY
	 in3tJXjaYSK3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B5C285B24;
	Tue,  9 Jun 2026 13:04:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CB85196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E23E426E0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4iGKayj73KJ for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DDFE426DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DDFE426DB
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A918287E68; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:52:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6a2f494290d85a26798564992ddd1ac46c1a48d
X-Git-Newrev: 7b977650468d0b296d9d9fcc96ef929adc53eed7
X-Patchwork-Hint: ignore
Message-Id: <20260609130121.A918287E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in: remove BR2_NEEDS_HOST_JAVA
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
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
