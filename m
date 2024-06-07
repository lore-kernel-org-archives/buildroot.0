Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE227C27C65
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 20:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A97F084D67;
	Fri,  7 Jun 2024 20:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SBBIdxC3fAS; Fri,  7 Jun 2024 20:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E6FE84D6D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E6FE84D6D;
	Fri,  7 Jun 2024 20:31:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8161BF473
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28A0984D01
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Esx_ZkAlmQS for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 20:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8416A84CA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8416A84CA5
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 20:30:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C762D87D85; Fri,  7 Jun 2024 20:30:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jun 2024 22:28:50 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8886594d59fc8bcba40fd90a3d659100aa7ec538
X-Git-Newrev: d50049e60f6162ac59cbeb3edae4d0ed756bd357
X-Patchwork-Hint: ignore
Message-Id: <20240607203033.C762D87D85@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libdrm: fix
 install of test programs
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

commit: https://git.buildroot.net/buildroot/commit/?id=d50049e60f6162ac59cbeb3edae4d0ed756bd357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Buildroot commit f95069814bd68cfc10ccf2dbc41efa6f1e127495 disabled the
build of test programs unconditionally without considering the option
BR2_PACKAGE_LIBDRM_INSTALL_TESTS.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 91848e73ae6f5ad6ca0568f8e7309247379e51f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index a04331c2da..e0c1217b38 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -17,8 +17,7 @@ LIBDRM_DEPENDENCIES = \
 
 LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=disabled \
-	-Dman-pages=disabled \
-	-Dtests=false
+	-Dman-pages=disabled
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
@@ -109,10 +108,12 @@ LIBDRM_CONF_OPTS += -Dvalgrind=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
-LIBDRM_CONF_OPTS += -Dinstall-test-programs=true
+LIBDRM_CONF_OPTS += -Dtests=true -Dinstall-test-programs=true
 ifeq ($(BR2_PACKAGE_CUNIT),y)
 LIBDRM_DEPENDENCIES += cunit
 endif
+else
+LIBDRM_CONF_OPTS += -Dtests=false
 endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
