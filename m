Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF681C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 01:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B3F060E6B;
	Thu,  3 Nov 2022 01:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B3F060E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VWafN9hhrV2; Thu,  3 Nov 2022 01:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E26360B70;
	Thu,  3 Nov 2022 01:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E26360B70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6DCE1BF337
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 01:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A65400D0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 01:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82A65400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bivYLBAPCx4J for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 01:47:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 376D440168
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 376D440168
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 01:47:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (27)
Received: from zm.lan (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id B3D151BC1BC;
 Thu,  3 Nov 2022 02:42:15 +0100 (CET)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 02:41:55 +0100
Message-Id: <20221103014156.791695-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-dbus-fast: new package
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 package/python-dbus-fast/Config.in            |  9 ++++
 .../python-dbus-fast/python-dbus-fast.hash    |  5 +++
 package/python-dbus-fast/python-dbus-fast.mk  | 14 ++++++
 .../tests/package/sample_python_dbus_fast.py  | 44 +++++++++++++++++++
 .../tests/package/test_python_dbus_fast.py    | 40 +++++++++++++++++
 7 files changed, 115 insertions(+)
 create mode 100644 package/python-dbus-fast/Config.in
 create mode 100644 package/python-dbus-fast/python-dbus-fast.hash
 create mode 100644 package/python-dbus-fast/python-dbus-fast.mk
 create mode 100644 support/testing/tests/package/sample_python_dbus_fast.py
 create mode 100644 support/testing/tests/package/test_python_dbus_fast.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d27936992..6d670ae21a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1881,6 +1881,7 @@ F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/python-ansicolors/
 F:	package/python-bleak/
+F:	package/python-dbus-fast/
 F:	package/python-dbus-next/
 F:	package/python-iniconfig/
 F:	package/python-intelhex/
@@ -1892,6 +1893,7 @@ F:	package/python-typing-extensions/
 F:	package/python-xmodem/
 F:	package/rs485conf/
 F:	package/turbolua/
+F:	support/testing/tests/package/sample_python_dbus_fast.py
 F:	support/testing/tests/package/sample_python_dbus_next.py
 F:	support/testing/tests/package/sample_python_pytest.py
 F:	support/testing/tests/package/sample_python_pytest_asyncio.py
diff --git a/package/Config.in b/package/Config.in
index 238d7813f0..db9e94f357 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1015,6 +1015,7 @@ menu "External python modules"
 	source "package/python-daphne/Config.in"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
+	source "package/python-dbus-fast/Config.in"
 	source "package/python-dbus-next/Config.in"
 	source "package/python-decorator/Config.in"
 	source "package/python-defusedxml/Config.in"
diff --git a/package/python-dbus-fast/Config.in b/package/python-dbus-fast/Config.in
new file mode 100644
index 0000000000..2665bd1964
--- /dev/null
+++ b/package/python-dbus-fast/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_DBUS_FAST
+	bool "python-dbus-fast"
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
+	help
+	  A faster version of dbus-next, a DBus library for Python with
+	  asyncio support.
+
+	  https://github.com/bluetooth-devices/dbus-fast
diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
new file mode 100644
index 0000000000..f0dceeb43d
--- /dev/null
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dbus-fast/json
+md5  eebf2c558dd1af0f8f32b361e91f2fa3  dbus_fast-1.61.1.tar.gz
+sha256  bda4a7d559047b74f409eda278f68f610a418e86ad3efa0368fa2ed240daa6b6  dbus_fast-1.61.1.tar.gz
+# Locally computed sha256 checksums
+sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
new file mode 100644
index 0000000000..74a02eb5b9
--- /dev/null
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-dbus-fast
+#
+################################################################################
+
+PYTHON_DBUS_FAST_VERSION = 1.61.1
+PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/dd/f4/a280d46b119d59f6a3d84abf474452ae76651558b0963ab8c48ae13b5a44
+PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
+PYTHON_DBUS_FAST_LICENSE = MIT
+PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_dbus_fast.py b/support/testing/tests/package/sample_python_dbus_fast.py
new file mode 100644
index 0000000000..c2855464a1
--- /dev/null
+++ b/support/testing/tests/package/sample_python_dbus_fast.py
@@ -0,0 +1,44 @@
+import asyncio
+from dbus_fast.aio import MessageBus
+from dbus_fast.service import ServiceInterface, method
+import dbus_fast.introspection as intr
+from dbus_fast import BusType
+
+
+class SampleInterface(ServiceInterface):
+    def __init__(self):
+        super().__init__('test.interface')
+
+    @method()
+    def Ping(self):
+        pass
+
+    @method()
+    def ConcatStrings(self, what1: 's', what2: 's') -> 's':  # noqa: F821
+        return what1 + what2
+
+
+async def main():
+    bus_name = 'dbus.fast.sample'
+
+    bus = await MessageBus(bus_type=BusType.SYSTEM).connect()
+    bus2 = await MessageBus(bus_type=BusType.SYSTEM).connect()
+
+    await bus.request_name(bus_name)
+
+    service_interface = SampleInterface()
+    bus.export('/test/path', service_interface)
+
+    introspection = await bus2.introspect(bus_name, '/test/path')
+    assert type(introspection) is intr.Node
+    obj = bus2.get_proxy_object(bus_name, '/test/path', introspection)
+    interface = obj.get_interface(service_interface.name)
+
+    result = await interface.call_ping()
+    assert result is None
+
+    result = await interface.call_concat_strings('hello ', 'world')
+    assert result == 'hello world'
+
+
+asyncio.run(main())
diff --git a/support/testing/tests/package/test_python_dbus_fast.py b/support/testing/tests/package/test_python_dbus_fast.py
new file mode 100644
index 0000000000..5f67cfd8cc
--- /dev/null
+++ b/support/testing/tests/package/test_python_dbus_fast.py
@@ -0,0 +1,40 @@
+import textwrap
+
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3DBusFast(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_DBUS=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DBUS_FAST=y
+        """
+    sample_scripts = ["tests/package/sample_python_dbus_fast.py"]
+
+    def run_sample_scripts(self):
+        config = \
+            """
+            <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+             "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+            <busconfig>
+              <policy user="root">
+                <allow own="dbus.fast.sample"/>
+                <allow send_destination="dbus.fast.sample"/>
+              </policy>
+            </busconfig>
+            """
+        config = textwrap.dedent(config)
+        config_dir = "/etc/dbus-1/system.d"
+        config_fn = "dbus.fast.sample.conf"
+
+        # Setup and reload D-Bus configuration
+        self.emulator.run("mkdir -p " + config_dir)
+        self.emulator.run("cat > " + config_dir + "/" + config_fn +
+                          " <<EOF" + config + "EOF")
+        self.emulator.run("killall -SIGHUP dbus-daemon")
+
+        # Run test scripts
+        super().run_sample_scripts()
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
