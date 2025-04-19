Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724EDC369CA
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 897D36083C;
	Sat, 19 Apr 2025 14:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4S60-9B2saj; Sat, 19 Apr 2025 14:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 023CE607B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 023CE607B8;
	Sat, 19 Apr 2025 14:43:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE10922F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A442060706
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJnC0g1sjWQ0 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F35546069F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F35546069F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:43:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECC7F85B5E; Sat, 19 Apr 2025 14:43:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 16:38:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9af9b4b304a38a28d6f81ba209f0ff63f528b571
X-Git-Newrev: 3e2e59340912a6788586a7216ac34df4de5ca1db
X-Patchwork-Hint: ignore
Message-Id: <20250419144348.ECC7F85B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuci: bump version to f3fc0b7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3e2e59340912a6788586a7216ac34df4de5ca1db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

 - f3fc0b7 libuci: fix false positive warning on older gcc versions
 - 16ff0ba CMakeLists: add support for including ABIVERSION in the library version number
 - 047b2ef CMakeLists.txt: bump minimum cmake version
 - fb3c234 add support for an override config directory
 - 10f7996 file: Ignore config file with '.' in name
 - 5781664 remove internal usage of redundant uci_ptr.last
 - 3cda251 file: Fix uci -m import command
 - 04d0c46 uci: macro uci_alloc_element not in uci.h
 - ae61e1c uci: optimize update section in uci_set
 - 16e8a3b uci: fix memory leak uci_set on update section
 - b2f3417 uci: maintain option position in uci_add_list
 - 74f2797 uci: fix atomicity of uci_add_list
 - 47697e6 uci: fix use-after-free uci_add_list
 - 7e01d66 uci: optimize update option in uci_set
 - b7ceda9 uci: maintain option position in uci_set
 - 9b6605e uci: fix use-after-free uci_set on update option
 - f49a2fd delta: simplify uci_load_delta() by using a helper
 - 5de3871 cli: drop redundant uci_add_delta_path() call for -P
 - f84f49f cmake: Allow override of install directories

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuci/libuci.hash | 6 +++---
 package/libuci/libuci.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index cc04320331..1e429f8160 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d095dc7ff4714e33aa18ef3ea5d30f525a202d6997d7b13bd952da53818988d6  libuci-4b3db1179747b6a6779029407984bacef851325c-git4.tar.gz
-sha256  39e1cc18a36172fb80d9b37f0af77d78ae935bd8a020978a7895d9e76a24e112  cli.c
-sha256  69d4eea4de19d27014f3d6ed723081b4039700bfd73cd0a5e39e2c4f19a58c66  libuci.c
+sha256  d3b12df54f9faa69f0ff6d2a239fdcc30d64eda5269ddc882cf97677ea8cb066  libuci-f3fc0b76040685829191debc03edf72f486ae8ae-git4.tar.gz
+sha256  5bb12361838b588bb263ade8537f5ae1a5e62d54b0a8f0640489db8cc29831d8  cli.c
+sha256  bbc34ea5f391abc3b27416dc3c96b0f71f852c44210faf1cde0990218f68b13a  libuci.c
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 81e87aa5be..3c7e12baae 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = 4b3db1179747b6a6779029407984bacef851325c
+LIBUCI_VERSION = f3fc0b76040685829191debc03edf72f486ae8ae
 LIBUCI_SITE = https://git.openwrt.org/project/uci.git
 LIBUCI_SITE_METHOD = git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
