Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF82606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ORMb094g
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6881C40AF5;
	Fri, 30 Oct 2026 14:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H377u79i26PJ; Fri, 30 Oct 2026 14:06:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6E39E40AFD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369160;
	b=XUgACDEL9ghzg5oaLB1UGXLGMDATi2wjz5EWohCPCOHyndz+T7CZkFIX2a/yQFKCe0Gh
	 LE4/7+B7Vpo3+LZSypBtPhvpO+xlffBrES71O2OCt+O6I7st78XjOgC2JFZjwz697dqZy
	 DUAETl8J4GMP0O5U1lcFwSp8sENnkhsb1K4v7xF/Ka604FYkytbJOQ3aXX2ApNkbkxTEp
	 uWOrtgnlkJYU5EMamJaD+6DGZJEWC8Ayxb5ApJYb7eIGi6LvtbN0DfgZpJqrI59m3uz6A
	 uegsiV3DprZ4z5uEExzeAaQ3qoOJaXQ2vNcAq6C5IKX8a8lJsFE/fuLbYZ4w7uJ3izg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yPRIqm1PpL+HUHnrH2ouoTrwhDhQffMsthb34xMOExY=;
	b=f8mocQdTNUcI0uYc7Yqjsj8QiU7Achuz3JJAqUKGWUDsSOeUGU5bB6MkxLwypQecaIss
	 +na925OeY5bLOx7+yGBP4T3TrWHsudQiD1Vq+hH9joh/9pOg3aouBp8n/XE2SPe5b3Ent
	 2znsRJER2wasVKajUPDVLbA1LtXMW2DeuWSI0ED/TkyiEpbn+bxWUqzyMuzvIoaJtO4ju
	 +zJgEWwei/PmXc9S3NXq7D72vlSBVhpbRf147F4Lwnpgznb2SfA3WEw0E2WARzcDnho+S
	 H1PXSuLlbsDBpGGTKUu31NSqnrTBOZJ4SJiFDecQFL9oKtLpdqrIFixkol10JRvMl9g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369160;
	bh=yPRIqm1PpL+HUHnrH2ouoTrwhDhQffMsthb34xMOExY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ORMb094gkaYfA/B6qxyIkR5CnXOe82+hSl30DQb4jlHICrbxmTFy2zx5aC/SoZNOz
	 SZVxX/ygIrubRD7PynISeO4ZYPdMckcb95OTIDShiJu3LxKk6xrLMf8I+CKS89E3Od
	 P+jUV+cI9ppJ2TMO4QQgTrX2DOn08dPd3dGh7RvniSYM1O6r2SstGRW/QuOHgN76te
	 c4K3JAYO4SRbA+MyPNpTPxqf9lsgrXkRWbO3gVKcpg6PX6nhefP30DRg/+mEddo/t5
	 8Cfy7ZrD1xxqTSeIoae9Hah5Zd5FKqPLsCud/M4mYhYjm8hkmBxW5NHuLcYO+Jdlpl
	 nF16xCRtFdcpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E39E40AFD;
	Fri, 30 Oct 2026 14:06:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A99D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA74481185
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AprkyW-Xajin for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7CBD281136
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369155;
 b=lVs9aHEx0YAV+PphBbuQmYCJnSeOVPOqa5nGghG45gtAOTt9oOtgyOzcbnpl1vnh8+lB
 qo6WhHfkGVVQm1sdyYZUIlmjTC3dT5CuG+z+A8DXAozpQywqlBMNemBtRh6HjcpHaSB/E
 kYqeOWrJmrfOzEl9bXGtquU1iAtEVD56U0MQSg81FxlY/vp3f9Z2mOpm806u7V36pCT7d
 bI6E1qisomGZX98aO9c5U8WX/i4i3Tl3we3FoiItRHUNLqaKwV+FOwcmzHlBAyexB+qxF
 MKxor+d8xZR8xI1jzcRmV6zjrJKE+qaepeSJTiGzo5tkBwM+WRpGrylJT3UOX8B+Vaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369155;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=X5bCG2xP/Xyq3xXnOEqHVxq791wesmSt4NLv9eSW28I=;
 b=bxhtBcrG0KJgvtLyx/D2YH+WldY20UpAvF3Mvsf81NLSqtN6CQfXpM88+lsBnvNeAkKv
 5ubShhqasG1UUNC1/ty3EYhIfVsWx9l/GKdXIwGnVueM+VOelDUwWk4yVm2ymQK9v/emv
 goCosYBoPfqtB9MviFzb/23U6D0YLMoZsCG2vlptn1/tD3xSPGfSRidE2CuvM9iNhh7NQ
 Xw31MqATZbwm6a+oGTVvOoZpIx0MgfpYrtuTKRzGWnBuEP2gPspifYWeRnfE+iGOk6bLj
 4w4jO/BHgrBVw8BE7WuD33vECWaYO5uUm2/YQ20F3jZhSuvLvsarroitthGZpI6aKBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CBD281136
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88C799D388; Fri, 30 Oct 2026 14:04:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 15:12:09 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0a9b75673ad0bd68d913cdfcb55676a44e448159
X-Git-Newrev: 9331eb7b5b3f62435b25704fddf5745577152992
X-Patchwork-Hint: ignore
Message-Id: <20261030140427.88C799D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: add
 runtime test for easydbus
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9331eb7b5b3f62435b25704fddf5745577152992
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 4456d899d0481efe7e7994090d0b709dbba47f39)
[thomas: only test on lua 5.3]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_easydbus.py     | 45 ++++++++++++++++++++++
 .../etc/dbus-1/system.d/easydbus.SampleTest.conf   |  8 ++++
 .../rootfs-overlay/root/easydbus-sample.lua        | 22 +++++++++++
 4 files changed, 77 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e769cab975..d4b70e0523 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2209,6 +2209,8 @@ F:	support/testing/tests/package/sample_python_dbus_fast.py
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
index 0000000000..3ad71e6a03
--- /dev/null
+++ b/support/testing/tests/package/test_easydbus.py
@@ -0,0 +1,45 @@
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
+        BR2_PACKAGE_LUA_5_3=y
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
