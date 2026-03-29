Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966A6F3D611
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 17:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB3CF812BE;
	Sun, 29 Mar 2026 17:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KToBCsDaEKm; Sun, 29 Mar 2026 17:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 193F48128A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774807149;
	bh=perub5oYaCxHNKIRSWDPyuWO7k523ONoeJW7gB+PZ0w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V/dzQdMsiJX3R2mQFCPrEE04qsEh/OIi4zUWlPjCOtX1oNZyzHXH8ZnzwB8q+RoyT
	 DEbdmpg/Xeg3Givy6EKa3llnNQz2WpuVeke5IflQJULmbT8ayFQuI9z8naas81fUsy
	 6i8Vn5gdeisaHIdLegg69bQhMv82pI+OEehPNamgcAGgnErs+bLjI8dG12QAhxFu9m
	 S1OOCbkQF0PIdao7HiBPOMtfOX6zDzIqRkioSaCszT4KZgmZ6/K+Bd8VY5/J9dbtnt
	 Z53XCTIAz8UblOjKwrKcf4aPyztFVcQRmtAdpwVbj5FfOUo1uK9YJZAdjrfjKERafj
	 Puq/I73/+hV0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 193F48128A;
	Sun, 29 Mar 2026 17:59:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9189C10F
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 17:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 836B84024F
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 17:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-eE7jPnn3lI for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 17:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 808AA40109
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 808AA40109
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 17:59:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF6087FD11; Sun, 29 Mar 2026 17:59:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Mar 2026 19:21:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b647b0c95d823a294ac5da6c15d5daad41874e1c
X-Git-Newrev: aa2d71ac38711b3e13505f48bc2b466c708991b9
X-Patchwork-Hint: ignore
Message-Id: <20260329175905.DF6087FD11@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add memcached test
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa2d71ac38711b3e13505f48bc2b466c708991b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add a basic runtime test for memcached. The test starts memcached and
checks if it responds to a basic set/get request.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                      |  3 +++
 support/testing/tests/package/test_memcached.py | 35 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 410073d48a..15de0a3cb6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1167,6 +1167,9 @@ F:	package/tbb/
 N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
 
+N:	Franciszek Stachura <fbstachura@gmail.com>
+F:	support/testing/tests/package/test_memcached.py
+
 N:	Francois Dugast <francois.dugast.foss@gmail.com>
 F:	board/sipeed/licheepi_nano/
 F:	board/visionfive2/
diff --git a/support/testing/tests/package/test_memcached.py b/support/testing/tests/package/test_memcached.py
new file mode 100644
index 0000000000..2d00e47ab4
--- /dev/null
+++ b/support/testing/tests/package/test_memcached.py
@@ -0,0 +1,35 @@
+import os
+
+import infra.basetest
+
+
+class TestMemcached(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_TARGET_ROOTFS_CPIO=y
+    BR2_PACKAGE_MEMCACHED=y
+    BR2_PACKAGE_NETCAT=y
+    BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+    """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        output, exit_code = self.emulator.run("memcached -u root &")
+
+        set_key_cmd = "set test_key 0 100 10\\r\\ntest_value\\r\\nquit\\r\\n"
+        output, exit_code = self.emulator.run(
+            f"echo -ne '{set_key_cmd}' | nc localhost 11211"
+        )
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0].strip(), 'STORED')
+
+        get_key_cmd = "get test_key\\r\\nquit\\r\\n"
+        output, exit_code = self.emulator.run(
+            f"echo -ne '{get_key_cmd}' | nc localhost 11211"
+        )
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[2].strip(), 'test_value')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
