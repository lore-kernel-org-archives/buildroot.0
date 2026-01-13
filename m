Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE04D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCD7960DEB;
	Tue, 13 Jan 2026 20:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ih6ya1gUwc8; Tue, 13 Jan 2026 20:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B1760DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337954;
	bh=FPoOzOlIgMAaVNibRJaariqWgGoWEzm3KZEB42K40cE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g5GnLLgbfgd/MczMU/B18wuUF2Ab+PVcksM3IPVsAa/MS/KJ9AS72u4kqwL43JMPT
	 it5E4lEufMskJA6zdumCnVdJnfVY/Ft3hglACnklDUf93QmlfFcPI3GlHwhquZt/4q
	 1GA/dt1li7otdVUUeXMCJCUDecDebYiu6sXh98mXtAAn5N4sZwNqDJRkNUPTx2hn8T
	 MUDBZ/Hv/JsQSSA0f+Hj9ygqVvDVbSWOrPN79w7EyKXfQk2PvDg3aUdnxogo259LHi
	 0m3bUnndiSy2Ds00xXvOlCUSFL0YWjqGkQC4KkYPDAsDGSVSOxuJF7ivYlFjftTL6v
	 yipIn/a7fraxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B1760DED;
	Tue, 13 Jan 2026 20:59:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1728C1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A17140781
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kD3711eqTSMj for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E62D4077E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E62D4077E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C5D784685; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bed191965f1685ea05d99625b9906c233048a990
X-Git-Newrev: ef603acb90762e550c3c1396559b63b7732faf89
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.2C5D784685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xeyes: bump version to
 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef603acb90762e550c3c1396559b63b7732faf89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-July/003618.html
https://lists.x.org/archives/xorg-announce/2023-July/003409.html

Switched tarball to xz.

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xeyes/-/commit/7dc4f720f57471d2eccefd87cdca54494cf75eb5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xeyes/xapp_xeyes.hash | 8 ++++----
 package/x11r7/xapp_xeyes/xapp_xeyes.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.hash b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
index 734492b6cd..ce058140ea 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.hash
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-August/003101.html
-sha256  f8a17e23146bef1ab345a1e303c6749e42aaa7bcf4f25428afad41770721b6db  xeyes-1.2.0.tar.bz2
-sha512  2d1614614b3ba3d1ebaa0e9801a2e159389b94aaacafb962d326b7e6dc712c1eb2c12a50ceb10b3135cf0eee6ae86bbf84e73098deb08e73792f14a60616b4d8  xeyes-1.2.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2025-July/003618.html
+sha256  5608d76b7b1aac5ed7f22f1b6b5ad74ef98c8693220f32b4b87dccee4a956eaa  xeyes-1.3.1.tar.xz
+sha512  c0c3e25b1685cc943c8d27f88c4d3ec79aa05c102ba7ac0cbd7dcebdf703111ecb2288f4bac55d9ffc5b7aa3b15cba58f28c21025a53b415a8a18bdb61688dcf  xeyes-1.3.1.tar.xz
 # Locally computed
-sha256  d8de1de40e16227d1eb4b19e95117ce3f990f71f71df096a2259b0bc9931e042  COPYING
+sha256  eb051f2b83cbc5c65b3b8c268747ee7fe5e37997375af47d269beca8ec58b362  COPYING
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 3f37aaee8c..29f8022170 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XEYES_VERSION = 1.2.0
-XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
+XAPP_XEYES_VERSION = 1.3.1
+XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.xz
 XAPP_XEYES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XEYES_LICENSE = MIT
 XAPP_XEYES_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
