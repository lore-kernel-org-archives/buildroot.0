Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E95CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF6785A5D;
	Tue,  9 Jun 2026 13:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBnXLcrQ_FPB; Tue,  9 Jun 2026 13:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34D1185A02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010212;
	bh=6JkfTN6L1DFKHXLo7rfJMV1mNpcT/rvqQZo/R6IdUYI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FPXu/SJk6/U5L51rW8O72BrCgNs7XKCtfez8ImGRcMNiLm25YS7PmfQSqJigUiCEH
	 UWgJixQcoY8XqOXZ2RjxvuOv/4PaSSQI1jwQXijts2QMpeMjxn1w18ftHUPfXBKrkn
	 xoZxlzEnkYjnCt6J+TuVVPt46KJ88mPR3BxWc4THap7ZEEcMBu9XfGQbS76G7fl5HH
	 Fvu0K4lVPqB0Eg+Yz7nwfh1/2zWlzO0z83y00r5mC5zCwbqKRkv7WFGgNpdVOwFSDx
	 NXFXL4y049tpTSkPxxCg5/zxJhlQbKwsJX7kUAvYKUFljXyiZJ/nl82dqw8JdBnbVn
	 pwqkDFbDWkJKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34D1185A02;
	Tue,  9 Jun 2026 13:03:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48FA82EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22609426C0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jclZ6NGqjiLP for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88AE4426F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88AE4426F0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3EC087E68; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:36:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f22ee807403a440b4f66ad8a5741d8f5fc04cd74
X-Git-Newrev: 3f24135c56f6aa8f0524307b7339512fecfa6f92
X-Patchwork-Hint: ignore
Message-Id: <20260609130119.C3EC087E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: only needs libudev,
 not udev daemon
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f24135c56f6aa8f0524307b7339512fecfa6f92
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Bernd: adjusted for libudev-zero]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libinput/Config.in   | 6 +++---
 package/libinput/libinput.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index f5253dfec2..eb5ed75c85 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBINPUT
 	bool "libinput"
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_LIBEVDEV
 	help
 	  libinput is a library to handle input devices in Wayland
@@ -34,5 +34,5 @@ config BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS
 
 endif
 
-comment "libinput needs udev /dev management"
-	depends on !BR2_PACKAGE_HAS_UDEV
+comment "libinput needs libudev"
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 33fd012076..7d7db01b10 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -7,7 +7,7 @@
 LIBINPUT_VERSION = 1.31.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
-LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
+LIBINPUT_DEPENDENCIES = host-pkgconf libevdev libudev
 LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
