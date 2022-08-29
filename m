Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D11ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3D884048E;
	Mon, 29 Aug 2022 20:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3D884048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hvS8n-VAx7-W; Mon, 29 Aug 2022 20:07:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89AA640465;
	Mon, 29 Aug 2022 20:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89AA640465
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 416BA1BF3D9
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A37F4048D
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A37F4048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uu0T9X9POEq0 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:06:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8F41400FE
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8F41400FE
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1682D87FAF; Mon, 29 Aug 2022 19:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 21:16:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 04d3aef6805aa2dbd5483ed4f9826b14c29faa50
X-Git-Newrev: 26ebde7013ee1b291918b05a67d5b5bfdb59af32
X-Patchwork-Hint: ignore
Message-Id: <20220829195150.1682D87FAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6base: add
 support for network module
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

commit: https://git.buildroot.net/buildroot/commit/?id=26ebde7013ee1b291918b05a67d5b5bfdb59af32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  | 9 +++++++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index a489ce39fc..68bca728e2 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -14,3 +14,12 @@ config BR2_PACKAGE_QT6BASE
 	  QtWidgets, etc.
 
 	  http://qt.io
+
+if BR2_PACKAGE_QT6BASE
+
+config BR2_PACKAGE_QT6BASE_NETWORK
+	bool "network module"
+	help
+	  This options enables the Qt6Network library.
+
+endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index c67d94e193..a93e98e035 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -75,5 +75,11 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
+QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
