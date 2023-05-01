Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34E4C77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 11:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A28FA40A04;
	Mon,  1 May 2023 11:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A28FA40A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ur0Jp9SOyN5X; Mon,  1 May 2023 11:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A000F400CC;
	Mon,  1 May 2023 11:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A000F400CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC70B1BF336
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B721C81FE5
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B721C81FE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5JNe-cf1QgRT for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 11:40:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B206081FE6
 for <buildroot@buildroot.org>; Mon,  1 May 2023 11:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B206081FE6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A09DD84F2F; Mon,  1 May 2023 11:40:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 13:12:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1740a066e9e6c29c9e91d9206195f5ce5360c07c
X-Git-Newrev: 460c9fa33880397a9a7c16393ac26552a9adc5c3
X-Patchwork-Hint: ignore
Message-Id: <20230501114025.A09DD84F2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pciutils: bump to version 3.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=460c9fa33880397a9a7c16393ac26552a9adc5c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove patch, see commit 0478e1f3928bf "Avoid adding multiple version tags
to the same symbol":

https://github.com/pciutils/pciutils/commit/0478e1f3928bf

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...karound-build-failure-with-older-binutils.patch | 57 ----------------------
 package/pciutils/Config.in                         |  2 +-
 package/pciutils/pciutils.hash                     |  2 +-
 package/pciutils/pciutils.mk                       |  2 +-
 4 files changed, 3 insertions(+), 60 deletions(-)

diff --git a/package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch b/package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch
deleted file mode 100644
index 1590bc19c5..0000000000
--- a/package/pciutils/0001-Workaround-build-failure-with-older-binutils.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From fda20d4bcb91f0f9d0db294b4813264de2d88866 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 12 May 2022 16:16:21 +0300
-Subject: [PATCH] Workaround build failure with older binutils
-
-binutils releases older than 2.35 are affected by bug gas/23840[1] that
-breaks the link of shared library:
-
-cc -O2 -Wall -W -Wno-parentheses -Wstrict-prototypes -Wmissing-prototypes -fPIC -fvisibility=hidden   -c -o filter.o filter.c
-/tmp/ccLtucRG.s: Assembler messages:
-/tmp/ccLtucRG.s:6: Error: multiple versions [`pci_filter_init@@LIBPCI_3.8'|`pci_filter_init@LIBPCI_3.3'] for symbol `pci_filter_init_v38'
-/tmp/ccLtucRG.s:8: Error: multiple versions [`pci_filter_parse_slot@@LIBPCI_3.8'|`pci_filter_parse_slot@LIBPCI_3.3'] for symbol `pci_filter_parse_slot_v38'
-/tmp/ccLtucRG.s:10: Error: multiple versions [`pci_filter_parse_id@@LIBPCI_3.8'|`pci_filter_parse_id@LIBPCI_3.3'] for symbol `pci_filter_parse_id_v38'
-/tmp/ccLtucRG.s:12: Error: multiple versions [`pci_filter_match@@LIBPCI_3.8'|`pci_filter_match@LIBPCI_3.3'] for symbol `pci_filter_match_v38'
-
-The symbol versioning feature has little value in the context of
-Buildroot. As a workaround remove one of each duplicated symbol.
-
-[1] https://sourceware.org/bugzilla/show_bug.cgi?id=23840
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: not upstreamable
-
-Upstream bug report: https://lore.kernel.org/linux-pci/87mtfm7v58.fsf@tarshish/
----
- lib/filter.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/lib/filter.c b/lib/filter.c
-index b881b6bc9083..bc34e8c2bab9 100644
---- a/lib/filter.c
-+++ b/lib/filter.c
-@@ -304,20 +304,16 @@ pci_filter_match_v30(struct pci_filter_v30 *f, struct pci_dev *d)
- 
- STATIC_ALIAS(void pci_filter_init(struct pci_access *a, struct pci_filter *f), pci_filter_init_v38(a, f));
- SYMBOL_VERSION(pci_filter_init_v30, pci_filter_init@LIBPCI_3.0);
--SYMBOL_VERSION(pci_filter_init_v38, pci_filter_init@LIBPCI_3.3);
- SYMBOL_VERSION(pci_filter_init_v38, pci_filter_init@@LIBPCI_3.8);
- 
- STATIC_ALIAS(char *pci_filter_parse_slot(struct pci_filter *f, char *str), pci_filter_parse_slot_v38(f, str));
- SYMBOL_VERSION(pci_filter_parse_slot_v30, pci_filter_parse_slot@LIBPCI_3.0);
--SYMBOL_VERSION(pci_filter_parse_slot_v38, pci_filter_parse_slot@LIBPCI_3.3);
- SYMBOL_VERSION(pci_filter_parse_slot_v38, pci_filter_parse_slot@@LIBPCI_3.8);
- 
- STATIC_ALIAS(char *pci_filter_parse_id(struct pci_filter *f, char *str), pci_filter_parse_id_v38(f, str));
- SYMBOL_VERSION(pci_filter_parse_id_v30, pci_filter_parse_id@LIBPCI_3.0);
--SYMBOL_VERSION(pci_filter_parse_id_v38, pci_filter_parse_id@LIBPCI_3.3);
- SYMBOL_VERSION(pci_filter_parse_id_v38, pci_filter_parse_id@@LIBPCI_3.8);
- 
- STATIC_ALIAS(int pci_filter_match(struct pci_filter *f, struct pci_dev *d), pci_filter_match_v38(f, d));
- SYMBOL_VERSION(pci_filter_match_v30, pci_filter_match@LIBPCI_3.0);
--SYMBOL_VERSION(pci_filter_match_v38, pci_filter_match@LIBPCI_3.3);
- SYMBOL_VERSION(pci_filter_match_v38, pci_filter_match@@LIBPCI_3.8);
--- 
-2.35.1
-
diff --git a/package/pciutils/Config.in b/package/pciutils/Config.in
index a082f23997..d16c36340f 100644
--- a/package/pciutils/Config.in
+++ b/package/pciutils/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PCIUTILS
 	  Various utilities dealing with the PCI bus.
 	  Provides things like setpci and lspci.
 
-	  http://atrey.karlin.mff.cuni.cz/~mj/pciutils.html
+	  https://mj.ucw.cz/sw/pciutils/
diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index 0b66b82589..93df1558ff 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256  91edbd0429a84705c9ad156d4ff38ccc724d41ea54c4c5b88e38e996f8a34f05  pciutils-3.8.0.tar.xz
+sha256  cdea7ae97239dee23249a09c68a19a287a3f109fbeb2c232ebb616cb38599012  pciutils-3.9.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 140276dbc4..95b377d844 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.8.0
+PCIUTILS_VERSION = 3.9.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
