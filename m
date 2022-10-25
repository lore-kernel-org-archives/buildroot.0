Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986EEC38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 21:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2162740263;
	Tue, 25 Oct 2022 21:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2162740263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPcaWWCeR-tO; Tue, 25 Oct 2022 21:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C535640264;
	Tue, 25 Oct 2022 21:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C535640264
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66B5C1BF3AE
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 428B081094
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 428B081094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eeE4j61SzenP for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 21:11:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6993981091
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 21:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6993981091
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 573CF870B9; Tue, 25 Oct 2022 21:11:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 23:07:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 259314f016b0cd7cabfdcce88a5c11f1da5edd05
X-Git-Newrev: 382d33dfa64202a79968ff54d729fb37479cbd65
X-Patchwork-Hint: ignore
Message-Id: <20221025211117.573CF870B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: enable host-gdb and gdbserver
 support for or1k with gdb 12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=382d33dfa64202a79968ff54d729fb37479cbd65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gdbserver support for or1k is available since 12.1 release, since
commit [1]. Restrict the gdb version choice for or1k to 12.1 for
simplicity. Also enable host-gdb to connect to the gdbserver on the
target.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=4933265c3f71b9134363d0c05f09542d5cc677f4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in      | 3 ---
 package/gdb/Config.in.host | 9 ++++++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 1cad3c4fd8..273b3072ae 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -17,8 +17,6 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
-	# no gdbserver on or1k
-	select BR2_PACKAGE_GDB_DEBUGGER if BR2_or1k
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
@@ -45,7 +43,6 @@ if BR2_PACKAGE_GDB
 config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	depends on !BR2_or1k
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the progam.
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 3b8d456f1c..e8a34e0834 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -3,7 +3,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
-	depends on !BR2_or1k
 
 comment "Host GDB Options"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
@@ -49,9 +48,13 @@ choice
 
 config BR2_GDB_VERSION_10
 	bool "gdb 10.x"
+	# gdbserver support missing
+	depends on !BR2_or1k
 
 config BR2_GDB_VERSION_11
 	bool "gdb 11.x"
+	# gdbserver support missing
+	depends on !BR2_or1k
 
 config BR2_GDB_VERSION_12
 	bool "gdb 12.x"
@@ -65,6 +68,6 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
 	default "10.2"	   if BR2_GDB_VERSION_10
-	default "11.2"     if BR2_GDB_VERSION_11 || !BR2_PACKAGE_HOST_GDB
-	default "12.1"     if BR2_GDB_VERSION_12
+	default "11.2"     if BR2_GDB_VERSION_11 || (!BR2_PACKAGE_HOST_GDB && !BR2_or1k)
+	default "12.1"     if BR2_GDB_VERSION_12 || (!BR2_PACKAGE_HOST_GDB && BR2_or1k)
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
