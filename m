Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6E4C28B2B
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF7D141B97;
	Thu, 18 Aug 2022 06:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF7D141B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y54PUfoA7yR4; Thu, 18 Aug 2022 06:17:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F1AC41B4C;
	Thu, 18 Aug 2022 06:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F1AC41B4C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4371C11A0
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 062DF41B4C
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 062DF41B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTlYZoVYO09r for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:17:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F20AA41B59
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F20AA41B59
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7333187708; Thu, 18 Aug 2022 06:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 08:15:06 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: a5c9f8f27118ff5b3392abb6863d02dd94b67655
X-Git-Newrev: 507dcaa30d7c3252fc9c550147b352038c36f443
X-Patchwork-Hint: ignore
Message-Id: <20220818060241.7333187708@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 toolchain/toolchain-buildroot, package/glibc: sync glibc dependency comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=507dcaa30d7c3252fc9c550147b352038c36f443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit 204e04ba8958411f46b09240a9fc4b948dc7108c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 11566c27ff..b58c02aea9 100644
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
