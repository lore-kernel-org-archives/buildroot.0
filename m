Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360ADC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9150E707B1;
	Mon, 19 May 2025 10:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z71AuJNVNKA9; Mon, 19 May 2025 10:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1283E707A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1283E707A8;
	Mon, 19 May 2025 10:53:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 147C0D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28F2142386
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QUSVzQlvEEhC for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9979041214
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9979041214
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 975EB873D4; Mon, 19 May 2025 10:39:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Apr 2025 21:05:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5926b3b3ae0d10005d7eb984c7575e0a8ababb72
X-Git-Newrev: e3ba7978731e0b0afdbaee1b0d39ce17c6397883
X-Patchwork-Hint: ignore
Message-Id: <20250519103953.975EB873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-sdbus: bump to
 version 0.14.0
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5271064163488470179=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5271064163488470179==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e3ba7978731e0b0afdbaee1b0d39ce17c6397883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note, see:
https://github.com/python-sdbus/python-sdbus/releases/tag/0.14.0

The upstream URL has changed so while at it also update it.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
[Julien: add link to release note in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sdbus/Config.in         | 2 +-
 package/python-sdbus/python-sdbus.hash | 4 ++--
 package/python-sdbus/python-sdbus.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sdbus/Config.in b/package/python-sdbus/Config.in
index b2d3990ab4..24ea16901f 100644
--- a/package/python-sdbus/Config.in
+++ b/package/python-sdbus/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PYTHON_SDBUS
 	  Modern Python D-Bus library. Based on sd-bus from
 	  libsystemd.
 
-	  https://github.com/igo95862/python-sdbus
+	  https://github.com/python-sdbus/python-sdbus
 
 comment "python-sdbus needs systemd"
 	depends on !BR2_PACKAGE_SYSTEMD
diff --git a/package/python-sdbus/python-sdbus.hash b/package/python-sdbus/python-sdbus.hash
index 62a4587628..544262d48f 100644
--- a/package/python-sdbus/python-sdbus.hash
+++ b/package/python-sdbus/python-sdbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdbus/json
-md5  ea63ebfd0499940dc32878b0ffb9601c  sdbus-0.13.0.tar.gz
-sha256  801bd46608ee82614d42960c8ba8ae9300edb1bf5bbeb534bc8fd21f13d2c20e  sdbus-0.13.0.tar.gz
+md5  69a256ea1c25105461a3955ac68e3ea7  sdbus-0.14.0.tar.gz
+sha256  41d61b76cc05a9ea41d10d70a11e9f9a86ed95f40f713630c5e18340e0e4c76f  sdbus-0.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-sdbus/python-sdbus.mk b/package/python-sdbus/python-sdbus.mk
index 111c4bd648..560a5f02ae 100644
--- a/package/python-sdbus/python-sdbus.mk
+++ b/package/python-sdbus/python-sdbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SDBUS_VERSION = 0.13.0
+PYTHON_SDBUS_VERSION = 0.14.0
 PYTHON_SDBUS_SOURCE = sdbus-$(PYTHON_SDBUS_VERSION).tar.gz
-PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/4f/c7/8740ff78e9ffdbb9a28e7722e145795015c62ea7ce812242f5968073511c
+PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/17/9a/1dc010428fa1f444809d9aa1adb3ce231dae891b5f33635d8f4d7a8e33fd
 PYTHON_SDBUS_SETUP_TYPE = setuptools
 PYTHON_SDBUS_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_LICENSE_FILES = COPYING

--===============5271064163488470179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5271064163488470179==--
