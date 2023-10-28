Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3951CC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD95D42D6B;
	Sat, 28 Oct 2023 19:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD95D42D6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8SAPyGuKH6zM; Sat, 28 Oct 2023 19:35:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E26542D67;
	Sat, 28 Oct 2023 19:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E26542D67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 225741BF3C6
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3FC6420A8
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3FC6420A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p7kINvES4KFV for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:34:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A9E242160
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A9E242160
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E035D85F16; Sat, 28 Oct 2023 19:34:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 21:30:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99d525028f969220719a4e6bcd694f7d9cfd5b67
X-Git-Newrev: ecce7bf95a8a5febbbe1d22563a079326bbf1ea4
X-Patchwork-Hint: ignore
Message-Id: <20231028193446.E035D85F16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dfu-programmer: bump version to
 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecce7bf95a8a5febbbe1d22563a079326bbf1ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The update-bash-completion.sh issue is now fixed, so remove the workaround:

https://github.com/dfu-programmer/dfu-programmer/pull/91

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dfu-programmer/dfu-programmer.hash |  2 +-
 package/dfu-programmer/dfu-programmer.mk   | 10 +---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/dfu-programmer/dfu-programmer.hash b/package/dfu-programmer/dfu-programmer.hash
index afa1d97aed..7260dfce0d 100644
--- a/package/dfu-programmer/dfu-programmer.hash
+++ b/package/dfu-programmer/dfu-programmer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  867eaf0a8cd10123715491807ab99cecb54dc6f09dddade4b2a42b0b0ef9e6b0  dfu-programmer-1.0.0.tar.gz
+sha256  844e469be559657bc52c9d9d03c30846acd11ffbb1ddd42438fa8af1d2b8587d  dfu-programmer-1.1.0.tar.gz
 sha256  d8fb44c26fecbb2b8a368a6c0ed4f5478a401fab03744325407736a80383af76  COPYING
diff --git a/package/dfu-programmer/dfu-programmer.mk b/package/dfu-programmer/dfu-programmer.mk
index 707e143eb3..4e5f2299d6 100644
--- a/package/dfu-programmer/dfu-programmer.mk
+++ b/package/dfu-programmer/dfu-programmer.mk
@@ -4,20 +4,12 @@
 #
 ################################################################################
 
-DFU_PROGRAMMER_VERSION = 1.0.0
+DFU_PROGRAMMER_VERSION = 1.1.0
 DFU_PROGRAMMER_SITE = https://github.com/dfu-programmer/dfu-programmer/releases/download/v$(DFU_PROGRAMMER_VERSION)
 DFU_PROGRAMMER_LICENSE = GPL-2.0+
 DFU_PROGRAMMER_LICENSE_FILES = COPYING
 DFU_PROGRAMMER_DEPENDENCIES = libusb
 
-# No update-bash-completion.sh in tarball. Fix sent upstream:
-# https://github.com/dfu-programmer/dfu-programmer/pull/91
-define DFU_PROGRAMMER_ADD_MISSING_FILE
-	ln -s /bin/true $(@D)/update-bash-completion.sh
-endef
-
-DFU_PROGRAMMER_POST_PATCH_HOOKS == DFU_PROGRAMMER_ADD_MISSING_FILE
-
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 DFU_PROGRAMMER_CONF_OPTS += LIBS=-latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
