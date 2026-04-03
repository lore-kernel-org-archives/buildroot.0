Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6C4E7E368
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7A77610C7;
	Fri,  3 Apr 2026 10:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmDW4QBNUY32; Fri,  3 Apr 2026 10:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E56FC610B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212037;
	bh=Wi0WjhlrzGdIPQNMxoCdtFAdUjtlwfzCa/G8DUA6qhQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TrdXNmvGXSm1IN+bXKpD+Gkxd4F4rbDAMCbwajUSjli4o6Xc/Fi52z4+5tmH+aB2E
	 Gn6SzyYXNJ0LNsOcskWwOw3TlIKyXuweJXrtjzb7VrJ2ZQsDkDq/KYpka8vX+nXkpa
	 8fiqBtgF8v7KglI3nvvPBMn64VpkPwRI6rBuM9OWY8HlJkWLOi2oXEFNwhhMCPmUNv
	 xvWQGGxgaPMxClURRz4xWK+nwQVb4f5Y95XHgnAJkCzFREAYKivRqh0GGZKj7VxFOx
	 E3N7anFP6DGLTEfjEhfFiyp+lie/UfmXm2v3RieomxnuWt2y5rSE6BK2PyTL7zLRys
	 EOBJAn8QXLvnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E56FC610B3;
	Fri,  3 Apr 2026 10:27:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AA331A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A20E240265
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjSiLjS80cqX for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A308040274
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A308040274
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DF787FFA9; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 12:21:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5d034098e0482d97b79fdc0f8f11ae0853f8a35c
X-Git-Newrev: dd3884b7360f610fb2e01ce690f344188bf48cd4
X-Patchwork-Hint: ignore
Message-Id: <20260403102657.2DF787FFA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: add
 memcached test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd3884b7360f610fb2e01ce690f344188bf48cd4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add a basic runtime test for memcached. The test starts memcached and
checks if it responds to a basic set/get request.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit aa2d71ac38711b3e13505f48bc2b466c708991b9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                      |  3 +++
 support/testing/tests/package/test_memcached.py | 35 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9fab580775..03e10f8a7b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1121,6 +1121,9 @@ F:	package/tbb/
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
