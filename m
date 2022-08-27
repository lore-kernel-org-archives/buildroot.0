Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B07EECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 10:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E184109D;
	Sat, 27 Aug 2022 10:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1E184109D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yg0FI5r4a1mb; Sat, 27 Aug 2022 10:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B6AB40E47;
	Sat, 27 Aug 2022 10:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B6AB40E47
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19C891BF32D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 10:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9A1360BF9
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 10:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A1360BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnirGmY_mIw1 for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 10:03:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A38160ABB
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 10:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A38160ABB
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C639E87DDC; Sat, 27 Aug 2022 09:48:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 12:02:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 014ebc394d116e886796dd9af377299915cb556d
X-Git-Newrev: 3ccf0abeeea242a9c95b0ef09c65cb10e1fa93ef
X-Patchwork-Hint: ignore
Message-Id: <20220827094855.C639E87DDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: cleanup conditional
 multi assignments
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ccf0abeeea242a9c95b0ef09c65cb10e1fa93ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/igh-ethercat/igh-ethercat.mk | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index cc3f37f883..9fcfb4f6f2 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -13,14 +13,13 @@ IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
 IGH_ETHERCAT_INSTALL_STAGING = YES
 
 IGH_ETHERCAT_CONF_OPTS = \
-	--with-linux-dir=$(LINUX_DIR)
-
-IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_INSTALL_LIBSTDCPP),--enable-tool,--disable-tool)
-IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
-IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--disable-e100)
-IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
-IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e)
-IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
+	--with-linux-dir=$(LINUX_DIR) \
+	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-tool,--disable-tool) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--disable-e100) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e) \
+	$(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
 
 $(eval $(kernel-module))
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
