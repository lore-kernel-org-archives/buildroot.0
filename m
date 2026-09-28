Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE31C9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 12:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF8E680C4D;
	Mon, 28 Sep 2026 12:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B72XFBQBgUcR; Mon, 28 Sep 2026 12:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ECBAC80DC4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790597309;
	b=PSYen8sRvtypCNbtwDy/XezoUSAffBfkEuQcDcPTqJc/SGYWUr0Pjezl+G4C8NVRww3P
	 tWHnp0clecS4TXgq2LqCooQRa2uw1FacFN8QSMlgyzHC7xHYV4KVYdN4eKKRYLZdi1uKT
	 SoShgNVdJpbdpdmw+HT4Cx0DpTvhU//LPOrewaSIn7gHETm7fAqRqWt2n7lsz5tVH/jsc
	 XsQ44ZRn4MT62yRyHvy8dOgS6UDbqb2vJoqWwt3nvJKi7lINYBaIem/4EdKtaH9vmNR2m
	 w+ElMl3NTl90sWXCvpVRJOjMxx/f6MEO+7xUq31qXJcYptruDsn03mwh1+lmaVS8hpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790597309;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dukUhJn+ARy0VpNUm+tUjj+M9q6GGguRIDxYxB3pYY0=;
	b=BOzgvU3WgWaggqurKldoReRc0VTj0tbmlrvCyKPnkmgITLQIKakVUYO+tEw5mO3PXaBC
	 jo24nhkZDmechsV3EzhbZbxb8ZLKM/8KWw08KNb2/pX12eFG55CCbEanO5pmH4sSHWg5j
	 ogh1o+DDxS60HApdWiqnOaF5J9d8SEP7gSiJkTDOri3TVa95DaOrSqSihv3R3DchWUBXW
	 XKvZyJK0sfAm8tWu5ksxCYsocIfMNrcjnIVFR8xXAIx3tqoWwm9CSYnDoUlL0mITbXpcB
	 81Fzgbgkw6DomgnbRXNrkUwenT5c83JEYYeV5dnsnTWx1uWXH93ByujLQ+10zlw2z5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790597309;
	bh=dukUhJn+ARy0VpNUm+tUjj+M9q6GGguRIDxYxB3pYY0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rJMWpLbFkybgNDYfhBvbxb9TkdXeygvg7sZcJBqR/KSm5dH3ocVSXJdolmYsQgV3A
	 v7rVv7SXDZoqSek5fQUB8DncNGv0KaxnEWt1/s4EX1Paui8tTqvNi7V8OIah5cWixw
	 GK0hg+8ZflH2gBhypPg3TlAzfzWKQPxoeiq1ZDQpkxulfiRYIlVRVuyI79UbtZqX8J
	 +gcWITTQGeUj7f951g9ZzUBPcRCmkobyugC8eUpfRhCzZQRAOtjpow5XOhPPg7QXct
	 3YKEm6Z9b3BKHcTvDypGeH7PDpdH9n2kejagIgxYN371QiNwY6pBIdFApJ/pcgCctl
	 Qh791dmjGxQeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECBAC80DC4;
	Mon, 28 Sep 2026 12:08:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 609302B6
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52B4640583
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02Mh42leHMHp for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 12:08:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 831A940582
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790597306;
 b=IC+KmNVv5690J96Yh8E8LlY8G6tV4+FOuQarp8TfKqpbsUev0Le8k913Ed9RJkLzcf+h
 c7VtA6RFKkd0k4nqa5mSyfJV/2JOMcaIgnaKXHmLfc28Gt+RWOJFdqZyV1X/T4qdp21ix
 tHIGpAhTEwEOpqvKsIDfEStV5vTZ6xOHcXBDLsv8pK/4MCT9Rm16ue8V/jYu0MnkHQ5NQ
 rpQZ1Zze8MqdiYiKfOAmEr28GMEjuFCOSnoz58pQNB6Xe8CZrkUYMLAwoXs5284/ov02U
 fYZi6grmN9lm9g8jC4IsNOkJYsO3qhXPG123GgslWFJbIwYAwCLlJrswE/cjGP8wb7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790597306;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PIOmlLWuieeAK2tBf7QiRMvIUNg4LEnETq2bHImzWRw=;
 b=VYd7+875Xgx/a+QHM8BJ/pFVnSBhtS+n3uJhdfA/J+WvKNy0+gmOrH0Rw/CSqF/Py3Du
 OC/M31LB0/9pR+jtnQSNVSKAiwdKLR5bz/e1G/5if0UW/v40ys4K2/22SevlwbI9LKU/J
 8wVH4PPTiXEjJdKUF3URcLRZyJEbKehGw3A4y8H1I5lPEDXhgTjfbIHItptV3fdEKIntr
 lPS0vIh23HW/CUTpmeccBlrKGkjbhAR/OHL38Qd72gYd5WjU/fsxLNYZvPF9h1VTQnBYm
 RUjpTqGCnjHZZ2mDDW2zsmTRcGOK1xGyetQykUbVwIVGtQ53EkUoQXCIOQfoBOQeD9A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 831A940582
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 469E39830F; Mon, 28 Sep 2026 12:07:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 14:00:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7dab0537a0c414a5282f1918550f06a2dbfcdd2b
X-Git-Newrev: eb6d16df92736b6681ed22bf243c10878d2061f3
X-Patchwork-Hint: ignore
Message-Id: <20260928120714.469E39830F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcsc-lite: bump version to 2.5.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb6d16df92736b6681ed22bf243c10878d2061f3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Autotools support was removed upstream in 2.5.0, so switch to the meson
build system:
- the tarball is now only provided as .tar.xz
- --disable-strict has no meson equivalent and is dropped
- there is no debugatr option anymore, so define ATR_DEBUG via CFLAGS
- pass -latomic via LDFLAGS instead of LIBS
- meson installs the systemd units into the user unit directory by
  default, so pass -Dsystemdunit=system to keep them in the system
  unit directory as before

