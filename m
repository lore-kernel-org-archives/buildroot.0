Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE67C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 10:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F159C80B03;
	Sun,  9 Aug 2026 10:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bmlz48JiZWhL; Sun,  9 Aug 2026 10:19:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB43780C0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786270769;
	bh=v7q7QNYUc4T3kZzVmLp5xsaligWdPe579o19ryFCp3U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ljoxC+Qrk25tRa2+9UwFBgFzjDmLU+49ndfMHq30YdngMIMa17I2WGQKR87diobwj
	 bNQ7ErK20hQotUt9HVH6RnZsN2lZIXkG4+4qhfdjlM5TZuBHwciObuzm6p8yj5V2/d
	 D03znYmTj4KNySEjICpO3dbQyYefmmVc6xaLa61H15xSH0vyRV9pFKIrJc7xBwhMJE
	 RDkjVvH6z7w5H5J2O9bgsJ2RMgwJbchQBgM6I1JNfopzVhshRzgVJuo/lmnIpQmzYH
	 KxgErWKwhNb+uOdLWGXY/1BhulCtNYJ0nG35c2PMlZfEKh86cqIE1uNTTtPNjeyka+
	 NIXdtQzytA2tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB43780C0F;
	Sun,  9 Aug 2026 10:19:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 476DB10E
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E21860644
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3V8LkyuBhZq for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 10:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 579B960602
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 579B960602
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:19:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E00638D20A; Sun,  9 Aug 2026 10:18:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 11:56:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d90bbf81f86acef07037ad59ed78e2809222e1d3
X-Git-Newrev: 4456d899d0481efe7e7994090d0b709dbba47f39
X-Patchwork-Hint: ignore
Message-Id: <20260809101837.E00638D20A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add runtime test for
 easydbus
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4456d899d0481efe7e7994090d0b709dbba47f39
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Test an actual D-Bus round-trip using easydbus:
 - obtain a name on the system bus
 - subscribe to a signal on a chosen object/interface
 - emit signal with a string payload
 - run the easydbus mainloop
 - verify the handler received the expected payload

This covers both the default Lua interpreter (Lua 5.4) and LuaJIT
(Lua 5.1 ABI).

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
[Julien:
 - move test files into a rootfs-overlay
 - move common BR2_PACKAGE_{,EASY}DBUS configs to EasyDBusBase
 - make stricter check of script output
 - add DEVELOPERS entry for rootfs-overlay files
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_easydbus.py     | 44 ++++++++++++++++++++++
 .../etc/dbus-1/system.d/easydbus.SampleTest.conf   |  8 ++++
 .../rootfs-overlay/root/easydbus-sample.lua        | 22 +++++++++++
 4 files changed, 76 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 353f4a2ccf..c462d41d75 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2290,6 +2290,8 @@ F:	support/testing/tests/package/sample_python_dbus_fast.py
 F:	support/testing/tests/package/sample_python_dbus_next.py
 F:	support/testing/tests/package/sample_python_pytest.py
 F:	support/testing/tests/package/sample_python_pytest_asyncio.py
+F:	support/testing/tests/package/test_easydbus.py
+F:	support/testing/tests/package/test_easydbus/
 F:	support/testing/tests/package/test_netdata.py
 F:	support/testing/tests/package/test_python_dbus_next.py
 F:	support/testing/tests/package/test_python_pytest.py
diff --git a/support/testing/tests/package/test_easydbus.py b/support/testing/tests/package/test_easydbus.py
new file mode 100644
index 0000000000..b628214eb7
--- /dev/null
+++ b/support/testing/tests/package/test_easydbus.py
@@ -0,0 +1,44 @@
+import infra.basetest
+
+from tests.package.test_lua import TestLuaBase
+
+
+class EasyDBusBase(TestLuaBase):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_easydbus/rootfs-overlay")
+    config = TestLuaBase.config + \
+        f"""
+        BR2_PACKAGE_DBUS=y
+        BR2_PACKAGE_EASYDBUS=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        """
+
+    def signal_round_trip(self):
+        cmd = "lua /root/easydbus-sample.lua"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "OK")
+
+
+class TestLuaEasyDBus(EasyDBusBase):
+    config = EasyDBusBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("easydbus")
+        self.signal_round_trip()
+
+
+class TestLuajitEasyDBus(EasyDBusBase):
+    config = EasyDBusBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("easydbus")
+        self.signal_round_trip()
diff --git a/support/testing/tests/package/test_easydbus/rootfs-overlay/etc/dbus-1/system.d/easydbus.SampleTest.conf b/support/testing/tests/package/test_easydbus/rootfs-overlay/etc/dbus-1/system.d/easydbus.SampleTest.conf
new file mode 100644
index 0000000000..0daaa9ff43
--- /dev/null
+++ b/support/testing/tests/package/test_easydbus/rootfs-overlay/etc/dbus-1/system.d/easydbus.SampleTest.conf
@@ -0,0 +1,8 @@
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+  <policy user="root">
+    <allow own="easydbus.SampleTest"/>
+    <allow send_destination="easydbus.SampleTest"/>
+  </policy>
+</busconfig>
diff --git a/support/testing/tests/package/test_easydbus/rootfs-overlay/root/easydbus-sample.lua b/support/testing/tests/package/test_easydbus/rootfs-overlay/root/easydbus-sample.lua
new file mode 100644
index 0000000000..e7afd210ba
--- /dev/null
+++ b/support/testing/tests/package/test_easydbus/rootfs-overlay/root/easydbus-sample.lua
@@ -0,0 +1,22 @@
+local dbus = require 'easydbus'
+
+local bus = assert(dbus.system())
+local service_name = 'easydbus.SampleTest'
+local object_path = '/easydbus/sample'
+local interface_name = 'easydbus.SampleTest'
+local signal_name = 'Pinged'
+
+local owner_id = assert(bus:own_name(service_name))
+
+local payload
+bus:subscribe(nil, object_path, interface_name, signal_name,
+              function(arg) payload = arg; dbus.mainloop_quit() end)
+assert(bus:emit(nil, object_path, interface_name, signal_name,
+                's', 'hello'))
+dbus.mainloop()
+
+bus:unown_name(owner_id)
+
+assert(payload == 'hello',
+       'unexpected payload: ' .. tostring(payload))
+print('OK')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
