Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5645CC43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 17:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0074A80FA1;
	Sat,  4 Jul 2026 17:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jx7WIoeBvJTZ; Sat,  4 Jul 2026 17:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E57C680FDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783185485;
	bh=R6oXZyBSBGbr9Twk9uq6nL+NVl7iCI/auPIC7DOG3zs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pD7OR0WlSD/zd4kaXgOxBGd3IrD8D78bI/LzYNKOGk2mWufRNn960kVeTHdAoz8hp
	 OdcEr/R9Zi+vj+HiEFyK4lCJWFWhAKe1CVWKahIk0aIeE1tcq7DeMwI1QtNm2PEsq/
	 YmhQH68HUXkLJvUihJozD8OENbkUCgQEYcdMk0vH50u4MR+jwY+rEuv+Nr3r5tk1pP
	 saSWJxfXhyqwb7OLLM8w8AL6GyqhstL1XFipfL7CC6+6AX9ByIjMD33x76qbua9XEz
	 UBLCgDPi3L7r51IrylUaEyyRz7kTzhl0+LioqaiM5xugqAS2J2XCiqD4nlxutKnW1R
	 LH4ww3He0pSsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E57C680FDE;
	Sat,  4 Jul 2026 17:18:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0A852A8
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 933A660631
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDJ8eKqPX-WZ for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 17:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF01D6061C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF01D6061C
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF23B88406; Sat,  4 Jul 2026 17:17:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 18:41:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 980d01157074d4403221534a54d17f5bf9563697
X-Git-Newrev: 760160039b997740126e83eb03c2a16399c3f073
X-Patchwork-Hint: ignore
Message-Id: <20260704171732.DF23B88406@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/760160039b997740126e83eb03c2a16399c3f073
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-July/000857.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 9781a1357c..324d4e1708 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.3
+MESA3D_HEADERS_VERSION = 26.1.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index abc0527907..6e77b17b0d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-June/000855.html
-sha256  7725004e724b34c6d4fbaf5c48fc6c6223aa9f2741d6d7782c699b049356fc45  mesa-26.1.3.tar.xz
-sha512  6dd452e8c7f2e7e9a26733f53dd0daf4df824f82de3d37c171581854dd419f519e104212aacdf8bdf94042a845d9ba5c45a1605d7cba1dc491570a9e72a91f83  mesa-26.1.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-July/000857.html
+sha256  072705caa9adf4740f1489194b13e278ad959166863b5271fe423a86353c9ab6  mesa-26.1.4.tar.xz
+sha512  39d15574e876005fd1a483d1cb3c801b08297ec73820a89cbf368d0f2a922cc770d0e623e99acc66b71791332cdadc6cc3095f059f713b09128921ff2d0197a8  mesa-26.1.4.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4e7a5240c7..8e6c2ee5b8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.3
+MESA3D_VERSION = 26.1.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
