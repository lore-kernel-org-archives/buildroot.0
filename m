Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA0EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:08:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F7F560F92
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F7F560F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1289E40356;
	Sat,  9 Oct 2021 10:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlNI62xVQTtq; Sat,  9 Oct 2021 10:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67A7C40257;
	Sat,  9 Oct 2021 10:08:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4492A1BF844
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3927081BC2
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OHYob3Etl-g8 for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 10:08:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69A3D81C21
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 10:08:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CADC291538; Sat,  9 Oct 2021 10:05:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 12:07:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d64975da2005fbda1882d820ad87fbfef8e568c4
X-Git-Newrev: babf10adf958602867ae34978923f0cfd3b31e50
X-Patchwork-Hint: ignore
Message-Id: <20211009100541.CADC291538@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/net-tools: bump to version 2.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=babf10adf958602867ae34978923f0cfd3b31e50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use standard install target as update target has been removed with
https://sourceforge.net/p/net-tools/code/ci/5484cf9a13a2b1d6f604aad2a4fa41c7f01e1a46/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/net-tools/net-tools.hash | 5 ++++-
 package/net-tools/net-tools.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/net-tools/net-tools.hash b/package/net-tools/net-tools.hash
index e29415b8ff..fdc30fa2b2 100644
--- a/package/net-tools/net-tools.hash
+++ b/package/net-tools/net-tools.hash
@@ -1,3 +1,6 @@
+# From http://sourceforge.net/projects/net-tools/files/
+sha1  4080baab0486dc882c3b293d5559c27251ae4268  net-tools-2.10.tar.xz
+md5  78aae762c95e2d731faf88d482e4cde5  net-tools-2.10.tar.xz
 # Locally computed
-sha256  4c68ef33d97cc807fe437fa64a801355c36d638774c0c8a4342742f6bdceea78  net-tools-479bb4a7e11a4084e2935c0a576388f92469225b-br1.tar.gz
+sha256  b262435a5241e89bfa51c3cabd5133753952f7a7b7b93f32e08cb9d96f580d69  net-tools-2.10.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index eb268a6e14..4a03e3d846 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-NET_TOOLS_VERSION = 479bb4a7e11a4084e2935c0a576388f92469225b
-NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
+NET_TOOLS_VERSION = 2.10
+NET_TOOLS_SOURCE = net-tools-$(NET_TOOLS_VERSION).tar.xz
+NET_TOOLS_SITE = http://downloads.sourceforge.net/project/net-tools
 NET_TOOLS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 NET_TOOLS_LICENSE = GPL-2.0+
 NET_TOOLS_LICENSE_FILES = COPYING
@@ -35,11 +36,10 @@ define NET_TOOLS_BUILD_CMDS
 		$(MAKE) -C $(@D)
 endef
 
-# install renames conflicting binaries, update does not
 # ifconfig & route reside in /sbin for busybox, so ensure we don't end
 # up with two versions of those.
 define NET_TOOLS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) update
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 	mv -f $(TARGET_DIR)/bin/ifconfig $(TARGET_DIR)/sbin/ifconfig
 	mv -f $(TARGET_DIR)/bin/route $(TARGET_DIR)/sbin/route
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
