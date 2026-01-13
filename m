Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814EED30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 846D740C2E;
	Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5RAyxXOeqGUL; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 990C140C48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337930;
	bh=im1oszZMyrUwBLdED8xIKY1l46l1dKHvV2NppgT4MTQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E7J37NqpmRzeWf1syHAUhep58RQhjEmvbeDR+vY6crwZDYra2Dk/rENnlITkuCUc/
	 GelDGXzD8A/KsZ4voZA8mojK2ZrS9uAMyl/PoLmgSS/d85C6E90mdy7U0PCHt48VCb
	 9UqeL5ndPXj8xup70niNHAW5Qygk2ozNELplv8gdKhl5n1XBDR80eOQpd4VEhA8vcp
	 Qjr9F+tY25cCnef7OgqBa3CBb6BBlW2gVOxesZo6y73Hnp051yofHDWvV/fl0F8jSh
	 U2QOYvkV7deEFrK7nQ3pjJBHS79j7wffGFZsnQ/XIH/41t4MdfMt7xIgWYpzhnnc9Z
	 Ib72AK6awxf9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 990C140C48;
	Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1748B1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D01B40084
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-wy9GgRdElB for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 951684073D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 951684073D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84A96885B2; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58e859c9ff9c036fa6e58d123f77cec1d1a12495
X-Git-Newrev: 47fea0b7089582755bcd492d7bba183c3651b85d
X-Patchwork-Hint: ignore
Message-Id: <20260113205845.84A96885B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xkbcomp: security bump
 version to 1.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=47fea0b7089582755bcd492d7bba183c3651b85d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-December/003645.html
https://lists.x.org/archives/xorg-announce/2024-February/003450.html

Fixes CVE-2018-15863, CVE-2018-15861, CVE-2018-15859 & CVE-2018-15853:
https://lists.x.org/archives/xorg-announce/2025-December/003644.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash | 6 +++---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
index b626e50236..dfebd08e07 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003283.html
-sha256  fa50d611ef41e034487af7bd8d8c718df53dd18002f591cca16b0384afc58e98  xkbcomp-1.4.6.tar.xz
-sha512  90e69dd1c78c28f77a5acc7821b43afec1b9ac4895bc6f3462b4902baaadc26f3869da69e3bd023b4bc74adb5f1be0c43ca24b3dab37ac9a479c5622684baa81  xkbcomp-1.4.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003645.html
+sha256  2ac31f26600776db6d9cd79b3fcd272263faebac7eb85fb2f33c7141b8486060  xkbcomp-1.5.0.tar.xz
+sha512  d8ef4906261251e2600b3650660fbe88ed99a44694f1e59b433e0811f1ab5234c4f2f0b3647fa5372fb0f46b56eac60c0219a762bf1af0ab06226b63e4a6b081  xkbcomp-1.5.0.tar.xz
 # Locally computed
 sha256  6b833fdc05906ce57f016dc791db86830d49ee4da2861ce45806c50b3f4dda9e  COPYING
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 61922c7cc9..97e131f353 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XKBCOMP_VERSION = 1.4.6
+XAPP_XKBCOMP_VERSION = 1.5.0
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.xz
-XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBCOMP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKBCOMP_LICENSE = MIT
 XAPP_XKBCOMP_LICENSE_FILES = COPYING
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
