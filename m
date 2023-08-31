Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2EDC83F17
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 10:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AE69417C4;
	Thu, 31 Aug 2023 10:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AE69417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1L22vWovdIVY; Thu, 31 Aug 2023 10:18:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC4B40542;
	Thu, 31 Aug 2023 10:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC4B40542
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 991D51BF3D4
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 10:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F0AA41802
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 10:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F0AA41802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iIdnfYAdFCY3 for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 10:18:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFEF2402F4
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 10:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFEF2402F4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D238866F5; Thu, 31 Aug 2023 10:18:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 12:06:16 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: e9584abeb03cd1a4d52ea185485cae9246ded39b
X-Git-Newrev: 352a2abad5d0bd7965024232f79cee778cfa9424
X-Patchwork-Hint: ignore
Message-Id: <20230831101816.9D238866F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/xenomai: fix
 testsuite install
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

commit: https://git.buildroot.net/buildroot/commit/?id=352a2abad5d0bd7965024232f79cee778cfa9424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Since commit [1], the testsuite build is unconditionally disabled
although we have the option BR2_PACKAGE_XENOMAI_TESTSUITE to
install Xenomai testsuite on the target.

Handle --disable-testsuite option with BR2_PACKAGE_XENOMAI_TESTSUITE.

[1] 74196b7d059684e555a87e5409c21c56c727066b

Signed-off-by: Pierre Ficheux <pierre.ficheux@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bc9a8ef111b5bbc325a8490d2ce04cc02ffd0416)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xenomai/xenomai.mk | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index c1ad0c5df6..9356919259 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -41,7 +41,6 @@ XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
 XENOMAI_CONF_OPTS += \
 	--disable-demo \
-	--disable-testsuite \
 	--includedir=/usr/include/xenomai/
 
 ifeq ($(BR2_PACKAGE_XENOMAI_MERCURY),y)
@@ -87,17 +86,10 @@ endef
 
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_UNNEEDED_FILES
 
-ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),)
-define XENOMAI_REMOVE_TESTSUITE
-	rm -rf $(TARGET_DIR)/usr/share/xenomai/
-	for i in clocktest gpiotest latency smokey spitest switchtest \
-		xeno-test-run-wrapper dohell xeno-test-run xeno-test ; do \
-		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
-	done
-	rm -rf $(TARGET_DIR)/usr/demo/
-endef
-
-XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_TESTSUITE
+ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),y)
+XENOMAI_CONF_OPTS += --enable-testsuite
+else
+XENOMAI_CONF_OPTS += --disable-testsuite
 endif
 
 ifeq ($(BR2_PACKAGE_XENOMAI_RTCAN),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
