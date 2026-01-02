Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC587FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8573840593;
	Fri,  2 Jan 2026 17:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0sk_uwieE3b; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97825406D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374201;
	bh=exhoEtrVk5JfhfjrUs2oCtPS4V6tg9OLn13f7GDv2+U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C/7Wk/fBkVb7vBUpwt/MY909eu3oejRuiU7skiyA81bi8yJ2AykaLcvcBS5cvFsid
	 h9otiE2rscT7Eq0nur++gXx4g73oIhHz0qfYH++Ntr+OjlgyfJAgll5vRisG+Y7/68
	 iJ9/jvXR3ditvdkiDl/o1Tw6UKcKTtOYYGGxN4vEOgbJmH7M4pMc23W+oCFM5DI2Gm
	 HrZHjR5oX8BEvga2k+0oabWQgCVI6RzY3mVk+T8bOq3b0aiCNnY3aPlwW6ZiPum/z8
	 Ws3MZXbblNugrSN/oxXtwwsymElkV8lTaD5XBooSFaepF1LaLJm0F6837d5vtu+imZ
	 KCm2rQLf7cIlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97825406D0;
	Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF28019D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1257404C9
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnmEzGd4Y1Sx for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:16:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED8DF4000B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED8DF4000B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C115C87D4D; Fri,  2 Jan 2026 17:16:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:10:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20f31f90ad55b3e0654b6bc1b1ed76e7a1e6032e
X-Git-Newrev: dc115ca708da277b138583caf725375749297e0d
X-Patchwork-Hint: ignore
Message-Id: <20260102171639.C115C87D4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: new option to enable
 building libdebuginfod for target
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dc115ca708da277b138583caf725375749297e0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This does not make debug info available, but allows building programs
that link against libdebuginfod.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elfutils/Config.in   | 10 ++++++++++
 package/elfutils/elfutils.mk |  9 +++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index e866dd448b..f6a7d6683d 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -33,4 +33,14 @@ comment "elfutils programs needs a glibc toolchain w/ C++"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_INSTALL_LIBSTDCPP
 
+config BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD
+	bool "Build libdebuginfod"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBCURL
+	help
+	  This option enables building libdebuginfod. Note that this
+	  only builds the library, it does not provide any service or
+	  data to download debug info.
+
 endif
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 554a60003f..176dc79f79 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -49,8 +49,13 @@ ifeq ($(BR2_microblaze),y)
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
 
-# disable for now, needs "distro" support
-ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
+ifeq ($(BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD),y)
+ELFUTILS_CONF_OPTS += --enable-libdebuginfod
+ELFUTILS_DEPENDENCIES += json-c libcurl
+else
+ELFUTILS_CONF_OPTS += --disable-libdebuginfod
+endif
+ELFUTILS_CONF_OPTS += --disable-debuginfod
 HOST_ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
 
 ELFUTILS_CONF_ENV += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
