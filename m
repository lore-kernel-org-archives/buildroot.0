Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9732CC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 20:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3916840A78;
	Fri, 10 Jul 2026 20:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xrpzAznZByg; Fri, 10 Jul 2026 20:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4044940A69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783716528;
	bh=r2tWy/kmTC+LG+3DHzUl1HkNgc32jOLewa8aXkK6uR4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JxdsOCMURCd09bA7yhlFhoT5VOBELRW4SifAI/SIL6xiB34Z+CB9WgNpHXt/6V4wY
	 BPDY0MpdERLQBlvfX8t/loA3VDnjdU+dE2jYId61JYxTNlpojcNTc15VgLunX214Ag
	 kIfcDMbxUfzRWQ8m+iKyIxwqYrNi/d2DW4x1u8jrbgizbqrCPWxHK4T6QftIkbqVrS
	 F3R/T4e6KcpipGm3DZKAra1scQe0P08vgi6QBlhorU/l9vnREj9bg7Lp5eJIzarRq7
	 mOg8Ym0KPLDMpz4QMfLSSQDa1NU93uZ7jiO89zmgMmdgSwj93OkGr22MXI87rhF1Sa
	 OIcNfWGRsvmAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4044940A69;
	Fri, 10 Jul 2026 20:48:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DD13372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 101D0810F0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id keW27EI8LTC0 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 20:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 455EE810EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 455EE810EF
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:48:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27989886E3; Fri, 10 Jul 2026 20:48:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 22:44:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 152e6abffa1635250dbf72f87a63843f1ac4c0a4
X-Git-Newrev: 053615b6a769826ff77dd0ccb1bef08a12943fdc
X-Patchwork-Hint: ignore
Message-Id: <20260710204813.27989886E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: fix build on m68k
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/053615b6a769826ff77dd0ccb1bef08a12943fdc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

samba4 uses very big switch statements, which causes the build to fail
on m68k, because the offsets there are only 16-bit.

We fix that by using -mlong-jump-table-offsets on m68k to use 32-bit
offsets for switch statements, but this is only available starting with
gcc 7 [0] [1].

Only one package selects samba4, mpd, but it already depends on gcc
>= 12. As such, we do not need to propagate that new dependency.

Fixes:
https://autobuild.buildroot.net/results/b60/b606da691bb462879d4f9769928b5a40b9170837/

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c15
[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c16

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/Config.in | 5 +++++
 package/samba4/samba4.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index e1d3dd9bf7..59f040e96a 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -4,6 +4,10 @@ comment "samba4 needs a uClibc or glibc toolchain w/ wchar, dynamic library, NPT
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
 
+comment "samba4 needs a toolchain w/ gcc >= 7"
+	depends on BR2_m68k
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+
 config BR2_PACKAGE_SAMBA4
 	bool "samba4"
 	depends on BR2_USE_MMU # fork()
@@ -12,6 +16,7 @@ config BR2_PACKAGE_SAMBA4
 	depends on !BR2_STATIC_LIBS # cmocka, python, gnutls
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_m68k || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # m68k needs gcc >= 7.x
 	select BR2_PACKAGE_CMOCKA
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_GNUTLS
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 2d6bc80b9e..006fbff6c5 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -32,6 +32,11 @@ SAMBA4_CONF_ENV = \
 	XSLTPROC=false \
 	WAF_NO_PREFORK=1
 
+# m68k needs 32-bit offsets in switch tables to build
+ifeq ($(BR2_m68k),y)
+SAMBA4_CFLAGS += -mlong-jump-table-offsets
+endif
+
 SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python3"
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 SAMBA4_PYTHON += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
