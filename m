Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5989FC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 07:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23E5F6082F;
	Sat, 11 May 2024 07:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQ_oJ530ijTV; Sat, 11 May 2024 07:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ACAF61632
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ACAF61632;
	Sat, 11 May 2024 07:06:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FF981BF47E
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B72E842FA
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTG2QhyPulrm for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 07:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52ACE842F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52ACE842F8
 for <buildroot@buildroot.org>; Sat, 11 May 2024 07:06:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FB1186F2A; Sat, 11 May 2024 07:06:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 09:05:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 288bfd201b9bed458aa792d444559b6154ef8c45
X-Git-Newrev: 6c3a4107b3e636036a681749e2798b48714d5b3f
X-Patchwork-Hint: ignore
Message-Id: <20240511070601.2FB1186F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udpxy: bump to version 1.0-25.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c3a4107b3e636036a681749e2798b48714d5b3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to get latest release
- Set ALL_CFLAGS to drop -Werror
- Update hash of README (changes not related to license)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/udpxy/Config.in  |  2 +-
 package/udpxy/udpxy.hash |  4 ++--
 package/udpxy/udpxy.mk   | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/udpxy/Config.in b/package/udpxy/Config.in
index f442a2f2fe..84a754bed4 100644
--- a/package/udpxy/Config.in
+++ b/package/udpxy/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_UDPXY
 	  forwards UDP traffic from a given multicast subscription to
 	  the requesting HTTP client.
 
-	  http://www.udpxy.com/
+	  https://github.com/pcherenkov/udpxy/
diff --git a/package/udpxy/udpxy.hash b/package/udpxy/udpxy.hash
index 8455fcdb1a..e0dbd06a35 100644
--- a/package/udpxy/udpxy.hash
+++ b/package/udpxy/udpxy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6ce33b1d14a1aeab4bd2566aca112e41943df4d002a7678d9a715108e6b714bd  udpxy.1.0.23-9-prod.tar.gz
-sha256  60ead3913246c7cd930fe653c0053aba1af2cd9f82b266befdbbd6e0b8ecb750  README
+sha256  a1a16e60895c6b2fd151321db47f5d5373843116f1b98ed9749e6c25a6c44497  udpxy-1.0-25.1.tar.gz
+sha256  aac36b21c5afa931fd0e5d796814e29102a3b1f2742fb8694a26ef135aebf943  README
diff --git a/package/udpxy/udpxy.mk b/package/udpxy/udpxy.mk
index 22467948a5..787f6e58ed 100644
--- a/package/udpxy/udpxy.mk
+++ b/package/udpxy/udpxy.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-UDPXY_VERSION = 1.0.23-9-prod
-UDPXY_SOURCE = udpxy.$(UDPXY_VERSION).tar.gz
-UDPXY_SITE = http://www.udpxy.com/download/1_23
+UDPXY_VERSION = 1.0-25.1
+UDPXY_SITE = $(call github,pcherenkov,udpxy,$(UDPXY_VERSION))
 UDPXY_LICENSE = GPL-3.0+
 UDPXY_LICENSE_FILES = README
 
 define UDPXY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		ALL_CFLAGS="$(TARGET_CFLAGS)" -C $(@D)/chipmunk
 endef
 
 define UDPXY_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
-		-C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/chipmunk DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr -C $(@D)/chipmunk install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
