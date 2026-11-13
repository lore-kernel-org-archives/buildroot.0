Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2DB606A32D
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KKMD6WwW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8913E60DC3;
	Fri, 13 Nov 2026 18:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ux9yekw0P8rR; Fri, 13 Nov 2026 18:51:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8C60A60DAA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794595916;
	b=kz/tPO33i2SrRBoOY9eqvCEgYuUIAr8sW7b6s1//GRIdJu+cpYo/Bc8Mmhu62Ov+HshQ
	 /fGdwb8QKkrj7y8FqJfJVxUrAPKB8jMabBgRFgyGEqysxGjlt+R8AxE8BjnLc6876mnGJ
	 iuy+IiPBfOMFU5ZPzBgx5jwC9M/EQfJiLyl88USLEjF+0jXEcy+tD7M96zlLPOaesnEE3
	 fhAgbWe+yqt/zrRtzuTvxcmLPLD0avYd3GNYWu+dN6oqjNgKv985ibN6S1xYYkyzCYzre
	 A75X1kd5hy5pnF5XyqtN40iHk2YlISNcyrgWOUntBcNN6nREyRqS/KSp60lvq0d7RRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794595916;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SVEQZMHHpqWiSxL9zyyXqL4vaGYSO/qMnpIjwim/be8=;
	b=qRhpFvIuUxG3S/+1Mjt5POoEdH9x5RTlOiwgCZENZvphau2dEIiiTcdwS84o2DFaAMC5
	 ooQ11T8ONYktmC8sRey8fo/+6bZAoQUMyEEfBCzzihctDbdgaJ595l5GdJ9W+ozOqtQ7E
	 P+VLGAuCgPLaVWukSHVpnZQ8NL5iePt4t8yhyICM44oLSrga1eSRffoYHaj7tqn+xbQHf
	 K6JMwq+Bd7hwJuY8cKEgPKmYn5EPsE8zXe6vnxiC6XEg42YBraQ2nDIHse5Pqi5rUdfbO
	 IJyVqClOVG5L6GAgnsd1osMf12JT4gBRzAvhuQZDOcsuXNCNYEbHOZYPHrmUWsPLDHQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794595916;
	bh=SVEQZMHHpqWiSxL9zyyXqL4vaGYSO/qMnpIjwim/be8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KKMD6WwWHxk2xpgQ8zKd5imNewqWk41PC+8oCkESvOutR4+TPexbJpWbvCq4KIsck
	 zWJXd+NbQF59RAu3bqxWxqWylXed4+wRxm7brKJ2DhLAgl225CBAV0nKySR+a9dUxa
	 qpNuzrXiAz7JJodVV+kfajLbWdITAfUsptIKwE0Mk/uhW1Acyhv3QaYoulUd5XkNwG
	 MrAaDOMtpUapPVi4UaqrQHX6DDQ8aH2l+AHgVlGcMB9lfl7aGqUK0L4PF9sXv0g3nG
	 3oUF30AixzLB9Pg2cwEm/lHbhkS81ekUF878IUsh1ChtTEXnduXiMY2S8eWxYteN2O
	 RT9Q3EiMrJhrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C60A60DAA;
	Fri, 13 Nov 2026 18:51:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EA532E5
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 18:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0446081601
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 18:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LK_Ao74OfvqX for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 18:51:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6B6458156B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B6458156B
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 18:51:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1920260136;
 Fri, 13 Nov 2026 19:51:48 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 13 Nov 2026 19:51:41 +0100
Message-ID: <20261113185141.778423-2-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113185141.778423-1-ju.o@free.fr>
References: <20261113185141.778423-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/testing: unionfs: new runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/18015553483
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_unionfs.py | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 support/testing/tests/package/test_unionfs.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..a4513f8b32 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2091,6 +2091,7 @@ F:	support/testing/tests/package/test_trace_cmd/
 F:	support/testing/tests/package/test_tree.py
 F:	support/testing/tests/package/test_unbound.py
 F:	support/testing/tests/package/test_unbound/
+F:	support/testing/tests/package/test_unionfs.py
 F:	support/testing/tests/package/test_usbip.py
 F:	support/testing/tests/package/test_usbip/
 F:	support/testing/tests/package/test_usbutils.py
diff --git a/support/testing/tests/package/test_unionfs.py b/support/testing/tests/package/test_unionfs.py
new file mode 100644
index 0000000000..3c6fea4db5
--- /dev/null
+++ b/support/testing/tests/package/test_unionfs.py
@@ -0,0 +1,78 @@
+import os
+
+import infra.basetest
+
+
+class TestUnionFS(infra.basetest.BRTest):
+    # We need to recompile a kernel with CONFIG_FUSE_FS, enabled by
+    # libfuse3 kernel config fixup.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.63"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_UNIONFS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # We check the program ran execute.
+        self.assertRunOk("unionfs --version")
+
+        # We create test directories.
+        self.assertRunOk("mkdir -p dir1 dir2 merged")
+
+        # We create empty test files.
+        n_files = 10
+        digits = list(map(str, range(n_files)))
+        letters = list(map(chr, range(ord('a'), ord('a') + n_files)))
+        path_digits = [f"dir1/{x}" for x in digits]
+        path_letters = [f"dir2/{x}" for x in letters]
+        files = " ".join(path_digits + path_letters)
+        self.assertRunOk(f"touch {files}")
+
+        # We setup our unionfs merged directory.
+        self.assertRunOk("unionfs dir1=RO:dir2=RW merged")
+
+        # We check we can list files in our merged directory.
+        self.assertRunOk("ls -al merged")
+
+        # We check the file list of the merged directory is the union
+        # of our two directories.
+        out, ret = self.emulator.run("( cd merged && echo * )")
+        self.assertEqual(ret, 0)
+        expected_list = " ".join(digits + letters)
+        self.assertEqual(out[0], expected_list)
+
+        # We mounted the 'dir1' directory as read-only. We should not
+        # be able to write files named with digits.
+        msg = "Hello Buildroot!"
+        self.assertRunNotOk(f"echo '{msg}' > merged/1")
+
+        # We mounted the 'dir2' directory as read-write. We should be
+        # able to write files named with letters.
+        self.assertRunOk(f"echo '{msg}' > merged/a")
+
+        # We check the written message is observable from the original
+        # 'dir2' directory.
+        out, ret = self.emulator.run("cat dir2/a")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
