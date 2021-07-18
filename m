Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400F4C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:43:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0585160F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0585160F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8DC883EF3;
	Tue,  3 Aug 2021 23:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8ir8m1iAfsT; Tue,  3 Aug 2021 23:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3712083EED;
	Tue,  3 Aug 2021 23:43:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7ADA01BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD2B440E5F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ipqxbi3nnW36 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AF7240EAA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6F9D886AA7; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 13:54:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7bb4f886abfc227c704accbb880059bb8fc85064
X-Git-Newrev: 4ecd247ead22a6cfb87a4ffafc4be05201328aef
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.6F9D886AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdb: enable gdbserver
 support for riscv
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4ecd247ead22a6cfb87a4ffafc4be05201328aef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It turn out that gdbserver support for riscv is available since 10.1 release, since commit [1].

Restrict the gdb version choice for riscv to 10.1 for simplicity [2].

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=bf84f7066626c78884436e1c39fb60f04c665f21
[2] http://lists.busybox.net/pipermail/buildroot/2021-June/312681.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in      | 3 ---
 package/gdb/Config.in.host | 9 ++++++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 262740fc4c..246748131e 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -19,8 +19,6 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
-	# no gdbserver on riscv
-	select BR2_PACKAGE_GDB_DEBUGGER if BR2_riscv
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
@@ -47,7 +45,6 @@ if BR2_PACKAGE_GDB
 config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	depends on !BR2_riscv
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the progam.
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 21e6b34caa..9814f3a79b 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -4,7 +4,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
 	depends on !BR2_or1k
-	depends on !BR2_riscv
 	depends on !BR2_nds32
 
 comment "Host GDB Options"
@@ -70,9 +69,13 @@ choice
 
 config BR2_GDB_VERSION_8_3
 	bool "gdb 8.3.x"
+	# gdbserver support missing
+	depends on !BR2_riscv
 
 config BR2_GDB_VERSION_9_2
 	bool "gdb 9.2.x"
+	# gdbserver support missing
+	depends on !BR2_riscv
 
 config BR2_GDB_VERSION_10
 	bool "gdb 10.x"
@@ -87,6 +90,6 @@ config BR2_GDB_VERSION
 	default "arc-2020.09-release-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "8.3.1"    if BR2_GDB_VERSION_8_3
-	default "9.2"      if BR2_GDB_VERSION_9_2 || !BR2_PACKAGE_HOST_GDB
-	default "10.1"	   if BR2_GDB_VERSION_10
+	default "9.2"      if BR2_GDB_VERSION_9_2 || (!BR2_PACKAGE_HOST_GDB && !BR2_riscv)
+	default "10.1"	   if BR2_GDB_VERSION_10 || (!BR2_PACKAGE_HOST_GDB && BR2_riscv)
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
