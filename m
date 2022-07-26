Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C567EC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 14:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9696860FC1;
	Tue, 26 Jul 2022 14:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9696860FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEFZMEtmmahs; Tue, 26 Jul 2022 14:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B7D561081;
	Tue, 26 Jul 2022 14:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B7D561081
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 769A31BF276
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49ECA60E85
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49ECA60E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isGfH-ADgyYC for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 14:54:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 864B960B02
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 14:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 864B960B02
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9032885EE1; Tue, 26 Jul 2022 14:40:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 15:42:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7451295826865fc08eb067ad226a11fd1c2b4512
X-Git-Newrev: 204e04ba8958411f46b09240a9fc4b948dc7108c
X-Patchwork-Hint: ignore
Message-Id: <20220726144035.9032885EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot,
 package/glibc: sync glibc dependency comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=204e04ba8958411f46b09240a9fc4b948dc7108c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit fd839aeb7f40596e60bc53a96b7a65892924cc26 ("package/glibc:
introduce and use BR2_PACKAGE_GLIBC_ARCH_SUPPORTS and
BR2_PACKAGE_GLIBC_SUPPORTS") we moved the Config.in logic about glibc
dependencies from toolchain/toolchain-buildroot/Config.in into
package/glibc/Config.in.

Unfortunately, it is not possible to move the Config.in comments that
tell the user, within the choice..endchoice for the C library why
glibc is not currently selectable, so we had to keep them in
toolchain/toolchain-buildroot/Config.in.

Turns out that the comments were out of sync with the dependencies,
and two comments were missing. This commit adds the missing ones, and
adds a comment in package/glibc/Config.in explaining that we need to
be careful about updating toolchain/toolchain-buildroot/Config.in as
well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/Config.in                 | 3 +++
 toolchain/toolchain-buildroot/Config.in | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index f535f9f6eb..2c6dc40139 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -30,6 +30,9 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
 	bool
 	default y if BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
+	# Make sure to keep these dependencies in sync with the
+	# Config.in comments in
+	# toolchain/toolchain-buildroot/Config.in
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 56343daee7..c8f522a8da 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -64,6 +64,14 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 	depends on BR2_MIPS_NAN_2008
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 
+comment "glibc on RISC-V 64-bit needs a toolchain w/ headers >= 5.0"
+	depends on BR2_RISCV_64
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
+comment "glibc on ARC needs a toolchain w/ headers >= 5.1"
+	depends on BR2_arc
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_PACKAGE_MUSL_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
