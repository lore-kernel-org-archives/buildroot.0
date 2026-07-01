Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8273EC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 20:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5966A83131;
	Wed,  1 Jul 2026 20:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPBVfqUxsRRd; Wed,  1 Jul 2026 20:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22556830E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782936483;
	bh=VY0Dn/uLA7EnkTj9+KGLniZY7pKnzMM4XMtFiFMuhac=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CeNGhmI9grcPPcziF5hf6cJr6VGC8Z6kLQoQegbaRfx/WVzF7zOBadrZJLujjh+5v
	 prjLUVx4RbmVH6obu03laK0upK7DKE099x5OWBJSiJFgHxlArSLGVL/4Vcx8CD5AhW
	 POS7ypnK7vfSMy0RJFYXYtL+7QI4igm0DA4JfihOKienhfgYcsO/YrkSAc3LXZbHMM
	 GHclQBWKGBXFN44h/IC2OSMkT1SSVAiNROv1IUWarm0Vatnit78Rdv2usjAOpHM1P0
	 PAtUFvfQ24MP1yMGf7l1r+zJvxZwtfjmBxGrq5pdNRZ+T/jt968KInNAh/eyIBI+1o
	 7zauUb5iTzkyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22556830E2;
	Wed,  1 Jul 2026 20:08:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C6A5127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E54383365
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eR_26Y12qo6d for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 20:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45220830E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45220830E2
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:08:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A760879B5; Wed,  1 Jul 2026 20:07:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jul 2026 22:01:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bebe90835ec2333ef67a5294c5c3c8b34c2555c
X-Git-Newrev: 3bd4b9f434af91b088e527b90f1f01dca77f1557
X-Patchwork-Hint: ignore
Message-Id: <20260701200731.2A760879B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/agec: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3bd4b9f434af91b088e527b90f1f01dca77f1557
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Agec is a simple file encryption tool that implements the
age format in C with minimal dependencies. The tool supports
asymmetric encryption based on X25519, and a passphrase
encryption based on scrypt.

https://git.sr.ht/~min/agec
https://age-encryption.org

Encryption is silently broken for files <35 bytes, so add a patch submitted
upstream to fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  1 +
 ...-isarmor-do-not-set-eof-for-35-byte-files.patch | 35 +++++++++++++
 package/agec/Config.in                             | 10 ++++
 package/agec/agec.hash                             |  3 ++
 package/agec/agec.mk                               | 24 +++++++++
 support/testing/tests/package/test_agec.py         | 61 ++++++++++++++++++++++
 7 files changed, 136 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5a09be9bff..1770eeeb43 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2649,6 +2649,7 @@ F:	configs/orangepi_pc_defconfig
 F:	configs/orangepi_r1_defconfig
 F:	configs/sheevaplug_defconfig
 F:	configs/visionfive_defconfig
+F:	package/agec/
 F:	package/bats-core/
 F:	package/dfu-programmer/
 F:	package/docker-compose/
@@ -2683,6 +2684,7 @@ F:	package/triggerhappy/
 F:	package/ugetty/
 F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
+F:	support/testing/tests/package/test_agec.py
 F:	support/testing/tests/package/test_docker_compose.py
 F:	support/testing/tests/package/test_python_hid.py
 
diff --git a/package/Config.in b/package/Config.in
index 27f61ca7bc..b6f23308af 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2729,6 +2729,7 @@ comment "Shells"
 	source "package/nushell/Config.in"
 	source "package/zsh/Config.in"
 comment "Utilities"
+	source "package/agec/Config.in"
 	source "package/apg/Config.in"
 	source "package/at/Config.in"
 	source "package/bash-completion/Config.in"
