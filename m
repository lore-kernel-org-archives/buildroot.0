Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DA9C25B08
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2387760F54;
	Mon, 15 Aug 2022 09:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2387760F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SNGXjs7g5Y5J; Mon, 15 Aug 2022 09:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C6160EA5;
	Mon, 15 Aug 2022 09:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36C6160EA5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBE2C1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1B10416AD
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B10416AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ndl3UO9XtXDX for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF4E5415FA
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF4E5415FA
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 01843875AC; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:03:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6f1b338176c1f2b43016ba9c2a60d45a629a6bd
X-Git-Newrev: 46915443a5d8fddb3819a9260e6e415405894b25
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.01843875AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ace: fix typo on variable names
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

commit: https://git.buildroot.net/buildroot/commit/?id=46915443a5d8fddb3819a9260e6e415405894b25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIBARIES -> LIBRARIES

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
