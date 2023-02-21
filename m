Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7DCC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0944408F9;
	Tue, 21 Feb 2023 20:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0944408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHuhVvnbSN_z; Tue, 21 Feb 2023 20:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0B4A40CB4;
	Tue, 21 Feb 2023 20:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B4A40CB4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3517A1BF8C7
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A85960B33
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A85960B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgxAWbcNxZ1U for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:47:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDAF360A71
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDAF360A71
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA3D686631; Tue, 21 Feb 2023 20:47:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 21:37:06 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b87222f6bfb424e15039c59722415558d7ff18ac
X-Git-Newrev: f5e565d9b2e9e2ec5098293b160ded29db2d03a0
X-Patchwork-Hint: ignore
Message-Id: <20230221204754.BA3D686631@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/upx: security
 bump to version 4.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5e565d9b2e9e2ec5098293b160ded29db2d03a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix CVE-2023-23456: A heap-based buffer overflow issue was discovered in
UPX in PackTmt::pack() in p_tmt.cpp file. The flow allows an attacker to
cause a denial of service (abort) via a crafted file.

Fix CVE-2023-23457: A Segmentation fault was found in UPX in
PackLinuxElf64::invert_pt_dynamic() in p_lx_elf.cpp. An attacker with a
crafted input file allows invalid memory address access that could lead
to a denial of service.

https://github.com/upx/upx/blob/v4.0.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 02befac8f9404ae30d0d090221d21a8460c82ec7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upx/upx.hash | 2 +-
 package/upx/upx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/upx/upx.hash b/package/upx/upx.hash
index 9f7c40c819..7c24906152 100644
--- a/package/upx/upx.hash
+++ b/package/upx/upx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  77003c8e2e29aa9804e2fbaeb30f055903420b3e01d95eafe01aed957fb7e190  upx-4.0.1-src.tar.xz
+sha256  1221e725b1a89e06739df27fae394d6bc88aedbe12f137c630ec772522cbc76f  upx-4.0.2-src.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index ef346b2310..6018b0a63d 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPX_VERSION = 4.0.1
+UPX_VERSION = 4.0.2
 UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
