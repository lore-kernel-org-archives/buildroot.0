Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9C4ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 17:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FBB960AFD;
	Mon, 29 Aug 2022 17:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FBB960AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AorOdwGWX22P; Mon, 29 Aug 2022 17:14:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FD8160AC0;
	Mon, 29 Aug 2022 17:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FD8160AC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C9ED1BF280
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 17:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E770B81348
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 17:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E770B81348
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVSSouaPiZ2u for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 17:14:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ECC481329
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2ECC481329
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 17:14:21 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4MGcVc4kLfz9t47;
 Mon, 29 Aug 2022 19:14:16 +0200 (CEST)
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 19:14:13 +0200
Message-Id: <20220829171415.129914-2-marcus.hoffmann@othermo.de>
In-Reply-To: <20220829171415.129914-1-marcus.hoffmann@othermo.de>
References: <20220829171415.129914-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1661793256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4JfUco+ZAUUOkYTCNs4oJ5OJg5vDYs+AWFHWSqDCm8=;
 b=jpJIhAwOc8h1EVtNasoFyhu/c/4znG3uRylNzuvQ9IW6yTLz1OmbVOvrNfVho0oZ4+S9gz
 q1TSpmL2cWL54qpfK/0vlsuxP01I3i96hfbH0MOVtX8v4NYG16hdV0/bqw3zLpfr1DsyWQ
 gJhm8Oks2c8P2dqHydA4+0Z0rRiwNOKrZomKWQ/H+SpRROFEIa4rtxf7G4fdiUYSGqFPkv
 aZm9RCIzipn4tDihHb+pWyLgxTpwMLtScpfY1ftVOZKv9/vkoBf0CHFTnLcoFnINBOCISI
 Z7eSE+baE8WP28Flmb8K5YDuVM/YtCZ4knPzVa5Z9Z9Fmznsi7OQhyPZmaAqSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=jpJIhAwO
Subject: [Buildroot] [next v2 1/2] package/python-paho-mqtt: bump to 1.6.1
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
Cc: Davide Viti <zinosat@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to switch to the github download as the sdist published to pypi
doesn't package the epl-v20 license file isn't included there:

https://github.com/eclipse/paho.mqtt.python/pull/635

License changed to EPL-2.0 or EDLv1.0

Changelog:
https://github.com/eclipse/paho.mqtt.python/blob/master/ChangeLog.txt
Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
Changes v1 -> v2:
  - switch to github download to have license file in source tarball
  - update license hashes

 package/python-paho-mqtt/python-paho-mqtt.hash | 10 +++++-----
 package/python-paho-mqtt/python-paho-mqtt.mk   |  9 ++++-----
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
index bf3993e919..dbf9ee89f6 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.hash
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -1,6 +1,6 @@
-# md5 from https://pypi.python.org/pypi/paho-mqtt/json, sha256 locally computed
-md5  e3ac29cd5dc247a01083a2a8f3fddd08  paho-mqtt-1.4.0.tar.gz
-sha256  e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79  paho-mqtt-1.4.0.tar.gz
-sha256  76f13729e84e9222e543303df00f87d1b2c0995b6a505cd859a285667e44babb  LICENSE.txt
+# locally computed
+md5  00c3381d7deacc7ac8b220f3b9d689c6  python-paho-mqtt-1.6.1.tar.gz
+sha256	6e35c1be242a901fc9c00bad7d37b5cc4a497f398dfceb4ed0d8018a959be650  python-paho-mqtt-1.6.1.tar.gz
+sha256	66408b049249c3bdb0ba1ed285f5422ce67e371d40151bebd4d806af454ffe7c  LICENSE.txt
 sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
-sha256  3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
+sha256	8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  epl-v20
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index d192749e1e..3ff5f9e57a 100644
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
+PYTHON_PAHO_MQTT_LICENSE = EPL-2.0 or EDLv1.0
+PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
 PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
