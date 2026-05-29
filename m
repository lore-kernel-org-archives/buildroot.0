Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89800CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FBF885904;
	Tue,  9 Jun 2026 13:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uv6E5QbvmZ7o; Tue,  9 Jun 2026 13:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C2E4859C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010200;
	bh=0QGpPAeJCXhpgosx9ESXDb3YF8+LcIfbhRAJ6dWfu34=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kKB3gBh1zR+jiSMXLTQlVR+8GBs8NuGUIV+m2tHxQaFebhm3bnvAnnCGu1b6T1mmo
	 2w0uORkkef6UnYdEkmvaabKxHeBEPFF0o6Vt+sboHH4l72qhy9c/t7YIlQM8bwaNEX
	 f5NGtNv8zJtUej9e9Vemxght2xNPij+DsOG4OBoXWnkkNxCuPUSEKw7g0Z7b21oUst
	 crESbUlEZDlp1zSB0u8zxQmQ4dlMlZFKIdQqCSbKbYOhCZgYTNubd7upzU0aok8tRX
	 b+KxVriuxtmytoXKfA6n/0GEFIxqknNVd3qHzUW9OVlPNtAp4XjRCOQs1xQfZ93cVG
	 kdW8Oxu6lJ0fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C2E4859C9;
	Tue,  9 Jun 2026 13:03:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1087C2EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4CB0426ED
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEzcVXSzVYuZ for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51BAC426EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51BAC426EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E30C87E68; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:36:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 418bbf025d6054036055c0d0da7696335e603865
X-Git-Newrev: a397689ee1256d1dcf8451f0ddf467f93dd2c0f8
X-Patchwork-Hint: ignore
Message-Id: <20260609130119.8E30C87E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libudev-zero: provides libudev
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a397689ee1256d1dcf8451f0ddf467f93dd2c0f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libudev-zero/Config.in       | 8 ++++++++
 package/libudev-zero/libudev-zero.mk | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/libudev-zero/Config.in b/package/libudev-zero/Config.in
index 78263406a4..41f1d762f1 100644
--- a/package/libudev-zero/Config.in
+++ b/package/libudev-zero/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUDEV_ZERO
 	bool "libudev-zero"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_HAS_LIBUDEV
 	help
 	  Daemonless replacement for libudev
 
@@ -8,3 +9,10 @@ config BR2_PACKAGE_LIBUDEV_ZERO
 
 comment "libudev-zero needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+
+if BR2_PACKAGE_LIBUDEV_ZERO
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "libudev-zero"
+
+endif # BR2_PACKAGE_LIBUDEV_ZERO
diff --git a/package/libudev-zero/libudev-zero.mk b/package/libudev-zero/libudev-zero.mk
index 3097beccfb..5361a81b0a 100644
--- a/package/libudev-zero/libudev-zero.mk
+++ b/package/libudev-zero/libudev-zero.mk
@@ -9,6 +9,7 @@ LIBUDEV_ZERO_SITE = $(call github,illiliti,libudev-zero,$(LIBUDEV_ZERO_VERSION))
 LIBUDEV_ZERO_LICENSE = ISC
 LIBUDEV_ZERO_LICENSE_FILES = LICENSE
 LIBUDEV_ZERO_INSTALL_STAGING = YES
+LIBUDEV_ZERO_PROVIDES = libudev
 
 define LIBUDEV_ZERO_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
