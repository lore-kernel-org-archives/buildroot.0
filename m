Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D03CDD1D3
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 18:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E906F84ED0;
	Fri, 27 Sep 2024 18:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ul5vuYcgrWMl; Fri, 27 Sep 2024 18:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD36284EDD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD36284EDD;
	Fri, 27 Sep 2024 18:34:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 257E81BF376
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10B0D4253B
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hk-jCZZpNlSN for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 18:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AF734253C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AF734253C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AF734253C
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 18:34:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.6.179]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mjj8D-1sE00u2y3H-00otwL; Fri, 27
 Sep 2024 20:34:11 +0200
To: buildroot@buildroot.org
Date: Fri, 27 Sep 2024 20:34:00 +0200
Message-ID: <20240927183400.339491-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927183400.339491-1-fiona.klute@gmx.de>
References: <20240927183400.339491-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:JtrbOh6CRhbA/HWVrzLiGtKq4d06Fz3ZTLRNM1GOzYPeRDmNXrV
 D0VCe5TZj4On7UVEAFBB18Ilv9bOfA+H4YUSoapop0pI6+IWyThSwekYoSv/yXS9jQ+3mTM
 BD8bdWIP1ycMhwbSMaS7/gwLy+Eo0yLzVIVSRxgysaLqNUGqy03i2JQGgi1a1xE4ubDgVL1
 mm0tE4nzwkWpYSGweHYMA==
UI-OutboundReport: notjunk:1;M01:P0:FeWfmC/mX/k=;nawuflunlUiM73+tEtKpWFH9nF8
 exUpp0Ck0fDE5PG35q+ICpI+/ZpF2TG0JDB4Tl1RG9EuUdXinBx5nz6Xy1LSOBqOOL0yJdDcQ
 wW0+PyCwJu6RBWNjkh40SPjDfzavBuG6HDdF8CcZy0NtHnbIXq87gBJX7BQWL1H9BU3RKYyqS
 xG34L7ypdjQpO20Q8YCcMOvbmTnzbEQ9nq8U8ZRquk71W0GdWR7dVISEmILs5f0gBnkoasj9L
 GagYTDpSWhffh6uyKnRwnHNHb3IO60vr7RyaMXZMcjsjhdU1YpLPGV7VuFdl4GLcFRzIFf2Ip
 WoRp4L1nbhPYKzN4QfLb0sbNe78QM5S5i/yR7vYSUBB5iuaTTtomPnNwWz48FSYrPruu6c3Qn
 u4xh1sOLyq0OolyODrRoZqFSBzmjERy5HeN0K2HjkZseFLXaSdfu4MKxrXmK3E3OHeloJZ/MW
 lQraJJY57LiGrNiARIBr5r0zrrO06VrcnX7E/nYmdfcHegtXp4LB7pmHdfiQddc3zuRzlg967
 CI66wkZlkp5hCdbIa0HMC4rsZfoEOX94NtK0jisJz5hh0Om4ZFVda1ARcrHMpETN+SXDk/a2X
 zFYjvL+zEPpGNqdBjQnZaykQ702dSp+W5Gf77pKE21KwFjbESx3l+ZKnyy2m+m52M8TWDHs5X
 /iDHoOqjSomfM9tOn0BhTGT7r9uhpL6efSZC/lqNQI01Sd1psyLnALR0i+s1GSGW3P3emWXTQ
 9MCUBkzXAY21F/TWmg2aNqPY7Z9u6qyitpOlNJjz62NZPeGV+TqpvtM0tub74EnfWbWW2ah/0
 Dw/LRhNuPdnlQhtClFacCJ1w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727462052; x=1728066852; i=fiona.klute@gmx.de;
 bh=f3NfU8hidKu4+DnXv4jg0ClomPlg72Aug9nx4qGiM0Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PxFSqXZ1DLyaosuGSBsPc9Cg1Ith25mwazA7/VnXj8OYThX/joqxul40jBDqXaJU
 6XoyESK+IUSf5IcNRfdlKUvG6+drzKaDJ9ncEVHr+0NTIRITG6b17Vr2QCoJ9aP/o
 ydmM77VgMF/65CR2bLqnZH7eCx+V3F3sPa0hr4+9zF3NQ7P1eF+DLzw9W/XG0AYY3
 keUIlD0ivwnp9940cK72kJyYmJkMEteZLxMoT8Y4i51s5DFeeOI939F8PPyipcCPO
 E1KNS/WUEe8xd2cNC+WbNH7mXGt169kt/HJDtodxqfi/f0mV8FfuVC7HkhxKmM4ZM
 UamXp+TbHFPM6tT/DA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=PxFSqXZ1
