Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE33C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 06:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A6F861431;
	Sat, 11 May 2024 06:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSUSB3sWKk2g; Sat, 11 May 2024 06:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52429614FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52429614FD;
	Sat, 11 May 2024 06:54:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA9F1BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48F9E40132
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bD1l3hMOcibs for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 06:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B0CF400F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B0CF400F9
 for <buildroot@buildroot.org>; Sat, 11 May 2024 06:54:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17C2C86E1B; Sat, 11 May 2024 06:54:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 08:46:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd64c544d31fbfa282306007fb3c151dd864146f
X-Git-Newrev: 23ef540288e86c50d24f9a7ab8e1e2e66500e024
X-Patchwork-Hint: ignore
Message-Id: <20240511065440.17C2C86E1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add zip test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=23ef540288e86c50d24f9a7ab8e1e2e66500e024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_zip.py | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 456e2b87ce..cb8a69a36a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -547,6 +547,7 @@ F:	package/python-pysensors/
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
