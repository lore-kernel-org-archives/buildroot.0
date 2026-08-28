Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825A8C61DD9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C46BA80F46;
	Fri, 28 Aug 2026 14:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WD6JZaTZm_KR; Fri, 28 Aug 2026 14:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927021;
	bh=qRvLUULvnVePcHFNH14V0ZlbMjLNFmAbRiTufbsz9bA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WCc+Ouw8KBuzIZxaxJKFe/FxfTEb2QN0J8R/5PXHrZ+Ri/HE65tBCKOA0RBXQKKKr
	 8pCv9WalYMWyJ0tqg7nxqxFJoIAiL/w9ltLWgQeCcBAPy00/4tCFoDT+1tKMijFjKj
	 yGbykTS9Z6pmxysqbCxd5PLkZ6NaBVI/aLY73SUVi5QF/WhvRaEBWN7zm4cT43LFX2
	 JlWzxIZ39udllsriEHXceu5QcMXuS0d0KTTSZebGuPIRD3LRsqiUPMwymNUUomrAnZ
	 aLzj16nQjLhJ2G4qtIL9k8fvs7ZCdi0v/Dqtt+3UP1Pi+jgT1Rj+BwHJs1PmKmIGKz
	 b8K/8UBn38gGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B44A480E18;
	Fri, 28 Aug 2026 14:23:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 537A3D28
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4523C4086A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWwvtIu-OIiW for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06B54407D6
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0526E921F9; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a86d248b071124b0eabe10913d5ae3ffe569c739
X-Git-Newrev: 13b42633d37d516e667abe3b4081ad67d0e99c8a
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.0526E921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wine: select
 libxkbcommon and libxml2 for the Wayland driver
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13b42633d37d516e667abe3b4081ad67d0e99c8a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

wine.mk passes --with-wayland whenever BR2_PACKAGE_WAYLAND is enabled,
but nothing guarantees the rest of what wine's Wayland test needs is in
the configuration. That test is:

  WINE_NOTICE_WITH(wayland, [test -z "$WAYLAND_CLIENT_LIBS" \
    -o -z "$WAYLAND_SCANNER" -o -z "$XKBCOMMON_LIBS" \
    -o -z "$XKBREGISTRY_LIBS" -o "$ac_cv_header_linux_input_h" = "no"], ...)

and because --with-wayland is passed explicitly, WINE_NOTICE_WITH turns
into AC_MSG_ERROR rather than a notice.

So wine needs libxkbcommon, and it needs the libxkbregistry part of it,
which is only built when libxml2 is available. Select both when Wayland
support is enabled, and add libxkbcommon to the build dependencies.

Note that libxml2 is not a direct dependency of wine, it only has to be
in the configuration so that libxkbcommon builds libxkbregistry; the
build ordering is handled by libxkbcommon's own dependency on libxml2.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a5e7f7af9fe9ca887003d725dc1ed26a314f1d45)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/wine/Config.in | 5 +++++
 package/wine/wine.mk   | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/wine/Config.in b/package/wine/Config.in
index db3b1570ef..7a01ef6f7c 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -17,6 +17,11 @@ config BR2_PACKAGE_WINE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_ALSA_LIB_SEQ if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI if BR2_PACKAGE_ALSA_LIB
+	# The Wayland driver needs libxkbcommon, including its
+	# libxkbregistry part, which is only built when libxml2 is
+	# available.
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBXML2 if BR2_PACKAGE_WAYLAND
 	help
 	  Wine is a compatibility layer capable of running Windows
 	  applications on Linux. Instead of simulating internal
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index efee63a294..29908b577b 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -195,7 +195,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 WINE_CONF_OPTS += --with-wayland
-WINE_DEPENDENCIES += wayland
+WINE_DEPENDENCIES += wayland libxkbcommon
 else
 WINE_CONF_OPTS += --without-wayland
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