Subject: [Buildroot] [PATCH 4/4] package/python-aiomqtt: new package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

MQTT client library for use with Python asyncio.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Unlike poetry-dynamic-versioning and dunamai there are no release
tarballs in the aiomqtt releases on Github, only the autogenerated
source archives, so I assume it's better to stick with PyPI for stable
tarballs.

 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-aiomqtt/Config.in           |  8 ++++++++
 package/python-aiomqtt/python-aiomqtt.hash |  5 +++++
 package/python-aiomqtt/python-aiomqtt.mk   | 15 +++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-aiomqtt/Config.in
 create mode 100644 package/python-aiomqtt/python-aiomqtt.hash
 create mode 100644 package/python-aiomqtt/python-aiomqtt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 248be00cda..9db603fc6b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1111,6 +1111,7 @@ N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/

 N:	Fiona Klute <fiona.klute@gmx.de>
+F:	package/python-aiomqtt/
 F:	package/python-dunamai/
 F:	package/python-poetry-dynamic-versioning/
 F:	package/python-pyasynchat/
diff --git a/package/Config.in b/package/Config.in
index e1ceb81dc0..fc9b798291 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -985,6 +985,7 @@ menu "External python modules"
 	source "package/python-aiojobs/Config.in"
 	source "package/python-aiologstash/Config.in"
 	source "package/python-aiomonitor/Config.in"
+	source "package/python-aiomqtt/Config.in"
 	source "package/python-aioprocessing/Config.in"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
diff --git a/package/python-aiomqtt/Config.in b/package/python-aiomqtt/Config.in
new file mode 100644
index 0000000000..d0d31b48ba
--- /dev/null
+++ b/package/python-aiomqtt/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AIOMQTT
+	bool "python-aiomqtt"
+	select BR2_PACKAGE_PYTHON_PAHO_MQTT # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
+	help
+	  The idiomatic asyncio MQTT client, wrapped around paho-mqtt.
+
+	  https://github.com/empicano/aiomqtt
diff --git a/package/python-aiomqtt/python-aiomqtt.hash b/package/python-aiomqtt/python-aiomqtt.hash
new file mode 100644
index 0000000000..12ea86d538
--- /dev/null
+++ b/package/python-aiomqtt/python-aiomqtt.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiomqtt/json
+md5  e23feb8ad69a1ae3a9701fb1f3c03a3c  aiomqtt-2.3.0.tar.gz
+sha256  312feebe20bc76dc7c20916663011f3bd37aa6f42f9f687a19a1c58308d80d47  aiomqtt-2.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  2cdee9e997c759749069649dfb9060fdb885da82bc50c0dcb4841b1dcab0b032  LICENSE
diff --git a/package/python-aiomqtt/python-aiomqtt.mk b/package/python-aiomqtt/python-aiomqtt.mk
new file mode 100644
index 0000000000..291547f11f
--- /dev/null
+++ b/package/python-aiomqtt/python-aiomqtt.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-aiomqtt
+#
+################################################################################
+
+PYTHON_AIOMQTT_VERSION = 2.3.0
+PYTHON_AIOMQTT_SOURCE = aiomqtt-$(PYTHON_AIOMQTT_VERSION).tar.gz
+PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/db/c9/168e78bd35b21d9bdbb26178db33a8f265e4a69bb4193e72434e7cb3d1cd
+PYTHON_AIOMQTT_SETUP_TYPE = pep517
+PYTHON_AIOMQTT_LICENSE = BSD-3-Clause
+PYTHON_AIOMQTT_LICENSE_FILES = LICENSE
+PYTHON_AIOMQTT_DEPENDENCIES = host-python-poetry-dynamic-versioning
+
+$(eval $(python-package))
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
