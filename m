Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483DAD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F7C860D7C;
	Tue, 13 Jan 2026 20:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9hiuCo0Bwtl; Tue, 13 Jan 2026 20:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39BA260E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337974;
	bh=gjzZzeXZJ7Ej3bAF/k28gdNEeHH/Et1ZCurSObd+7iA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VMI+EZ0F92+TLOAZDkXpOjKkmGmdb7hpmRVm+BP+g0wpiK837H6QAlH5Jg2KUtoWW
	 nLVj4byLoJ1c1RAO4XigLgP0tsZ+xZrTSCU+5lvlWVlj6lzeZg9fdIHZde90MOvnx0
	 kKs23APbeDpxOFGP3Klh7sR9ouPZYFrKG/weO4acmZZSHCdOAj6LseGdii7mwpvUPu
	 1GCsdjRofBOhl4Xqs4IP16AYngt2r+dzBz0AEMkDcIIkRXZzR3HBQvpEJwX/KFRVbK
	 2CTCM9y7TSPOgcsud5rFndtM/dlkkzDCpWBftulQ99sYCrddwD3K4TsQhYelBsR+M1
	 +RIGYUcvw6CAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39BA260E96;
	Tue, 13 Jan 2026 20:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E889C1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AF15407D4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8xIjOxl5-lB for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E2EC4079F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E2EC4079F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CB1281382; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd3024c896b5704c8c5765892f8b92ced874710b
X-Git-Newrev: fa812972cdc9102ab51868119efd96be2720ee86
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.7CB1281382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xutil_util-macros: bump version to
 1.20.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa812972cdc9102ab51868119efd96be2720ee86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-November/003556.html
https://lists.x.org/archives/xorg-announce/2024-April/003509.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xutil_util-macros/xutil_util-macros.hash | 6 +++---
 package/xutil_util-macros/xutil_util-macros.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xutil_util-macros/xutil_util-macros.hash b/package/xutil_util-macros/xutil_util-macros.hash
index 4fcddb7a85..fc3ea8996c 100644
--- a/package/xutil_util-macros/xutil_util-macros.hash
+++ b/package/xutil_util-macros/xutil_util-macros.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003324.html
-sha256  0b86b262dbe971edb4ff233bc370dfad9f241d09f078a3f6d5b7f4b8ea4430db  util-macros-1.20.0.tar.xz
-sha512  76caefb118bf1675d7b2b96e1bbb04eb9a320b02e120839e55a22ef98538ecf00d0e686a67186fc8fdc8492d277ffe3125ae8b7ac61ce4739edc0de3f468d2eb  util-macros-1.20.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003556.html
+sha256  9ac269eba24f672d7d7b3574e4be5f333d13f04a7712303b1821b2a51ac82e8e  util-macros-1.20.2.tar.xz
+sha512  7d5ae8dbb6c1977e40c024f63d1405e7d5a40a38b90b01208d8dc1f1548e309734d1dec177b68bbf342a4d7d56ab0cfb4c8c36575c6a774b5a76a88d926c6d7b  util-macros-1.20.2.tar.xz
 # Locally computed
 sha256  7db0516389152a90c20ea910e8839d10204ebc25ccbc71fc7f5809dfb98e80ac  COPYING
diff --git a/package/xutil_util-macros/xutil_util-macros.mk b/package/xutil_util-macros/xutil_util-macros.mk
index e2e40eb84e..0a9720b394 100644
--- a/package/xutil_util-macros/xutil_util-macros.mk
+++ b/package/xutil_util-macros/xutil_util-macros.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.20.0
+XUTIL_UTIL_MACROS_VERSION = 1.20.2
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.xz
 XUTIL_UTIL_MACROS_SITE = https://xorg.freedesktop.org/archive/individual/util
 XUTIL_UTIL_MACROS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
