Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D706BC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BD254EE94;
	Tue, 21 Feb 2023 00:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BD254EE94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwSrupcngFkF; Tue, 21 Feb 2023 00:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F1464EF64;
	Tue, 21 Feb 2023 00:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F1464EF64
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85A001BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39EE6417B3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39EE6417B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EflsCXAm-d4D for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53A6A41782
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53A6A41782
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 441DB86495; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 15:24:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 42e34cf10f9eb037aa8c48a4fb9e8f521901b983
X-Git-Newrev: 02befac8f9404ae30d0d090221d21a8460c82ec7
X-Patchwork-Hint: ignore
Message-Id: <20230220205247.441DB86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/upx: security bump to
 version 4.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=02befac8f9404ae30d0d090221d21a8460c82ec7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
