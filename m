Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133E9C4828F
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 15:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6300B83D77;
	Fri,  2 Feb 2024 15:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6300B83D77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCKdCsF73CZf; Fri,  2 Feb 2024 15:59:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9E5E835BA;
	Fri,  2 Feb 2024 15:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9E5E835BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF941BF330
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 15:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54B6642488
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 15:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54B6642488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0Kin4RkhObm for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 15:58:58 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 485BF42447
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 15:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 485BF42447
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3E8BA35351DB; Fri,  2 Feb 2024 16:58:56 +0100 (CET)
Date: Fri, 2 Feb 2024 16:58:56 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zb0RQA8kV+RXOd0h@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1706889536; bh=0r4AeK0onKFXA/AwJDp9qoZapFdOgjhXRmgqY+og750=;
 h=Date:From:To:Subject:From;
 b=ZWrG7T9WOG5GIyf4Ls63s/94bhJjxL7sqJaXbv8DY63F6t0VkoVPec7XH48siJLg2
 nAugMNv07DJU4WX7ohmvoiEeHJkSvg0PBQeirBjoyEDgRVMlo2tT0eJogmhRYQuztd
 t509YPzLaJlge855bKZiZ+qe3O+5Fpyv7KjU1ZhuC12I5NV4r7rOkVfYy0/BdyngAt
 RLuQqTKPwpJRWS7u4bGMDF+95MvHdtVXOILOtPkEVmQ4PB76aKXRk5Hspwbx/+5IBN
 ZJlm0OWj7Y7H5drrWGSWX64UFikGuFv5eYVyCRA6BOd2lcSqOet3Dkl4qUvr9cKQTv
 mQXLa7qDPSnLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=ZWrG7T9W
Subject: [Buildroot] [PATCH 2/2 v2] package/asterisk: bump to 20.6.0
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
v1->v2:
 - use separate libjwt package instead of bundled one, suggested by
   Peter Korsgaard
---
 package/asterisk/Config.in     | 1 +
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 6 ++++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
index c52456f8fc..662f070dac 100644
--- a/package/asterisk/Config.in
+++ b/package/asterisk/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_ASTERISK
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBEDIT
 	select BR2_PACKAGE_LIBILBC
+	select BR2_PACKAGE_LIBJWT
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
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
index d1f3ea82d3..869e4128ff 100644
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
@@ -35,6 +35,7 @@ ASTERISK_DEPENDENCIES = \
 	jansson \
 	libcurl \
 	libedit \
+	libjwt \
 	libxml2 \
 	sqlite \
 	util-linux
@@ -89,6 +90,7 @@ ASTERISK_CONF_OPTS = \
 	--with-jansson \
 	--with-libcurl \
 	--with-ilbc \
+	--with-libjwt="$(STAGING_DIR)/usr" \
 	--with-libxml2 \
 	--with-libedit="$(STAGING_DIR)/usr" \
 	--with-pjproject \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
