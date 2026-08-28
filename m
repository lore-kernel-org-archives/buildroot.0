Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC63C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6267B60859;
	Fri, 28 Aug 2026 14:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TxftnRsQU_D; Fri, 28 Aug 2026 14:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927148;
	bh=c7p+upQ/YSbk7O+GBdoQz2pebyKicP80ZB09nlAyVm8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fR84670ejtsSOSCpxbSUVRvX6Q9yMKUtjhd/3+vC6YCDeOBuuDXINt2wdgkGEqDEb
	 XF9xO7ImaBEa+trLaiPcke+rSG4lHP7BIeEnOoJT7bjzQSPntturxSPdaa4NGqmTTr
	 gRPLb+W+GlbvbYuCsa4eNZWLvneUJhijSfDllun/x/nZA+uz7qBh7k2abKyktrKk6R
	 kiQR9fecjB6YEg2bu5OhhWNz8QhCf3uGrq5/AGdC9zo3zDSY2+VDK2Tn3ryecL7Wrs
	 F/4Al7G/FyIecCcBqc11qRLuZtBvMiS+O5dts6l9fNIrPF33r8pkEBzwKrWbeHA4l3
	 Poes1VU2V1KpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B80E60823;
	Fri, 28 Aug 2026 14:25:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FB8BD28
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8517380F50
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEfFlc_lYd46 for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1F8680ECB
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D048D921F9; Fri, 28 Aug 2026 14:24:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 92c3e21893ae9de832f7aa629f4ea863bc4b854e
X-Git-Newrev: de57d9bcd93e401ba369b98ec3a4fa8dc636e129
X-Patchwork-Hint: ignore
Message-Id: <20260828142441.D048D921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/wine: select
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/de57d9bcd93e401ba369b98ec3a4fa8dc636e129
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
index 4f0e229e9a..eca13d77cb 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -189,7 +189,7 @@ endif
 
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
