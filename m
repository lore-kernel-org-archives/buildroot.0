Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E6CC3F6B0
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5234A81A50;
	Tue, 23 Aug 2022 19:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5234A81A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_ryV47D9N-E; Tue, 23 Aug 2022 19:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E26E181A4E;
	Tue, 23 Aug 2022 19:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E26E181A4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA0BD1BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2008819ED
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2008819ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxxsFMVMT3Es for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:47:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7928181951
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7928181951
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:47:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4MC0BF32P1z9sqC;
 Tue, 23 Aug 2022 21:47:33 +0200 (CEST)
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 21:47:31 +0200
Message-Id: <20220823194732.701895-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4MC0BF32P1z9sqC
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1661284053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=U1wjjUtpVRQ4S5k+/BHB8j/r6lxTgW9UwK2vdx/KC6A=;
 b=N9bf8QTDplmLphqAE1FsZRkgZfuK52zUSvDlsaskXCy2syosv4x95SH3u+Y/ZC+ES/EotK
 +jCeBaG0WJzSJ/xbLNy16FkytrfgjuRPky6sTY0+buM/5ZfgG2agT40WT2H7E6GJ+GrTVI
 wPTdx0/KaHNqfcu1kPsLurXhHSjyC3dk4HKzLliw0Ta4xk/oaGI6ZGGbT+gsHL1P0z77H9
 LEuDudOe4ZyJVBBXmaDUskMPJY1YPEEv9IpyUGN7ApLkN2LL/V/n8yXA5I2CkFz7X/ayPC
 Hs6Ywq57F0YldZNiw+sCIMw1hSTTvH4QAs86rr3YYW7bWLlYj734C6Dac/vuKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=N9bf8QTD
Subject: [Buildroot] [PATCH 1/2] package/python-paho-mqtt: bump to 1.6.1 to
 fix running on python 3.10
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

Fixes the following error on calling mqtt.publish():

  File "/usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 222, in single
    multiple([msg], hostname, port, client_id, keepalive, will, auth, tls,
  File "/usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 126, in multiple
    if not isinstance(msgs, collections.Iterable):
AttributeError: module 'collections' has no attribute 'Iterable'

This was actually changed in release 1.5.0 but 1.6.1 is alaready out for
almost a year, so we just update to that version.

Changelog:
https://github.com/eclipse/paho.mqtt.python/blob/master/ChangeLog.txt
Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 package/python-paho-mqtt/python-paho-mqtt.hash | 6 +++---
 package/python-paho-mqtt/python-paho-mqtt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
index bf3993e9195..56783e3fc08 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.hash
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -1,6 +1,6 @@
-# md5 from https://pypi.python.org/pypi/paho-mqtt/json, sha256 locally computed
-md5  e3ac29cd5dc247a01083a2a8f3fddd08  paho-mqtt-1.4.0.tar.gz
-sha256  e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79  paho-mqtt-1.4.0.tar.gz
+# package hashes from from https://pypi.org/project/paho-mqtt/#copy-hash-modal-e8e8e0de-1aec-462d-8ae0-d858d4f5a0d7
+md5  bdb20f88db291fdb4a0fe804c0f29316  paho-mqtt-1.6.1.tar.gz
+sha256  2a8291c81623aec00372b5a85558a372c747cbca8e9934dfe218638b8eefc26f  paho-mqtt-1.6.1.tar.gz
 sha256  76f13729e84e9222e543303df00f87d1b2c0995b6a505cd859a285667e44babb  LICENSE.txt
 sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
 sha256  3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index d192749e1e1..892f5f33c74 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PAHO_MQTT_VERSION = 1.4.0
+PYTHON_PAHO_MQTT_VERSION = 1.6.1
 PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
-PYTHON_PAHO_MQTT_SITE = https://files.pythonhosted.org/packages/25/63/db25e62979c2a716a74950c9ed658dce431b5cb01fde29eb6cba9489a904
+PYTHON_PAHO_MQTT_SITE = https://files.pythonhosted.org/packages/f8/dd/4b75dcba025f8647bc9862ac17299e0d7d12d3beadbf026d8c8d74215c12
 PYTHON_PAHO_MQTT_LICENSE = EPL-1.0 or EDLv1.0
 PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
 PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
