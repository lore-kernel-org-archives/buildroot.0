Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FCDC4345F
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 07:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92BEA80BD9;
	Sun, 14 Apr 2024 07:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edVqQo8gVoaG; Sun, 14 Apr 2024 07:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87B2F80BCD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87B2F80BCD;
	Sun, 14 Apr 2024 07:48:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B82D1BF40B
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 07:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FA67400E5
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 07:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rec_gV5hlsSu for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 07:48:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10462400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10462400C7
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10462400C7
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 07:48:42 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 12245352110F; Sun, 14 Apr 2024 09:48:40 +0200 (CEST)
Date: Sun, 14 Apr 2024 09:48:40 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZhuKWDZALDt+xUcI@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1713080921; bh=tjzM5DGI5MD663wVW1wW2eCU1wo+Xr8zIuBeQsnJua8=;
 h=Date:From:To:Subject:From;
 b=qPm1V6pa3S9PlzLiFfehx/fGaF/hq+Vpk8VOww3totOvTAO5oxCt24bkq4UPJ3MzR
 6WxmkSEgJzJO6kLlMtT/mnI54RLhDzC0r0lkjk4sgpeShhyf4Qe1pz7hegaGmE0usQ
 0RcczHpkyPbFeKwHdMU9vvNEImAZ6r6B0o6AwsK52d1PrX0THQL0J9uwgEIlqNas0M
 aCzOZXmocA5LN/IugFknRiuL0PGFJk+2NjZmJ7ayZnZi3GN1ZqD/FkKXnmXKtVbtBX
 hRHj+Je0MlKcVtdOCHM27tWU677S/1apVx0TT+oh1wGkfT/zcfUjHO9n1LH6Jei5y1
 JiehGhYmhCGxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=qPm1V6pa
Subject: [Buildroot] [PATCH] package/asterisk: bump to 20.7.0
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

There is still an open issue reported upstream:
https://github.com/asterisk/asterisk/issues/671

But it seems it is not reproducible by the asterisk developers, so
update the package so others can make use of it.

Use the external pjsip package, instead of the bundled one.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/asterisk/Config.in     |  2 ++
 package/asterisk/asterisk.hash |  2 +-
 package/asterisk/asterisk.mk   | 11 +++++++----
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
index c52456f8fc..ba5a574042 100644
--- a/package/asterisk/Config.in
+++ b/package/asterisk/Config.in
@@ -10,6 +10,8 @@ config BR2_PACKAGE_ASTERISK
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBEDIT
 	select BR2_PACKAGE_LIBILBC
+	select BR2_PACKAGE_LIBJWT
+	select BR2_PACKAGE_LIBPJSIP
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 246f4219aa..8cb5468249 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9def260ac8745a5eac7aceabe1c22f84a283b7812f0eccd760f87ce9eb991d22  asterisk-20.5.2.tar.gz
+sha256  62adff44f5bc415627e16957e6bd528e1782a892e116ff261c46f96ca87c342b  asterisk-20.7.0.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index d1f3ea82d3..33d2e78bcf 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 20.5.2
+ASTERISK_VERSION = 20.7.0
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
@@ -35,6 +35,8 @@ ASTERISK_DEPENDENCIES = \
 	jansson \
 	libcurl \
 	libedit \
+	libjwt \
+	libpjsip \
 	libxml2 \
 	sqlite \
 	util-linux
@@ -89,10 +91,11 @@ ASTERISK_CONF_OPTS = \
 	--with-jansson \
 	--with-libcurl \
 	--with-ilbc \
+	--with-libjwt="$(STAGING_DIR)/usr" \
 	--with-libxml2 \
 	--with-libedit="$(STAGING_DIR)/usr" \
-	--with-pjproject \
-	--with-pjproject-bundled \
+	--without-pjproject-bundled \
+	--with-pjproject="$(STAGING_DIR)/usr" \
 	--with-sqlite3="$(STAGING_DIR)/usr" \
 	--with-sounds-cache=$(ASTERISK_DL_DIR)
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
