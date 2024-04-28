Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F4DC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A0760633;
	Sun, 28 Apr 2024 18:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQjoUOGGJkaq; Sun, 28 Apr 2024 18:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06A9C60666
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A9C60666;
	Sun, 28 Apr 2024 18:27:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B76011BF5A8
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEF3E4034A
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYXmoAurkfF6 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B24CC40105
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B24CC40105
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABAE9861F5; Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 20:09:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 108175922b9d1c412e6fa71d1a1e96fd4fdca62d
X-Git-Newrev: 0e6d4d2171ce70d3aa6693f860a36ff08fc4d2b3
X-Patchwork-Hint: ignore
Message-Id: <20240428182741.ABAE9861F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: bump to 20.7.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0e6d4d2171ce70d3aa6693f860a36ff08fc4d2b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for changes:
https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-20-current.md

There is still an open issue reported upstream:
https://github.com/asterisk/asterisk/issues/671

But it seems it is not reproducible by the asterisk developers, so
update the package so others can make use of it.

Use the external pjsip package, instead of the bundled one.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
