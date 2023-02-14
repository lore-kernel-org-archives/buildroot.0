Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6CDC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6605D4F652;
	Tue, 21 Feb 2023 00:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6605D4F652
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqPPNj0YQInS; Tue, 21 Feb 2023 00:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 171844F655;
	Tue, 21 Feb 2023 00:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 171844F655
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED7231BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2C7B4181B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2C7B4181B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQ4Gy1oThkpw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD41E4180E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD41E4180E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA5E5828C8; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 18:12:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4231054b05436978795267330202f72be0d3a4d4
X-Git-Newrev: 89fa774a191d41ed5d125d87d812ff3478902251
X-Patchwork-Hint: ignore
Message-Id: <20230220205259.CA5E5828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zabbix: bump to
 version 6.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=89fa774a191d41ed5d125d87d812ff3478902251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- host-pkgconf is now mandatory
- switch to pcre2 which is supported since version 6.0.0 and
  https://github.com/zabbix/zabbix/commit/18917f919a68abc863a5c79ba88c0cb156255fdc
- Update hash of README (links updated with
  https://github.com/zabbix/zabbix/commit/067f5f873fb18ae7b22c5eaef40f0898b98edeb5
  https://github.com/zabbix/zabbix/commit/499dbc81b987513233d579610335b8938f1ae91d)

https://github.com/zabbix/zabbix/blob/6.2.7/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zabbix/Config.in   | 2 +-
 package/zabbix/zabbix.hash | 4 ++--
 package/zabbix/zabbix.mk   | 7 +++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index 0f7a0b0003..377c0ff692 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ZABBIX
 	bool "zabbix"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Zabbix is an enterprise-class open source distributed
 	  monitoring solution. Zabbix is free of cost. Zabbix is
diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index 42cc0bda57..bb6127e5ec 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  19686628df76e8d5ef7c2ed2975b258c7ca3ec7d151b1bb59d7e132f9fc7c941  zabbix-5.4.9.tar.gz
-sha256  10d68ec3abacc29222c07748fc5e5cb9474fd7cd9ccdde1b92ff941ded946b78  README
+sha256  6d423810667b948ed22052d9aa84a035e2d4b92cbe8efdb669cac529806b722d  zabbix-6.2.7.tar.gz
+sha256  f8fc3fd12521b60d53d8c5d48a883eb3c9c5ddec9de986a273e1b77f69d811db  README
 sha256  444fe54aecc95ac0f3314289c300afc73b3946a4dc9fbd7e022709b3e0924dd0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index e00d693ba5..db9efed78b 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZABBIX_VERSION_MAJOR = 5.4
-ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).9
+ZABBIX_VERSION_MAJOR = 6.2
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).7
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_LICENSE = GPL-2.0+
 ZABBIX_LICENSE_FILES = README COPYING
@@ -13,9 +13,8 @@ ZABBIX_CPE_ID_VENDOR = zabbix
 # We're patching m4/netsnmp.m4
 ZABBIX_AUTORECONF = YES
 
-ZABBIX_DEPENDENCIES = pcre
+ZABBIX_DEPENDENCIES = host-pkgconf pcre2
 ZABBIX_CONF_OPTS = \
-	--with-libpcre=$(STAGING_DIR)/usr/bin/ \
 	--without-sqlite3 \
 	--enable-agent \
 	--disable-agent2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
