Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE1AC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E8B142876;
	Sat,  8 Jun 2024 07:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWf2q4wRFyOA; Sat,  8 Jun 2024 07:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7C054287B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7C054287B;
	Sat,  8 Jun 2024 07:53:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5381BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A43D060793
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0nm0fAagrjD for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F7666077B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F7666077B
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 541C487D85; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 09:28:50 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f3248d0b5c0d59eb3543c9b6d54b7bfe30367b22
X-Git-Newrev: 188d0e5f6f3685db4c0228e7a91a876a5f887465
X-Patchwork-Hint: ignore
Message-Id: <20240608075253.541C487D85@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add zip
 test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=188d0e5f6f3685db4c0228e7a91a876a5f887465
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 23ef540288e86c50d24f9a7ab8e1e2e66500e024)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_zip.py | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 823bbad88d..e5f5f56881 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -534,6 +534,7 @@ F:	package/python-pysensors/
 F:	package/qoriq-fm-ucode/
 F:	package/unifdef/
 F:	package/vmtouch/
+F:	support/testing/tests/package/test_zip.py
 
 N:	Brock Williams <brock@cottonwoodcomputer.com>
 F:	package/pdmenu/
diff --git a/support/testing/tests/package/test_zip.py b/support/testing/tests/package/test_zip.py
new file mode 100644
index 0000000000..eb2e016988
--- /dev/null
+++ b/support/testing/tests/package/test_zip.py
@@ -0,0 +1,15 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestZip(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_ZIP=y
+        BR2_PACKAGE_UNZIP=y
+        """
+    compress_cmd = "/bin/sh -c 'zip $1.zip $1' /bin/sh"
+    decompress_cmd = "unzip"
+    check_integrity_cmd = "unzip -t"
+    compressed_file_ext = ".zip"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
