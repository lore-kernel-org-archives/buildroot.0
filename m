Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12690C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 10:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5B2260E7C;
	Wed, 15 Mar 2023 10:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5B2260E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-N-B7BAkOnz; Wed, 15 Mar 2023 10:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7E6660BAB;
	Wed, 15 Mar 2023 10:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7E6660BAB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7ABC1BF5E0
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 10:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B094B408C9
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 10:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B094B408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u0maCmXLOuZO for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 10:08:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF20408B3
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FF20408B3
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 10:08:52 +0000 (UTC)
Received: from localhost.localdomain ([151.36.255.68])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cO3sppOaMBDVWcO3spMB99; Wed, 15 Mar 2023 11:08:49 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 11:08:47 +0100
Message-Id: <20230315100848.57061-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230314233719.55e2f430@windsurf>
References: <20230314233719.55e2f430@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHvSqR3fur64d9jcDex2VsDBKHgBcWUnJ6Kzm6cbkVxco1iXjf1y78Oa5thZ99rDVrslvGcriJl+yUr3dAp8sHkZosCr1lpjDHZCNiMrCn2vjR/3qiNZ
 Go6tCTWfueBSqA0Th7MlTctp6+s6KDTdZqztsBxrL60DMCoSGg7GXbXvjTn254Jio6lgnb17ixvGKysSf18HZ9n+WjcrItrd33Ht9I/8BNtc0YRB8+YRGgwx
 WxZb4tGuPrujxK05P30pra9KjcBXmJV68Cu4RYtuUQ8mx1Q/soZgfrEGucd/Vxm5cDaiieweC8+sT4LwLi3mdc2NF6LyqJ0BHL/PwuL1e1nLqKxBAaS3MdVX
 4Y4ewwTS5WLnXLSfrwIA/dCyWrBaPxfHVdXIHjOdvuf3i2BZ93A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678874929; bh=fnuHs7gn+tbGRjb9PBroQTzn6ID2Gu6dYyydOb+bGlk=;
 h=From:To:Subject:Date:MIME-Version;
 b=kqhJvKv2mwLRVEOXzs0xSvb5ceafYOjqjCOKhG+57Cz6hwocZqcyQgyW8giyqg8Dn
 JfrQRaedANceUX3Jsz4PCj270DBKfUmtIFZ2ODnY+yBhaH0T5IBnUN/tAGIVxDR16s
 XZ6ScLjcorrIjgNCIujyaf7Dj2GS7cFDH1MRW6CUpVHgwOrN5h6JfvodQxjpRHV1Tq
 GSBZSwcRx72QPFPC0J/izSLTJMjhzCRnWJwDUCto67DAmhBXfMs6QWsQYqv+K7y6ZQ
 1NWFdqkyO4dDH1XZNar3wx8Kbq2oEoTsi2cu9Jo9MESY0XagCNXOVpKdiU25BK9KUQ
 l08ymNyIYMnVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=kqhJvKv2
Subject: [Buildroot] [PATCH v2 1/2] package/python-libconf: new package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-libconf is a pure-Python reader/writer for configuration files in
libconfig format, which is often used in C/C++ projects.

https://github.com/ChrisAichinger/python-libconf

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add python-libconf package since it's required by swugenerator as
  pointed by Thomas Petazzoni
---
 DEVELOPERS                                 |  1 +
 package/Config.in.host                     |  1 +
 package/python-libconf/Config.in.host      |  7 +++++++
 package/python-libconf/python-libconf.hash |  4 ++++
 package/python-libconf/python-libconf.mk   | 13 +++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/python-libconf/Config.in.host
 create mode 100644 package/python-libconf/python-libconf.hash
 create mode 100644 package/python-libconf/python-libconf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b6d288c54f..8ddffbf428 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1171,6 +1171,7 @@ F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mmc-utils/
 F:	package/nfs-utils/
+F:	package/python-libconf/
 F:	package/python-uvloop/
 F:	package/qt5/
 F:	package/rockchip-mali/
diff --git a/package/Config.in.host b/package/Config.in.host
index dcadbfdfc1..edfe7ce4b3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -80,6 +80,7 @@ menu "Host utilities"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-iniparse/Config.in.host"
 	source "package/python-kflash/Config.in.host"
+	source "package/python-libconf/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
 	source "package/python-six/Config.in.host"
diff --git a/package/python-libconf/Config.in.host b/package/python-libconf/Config.in.host
new file mode 100644
index 0000000000..65e8d3a241
--- /dev/null
+++ b/package/python-libconf/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_LIBCONF
+	bool "host python-libconf"
+	help
+	  libconf is a pure-Python reader/writer for configuration files
+	  in libconfig format, which is often used in C/C++ projects.
+
+	  https://github.com/ChrisAichinger/python-libconf/
\ No newline at end of file
diff --git a/package/python-libconf/python-libconf.hash b/package/python-libconf/python-libconf.hash
new file mode 100644
index 0000000000..d05efd37fd
--- /dev/null
+++ b/package/python-libconf/python-libconf.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  66897870fcafce05624eafcc99e2dc8e150124e91019d9c29cc4f3bef64311dd  python-libconf-2.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  3c2afc8c9f7a12032f225e6fa870e85af14d1b71236afe28d94a4b67e5e8c873  LICENSE
diff --git a/package/python-libconf/python-libconf.mk b/package/python-libconf/python-libconf.mk
new file mode 100644
index 0000000000..b349e3e60e
--- /dev/null
+++ b/package/python-libconf/python-libconf.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-libconf
+#
+################################################################################
+
+PYTHON_LIBCONF_VERSION = 2.0.1
+PYTHON_LIBCONF_SITE = $(call github,ChrisAichinger,python-libconf,$(PYTHON_LIBCONF_VERSION))
+PYTHON_LIBCONF_SETUP_TYPE = setuptools
+PYTHON_LIBCONF_LICENSE = MIT
+PYTHON_LIBCONF_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
