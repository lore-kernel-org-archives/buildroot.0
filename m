Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B15C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D13261234;
	Fri, 16 Sep 2022 11:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D13261234
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUO5g9HuL0wZ; Fri, 16 Sep 2022 11:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEAAF60B9F;
	Fri, 16 Sep 2022 11:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEAAF60B9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8E41BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6DD5419C7
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6DD5419C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZCKG3u0L_ZU for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30CD241959
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30CD241959
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1DC1383CC5; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:16:28 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0ccf43c02da5606778911e80ff557142a692bb4f
X-Git-Newrev: fcf9525dd890db93a8050eccfa4bd6eafdc5dad3
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.1DC1383CC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ace: fix typo on
 variable names
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

commit: https://git.buildroot.net/buildroot/commit/?id=fcf9525dd890db93a8050eccfa4bd6eafdc5dad3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

LIBARIES -> LIBRARIES

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 46915443a5d8fddb3819a9260e6e415405894b25)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ace/ace.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ace/ace.mk b/package/ace/ace.mk
index 3f7fe5e994..29555eea74 100644
--- a/package/ace/ace.mk
+++ b/package/ace/ace.mk
@@ -15,7 +15,7 @@ ACE_CPE_ID_PRODUCT = adaptive_communication_environment
 
 # Note: We are excluding examples, apps and tests
 # Only compiling ACE libraries (no TAO)
-ACE_LIBARIES = ace ACEXML Kokyu netsvcs protocols/ace
+ACE_LIBRARIES = ace ACEXML Kokyu netsvcs protocols/ace
 
 ACE_CPPFLAGS = $(TARGET_CPPFLAGS) -std=c++11
 
@@ -31,7 +31,7 @@ ACE_MAKE_OPTS = \
 	DEFFLAGS="$(ACE_CPPFLAGS)"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-ACE_LIBARIES += ace/SSL
+ACE_LIBRARIES += ace/SSL
 ACE_DEPENDENCIES += openssl
 define ACE_CONFIGURE_SSL
 	echo "ssl = 1" >> $(@D)/include/makeinclude/platform_macros.GNU
@@ -51,25 +51,25 @@ define ACE_CONFIGURE_CMDS
 endef
 
 define ACE_BUILD_CMDS
-	$(foreach lib,$(ACE_LIBARIES), \
+	$(foreach lib,$(ACE_LIBRARIES), \
 		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(lib) \
 			$(ACE_MAKE_OPTS) all
 	)
 endef
 
-define  ACE_LIBARIES_INSTALL
+define  ACE_LIBRARIES_INSTALL
 	mkdir -p $(1)/usr/share/ace
-	$(foreach lib,$(ACE_LIBARIES), \
+	$(foreach lib,$(ACE_LIBRARIES), \
 		$(MAKE) -C $(@D)/$(lib) $(ACE_MAKE_OPTS) DESTDIR=$(1) install
 	)
 endef
 
 define  ACE_INSTALL_TARGET_CMDS
-	$(call ACE_LIBARIES_INSTALL,$(TARGET_DIR))
+	$(call ACE_LIBRARIES_INSTALL,$(TARGET_DIR))
 endef
 
 define  ACE_INSTALL_STAGING_CMDS
-	$(call ACE_LIBARIES_INSTALL,$(STAGING_DIR))
+	$(call ACE_LIBRARIES_INSTALL,$(STAGING_DIR))
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
