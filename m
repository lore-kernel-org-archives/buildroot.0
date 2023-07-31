Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69118C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A46640A07;
	Mon, 31 Jul 2023 22:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A46640A07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcfE8MN9P4io; Mon, 31 Jul 2023 22:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE61140930;
	Mon, 31 Jul 2023 22:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE61140930
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 208831BF369
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA70C40BDE
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA70C40BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKYMbKJb1pex for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:11:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E792C40BD6
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E792C40BD6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEB7483EB6; Mon, 31 Jul 2023 22:11:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 00:11:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc9a8ef111b5bbc325a8490d2ce04cc02ffd0416
X-Git-Newrev: 1b4d921e1da614a72fed2a79d5c4f8e0b6d1cd45
X-Patchwork-Hint: ignore
Message-Id: <20230731221126.CEB7483EB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: install libsframe to
 staging
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1b4d921e1da614a72fed2a79d5c4f8e0b6d1cd45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

binutils 2.40 added libsframe:
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=19e559f1c91bfaedbd2f91d85ee161f3f03fda3c

Quoting release notes:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=binutils/NEWS;hb=refs/heads/binutils-2_40-branch
* readelf and objdump now have a newly added option --sframe which dumps
  the SFrame section.

Install libsframe to staging when available to avoid build errors, for
example with lightning:
libsframe.so.0, needed by output/per-package/lightning/host/arm-
  buildroot-linux-gnueabi/sysroot/usr/lib/libopcodes.so, not found

Fixes:
http://autobuild.buildroot.net/results/1d1/1d1480dc0c3fb0a88490e3fae85abb2aa76bdade/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 4 ++++
 package/binutils/binutils.mk    | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index de5ca866e5..e62fea1406 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -5,6 +5,9 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 	default y
 	depends on !BR2_microblaze
 
+config BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
+	bool
+
 choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_39_X if !BR2_arc
@@ -20,6 +23,7 @@ config BR2_BINUTILS_VERSION_2_39_X
 
 config BR2_BINUTILS_VERSION_2_40_X
 	bool "binutils 2.40"
+	select BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0dd8526b26..48a036651c 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -105,12 +105,19 @@ endif
 # our TARGET_CONFIGURE_ARGS are taken into consideration for those
 BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
 
+ifeq ($(BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME),y)
+define BINUTILS_INSTALL_STAGING_LIBSFRAME
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(STAGING_DIR) install
+endef
+endif
+
 # We just want libbfd, libiberty and libopcodes,
 # not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
+	$(BINUTILS_INSTALL_STAGING_LIBSFRAME)
 endef
 
 # If we don't want full binutils on target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
