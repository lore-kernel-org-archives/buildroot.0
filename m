Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8DBD3A697
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D89F280AA5;
	Tue, 29 Oct 2024 20:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_11vzUSQjTu; Tue, 29 Oct 2024 20:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5D9980A93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5D9980A93;
	Tue, 29 Oct 2024 20:21:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2F755E4F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0D444014E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMjt0kyEl0Wk for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A1040AB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2A1040AB1
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B816F847A8; Tue, 29 Oct 2024 20:21:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 19:51:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ded7184a58ea9fb5b8963cab8a6612146750a693
X-Git-Newrev: 98fc3879c734ab88ebea2ee74a8b929dee4ae66b
X-Patchwork-Hint: ignore
Message-Id: <20241029202119.B816F847A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils-bare-metal: clean up
 variable names
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

commit: https://git.buildroot.net/buildroot/commit/?id=98fc3879c734ab88ebea2ee74a8b929dee4ae66b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removing HOST_ prefix from variables to follow buildroot coding practices.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils-bare-metal/binutils-bare-metal.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index f2f223387e..97a242a6f2 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-HOST_BINUTILS_BARE_METAL_VERSION = 2.43.1
-HOST_BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
-HOST_BINUTILS_BARE_METAL_SOURCE = binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).tar.xz
+BINUTILS_BARE_METAL_VERSION = 2.43.1
+BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
+BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
-HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
-HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
-HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
-HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT = binutils
+BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
+BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
+BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
+BINUTILS_BARE_METAL_CPE_ID_PRODUCT = binutils
 
 HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
