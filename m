Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91901C52D6D
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A17C8119B;
	Mon,  5 Aug 2024 20:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bt8CpehiSR63; Mon,  5 Aug 2024 20:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F191811AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F191811AE;
	Mon,  5 Aug 2024 20:41:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 722571BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 601674023C
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59lDNlOk_tzG for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7126440246
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7126440246
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:40:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C64D8452E; Mon,  5 Aug 2024 20:40:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Aug 2024 22:33:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adcf413ed7a6e96c1715a8f4528e908b6f2a34ef
X-Git-Newrev: 0eb09e7d377f30b54b329e20ccf4340d493eabde
X-Patchwork-Hint: ignore
Message-Id: <20240805204052.6C64D8452E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: bump version to 2.13.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=0eb09e7d377f30b54b329e20ccf4340d493eabde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add configure option --with-http to enable HTTP support which is now
disabled by default to preserve previous behaviour.

Release notes:
https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.0.news
https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.1.news
https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.2.news
https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.3.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxml2/libxml2.hash | 6 +++---
 package/libxml2/libxml2.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 73fd0ecedf..7b9ffc5d47 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.9.sha256sum
-sha256  59912db536ab56a3996489ea0299768c7bcffe57169f0235e7f962a91f483590  libxml2-2.12.9.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.3.sha256sum
+sha256  0805d7c180cf09caad71666c7a458a74f041561a532902454da5047d83948138  libxml2-2.13.3.tar.xz
 # License files, locally calculated
-sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
+sha256  c99aae1afe013e50b8b3701e089222b351258043c3025b64053a233fd25b4be7  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index b69722b21d..068ce157d5 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBXML2_VERSION_MAJOR = 2.12
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).9
+LIBXML2_VERSION_MAJOR = 2.13
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
@@ -20,7 +20,7 @@ ifeq ($(BR2_m68k_cf),y)
 LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
 endif
 
-LIBXML2_CONF_OPTS = --with-gnu-ld --without-debug
+LIBXML2_CONF_OPTS = --with-http --with-gnu-ld --without-debug
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 LIBXML2_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