Since 2.4.0, pcscd.service runs pcscd as the unprivileged pcscd user,
so add it to the users table.

COPYING hash changed because doc/example/pcsc_demo.c was removed from
the list of GPL-3.0+ files; Buildroot already listed it as
BSD-3-Clause.

https://github.com/LudovicRousseau/PCSC/blob/2.5.2/ChangeLog

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcsc-lite/pcsc-lite.hash |  4 ++--
 package/pcsc-lite/pcsc-lite.mk   | 34 ++++++++++++++++++++--------------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 806792faee..eab6397438 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  85cab61cc744c81e2bc432656863293b8428d0136f079e3b12a84b335b5b35aa  pcsc-lite-2.1.0.tar.bz2
-sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
+sha256  60a08942d8c00a1d86a3bf4c64eddbf7a5569c7c54f6904e3f07801bb5316acd  pcsc-lite-2.5.2.tar.xz
+sha256  7dffe53fb02dd12a3518335d9c948484ee91ca098f1fac2ee9f9af639bbde7c9  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 8418d6a32a..a3a8fff323 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,56 +4,62 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 2.1.0
-PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
+PCSC_LITE_VERSION = 2.5.2
+PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.xz
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf host-flex
 PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (spy, tests), ISC (simclist)
 PCSC_LITE_LICENSE_FILES = COPYING GPL-3.0.txt
 PCSC_LITE_SELINUX_MODULES = pcscd
-PCSC_LITE_CONF_OPTS = --disable-strict
+PCSC_LITE_CONF_OPTS = -Dsystemdunit=system
 
 # - libudev and libusb are optional
 # - libudev and libusb can't be used together
 # - libudev has a priority over libusb
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-PCSC_LITE_CONF_OPTS += --enable-libudev --disable-libusb
+PCSC_LITE_CONF_OPTS += -Dlibudev=true -Dlibusb=false
 PCSC_LITE_DEPENDENCIES += udev
 else
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
-PCSC_LITE_CONF_OPTS += --enable-libusb --disable-libudev
+PCSC_LITE_CONF_OPTS += -Dlibusb=true -Dlibudev=false
 PCSC_LITE_DEPENDENCIES += libusb
 else
-PCSC_LITE_CONF_OPTS += --disable-libusb --disable-libudev
+PCSC_LITE_CONF_OPTS += -Dlibusb=false -Dlibudev=false
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-PCSC_LITE_CONF_OPTS += --enable-libsystemd
+PCSC_LITE_CONF_OPTS += -Dlibsystemd=true
 PCSC_LITE_DEPENDENCIES += systemd
 else
-PCSC_LITE_CONF_OPTS += --disable-libsystemd
+PCSC_LITE_CONF_OPTS += -Dlibsystemd=false
 endif
 
 ifeq ($(BR2_PACKAGE_PCSC_LITE_DEBUGATR),y)
-PCSC_LITE_CONF_OPTS += --enable-debugatr
+PCSC_LITE_CFLAGS = $(TARGET_CFLAGS) -DATR_DEBUG
 endif
 
 ifeq ($(BR2_PACKAGE_PCSC_LITE_EMBEDDED),y)
-PCSC_LITE_CONF_OPTS += --enable-embedded
+PCSC_LITE_CONF_OPTS += -Dembedded=true
+else
+PCSC_LITE_CONF_OPTS += -Dembedded=false
 endif
 
 ifeq ($(BR2_PACKAGE_POLKIT),y)
-PCSC_LITE_CONF_OPTS += --enable-polkit
+PCSC_LITE_CONF_OPTS += -Dpolkit=true
 PCSC_LITE_DEPENDENCIES += polkit
 else
-PCSC_LITE_CONF_OPTS += --disable-polkit
+PCSC_LITE_CONF_OPTS += -Dpolkit=false
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-PCSC_LITE_CONF_ENV += LIBS=-latomic
+PCSC_LITE_LDFLAGS = $(TARGET_LDFLAGS) -latomic
 endif
 
-$(eval $(autotools-package))
+define PCSC_LITE_USERS
+	pcscd -1 pcscd -1 * - - - PC/SC Smart Card Daemon
+endef
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
