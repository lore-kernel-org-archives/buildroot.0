Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C151CC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E7FF61391;
	Thu,  9 May 2024 20:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BS14_Izc0Ajv; Thu,  9 May 2024 20:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8629C6138F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8629C6138F;
	Thu,  9 May 2024 20:47:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D56F1BF98E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FB2A83FEF
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9RvOcmehWxB for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 857C183FF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 857C183FF2
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37D0286DC9; Thu,  9 May 2024 20:46:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:44:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac92ce4961b557a0f25adac824d9190b18f830e8
X-Git-Newrev: a6182475b0f8abc04212fedf3da1f3e88f81d8f4
X-Patchwork-Hint: ignore
Message-Id: <20240509204628.37D0286DC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add test for export-subst
 support in git-download
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a6182475b0f8abc04212fedf3da1f3e88f81d8f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../git-hash/package/export-subst/export-subst.hash       |   1 +
 .../git-hash/package/export-subst/export-subst.mk         |  10 ++++++++++
 .../objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38     | Bin 0 -> 35 bytes
 .../objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26     | Bin 0 -> 197 bytes
 .../objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8     | Bin 0 -> 28 bytes
 .../objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0     | Bin 0 -> 112 bytes
 .../tests/download/git-remote/repo.git/refs/heads/master  |   2 +-
 support/testing/tests/download/test_git.py                |   4 ++++
 8 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
new file mode 100644
index 0000000000..1926236993
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
@@ -0,0 +1 @@
+sha256  9d359f9ae9a9e65dd4ccfe7170aa6fda24e17dfc81238972957b4b7fe97168a7  export-subst-0fdb95cf4f3c5ed4003287649cabb33c5f843e26-br2.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
new file mode 100644
index 0000000000..8d7d3ff970
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# export-subst
+#
+################################################################################
+
+EXPORT_SUBST_VERSION = 0fdb95cf4f3c5ed4003287649cabb33c5f843e26
+EXPORT_SUBST_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38 b/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
new file mode 100644
index 0000000000..404bb1397c
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26 b/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
new file mode 100644
index 0000000000..3a4cc4ead6
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8 b/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
new file mode 100644
index 0000000000..fdc4a37651
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0 b/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0
new file mode 100644
index 0000000000..932f73602f
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/master b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
index b6bccc1c17..b6e37260fb 100644
--- a/support/testing/tests/download/git-remote/repo.git/refs/heads/master
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
@@ -1 +1 @@
-a238b1dfcd825d47d834af3c5223417c8411d90d
+0fdb95cf4f3c5ed4003287649cabb33c5f843e26
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index ec5b8f3fdd..ba52e03ef5 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -56,6 +56,10 @@ class TestGitHash(GitTestBase):
             self.check_hash("bad")
         self.check_hash("good")
         self.check_hash("nohash")
+        self.check_hash("export-subst")
+        with open(os.path.join(self.builddir, "dl", "export-subst", "git", "file2"), "r") as f:
+            blob = f.read()
+        self.assertEqual(blob, "0fdb95cf4f3c5ed4003287649cabb33c5f843e26\n")
 
 
 class TestGitRefs(GitTestBase):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
