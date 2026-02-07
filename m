Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CADEEE0AF1
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 19:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C178D4095F;
	Sat,  7 Feb 2026 19:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jotdq_rvfW_B; Sat,  7 Feb 2026 19:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D892B409BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770493087;
	bh=XAU4RpUphsPMnS+XBOlrDwzy2sLyA0EjaH5r07LGED0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K82RXsgO3IjtK6zlF+5iWfQ61ncpKQ/lqtCoCWP6rbBA0FQGGxSp6mVlzpHcCOl15
	 3dX/ukyf/QY1yHaUhSOHQbBOMJWzCIPVpqGWqw2oQr4aS2NkBYiLLr3VshcFtk+fIf
	 v1q1sN14mscLWk7exbnBdl35q+3DhQF5lcD+Vwa9VTQ5/CeYFL+XuMOUmVeoZ+BS9J
	 abFmpWT7IJWfE+IqSQnZ2VrFKhTkYnBSjuZICUbBOkFfB1zSf+cMPHj3NG8ngcxOMP
	 s1wL8LJZzVi1zztUc2VTTYCJO1czS1K7DApDS49bGaQKInYmDhguJbX8czyANK5Brh
	 YhqP5p/lmNiOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D892B409BD;
	Sat,  7 Feb 2026 19:38:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C20CA2C5
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3CF160F58
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJdNOhViQclX for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 19:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5540611F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5540611F9
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:38:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3662986B52; Sat,  7 Feb 2026 19:38:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Feb 2026 20:34:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b7b895d10a8156e96f17742c6b05eb6fd47ca40
X-Git-Newrev: fbebf670c4acd9bccf81ea18f1cf38d9f934271c
X-Patchwork-Hint: ignore
Message-Id: <20260207193803.3662986B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fbebf670c4acd9bccf81ea18f1cf38d9f934271c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-February/000837.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 933f7ab731..263c79ec38 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.3.4
+MESA3D_HEADERS_VERSION = 25.3.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f76043488e..346738458a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-January/000834.html
-sha256  3a0fc6ec070b45ae25dc2ccb5e52fae1d89141f7c39c4a91fe4eaa80dfff9deb  mesa-25.3.4.tar.xz
-sha512  3043bebebebc90ba443bbc96d71fbae41c76504d54ff6a44a48ad7c3a132db09e3ad1ae607c49f1d58b724a8b6e4263b68ee5722f8b98328481eb2e82164ac3a  mesa-25.3.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-February/000837.html
+sha256  be472413475082df945e0f9be34f5af008baa03eb357e067ce5a611a2d44c44b  mesa-25.3.5.tar.xz
+sha512  3db3d3c98bf476a5827705b82733d9964ec511b30882ec7e9edaddc65a5dea5e6bfb33bdcd4f97752d7a3ae9e306e8703982686cbd869567b4194decdb2f5a89  mesa-25.3.5.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b5300df2ba..64b8113e6f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.3.4
+MESA3D_VERSION = 25.3.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
