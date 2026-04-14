Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6C3F9D0F1
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 21:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BD48807A6;
	Tue, 14 Apr 2026 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4J4_i8eLiUyM; Tue, 14 Apr 2026 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1924A807AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776200411;
	bh=eWscBG75VQdjVgOaulCOxtaDQL5fDgKREXa53IJNKsY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oaqijV4+GUD6pg791HAFYXH+oDsZtS7BF9jDTTxNtEwsGWLApQNpUEpm6DGUa16Cy
	 63vaGoDEm8jpLXPjRP5pfZxwKGLPBoaq7BZqddwe8OgJDpWenc3Fw8kzZdTF2YhcOV
	 CO6Lhc2yq/gsixd22ru0gulpJXh+9okClnEUGikKU/2awKUajKKg5CFmlzqyPY3QmZ
	 KrbiivJQci2mIKmHYCzODU7jVU4olvnFctR2ZqlPcRdMwYGSgLBNJawx8rRB7JoFJa
	 QOXLkEaa05FtTjmSJemu7BN68NIQpKt95IHkCPpkzlnOQTa3p2NZ7C7xUfJmQh93h9
	 2BT2PwJgifsOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1924A807AD;
	Tue, 14 Apr 2026 21:00:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48ACE375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 21:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EAED42527
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 21:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNvuwHiL-EJi for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 21:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 007DE404AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 007DE404AF
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 21:00:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82FEC815E8; Tue, 14 Apr 2026 21:00:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 22:40:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 374e31947a2961f7563d83cfab10c5af2e660c11
X-Git-Newrev: f3d0050e3d044ee5e83f3a8df38806f4df9ebbb1
X-Patchwork-Hint: ignore
Message-Id: <20260414210007.82FEC815E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-transitions: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f3d0050e3d044ee5e83f3a8df38806f4df9ebbb1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Lightweight finite state machine implementation in Python.

https://github.com/pytransitions/transitions

Signed-off-by: Vincent Cruz <mooz@blockos.org>
[Julien:
 - remove directory for LICENSE in hash file
 - remove PKG-INFO entry in hash file
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 package/python-transitions/Config.in               |  7 +++++
 package/python-transitions/python-transitions.hash |  4 +++
 package/python-transitions/python-transitions.mk   | 15 ++++++++++
 .../tests/package/sample_python_transitions.py     | 34 ++++++++++++++++++++++
 .../tests/package/test_python_transitions.py       | 29 ++++++++++++++++++
 7 files changed, 93 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ad64e876e..b20cf7d93c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3361,6 +3361,9 @@ F:	package/rtl8822cs/
 N:	Victor Huesca <victor.huesca@bootlin.com>
 F:	support/testing/tests/core/test_root_password.py
 
+N:	Vincent Cruz <mooz@blockos.org>
+F:	package/python-transitions/
+
 N:	Vincent Jardin <vjardin@free.fr>
 F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
diff --git a/package/Config.in b/package/Config.in
index bd2e06dc0b..d0f148699b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1463,6 +1463,7 @@ menu "External python modules"
 	source "package/python-tqdm/Config.in"
 	source "package/python-trafaret/Config.in"
 	source "package/python-traitlets/Config.in"
+	source "package/python-transitions/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-trio/Config.in"
 	source "package/python-trio-websocket/Config.in"
diff --git a/package/python-transitions/Config.in b/package/python-transitions/Config.in
new file mode 100644
index 0000000000..4289b446f5
--- /dev/null
+++ b/package/python-transitions/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TRANSITIONS
+	bool "python-transitions"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Lightweight finite state machine implementation in Python.
+
+	  https://github.com/pytransitions/transitions
diff --git a/package/python-transitions/python-transitions.hash b/package/python-transitions/python-transitions.hash
new file mode 100644
index 0000000000..9d0057c793
--- /dev/null
+++ b/package/python-transitions/python-transitions.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/pypi/transitions/0.9.3/json
+sha256  881fb75bb1654ed55d86060bb067f2c716f8e155f57bb73fd444e53713aafec8  transitions-0.9.3.tar.gz
+# Locally computed
+sha256  fd7115fc5517d1d2d042a80a33d92033532236830a9c25866112299fe33c036b  LICENSE
diff --git a/package/python-transitions/python-transitions.mk b/package/python-transitions/python-transitions.mk
new file mode 100644
index 0000000000..8189cebcbd
--- /dev/null
+++ b/package/python-transitions/python-transitions.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-transitions
+#
+################################################################################
+
+PYTHON_TRANSITIONS_VERSION = 0.9.3
+PYTHON_TRANSITIONS_SOURCE = transitions-$(PYTHON_TRANSITIONS_VERSION).tar.gz
+PYTHON_TRANSITIONS_SITE = https://files.pythonhosted.org/packages/source/t/transitions
+PYTHON_TRANSITIONS_SETUP_TYPE = setuptools
+
+PYTHON_TRANSITIONS_LICENSE = MIT
+PYTHON_TRANSITIONS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_transitions.py b/support/testing/tests/package/sample_python_transitions.py
new file mode 100644
index 0000000000..ca33309998
--- /dev/null
+++ b/support/testing/tests/package/sample_python_transitions.py
@@ -0,0 +1,34 @@
+# test from https://github.com/pytransitions/transitions/blob/master/tests/test_nesting.py
+
+from transitions.extensions import HierarchicalMachine as Machine
+
+states = ['standing', 'walking', {'name': 'caffeinated', 'children': ['dithering', 'running']}]
+transitions = [
+  ['walk', 'standing', 'walking'],
+  ['stop', 'walking', 'standing'],
+  ['drink', 'caffeinated_dithering', '='],
+  ['drink', 'caffeinated', 'caffeinated_dithering'],
+  ['drink', '*', 'caffeinated'],
+  ['walk', 'caffeinated', 'caffeinated_running'],
+  ['relax', 'caffeinated', 'standing']
+]
+
+machine = Machine(states=states, transitions=transitions, initial='standing', ignore_invalid_triggers=True)
+
+machine.walk()   # Walking now
+machine.stop()   # let's stop for a moment
+machine.drink()  # coffee time
+machine.state
+print(machine.state)
+machine.drink()  # again!
+print(machine.state)
+machine.drink()  # and again!
+print(machine.state)
+machine.walk()   # we have to go faster
+print(machine.state)
+machine.stop()   # can't stop moving!
+machine.state
+print(machine.state)
+machine.relax()  # leave nested state
+machine.state    # phew, what a ride
+print(machine.state)
diff --git a/support/testing/tests/package/test_python_transitions.py b/support/testing/tests/package/test_python_transitions.py
new file mode 100644
index 0000000000..ae64284720
--- /dev/null
+++ b/support/testing/tests/package/test_python_transitions.py
@@ -0,0 +1,29 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonTransitions(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_TRANSITIONS=y
+        """
+    sample_scripts = ["tests/package/sample_python_transitions.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+
+        cmd = self.interpreter + " " + os.path.basename(self.sample_scripts[0])
+        output, exit_code = self.emulator.run(cmd, timeout=15)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output, [
+            'caffeinated',
+            'caffeinated_dithering',
+            'caffeinated_dithering',
+            'caffeinated_running',
+            'caffeinated_running',
+            'standing'
+        ])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
