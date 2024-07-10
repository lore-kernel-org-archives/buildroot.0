Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE62C3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 08:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8C5A6072A;
	Wed, 10 Jul 2024 08:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfRCdZNWHonE; Wed, 10 Jul 2024 08:49:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B390A60880
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B390A60880;
	Wed, 10 Jul 2024 08:49:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D7F41BF5AD
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8556D80EF9
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vyWm3Fcv0veW for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 08:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B183480E9C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B183480E9C
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 08:49:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F62084607; Wed, 10 Jul 2024 08:49:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 10:49:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e74059b39ce2f8511bc57c3f829681bf919b4e55
X-Git-Newrev: 083de00fdfb8587b6c6fbcf40e5c25a1e23d3baa
X-Patchwork-Hint: ignore
Message-Id: <20240710084949.6F62084607@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-paho-mqtt: bump version to
 2.1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=083de00fdfb8587b6c6fbcf40e5c25a1e23d3baa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.1.0 is a major bump, with an API change that should be
backward compatible with version up to 1.6.1.

The runtime test failed in timeout because the crng init did not have
time to complete in the default 5-second timeout; tests showed that the
trip-off would be between 6s and 7s here, so increase it enough to leave
some margin on less-capable machines.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Davide Viti <zinosat@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-paho-mqtt/python-paho-mqtt.hash         | 2 +-
 package/python-paho-mqtt/python-paho-mqtt.mk           | 5 +++--
 support/testing/tests/package/test_python_paho_mqtt.py | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
index 81b9dda81d..5fe91c5c54 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.hash
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  6e35c1be242a901fc9c00bad7d37b5cc4a497f398dfceb4ed0d8018a959be650  python-paho-mqtt-1.6.1.tar.gz
+sha256  3602ce9d1ada58b063f2052ff013ff8cdd06d66cef918d5f6d048b6f68ccf049  python-paho-mqtt-2.1.0.tar.gz
 sha256  66408b049249c3bdb0ba1ed285f5422ce67e371d40151bebd4d806af454ffe7c  LICENSE.txt
 sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
 sha256  8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  epl-v20
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index f255a7847d..095d6e1f90 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PAHO_MQTT_VERSION = 1.6.1
+PYTHON_PAHO_MQTT_VERSION = 2.1.0
 PYTHON_PAHO_MQTT_SITE = $(call github,eclipse,paho.mqtt.python,v$(PYTHON_PAHO_MQTT_VERSION))
 PYTHON_PAHO_MQTT_LICENSE = EPL-2.0, EDLv1.0
 PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
+PYTHON_PAHO_MQTT_SETUP_TYPE = pep517
+PYTHON_PAHO_MQTT_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
diff --git a/support/testing/tests/package/test_python_paho_mqtt.py b/support/testing/tests/package/test_python_paho_mqtt.py
index 0fe7fa5904..217293e4ee 100644
--- a/support/testing/tests/package/test_python_paho_mqtt.py
+++ b/support/testing/tests/package/test_python_paho_mqtt.py
@@ -18,6 +18,7 @@ class TestPythonPahoMQTT(TestPythonPackageBase):
         self.check_sample_scripts_exist()
 
         cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
-        output, exit_code = self.emulator.run(cmd)
+        # Increase timeout to let the crng init complete
+        output, exit_code = self.emulator.run(cmd, timeout=15)
         self.assertEqual(exit_code, 0)
         self.assertEqual(output[0], "Hello, World!")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
