Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F295CC77B7F
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 12:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B17E60E7B;
	Sat, 28 Jun 2025 12:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrKO9mQ87Z5r; Sat, 28 Jun 2025 12:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 750E860E8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 750E860E8B;
	Sat, 28 Jun 2025 12:21:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 967881C9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 12:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74AB1400B8
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 12:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1no2oKClHzym for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 12:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AECD5400A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AECD5400A7
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 12:21:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B9D684717; Sat, 28 Jun 2025 12:21:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 14:11:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 430aa91c3d913aa14dba78713e7960c27806c1cd
X-Git-Newrev: 5cda85cb566bfcd9d7a6c5bd701d326a47cb725b
X-Patchwork-Hint: ignore
Message-Id: <20250628122112.9B9D684717@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add new test for
 nginx-modsecurity
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
Content-Type: multipart/mixed; boundary="===============6472703447085587408=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6472703447085587408==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5cda85cb566bfcd9d7a6c5bd701d326a47cb725b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test verifies that we can run nginx with the modsecurity
directives.
It also checks a very simple rule that blocks requests containing the
keyword "blockme".

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
[Julien:
 - add / at directory end in DEVELOPERS
 - sort DEVELOPERS entries alphabetically
 - remove unneeded test configs already present in
   BASIC_TOOLCHAIN_CONFIG
 - sort test config directives alphabetically
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 ++
 .../tests/package/test_nginx_modsecurity.py        | 33 ++++++++++++++++++++++
 .../overlay/etc/nginx/modsecurity-rules.conf       |  7 +++++
 .../overlay/etc/nginx/nginx.conf                   | 15 ++++++++++
 4 files changed, 57 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0ba2f7a4cd..e6285ab35d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2848,6 +2848,8 @@ F:	support/testing/tests/package/sample_python_s3transfer.py
 F:	support/testing/tests/package/sample_python_sdbus.py
 F:	support/testing/tests/package/sample_python_sdbus_networkmanager.py
 F:	support/testing/tests/package/sample_python_urllib3.py
+F:	support/testing/tests/package/test_nginx_modsecurity/
+F:	support/testing/tests/package/test_nginx_modsecurity.py
 F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_pymupdf.py
 F:	support/testing/tests/package/test_python_rsa.py
diff --git a/support/testing/tests/package/test_nginx_modsecurity.py b/support/testing/tests/package/test_nginx_modsecurity.py
new file mode 100644
index 0000000000..3903d46bcc
--- /dev/null
+++ b/support/testing/tests/package/test_nginx_modsecurity.py
@@ -0,0 +1,33 @@
+import os
+
+import infra.basetest
+
+
+class TestNginxModsecurity(infra.basetest.BRTest):
+    overlay = infra.filepath("tests/package/test_nginx_modsecurity/overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_NGINX=y
+        BR2_PACKAGE_NGINX_HTTP=y
+        BR2_PACKAGE_NGINX_MODSECURITY=y
+        BR2_ROOTFS_OVERLAY="{overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.assertRunOk("nginx -V")
+        self.assertRunOk("wget http://localhost/index.html")
+        self.assertRunOk("grep -F 'Welcome to nginx!' index.html")
+        cmd = "wget -q -O /dev/null --server-response 2>&1 " \
+            "http://localhost/blockme/ 2>&1 | awk '/^  HTTP/{print $2}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        # Check for HTTP 403 Unauthorized:
+        self.assertEqual(out[0], "403")
diff --git a/support/testing/tests/package/test_nginx_modsecurity/overlay/etc/nginx/modsecurity-rules.conf b/support/testing/tests/package/test_nginx_modsecurity/overlay/etc/nginx/modsecurity-rules.conf
new file mode 100644
index 0000000000..94a132a9c7
--- /dev/null
+++ b/support/testing/tests/package/test_nginx_modsecurity/overlay/etc/nginx/modsecurity-rules.conf
@@ -0,0 +1,7 @@
+SecRuleEngine On
+SecRule REQUEST_URI "@contains blockme" \
+    "id:100001, \
+    phase:2, \
+    deny, \
+    status:403, \
+    msg:'Blocked request with forbidden keyword in URI.'"
diff --git a/support/testing/tests/package/test_nginx_modsecurity/overlay/etc/nginx/nginx.conf b/support/testing/tests/package/test_nginx_modsecurity/overlay/etc/nginx/nginx.conf
new file mode 100644
index 0000000000..3d1b990557
--- /dev/null
+++ b/support/testing/tests/package/test_nginx_modsecurity/overlay/etc/nginx/nginx.conf
@@ -0,0 +1,15 @@
+events {
+    worker_connections 1024;
+}
+
+http {
+    server {
+        modsecurity on;
+        listen 80;
+        location / {
+            root   html;
+            index  index.html index.htm;
+            modsecurity_rules_file /etc/nginx/modsecurity-rules.conf;
+        }
+    }
+}

--===============6472703447085587408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6472703447085587408==--
