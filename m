Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EE8C77B7A
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 22:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CB88428BA;
	Fri,  2 Jun 2023 22:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB88428BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBhp-X2kTU9k; Fri,  2 Jun 2023 22:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E11D428B4;
	Fri,  2 Jun 2023 22:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E11D428B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3040A1BF5DD
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 22:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0976160F90
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 22:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0976160F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSIkD1vBD4ok for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 22:29:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C34860F3E
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 22:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C34860F3E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BE1786BF5; Fri,  2 Jun 2023 22:29:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jun 2023 00:28:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7e7c321ba0424123b0bf6f10a31af00607daaa8f
X-Git-Newrev: a46ac2346558d05afe405dda3730169df4b677d2
X-Patchwork-Hint: ignore
Message-Id: <20230602222932.1BE1786BF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openvpn: bump version
 to 2.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=a46ac2346558d05afe405dda3730169df4b677d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Added mandatory dependency to libcap-ng due to upstream commit
https://github.com/OpenVPN/openvpn/commit/2e359a088226ab1e5ee41fbab27d38d8a8d192ac

Added optional dependency to libnl due to upstream commit
https://github.com/OpenVPN/openvpn/commit/f63c9b1edbda41491ba2e05ff706bf0233903cb6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/Config.in    |  1 +
 package/openvpn/openvpn.hash |  2 +-
 package/openvpn/openvpn.mk   | 11 +++++++++--
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index cd8b1db996..5aa2386d36 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 0959b7f838..8078b41157 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  08340a389905c84196b6cd750add1bc0fa2d46a1afebfd589c24120946c13e68  openvpn-2.5.7.tar.gz
+sha256  371a2a323a99a79299b9b4caa4a31bc7b2cdff63236e68d429f3ee50e75f3dd4  openvpn-2.6.4.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 5c602e0448..920677e170 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.5.7
+OPENVPN_VERSION = 2.6.4
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
-OPENVPN_DEPENDENCIES = host-pkgconf
+OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CPE_ID_VENDOR = openvpn
@@ -16,6 +16,13 @@ OPENVPN_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = NETSTAT=/bin/netstat
 
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+OPENVPN_CONF_OPTS += --enable-dco
+OPENVPN_DEPENDENCIES += libnl
+else
+OPENVPN_CONF_OPTS += --disable-dco
+endif
+
 ifeq ($(BR2_PACKAGE_OPENVPN_SMALL),y)
 OPENVPN_CONF_OPTS += \
 	--enable-small \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
