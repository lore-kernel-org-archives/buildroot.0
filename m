Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C30C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 20:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE35160B2F;
	Sun, 10 Apr 2022 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6S6SiNLHtBG; Sun, 10 Apr 2022 20:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C987160BAA;
	Sun, 10 Apr 2022 20:37:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3A11BF3E1
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B97E4159F
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTOrxEclX7_y for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 20:37:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 909CA4099B
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 20:37:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4555B83906; Sun, 10 Apr 2022 20:27:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 22:35:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8394943e80c847793f13555697e0b4c76483322
X-Git-Newrev: 73dc2eef2dc40b78e732872b26eee0bcea1087d1
X-Patchwork-Hint: ignore
Message-Id: <20220410202754.4555B83906@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netdata: bump to version 1.33.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=73dc2eef2dc40b78e732872b26eee0bcea1087d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball (and so drop autoreconf)
- Disable ebpf, enabled by default since its addition in version 1.25.0:
  https://github.com/netdata/netdata/commit/c857c880f31a89b7857bf01f1f48227c41bf8a93
- disable ml, enabled by default since its addition in version 1.32.1:
  https://github.com/netdata/netdata/commit/9ed4cea59042aa5e5053c4b4b3529e9d70ab83f9
- lz4 is an optional dependency (enabled by default) since version
  1.33.0 and
  https://github.com/netdata/netdata/commit/b003e5fd40c3b42dfacc87db5a7730b76eff0e92
- This bump will fix a build failure with libressl thanks to
  https://github.com/netdata/netdata/commit/6b091fafd9c3b0197325b3ef751dbdb317048e2b
- Update indentation in hash file (two spaces)

https://github.com/netdata/netdata/blob/v1.33.1/CHANGELOG.md

Fixes:
 - http://autobuild.buildroot.org/results/897d6f1425a645667b884739b2ee6f588fd06972

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netdata/netdata.hash |  6 ++++--
 package/netdata/netdata.mk   | 17 +++++++++++++----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/package/netdata/netdata.hash b/package/netdata/netdata.hash
index 8d5ce51fca..bc33a8b8a1 100644
--- a/package/netdata/netdata.hash
+++ b/package/netdata/netdata.hash
@@ -1,3 +1,5 @@
+# From https://github.com/netdata/netdata/releases/download/v1.33.1/sha256sums.txt
+sha256  20ba8695d87187787b27128ac3aab9b09aa29ca6b508c48542e0f7d50ec9322b  netdata-v1.33.1.tar.gz
+
 # Locally calculated
-sha256 60cdde3f1f8bd9035fef6a566053c0a7195d1714b5da6814473263e85382b4a8  netdata-1.21.1.tar.gz
-sha256 0e5fd9d833efe9b79f784d1903281554af82d1b4261af67d35455728e5572aa6  LICENSE
+sha256  0e5fd9d833efe9b79f784d1903281554af82d1b4261af67d35455728e5572aa6  LICENSE
diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 6def59764a..da6f8eb18b 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-NETDATA_VERSION = 1.21.1
-NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
+NETDATA_VERSION = 1.33.1
+NETDATA_SOURCE = netdata-v$(NETDATA_VERSION).tar.gz
+NETDATA_SITE = \
+	https://github.com/netdata/netdata/releases/download/v$(NETDATA_VERSION)
 NETDATA_LICENSE = GPL-3.0+
 NETDATA_LICENSE_FILES = LICENSE
 NETDATA_CPE_ID_VENDOR = netdata
-# netdata's source code is released without a generated configure script
-NETDATA_AUTORECONF = YES
 NETDATA_CONF_OPTS = \
 	--disable-dbengine \
+	--disable-ebpf \
+	--disable-ml \
 	--disable-unit-tests
 NETDATA_DEPENDENCIES = libuv util-linux zlib
 
@@ -43,6 +45,13 @@ else
 NETDATA_CONF_OPTS += --without-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+NETDATA_CONF_OPTS += --enable-compression
+NETDATA_DEPENDENCIES += lz4
+else
+NETDATA_CONF_OPTS += --disable-compression
+endif
+
 ifeq ($(BR2_PACKAGE_NFACCT),y)
 NETDATA_CONF_OPTS += --enable-plugin-nfacct
 NETDATA_DEPENDENCIES += nfacct
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
