Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD55C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 587B8605D4;
	Wed,  5 Feb 2025 10:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLzM1MAoLwto; Wed,  5 Feb 2025 10:09:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4501560631
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4501560631;
	Wed,  5 Feb 2025 10:09:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4D7212F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C44F840928
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ympWsFUb5qf for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74C82408E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74C82408E2
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E7E086FB7; Wed,  5 Feb 2025 10:09:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 11:06:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa9823907405bd775e43d24c00fe2ab5cda050a0
X-Git-Newrev: 65503c219defc8151de3f39d1350aed93cfa1898
X-Patchwork-Hint: ignore
Message-Id: <20250205100919.5E7E086FB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kismet: bump to version
 52bcb902e36b2df1562cfbe644b113362248d029
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=65503c219defc8151de3f39d1350aed93cfa1898
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to use the latest git commit as the last release does not
support compiling with the newer protobuf releases.

Add optional mosquito support.

Add librtlsdr mosquito support.

Fix python-setuptools dependency which should be
host-python-setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/kismet/Config.in   |  1 -
 package/kismet/kismet.hash |  2 +-
 package/kismet/kismet.mk   | 21 +++++++++++++++++----
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 2e1e0cfbd0..aa05e045d5 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -42,7 +42,6 @@ config BR2_PACKAGE_KISMET_PYTHON_TOOLS
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime for RTLAMR and RTLADSB
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	select BR2_PACKAGE_PYTHON_SERIAL # runtime for Freaklabs Zigbee
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	help
 	  Enable Python and Python-related tools (RTL_433, RTLAMR,
 	  RTLADSB and Freaklabs Zigbee)
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 543515858e..2d05a6791b 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f08548e26ca65fa1e567b1debbea1ca4d0e7206bddb96a4f639c90171873e8f7  kismet-2023-07-R1.tar.xz
+sha256  2dccf9b5bbf5f4e6b04a44bf8cfecf80db8dcfa52a8183dd1166396c3ca04660  kismet-52bcb902e36b2df1562cfbe644b113362248d029.tar.gz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index c448233d60..f182fbe328 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2023-07-R1
-KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
-KISMET_SITE = http://www.kismetwireless.net/code
+KISMET_VERSION = 52bcb902e36b2df1562cfbe644b113362248d029
+KISMET_SITE = $(call github,kismetwireless,kismet,$(KISMET_VERSION))
 KISMET_DEPENDENCIES = \
 	host-pkgconf \
 	libpcap \
@@ -37,6 +36,13 @@ else
 KISMET_CONF_OPTS += --disable-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
+KISMET_DEPENDENCIES += librtlsdr
+KISMET_CONF_OPTS += --enable-librtlsdr
+else
+KISMET_CONF_OPTS += --disable-librtlsdr
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 KISMET_DEPENDENCIES += libusb
 KISMET_CONF_OPTS += --enable-libusb
@@ -58,6 +64,13 @@ else
 KISMET_CONF_OPTS += --disable-lmsensors
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO),y)
+KISMET_DEPENDENCIES += mosquitto
+KISMET_CONF_OPTS += --enable-mosquitto
+else
+KISMET_CONF_OPTS += --disable-mosquitto
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 KISMET_DEPENDENCIES += pcre2
 KISMET_CONF_OPTS += --enable-pcre --enable-require-pcre2
@@ -69,7 +82,7 @@ KISMET_CONF_OPTS += --disable-pcre
 endif
 
 ifeq ($(BR2_PACKAGE_KISMET_PYTHON_TOOLS),y)
-KISMET_DEPENDENCIES += python3 python-setuptools
+KISMET_DEPENDENCIES += python3 host-python-setuptools
 KISMET_CONF_OPTS += \
 	--enable-python-tools \
 	--with-python-interpreter=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
