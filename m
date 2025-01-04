Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0324AC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DFA16FCBF;
	Fri, 28 Feb 2025 16:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ie0-CTnsuYK5; Fri, 28 Feb 2025 16:51:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 610CE6FC7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 610CE6FC7E;
	Fri, 28 Feb 2025 16:51:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0625A68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31F6D42F01
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsTsQCqxCUso for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B517E42504
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B517E42504
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABDCA86612; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jan 2025 21:38:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0919d98e832ae092d868b118e8fc986f1c9485a7
X-Git-Newrev: 9ee173ba5faa90f9487ddb0ac55b3c6032a86a91
X-Patchwork-Hint: ignore
Message-Id: <20250228162957.ABDCA86612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing/{test_edk2,
 test_grub, test_iso9660, test_fwts}: remove edk2 download fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ee173ba5faa90f9487ddb0ac55b3c6032a86a91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove the download fix introduced by [1] now the edk2 git repository
has been fixed in version stable202411 [2].

[1] 47fc9e5509837260310cd7e41335fade29b587b1.
[2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_edk2.py    | 22 --------
 support/testing/tests/boot/test_grub.py    | 88 ------------------------------
 support/testing/tests/fs/test_iso9660.py   | 44 ---------------
 support/testing/tests/package/test_fwts.py | 22 --------
 4 files changed, 176 deletions(-)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 6403aaa653..90583b56fe 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -36,28 +36,6 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestEdk2, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestEdk2.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 5cbc7fd22b..37b7c06143 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -58,28 +58,6 @@ class TestGrubi386EFI(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
         """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestGrubi386EFI, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestGrubi386EFI.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
@@ -131,28 +109,6 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_DOSFSTOOLS=y
         """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestGrubX8664EFI, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestGrubX8664EFI.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
@@ -202,28 +158,6 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
         """.format(post_image=infra.filepath("tests/boot/test_grub/post-image-aarch64-efi.sh"),
                    linux_fragment=infra.filepath("tests/boot/test_grub/linux-aarch64-efi.config"))
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestGrubAArch64EFI, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestGrubAArch64EFI.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "QEMU_EFI.fd")
@@ -270,28 +204,6 @@ class TestGrubRiscV64EFI(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestGrubRiscV64EFI, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestGrubAArch64EFI.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         disk = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "RISCV_VIRT_CODE.fd")
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 6f8ca06de3..3d08f2e895 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -135,28 +135,6 @@ class TestIso9660Grub2EFI(infra.basetest.BRTest):
         """.format(infra.filepath("conf/grub2-efi.cfg"),
                    infra.filepath("conf/grub2.cfg"))
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestIso9660Grub2EFI, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestIso9660Grub2EFI.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         exit_code = test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True,
@@ -185,28 +163,6 @@ class TestIso9660Grub2Hybrid(infra.basetest.BRTest):
         """.format(infra.filepath("conf/grub2-efi.cfg"),
                    infra.filepath("conf/grub2.cfg"))
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestIso9660Grub2Hybrid, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestIso9660Grub2Hybrid.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         exit_code = test_mount_internal_external(self.emulator,
                                                  self.builddir, internal=True,
diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
index 4a9c412d94..e33adcaea4 100644
--- a/support/testing/tests/package/test_fwts.py
+++ b/support/testing/tests/package/test_fwts.py
@@ -39,28 +39,6 @@ class TestFwts(infra.basetest.BRTest):
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
         """
 
-    def __init__(self, names):
-        """Setup common test variables."""
-        super(TestFwts, self).__init__(names)
-        """All EDK2 releases <= edk2-stable202408 can't be fetched from git
-           anymore due to a missing git submodule as reported by [1].
-
-           Usually Buildroot fall-back using https://sources.buildroot.net
-           thanks to BR2_BACKUP_SITE where a backup of the generated archive
-           is available. But the BRConfigTest remove BR2_BACKUP_SITE default
-           value while generating the .config used by TestFwts.
-
-           Replace the BR2_BACKUP_SITE override from BRConfigTest in order
-           to continue testing EDK2 package using the usual backup site.
-
-           To be removed with the next EDK2 version bump using this commit
-           [2].
-
-           [1] https://github.com/tianocore/edk2/issues/6398
-           [2] https://github.com/tianocore/edk2/commit/95d8a1c255cfb8e063d679930d08ca6426eb5701
-        """
-        self.config = self.config.replace('BR2_BACKUP_SITE=""\n', '')
-
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         flash0 = os.path.join(self.builddir, "images", "SBSA_FLASH0.fd")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
