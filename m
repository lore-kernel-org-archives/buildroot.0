Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDB4C6FA69
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 17:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A41881449;
	Mon, 29 Aug 2022 17:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A41881449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAC0OVXJ61GA; Mon, 29 Aug 2022 17:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2BB181446;
	Mon, 29 Aug 2022 17:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2BB181446
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD1F21BF280
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 17:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 986C46079D
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 17:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 986C46079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwwzfQmCk8WY for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 17:18:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BADED605C9
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BADED605C9
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 17:18:24 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4MGcbJ6lhHz9tq6;
 Mon, 29 Aug 2022 19:18:20 +0200 (CEST)
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 19:18:20 +0200
Message-Id: <20220829171820.130690-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1661793500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=v59PP4EgdgvyneehcGGnEPOSaoS3dQYdysiBHHqZLok=;
 b=zxEF0i5g21Hv8FjoOVbUw9DnOXZCwrItVZV/GNyixx0r6InDq90lvw7XLeDP9SIMJmRxRi
 Tm3H35pPJu10wMJ5XeqlpNrxY8Cb3p65Aolf4kNEpuk3w+AU8qUB3SFC9Y1LZXpET7niMJ
 dL7ud3em0XtuDhYvDuSd6HWVmw+2My5CrUxJUYT+YxG2fPVBe8uKtf0QvulWHKAM/BGq8C
 9UqqlbiZPCYfAeKEZVMjQr2qggYvzo3fZdoz3D18kfxIqG5MogJmymCFaanmR3SdUUhkWm
 1EhUlTmJ7y2M4IXkK0i98gHvG0h32zh3oTyb/vPRhLnq1hYRar4QlK65DTUm1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=zxEF0i5g
Subject: [Buildroot] [next v2 2/2]
 support/testing/tests/package/test_python_paho_mqtt: new runtime test
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

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../tests/package/sample_python_paho_mqtt.py  | 12 ++++++++
 .../tests/package/test_python_paho_mqtt.py    | 29 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_paho_mqtt.py
 create mode 100644 support/testing/tests/package/test_python_paho_mqtt.py

diff --git a/support/testing/tests/package/sample_python_paho_mqtt.py b/support/testing/tests/package/sample_python_paho_mqtt.py
new file mode 100644
index 0000000000..769ad6250f
--- /dev/null
+++ b/support/testing/tests/package/sample_python_paho_mqtt.py
@@ -0,0 +1,12 @@
+from paho.mqtt import publish, subscribe
+
+publish.single(
+        'buildroot/test',
+        payload="Hello, World!",
+        qos=2,
+        retain=True,
+        hostname="localhost",
+        port=1883)
+
+message = subscribe.simple('buildroot/test')
+print(message.payload.decode())
diff --git a/support/testing/tests/package/test_python_paho_mqtt.py b/support/testing/tests/package/test_python_paho_mqtt.py
new file mode 100644
index 0000000000..b1e2b8fb42
--- /dev/null
+++ b/support/testing/tests/package/test_python_paho_mqtt.py
@@ -0,0 +1,29 @@
+from tests.package.test_python import TestPythonPackageBase
+import os
+import time
+
+
+class TestPythonPahoMQTT(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_MOSQUITTO=y
+        BR2_PACKAGE_MOSQUITTO_BROKER=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PAHO_MQTT=y
+        """
+    sample_scripts = ["tests/package/sample_python_paho_mqtt.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        cmd = "mosquitto > /dev/null 2>&1 &"
+        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+
+        # Give some time for mosquitto broker to start up
+        time.sleep(1)
+
+        cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
+        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "Hello, World!")
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
