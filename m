Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A650C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 09:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D11060BBB;
	Sat, 13 Aug 2022 09:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D11060BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otw3wYt7hn-2; Sat, 13 Aug 2022 09:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 441CF60B08;
	Sat, 13 Aug 2022 09:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 441CF60B08
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71CD41BF408
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 09:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46E6E83330
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 09:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46E6E83330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kai2Wss8NBFx for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 09:36:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FE0C8328E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FE0C8328E
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 09:36:49 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.36.35])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 11E9419F744;
 Sat, 13 Aug 2022 11:36:42 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 11:36:27 +0200
Message-Id: <20220813093627.369221-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660383406;
 bh=TUWEwnIBYYaGvQATmSIsxjpDqd08feoSKFKZaGjBcEM=;
 h=From:To:Cc:Subject:Date:From;
 b=ZFyQwQvzm3QOo7hzutG5GfOCPXpsvPjOSTtP63lcFTYx01FdUwt3uxcMiZtXqaoOH
 DePAv6220nEBbd8qc6IYh1laVu/nxSNtN6w0W0O79WYFDJ9XooGQ85YhViQ9TxkHg2
 8NzPgWqJfmuh1JjkPQSYpa7kJSZPV6XFyeV9XWo+N9y1krdQDN/o4CrUzrEPbVRPCj
 BC96PIEnWop5r9upujUkEiAKV+VD/Ual1zImBgmotzcrdC+lEOeaw5+9ndaCnJkF8E
 oGMeNGL4moKu5/q7WBx+xNVvw+C22rwzIUdibiFnbLm5wFiKSPLMkZUxmrqk7yMFad
 SMg9muEPjy5aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZFyQwQvz
Subject: [Buildroot] [PATCH next 1/1] package/linux-backports: bump version
 to 5.15.58
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit also change the minimal supported kernel version from 3.10
to 4.4. See [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/tree/README?h=v5.15.58-1#n11

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested with backports defconfig "ath10k" with a kernel 5.4.24.
---
 package/linux-backports/Config.in            | 2 +-
 package/linux-backports/linux-backports.hash | 4 ++--
 package/linux-backports/linux-backports.mk   | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/linux-backports/Config.in b/package/linux-backports/Config.in
index 251d202fd2..b20db67308 100644
--- a/package/linux-backports/Config.in
+++ b/package/linux-backports/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LINUX_BACKPORTS
 	  recent kernels, backported to older ones.
 
 	  This version of linux-backports supports kernels starting
-	  from 3.10.
+	  from 4.4.
 
 	  https://backports.wiki.kernel.org
 
diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
index 3e103424f5..117b1612b2 100644
--- a/package/linux-backports/linux-backports.hash
+++ b/package/linux-backports/linux-backports.hash
@@ -1,5 +1,5 @@
-# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v5.8/sha256sums.asc
-sha256  19b4174d89bf11ee221458e11f1e8dace26558498774b823051156f522d2036b  backports-5.8-1.tar.xz
+# From: https://cdn.kernel.org/pub/linux/kernel/projects/backports/stable/v5.15.58/sha256sums.asc
+sha256  a3c2a2b7bbaf8943c65fd72f4e7d7ad5e205aeae28b26c835f9d8afa0f9810bf  backports-5.15.58-1.tar.xz
 # Locally computed
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
 sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 068dcffcc8..b4963d302f 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_BACKPORTS_VERSION_MAJOR = 5.8
+LINUX_BACKPORTS_VERSION_MAJOR = 5.15.58
 LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
 LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
 LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
@@ -94,7 +94,7 @@ $(eval $(kconfig-package))
 # instead.
 #
 # Furthermore, we want to check the kernel version, since linux-backports
-# only supports kernels >= 3.10. To avoid overriding linux-backports'
+# only supports kernels >= 4.4. To avoid overriding linux-backports'
 # KCONFIG_STAMP_DOTCONFIG rule defined in the kconfig-package infra, we
 # use an intermediate stamp-file.
 #
@@ -109,8 +109,8 @@ $(LINUX_BACKPORTS_DIR)/.stamp_check_kernel_version: $$(LINUX_DIR)/$$(LINUX_KCONF
 	$(Q)KVER=$(LINUX_VERSION_PROBED); \
 	KVER_MAJOR=`echo $${KVER} | sed 's/^\([0-9]*\)\..*/\1/'`; \
 	KVER_MINOR=`echo $${KVER} | sed 's/^[0-9]*\.\([0-9]*\).*/\1/'`; \
-	if [ $${KVER_MAJOR} -lt 3 -o \( $${KVER_MAJOR} -eq 3 -a $${KVER_MINOR} -lt 10 \) ]; then \
-		printf "Linux version '%s' is too old for linux-backports (needs 3.10 or later)\n" \
+	if [ $${KVER_MAJOR} -lt 4 -o \( $${KVER_MAJOR} -eq 4 -a $${KVER_MINOR} -lt 4 \) ]; then \
+		printf "Linux version '%s' is too old for linux-backports (needs 4.4 or later)\n" \
 			"$${KVER}"; \
 		exit 1; \
 	fi
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
