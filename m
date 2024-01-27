Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA7CC47422
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 02:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1509383E7B;
	Sat, 27 Jan 2024 02:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1509383E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytUeIYVZCJRS; Sat, 27 Jan 2024 02:21:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2CD83D71;
	Sat, 27 Jan 2024 02:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D2CD83D71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1B41BF5EA
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 02:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5874F60AC1
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 02:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5874F60AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id imOXUTt89Scv for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 02:21:46 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AAD060017
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 02:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AAD060017
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3BEBF35353E7; Sat, 27 Jan 2024 03:21:43 +0100 (CET)
Date: Sat, 27 Jan 2024 03:21:43 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZbRoty6JGeyS5bZe@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1706322104; bh=7XhJ4+2iWP/PDC3GEdObpd7bztO093MNZ4bacK0/7PU=;
 h=Date:From:To:Subject:From;
 b=JOexOkNHZ9WULMhYJFMkNIgZYkTM0ndQVtL/aZGFRxKMQSlvKqxRBy/5RndnU4chN
 4/afHJfgG0tNnPH53NOQ8IDbx3b6jx6CcfmExbg80iT/FHONDqQDxqeFH+YO4D/DXQ
 gYRByspEB3198tFBWsyjvBVkhGwrwOsreBNk04GnOfDCJZoN6b9thaQ/cg++fj8LJP
 XdI8f3lE2T1L0j9hCWpolfdHe7SHtYpZ1o6eyxs9dYLQpI25wuq9HsMNd4hzzy3FzG
 bvklHH21rJXlRcutbspu+pNefHQ/u06HFqROnTnCsu7NhFRrFuZkZtRl++gXdW6wJX
 enPojIUosM/Xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=JOexOkNH
Subject: [Buildroot] [PATCH] package/asterisk: bump to 20.6.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for changes:
https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-20-current.md

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 246f4219aa..d50955dd2b 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9def260ac8745a5eac7aceabe1c22f84a283b7812f0eccd760f87ce9eb991d22  asterisk-20.5.2.tar.gz
+sha256  088dbc08916e21528dba364f5452b2090b066dbba4548b32ec10af138d4b442f  asterisk-20.6.0.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index d1f3ea82d3..703547e630 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 20.5.2
+ASTERISK_VERSION = 20.6.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
@@ -27,7 +27,7 @@ ASTERISK_SELINUX_MODULES = asterisk
 
 # For patches 0002 and 0003
 ASTERISK_AUTORECONF = YES
-ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson
+ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson -Ithird-party/libjwt
 
 ASTERISK_DEPENDENCIES = \
 	host-asterisk \
@@ -93,6 +93,7 @@ ASTERISK_CONF_OPTS = \
 	--with-libedit="$(STAGING_DIR)/usr" \
 	--with-pjproject \
 	--with-pjproject-bundled \
+	--with-libjwt-bundled \
 	--with-sqlite3="$(STAGING_DIR)/usr" \
 	--with-sounds-cache=$(ASTERISK_DL_DIR)
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