diff --git a/package/agec/0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch b/package/agec/0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch
new file mode 100644
index 0000000000..fa4af2a9c0
--- /dev/null
+++ b/package/agec/0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch
@@ -0,0 +1,35 @@
+From eb8ccfe5bb32273226d80236caab7a9386d71071 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Thu, 18 Jun 2026 15:12:38 +0200
+Subject: [PATCH] io.c: isarmor(): do not set eof for <35 byte files
+
+Encryption is silently broken for <35 byte files since commit b374d8de5a
+("stop reading after first EOF"), as readall() sets the eof flag when it was
+unable to read the entire 35 bytes in isarmor(), causing bread() to return
+EOF and ignore the <35 bytes already read.
+
+Fix it by only setting the eof flag in isarmor() if nothing could be read.
+
+Upstream: mailed to amin@firemail.cc
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ io.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/io.c b/io.c
+index 15ed4f7..2773022 100644
+--- a/io.c
++++ b/io.c
+@@ -128,8 +128,7 @@ isarmor(Ibuf *b)
+ 	nr = readall(b->fd, b->buf, sizeof(armorfirst) - 1, &b->eof);
+ 	if(nr == -1)
+ 		return -1;
+-	if(nr == 0)
+-		b->eof = 1;
++	b->eof = (nr == 0);
+ 	b->size = nr;
+ 	if((usize)nr < sizeof(armorfirst) - 1)
+ 		return 0;
+-- 
+2.47.3
+
diff --git a/package/agec/Config.in b/package/agec/Config.in
new file mode 100644
index 0000000000..8ca9240917
--- /dev/null
+++ b/package/agec/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_AGEC
+	bool "agec"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Agec is a simple file encryption tool that implements the
+	  age format in C with minimal dependencies. The tool supports
+	  asymmetric encryption based on X25519, and a passphrase
+	  encryption based on scrypt.
+
+	  https://git.sr.ht/~min/agec
diff --git a/package/agec/agec.hash b/package/agec/agec.hash
new file mode 100644
index 0000000000..0b6982f913
--- /dev/null
+++ b/package/agec/agec.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  97958ff82eaa6aa89328f4319d585e362130168c478cf6a85ba3f4d05e453669  0.1.0.tar.gz
+sha256  f7f37a8bb7d993825b10f5ce2838c1c452d902eda63cd180fdabc7c3a5dd0341  LICENSE
diff --git a/package/agec/agec.mk b/package/agec/agec.mk
new file mode 100644
index 0000000000..b19eac94a4
--- /dev/null
+++ b/package/agec/agec.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# agec
+#
+################################################################################
+
+AGEC_VERSION = 0.1.0
+AGEC_SOURCE = $(AGEC_VERSION).tar.gz
+AGEC_SITE = https://git.sr.ht/~min/agec/archive
+AGEC_LICENSE = BSD-0-Clause
+AGEC_LICENSE_FILES = LICENSE
+AGEC_DEPENDENCIES = host-pkgconf openssl
+
+define AGEC_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
+endef
+
+define AGEC_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		PREFIX=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_agec.py b/support/testing/tests/package/test_agec.py
new file mode 100644
index 0000000000..45fd0fbf69
--- /dev/null
+++ b/support/testing/tests/package/test_agec.py
@@ -0,0 +1,61 @@
+import os
+
+import infra.basetest
+
+
+class TestAgec(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_PACKAGE_AGEC=y
+    BR2_TARGET_ROOTFS_CPIO=y
+    """
+
+    # generate keypair in file and return pubkey
+    def generate_keypair(self, filename):
+        self.assertRunOk(f"agec-keygen > {filename}")
+
+        output, exit_code = self.emulator.run(f"agec-keygen -y < {filename}")
+        self.assertEqual(exit_code, 0)
+        pubkey = output[0].strip()
+        self.assertNotEqual(pubkey, "")
+        return pubkey
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We define two keypairs
+        key1 = "/tmp/key1.txt"
+        key2 = "/tmp/key2.txt"
+
+        # And files to work on
+        orig_file = "/bin/busybox"
+        decrypted_file = "/tmp/busybox"
+        encrypted_file = decrypted_file + ".age"
+
+        # should output a valid looking keypair to stdout
+        output, exit_code = self.emulator.run("agec-keygen")
+        self.assertEqual(exit_code, 0)
+        self.assertIn("public key:", output[0])
+        self.assertIn("AGE-SECRET-KEY-", output[1])
+
+        # generate keypairs and extract pubkeys
+        pubkey1 = self.generate_keypair(key1)
+        _ = self.generate_keypair(key2)
+
+        # encrypt file
+        self.assertRunOk(f"agec -r {pubkey1} {orig_file} > {encrypted_file}")
+
+        # should be encrypted
+        self.assertRunNotOk(f"cmp {orig_file} {encrypted_file}")
+
+        # should be decryptable with key1
+        self.assertRunOk(f"agec -d -i {key1} {encrypted_file} > {decrypted_file}")
+
+        # and equal to original
+        self.assertRunOk(f"cmp {orig_file} {decrypted_file} ")
+
+        # should NOT be decryptable with key2
+        self.assertRunNotOk(f"agec -d -i {key2} {encrypted_file} > {decrypted_file}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
