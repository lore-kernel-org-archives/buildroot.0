Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D76D30CC0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C181A40DE3;
	Tue, 13 Jan 2026 21:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDMefEgZFXhw; Tue, 13 Jan 2026 21:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E208940DDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338008;
	bh=mvT4r0ENfWJhGdkGVdudLYrynOYw8XDGtykkkmleW7E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PLCyxYaGhUS2QUHNaGgB50/PeFUnKUrDWGkU5Dxv5QDNO5B6xld5yg7Pv5gLAavn1
	 1ewQxkuHpLTgoOQb3cNbchctnMlTWBau9LLA9IGhxIZHNTQcYS4tOFz0Pny4BHRk1J
	 mBbWWwy6Amv5q46owid+b40uvq7zOsCy0gyyjgw9xLyQtiiqUluo3w34PZnkJD/H/m
	 35Cx3Nkt49Iy4HJQ2XtaY6xNZcr7FNj0ohAGMjmcu2p0cz0PoLLBbXVGlqVLbl4xWh
	 WW7gxq3aAJf31WgvBjOZunjnzCW5SaaDLT05NA4i31Dojo8PRcvX2ap0fRD39fr/g5
	 L06mAda3XFLtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E208940DDF;
	Tue, 13 Jan 2026 21:00:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A6A11CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 254FD4077C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1n9YuygtI2oO for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61CA140740
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61CA140740
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FFDB81382; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7c2ce79a16293fa7eec197fa42fceebafa27237
X-Git-Newrev: 4e59dc19d7ae4e33a756fc4f996a7fbaf9cafeb8
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.5FFDB81382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xsm: bump version to
 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e59dc19d7ae4e33a756fc4f996a7fbaf9cafeb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003479.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xsm/xapp_xsm.hash | 6 +++---
 package/x11r7/xapp_xsm/xapp_xsm.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xsm/xapp_xsm.hash b/package/x11r7/xapp_xsm/xapp_xsm.hash
index 9568836bbc..ed6ad5455b 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.hash
+++ b/package/x11r7/xapp_xsm/xapp_xsm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003152.html
-sha256  9c30fdaa3fc132e4ff201cfc478669056e6e15502e77df88df11fb94e4e6fb2d  xsm-1.0.5.tar.xz
-sha512  df3777b3aab813ec8aa906f5a03f93b8ca645978970290cf7baf732e175c36c00ae19baeb45ea7404d35838c21e6f8fca28f0da3e2f398d17adac5f2acb7b351  xsm-1.0.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003479.html
+sha256  b74cc774c6060c37592f68a90dbd31b0f2a62fb14e562769434f79be284a63ce  xsm-1.0.6.tar.xz
+sha512  ee4e9b4ab6be6773e53685540f807b03d553bfecc26c4e85fe12daca486fdeb66c594c6eab54043a8c149112c7a3ed18e463d68d7aee62e93a06c091ce39c268  xsm-1.0.6.tar.xz
 # Locally computed
 sha256  5531d18cfcc944dab39991f63f182cbbce3fe493ba0c7cf08a25c0d01ee84482  COPYING
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index 1c73f5c65c..9783273d4e 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XSM_VERSION = 1.0.5
+XAPP_XSM_VERSION = 1.0.6
 XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.xz
-XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSM_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XSM_LICENSE = MIT
 XAPP_XSM_LICENSE_FILES = COPYING
 XAPP_XSM_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
