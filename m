Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16878C61DCD
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22DCA60826;
	Thu, 27 Aug 2026 21:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAlXaaS2Ub_G; Thu, 27 Aug 2026 21:08:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787864932;
	bh=uMocxctIKFvEYgL9wLO4SLFMDRAjvs7F+ohBbyPjNvc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RwmbGT2CXB2H+6zwukH4Zw9f4TrTHjBjPIdjfysrD1ApTXIWjIX2Yma3vH9ZAQ3LA
	 6lmsbPpHdAlH+RqpA4W6UERTkJncHFdVaKtGaBjbelvxKrcImsPriWKV0a2rxPDxtD
	 CU1Ej9U3Pmn3607zBUHrU2t27E6i0ttarObvwJYceuBo/bAwPG+5zR+ga/FSwiX4aA
	 7NqX2v/Us+Ak9yFRzR4s2CxjUG8tb0WuVID0oVa+8d43lBbqYdxshul4IueAzPv6IL
	 633NtUsq6jZwemP+JWBcQWtcQLPDe4m7JjfEYhXBA6CU8puB19AW8Ato/vqQsj/zeT
	 ATje5j7ZsiRTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B9516083B;
	Thu, 27 Aug 2026 21:08:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0155D28
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF5C860808
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiCaL0VLBwWu for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31A53607EC
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87A1D920D9; Thu, 27 Aug 2026 21:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 23:01:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94aa7f40b5b132b255314f6402d4c2bf50928c75
X-Git-Newrev: 211cfafa166d75a30a08b2a050a356a222c3a831
X-Patchwork-Hint: ignore
Message-Id: <20260827210749.87A1D920D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add haproxy test
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/211cfafa166d75a30a08b2a050a356a222c3a831
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Based on the lighttpd test case.  Verify that we can download index.html
from haproxy in front of lighttpd.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 support/testing/conf/haproxy.cfg              | 13 +++++++++
 support/testing/tests/package/test_haproxy.py | 38 +++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5e5f112783..49a72bb69a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2721,6 +2721,7 @@ F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
 F:	support/testing/tests/package/test_agec.py
 F:	support/testing/tests/package/test_docker_compose.py
+F:	support/testing/tests/package/test_haproxy.py
 F:	support/testing/tests/package/test_python_hid.py
 
 N:	Peter Seiderer <ps.report@gmx.net>
diff --git a/support/testing/conf/haproxy.cfg b/support/testing/conf/haproxy.cfg
new file mode 100644
index 0000000000..41e983ea97
--- /dev/null
+++ b/support/testing/conf/haproxy.cfg
@@ -0,0 +1,13 @@
+defaults
+    timeout connect 10s
+    timeout client 30s
+    timeout server 30s
+
+frontend myfrontend
+  mode http
+  bind :81
+  default_backend web_servers
+
+backend web_servers
+  mode http
+  server s1 localhost:80 check
diff --git a/support/testing/tests/package/test_haproxy.py b/support/testing/tests/package/test_haproxy.py
new file mode 100644
index 0000000000..6fba0c3809
--- /dev/null
+++ b/support/testing/tests/package/test_haproxy.py
@@ -0,0 +1,38 @@
+import os
+
+import infra.basetest
+
+
+class TestHaproxy(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
+        BR2_PACKAGE_HAPROXY=y
+        BR2_PACKAGE_LIGHTTPD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            infra.filepath("tests/package/copy-sample-script-to-target.sh"),
+            infra.filepath("conf/haproxy.cfg")
+        )
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        msg = "Hello Buildroot!"
+
+        # sanity check
+        self.assertRunOk("haproxy -v")
+        self.assertRunOk("haproxy -c -f .")
+
+        # proxy to lighttpd
+        self.assertRunOk("haproxy -D -f .")
+
+        self.assertRunOk(f"echo '{msg}' > /var/www/index.html")
+        self.assertRunOk("wget http://localhost:81/index.html")
+        self.assertRunOk(f"grep -F '{msg}' index.html")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
