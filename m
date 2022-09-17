Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C77ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 18:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 394CA84025;
	Sat, 17 Sep 2022 18:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 394CA84025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MHQVVpQNHb4d; Sat, 17 Sep 2022 18:40:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15BC084023;
	Sat, 17 Sep 2022 18:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15BC084023
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 141241BF335
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E408A4016A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E408A4016A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1AmwJVxLZxJ for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 18:40:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 276F84012D
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 18:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 276F84012D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17B6F845F5; Sat, 17 Sep 2022 18:40:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 20:28:34 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 9452ae0f9091874d8a16a514b6b17634b47517f2
X-Git-Newrev: 447b260db0199d83ba252d3d20cf725e9b230158
X-Patchwork-Hint: ignore
Message-Id: <20220917184011.17B6F845F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/igh-ethercat:
 cleanup conditional multi assignments
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

commit: https://git.buildroot.net/buildroot/commit/?id=447b260db0199d83ba252d3d20cf725e9b230158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3ccf0abeeea242a9c95b0ef09c65cb10e1fa93ef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
