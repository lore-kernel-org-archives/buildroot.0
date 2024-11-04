Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59518D1BDF2
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26DFE8110D;
	Mon,  4 Nov 2024 20:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzDSGgM_fGlf; Mon,  4 Nov 2024 20:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ED3981083
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ED3981083;
	Mon,  4 Nov 2024 20:42:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69A563B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DE336079D
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnevHSFyPKip for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B0F9607A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B0F9607A4
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58873828DA; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 21:39:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d48b515025016bb9673df81409b19eb31e6bb30
X-Git-Newrev: cbce27d2519cc9caf5710d67282975c915a4b25a
X-Patchwork-Hint: ignore
Message-Id: <20241104204205.58873828DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sdbus: bump to version
 0.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbce27d2519cc9caf5710d67282975c915a4b25a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add -fPIC to cflags which is now required to build python-sdbus.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-sdbus/python-sdbus.hash | 4 ++--
 package/python-sdbus/python-sdbus.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-sdbus/python-sdbus.hash b/package/python-sdbus/python-sdbus.hash
index 13c8c2bb5f..62a4587628 100644
--- a/package/python-sdbus/python-sdbus.hash
+++ b/package/python-sdbus/python-sdbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdbus/json
-md5  46d3ea00a491c2eec2a25ccf61b8a77a  sdbus-0.12.0.tar.gz
-sha256  c3692d75704438a78adc1439350bc32f30d6b38ad344cfc94773db89c6ce4a89  sdbus-0.12.0.tar.gz
+md5  ea63ebfd0499940dc32878b0ffb9601c  sdbus-0.13.0.tar.gz
+sha256  801bd46608ee82614d42960c8ba8ae9300edb1bf5bbeb534bc8fd21f13d2c20e  sdbus-0.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-sdbus/python-sdbus.mk b/package/python-sdbus/python-sdbus.mk
index 0b3ea37b30..111c4bd648 100644
--- a/package/python-sdbus/python-sdbus.mk
+++ b/package/python-sdbus/python-sdbus.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_SDBUS_VERSION = 0.12.0
+PYTHON_SDBUS_VERSION = 0.13.0
 PYTHON_SDBUS_SOURCE = sdbus-$(PYTHON_SDBUS_VERSION).tar.gz
-PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/8e/39/3d49f0d18dcba3344af756f31e4408e7de50b3df86fa3f3ea6f604402f16
+PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/4f/c7/8740ff78e9ffdbb9a28e7722e145795015c62ea7ce812242f5968073511c
 PYTHON_SDBUS_SETUP_TYPE = setuptools
 PYTHON_SDBUS_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_LICENSE_FILES = COPYING
 PYTHON_SDBUS_DEPENDENCIES = systemd
+PYTHON_SDBUS_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
 
 ifeq ($(BR2_STATIC_LIBS),y)
 PYTHON_SDBUS_ENV += PYTHON_SDBUS_USE_STATIC_LINK=1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
