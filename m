Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5DEC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 14:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DF584051A;
	Sat, 27 Apr 2024 14:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqyNbtu_YRpa; Sat, 27 Apr 2024 14:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DE10408EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DE10408EA;
	Sat, 27 Apr 2024 14:09:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAE4B1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 14:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C578B60646
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 14:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YACBZWgEraEd for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 14:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13D71605D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D71605D7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13D71605D7
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 14:09:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E365040003;
 Sat, 27 Apr 2024 14:09:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s0ikK-001bCn-2w;
 Sat, 27 Apr 2024 16:09:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 16:09:39 +0200
Message-Id: <20240427140941.381333-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 1/2] package/python-hid: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A python wrapper for the hidapi library.  Hidapi has fairly complicated
dependencies, so use a select rather than a depends on.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/python-hid/Config.in       |  7 +++++++
 package/python-hid/python-hid.hash |  5 +++++
 package/python-hid/python-hid.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-hid/Config.in
 create mode 100644 package/python-hid/python-hid.hash
 create mode 100644 package/python-hid/python-hid.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff..29c32f0a11 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2480,6 +2480,7 @@ F:	package/python-cached-property/
 F:	package/python-docker/
 F:	package/python-dockerpty/
 F:	package/python-docker-pycreds/
+F:	package/python-hid/
 F:	package/python-psutil/
 F:	package/python-request-id/
 F:	package/python-semver/
diff --git a/package/Config.in b/package/Config.in
index 1935077f0f..d4d951d903 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1121,6 +1121,7 @@ menu "External python modules"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
+	source "package/python-hid/Config.in"
 	source "package/python-hiredis/Config.in"
 	source "package/python-hkdf/Config.in"
 	source "package/python-hpack/Config.in"
diff --git a/package/python-hid/Config.in b/package/python-hid/Config.in
new file mode 100644
index 0000000000..78af383e65
--- /dev/null
+++ b/package/python-hid/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_HID
+	bool "python-hid"
+	depends on BR2_PACKAGE_HIDAPI # runtime
+	help
+	  ctypes bindings for hidapi.
+
+	  https://github.com/apmorton/pyhidapi
diff --git a/package/python-hid/python-hid.hash b/package/python-hid/python-hid.hash
new file mode 100644
index 0000000000..d03757771b
--- /dev/null
+++ b/package/python-hid/python-hid.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/hid/json
+md5  1954df0dce4e15afd89197e898039e92  hid-1.0.6.tar.gz
+sha256  48d764d7ae9746ba123b96dbf457893ca80268b7791c4b1d2e051310eeb83860  hid-1.0.6.tar.gz
+# Locally computed sha256 checksums
+sha256  5524b425acacdfedeca3f959980f0cd38b00176ebbb292e4a96c520d6074353d  LICENSE
diff --git a/package/python-hid/python-hid.mk b/package/python-hid/python-hid.mk
new file mode 100644
index 0000000000..2f65bd1412
--- /dev/null
+++ b/package/python-hid/python-hid.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-hid
+#
+################################################################################
+
+PYTHON_HID_VERSION = 1.0.6
+PYTHON_HID_SOURCE = hid-$(PYTHON_HID_VERSION).tar.gz
+PYTHON_HID_SITE = https://files.pythonhosted.org/packages/50/b8/5f470948262b6cdda8e1b2382b19f67c57eacda1e07a14322807b911e0ce
+PYTHON_HID_SETUP_TYPE = setuptools
+PYTHON_HID_LICENSE = MIT
+PYTHON_HID_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
