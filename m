Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADD7C55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 12:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A364A80E46;
	Sat,  1 Aug 2026 12:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhgwjjWXv-kP; Sat,  1 Aug 2026 12:48:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C547280E4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785588517;
	bh=4oJ4S0m9pbHsORxRqpI1imWzJ+3eVBiGCGOmWFVZ+Yo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lp2eoD+faP1BY84CrCMBDJGfxLSSEPl6kYC3tFec5qaIXdnAANUhzBQxGEiEg0ifD
	 7uK577/JkC9oevPvdj/LWyjdNLeYK5z8VfjnV0zRbDJAQbG3tCTJpA4LgChsTIfIT4
	 jsbiDWs5oIVGM9iXkMZZqjR3uqmf4Ex4vcEdjLXSRvf+YoML8AMvsSVsPAeW2/kcX/
	 Q24JyhKCAn5PJJiqpac0jdHZ/W7OAnIAuAX3PjnW1XJaX4uX6Y4U8QerPtZoGJ9oVP
	 5uu/8E7bXFFwI2TYHUKdFMoZ7gt69KY4FfJO/b+6kqzoZhWW8V9Q/EWyxAinFOa9mK
	 Q7BXuN2nfw1fA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C547280E4E;
	Sat,  1 Aug 2026 12:48:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F023EFE3
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D236A40830
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRFDjdzX0BFt for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 12:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C8940810
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03C8940810
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:48:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C30286FAD; Sat,  1 Aug 2026 12:47:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Aug 2026 14:02:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33608902b85f22e97aa7c5e08c9a62a48cee79fe
X-Git-Newrev: 43e87a583f0761ec12860a3f9a68df7e9a9c0e04
X-Patchwork-Hint: ignore
Message-Id: <20260801124749.4C30286FAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: php: new runtime test
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43e87a583f0761ec12860a3f9a68df7e9a9c0e04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_php.py          | 61 ++++++++++++++++++++++
 .../test_php/rootfs-overlay/etc/apache2/httpd.conf | 58 ++++++++++++++++++++
 .../test_php/rootfs-overlay/root/mandel.php        | 19 +++++++
 .../test_php/rootfs-overlay/usr/htdocs/script.php  |  1 +
 5 files changed, 141 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f2713c7239..b4ca50a10e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1991,6 +1991,8 @@ F:	support/testing/tests/package/test_patch.py
 F:	support/testing/tests/package/test_patch/
 F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
+F:	support/testing/tests/package/test_php.py
+F:	support/testing/tests/package/test_php/
 F:	support/testing/tests/package/test_pigz.py
 F:	support/testing/tests/package/test_postgresql.py
 F:	support/testing/tests/package/test_pppd.py
diff --git a/support/testing/tests/package/test_php.py b/support/testing/tests/package/test_php.py
new file mode 100644
index 0000000000..b328eaa3bb
--- /dev/null
+++ b/support/testing/tests/package/test_php.py
@@ -0,0 +1,61 @@
+import os
+
+import infra.basetest
+
+
+class TestPhp(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_php/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_APACHE=y
+        BR2_PACKAGE_LIBCURL=y
+        BR2_PACKAGE_LIBCURL_CURL=y
+        BR2_PACKAGE_PHP=y
+        BR2_PACKAGE_PHP_SAPI_APACHE=y
+        BR2_PACKAGE_PHP_SAPI_CLI=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check the php program can execute.
+        self.assertRunOk("php --version")
+
+        # We check can print a message from the command line.
+        msg = "Hello Buildroot!"
+        php_code = f"echo '{msg}' . PHP_EOL;"
+        cmd = f"php -r \"{php_code}\""
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We check we can exit with a specific code.
+        exit_code = 123
+        php_code = f"exit({exit_code});"
+        cmd = f"php -r \"{php_code}\""
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, exit_code)
+        self.assertEqual(len(out), 0)
+
+        # We check we can run a slightly more complex program.
+        self.assertRunOk("php mandel.php")
+
+        # We check the apache php module is also working.
+        # The php script reads the "message" POST variable,
+        # then write its content back in upper case.
+        cmd = "curl"
+        cmd += " -H 'Content-type: multipart/form-data'"
+        cmd += " -X POST"
+        cmd += f" -F message='{msg}'"
+        cmd += " http://127.0.0.1/script.php"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual("\n".join(out), msg.upper())
diff --git a/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf b/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
new file mode 100644
index 0000000000..109247514b
--- /dev/null
+++ b/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
@@ -0,0 +1,58 @@
+# This file is a minimal Apache config to run PHP scripts for tests.
+# It was essentially written from the default package config with:
+# - all the comments removed,
+# - unneeded modules and config sections removed,
+# - "ServerName localhost:80" added to remove startup warning,
+# - "AddType application/x-httpd-php .php" added to enable php.
+
+ServerRoot "/usr"
+Listen 80
+
+LoadModule authz_core_module modules/mod_authz_core.so
+LoadModule mime_module modules/mod_mime.so
+LoadModule log_config_module modules/mod_log_config.so
+LoadModule unixd_module modules/mod_unixd.so
+LoadModule php_module modules/libphp.so
+
+<IfModule unixd_module>
+User daemon
+Group daemon
+</IfModule>
+
+ServerAdmin you@example.com
+ServerName localhost:80
+
+<Directory />
+    AllowOverride none
+    Require all denied
+</Directory>
+
+DocumentRoot "/usr/htdocs"
+<Directory "/usr/htdocs">
+    Options Indexes FollowSymLinks
+    AllowOverride None
+    Require all granted
+</Directory>
+
+<Files ".ht*">
+    Require all denied
+</Files>
+
+ErrorLog "/var/logs/error_log"
+LogLevel warn
+
+<IfModule log_config_module>
+    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
+    LogFormat "%h %l %u %t \"%r\" %>s %b" common
+
+    <IfModule logio_module>
+      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
+    </IfModule>
+
+    CustomLog "/var/logs/access_log" common
+</IfModule>
+
+<IfModule mime_module>
+    TypesConfig /etc/apache2/mime.types
+    AddType application/x-httpd-php .php
+</IfModule>
diff --git a/support/testing/tests/package/test_php/rootfs-overlay/root/mandel.php b/support/testing/tests/package/test_php/rootfs-overlay/root/mandel.php
new file mode 100644
index 0000000000..a18e5c6838
--- /dev/null
+++ b/support/testing/tests/package/test_php/rootfs-overlay/root/mandel.php
@@ -0,0 +1,19 @@
+<?php
+$points = ",.:-;!/>)|&IH%*Z";
+for ($y = -15; $y <= 15; $y++) {
+  for ($x = 1; $x <= 84; $x++) {
+    $i = 0;
+    $r = 0;
+    for ($k = 0; $k <= 111; $k++) {
+      $j = ($r*$r) - ($i*$i) - 2 + ($x/25);
+      $i = 2 * $r * $i + ($y/10);
+      if (($j*$j + $i*$i) >= 11) {
+        break;
+      }
+      $r = $j;
+    }
+    echo $points[$k & 0xF];
+  }
+  echo PHP_EOL;
+}
+?>
diff --git a/support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php b/support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php
new file mode 100644
index 0000000000..8f8feaedbf
--- /dev/null
+++ b/support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php
@@ -0,0 +1 @@
+<?php echo strtoupper($_POST["message"]) . PHP_EOL; ?>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
