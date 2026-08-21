Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935D0C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E9DD8146A;
	Fri, 21 Aug 2026 15:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e36Csg6oKiQ6; Fri, 21 Aug 2026 15:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324905;
	bh=u/2WV2Ojvkt557tZILm7oK/weWmdqliX397wO5K3qEs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Py2mW98RlhCbkjNfBwSgrkwV1vmHyP3Rs+kNv3OUSIlxPUWPrdowAbOs2kSLxgYVK
	 43tfOsONg0VQHtqNWjC3jns4EGZVJ6/pktxbfyl3iUXrZA6deZ8jELb++ijqd02KW6
	 /0v4FnmoYCsXqacvOR66vgunj4VPPdMjEtOTj6NZELqp0yQ3UcwdHVbtwA0JJU9VbK
	 SAjfB3ND9SH/AtxkNsMyh5m1HHcGr3Csmf1QBDOnD1gpvmj2du5+3S++b6ykb55XxD
	 EyCw2tv79s8ZfOAE83U4JRMbqlpa4KxwyRjsn+p9qoTofuHMTc248Zvzf8zkFz6PgX
	 H3EB0hc5wT/Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D9D481495;
	Fri, 21 Aug 2026 15:08:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C99DB1CF2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C72F94004E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbL88JJqAr8x for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0557940327
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79AED8E127; Fri, 21 Aug 2026 15:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6c1d649fcbbb94636f3df6d21e2d74e1e56a8740
X-Git-Newrev: 94cafd26735775cd74e17fb56b05ca393d3ede72
X-Patchwork-Hint: ignore
Message-Id: <20260821150615.79AED8E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 TestApache: use read-only rootfs image
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94cafd26735775cd74e17fb56b05ca393d3ede72
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

With this the test verifies not only that Apache can work in
principle, but also that it works with a read-only rootfs. Because of
the read-only rootfs the test itself cannot write to /root, so store
the test download in /tmp.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0c349a881332d76ef6f0526a3224facc0c8a7a48)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 support/testing/tests/package/test_apache.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_apache.py b/support/testing/tests/package/test_apache.py
index f29f4e2524..d44e7927bd 100644
--- a/support/testing/tests/package/test_apache.py
+++ b/support/testing/tests/package/test_apache.py
@@ -1,5 +1,6 @@
 import os
 
+import infra
 import infra.basetest
 
 
@@ -7,17 +8,22 @@ class TestApache(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_APACHE=y
-        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
     def test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
+        rootfs = os.path.join(self.builddir, "images", "rootfs.squashfs")
+        infra.img_round_power2(rootfs)
+        self.emulator.boot(arch="armv7",
                            kernel="builtin",
-                           options=["-initrd", cpio_file])
+                           kernel_cmdline=["root=/dev/mmcblk0",
+                                           "rootfstype=squashfs"],
+                           options=["-drive",
+                                    "file={},if=sd,format=raw".format(rootfs)])
         self.emulator.login()
 
         self.assertRunOk("httpd -V")
-        self.assertRunOk("wget http://localhost/index.html")
-        self.assertRunOk("grep -F 'It works!' index.html")
+        self.assertRunOk("wget -O /tmp/index.html http://localhost/index.html")
+        self.assertRunOk("grep -F 'It works!' /tmp/index.html")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
