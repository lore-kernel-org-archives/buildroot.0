Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF7DC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C31F680C33;
	Mon, 20 Feb 2023 23:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C31F680C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iwqc917Mwtl2; Mon, 20 Feb 2023 23:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABA79835E4;
	Mon, 20 Feb 2023 23:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABA79835E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02E1B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51C5E41723
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51C5E41723
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaUBNBEzDd_r for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32ECD41717
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32ECD41717
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 235EF86496; Mon, 20 Feb 2023 20:52:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 2 Jan 2023 22:33:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: acaae6c39bd046a4a2a6250e7c167d77fb24f1f0
X-Git-Newrev: 82522d25476fee95fe242a38c989280035a460c5
X-Patchwork-Hint: ignore
Message-Id: <20230220205222.235EF86496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dbus-fast: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=82522d25476fee95fe242a38c989280035a460c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr:
  - select host-cython in Config.in
  - introduce obj_path in test sample
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  1 +
 package/python-dbus-fast/Config.in                 | 10 +++++
 package/python-dbus-fast/python-dbus-fast.hash     |  5 +++
 package/python-dbus-fast/python-dbus-fast.mk       | 16 ++++++++
 .../tests/package/sample_python_dbus_fast.py       | 45 ++++++++++++++++++++++
 .../testing/tests/package/test_python_dbus_fast.py | 40 +++++++++++++++++++
 7 files changed, 119 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3217823b6f..8399dcc7af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1877,6 +1877,7 @@ F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/python-ansicolors/
 F:	package/python-bleak/
+F:	package/python-dbus-fast/
 F:	package/python-dbus-next/
 F:	package/python-iniconfig/
 F:	package/python-intelhex/
@@ -1888,6 +1889,7 @@ F:	package/python-typing-extensions/
 F:	package/python-xmodem/
 F:	package/rs485conf/
 F:	package/turbolua/
+F:	support/testing/tests/package/sample_python_dbus_fast.py
 F:	support/testing/tests/package/sample_python_dbus_next.py
 F:	support/testing/tests/package/sample_python_pytest.py
 F:	support/testing/tests/package/sample_python_pytest_asyncio.py
diff --git a/package/Config.in b/package/Config.in
index 41e15ca77f..995dae2c57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1022,6 +1022,7 @@ menu "External python modules"
 	source "package/python-daphne/Config.in"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
+	source "package/python-dbus-fast/Config.in"
 	source "package/python-dbus-next/Config.in"
 	source "package/python-decorator/Config.in"
 	source "package/python-defusedxml/Config.in"
diff --git a/package/python-dbus-fast/Config.in b/package/python-dbus-fast/Config.in
new file mode 100644
index 0000000000..c9562fecfa
--- /dev/null
+++ b/package/python-dbus-fast/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_DBUS_FAST
+	bool "python-dbus-fast"
+	select BR2_PACKAGE_HOST_PYTHON_CYTHON
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
index 0000000000..de7049ba22
--- /dev/null
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -0,0 +1,16 @@
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
+PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
+PYTHON_DBUS_FAST_DEPENDENCIES = host-python-cython
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_dbus_fast.py b/support/testing/tests/package/sample_python_dbus_fast.py
new file mode 100644
index 0000000000..4157bccfcf
--- /dev/null
+++ b/support/testing/tests/package/sample_python_dbus_fast.py
@@ -0,0 +1,45 @@
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
+    obj_path = '/test/path'
+
+    bus = await MessageBus(bus_type=BusType.SYSTEM).connect()
+    bus2 = await MessageBus(bus_type=BusType.SYSTEM).connect()
+
+    await bus.request_name(bus_name)
+
+    service_interface = SampleInterface()
+    bus.export(obj_path, service_interface)
+
+    introspection = await bus2.introspect(bus_name, obj_path)
+    assert type(introspection) is intr.Node
+    obj = bus2.get_proxy_object(bus_name, obj_path, introspection)
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
