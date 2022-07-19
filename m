Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEA4C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 20:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C65FD400B8;
	Tue, 19 Jul 2022 20:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C65FD400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2PiaNx47EtH; Tue, 19 Jul 2022 20:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2B1F40CE2;
	Tue, 19 Jul 2022 20:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2B1F40CE2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4978D1BF267
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 20:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FA54400B8
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 20:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FA54400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORmrQ6P2epog for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 20:46:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B16D40CDB
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 20:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B16D40CDB
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BB05083EE8; Tue, 19 Jul 2022 20:32:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 22:45:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39a19ee2e269014f00fb9611669c6e7d128351d7
X-Git-Newrev: 5bdf0799df45b52123faade4a4847859e7591eb6
X-Patchwork-Hint: ignore
Message-Id: <20220719203231.BB05083EE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/kontron/pitx-imx8m: add U-Boot
 2022.04 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bdf0799df45b52123faade4a4847859e7591eb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch is required to fix an issue in U-Boot for linking
the mkeficapsule tool against -luuid and -lgnutls.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001065

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...capsule-use-pkg-config-to-get-luuid-and-l.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch b/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch
new file mode 100644
index 0000000000..9530a45efe
--- /dev/null
+++ b/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch
@@ -0,0 +1,33 @@
+From f3523977e8f5f6b2173708777001332431ebc609 Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Tue, 19 Jul 2022 16:17:09 +0200
+Subject: [PATCH 1/2] tools: mkeficapsule: use pkg-config to get -luuid and -lgnutls
+
+Instead of hardcoding -luuid -lgnutls as the flags needed to build
+mkeficapsule, use pkg-config when available.
+
+We gracefully fallback on the previous behavior of hardcoding -luuid
+-lgnutls if pkg-config is not available or fails with an error.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ tools/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 9f2339666a..9f6b282ad8 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -242,7 +242,8 @@ hostprogs-$(CONFIG_MIPS) += mips-relocs
+ hostprogs-$(CONFIG_ASN1_COMPILER)	+= asn1_compiler
+ HOSTCFLAGS_asn1_compiler.o = -idirafter $(srctree)/include
+ 
+-HOSTLDLIBS_mkeficapsule += -lgnutls -luuid
++HOSTLDLIBS_mkeficapsule += \
++	$(shell pkg-config --libs gnutls uuid 2> /dev/null || echo "-lgnutls -luuid")
+ hostprogs-$(CONFIG_TOOLS_MKEFICAPSULE) += mkeficapsule
+ 
+ # We build some files with extra pedantic flags to try to minimize things
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
