Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345D8ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9B8D6FB32;
	Sun, 11 Sep 2022 09:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9B8D6FB32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iu-_J_dkPEk; Sun, 11 Sep 2022 09:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 192666FB09;
	Sun, 11 Sep 2022 09:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 192666FB09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5C831BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8850060812
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8850060812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thmcc0Ku5zzr for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8D436FB40
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8D436FB40
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A5589835E4; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 21:56:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fbce4ea35a0c86313f11200f9496878f8a45d73
X-Git-Newrev: fc7ba3ab8fa6c3144098fae057c758d35279e46f
X-Patchwork-Hint: ignore
Message-Id: <20220911084828.A5589835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-paho-mqtt: bump to 1.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc7ba3ab8fa6c3144098fae057c758d35279e46f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to switch to the github download as the sdist published to pypi
doesn't package the epl-v20 license file isn't included there:

https://github.com/eclipse/paho.mqtt.python/pull/635

License changed to EPL-2.0 and EDLv1.0.

Changelog:
https://github.com/eclipse/paho.mqtt.python/blob/master/ChangeLog.txt
Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
[yann.morin.1998@free.fr:
  - use spaces in hash file
  - drop localy computed md5
  - license is EPL *and* EDL, not _or_
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-paho-mqtt/python-paho-mqtt.hash | 9 ++++-----
 package/python-paho-mqtt/python-paho-mqtt.mk   | 9 ++++-----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
index bf3993e919..81b9dda81d 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.hash
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -1,6 +1,5 @@
-# md5 from https://pypi.python.org/pypi/paho-mqtt/json, sha256 locally computed
-md5  e3ac29cd5dc247a01083a2a8f3fddd08  paho-mqtt-1.4.0.tar.gz
-sha256  e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79  paho-mqtt-1.4.0.tar.gz
-sha256  76f13729e84e9222e543303df00f87d1b2c0995b6a505cd859a285667e44babb  LICENSE.txt
+# locally computed
+sha256  6e35c1be242a901fc9c00bad7d37b5cc4a497f398dfceb4ed0d8018a959be650  python-paho-mqtt-1.6.1.tar.gz
+sha256  66408b049249c3bdb0ba1ed285f5422ce67e371d40151bebd4d806af454ffe7c  LICENSE.txt
 sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
-sha256  3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
+sha256  8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  epl-v20
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index d192749e1e..f255a7847d 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PAHO_MQTT_VERSION = 1.4.0
-PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
-PYTHON_PAHO_MQTT_SITE = https://files.pythonhosted.org/packages/25/63/db25e62979c2a716a74950c9ed658dce431b5cb01fde29eb6cba9489a904
-PYTHON_PAHO_MQTT_LICENSE = EPL-1.0 or EDLv1.0
-PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
+PYTHON_PAHO_MQTT_VERSION = 1.6.1
+PYTHON_PAHO_MQTT_SITE = $(call github,eclipse,paho.mqtt.python,v$(PYTHON_PAHO_MQTT_VERSION))
+PYTHON_PAHO_MQTT_LICENSE = EPL-2.0, EDLv1.0
+PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
 PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
