Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF567C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 19:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D53A614AB;
	Sat, 13 May 2023 19:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D53A614AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WpBNXnPW5GQ; Sat, 13 May 2023 19:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71955614A2;
	Sat, 13 May 2023 19:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71955614A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B75441BF5B4
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90738614A2
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90738614A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id suVfUdYR7dxz for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 19:32:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D51BC61480
 for <buildroot@buildroot.org>; Sat, 13 May 2023 19:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D51BC61480
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2B24865A4; Sat, 13 May 2023 19:32:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 21:32:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 436f9966ce7930b4d4cbf5182b5ebaf6e52ee089
X-Git-Newrev: 4c3df47d035d3848cad5a056a3c99d11246ae578
X-Patchwork-Hint: ignore
Message-Id: <20230513193258.C2B24865A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_python_botocore.py: increase timeout
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
Content-Type: multipart/mixed; boundary="===============2144216622691564885=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2144216622691564885==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4c3df47d035d3848cad5a056a3c99d11246ae578
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the current python-botocore version, the test times out on
machines on which it was passing with previous versions. Increase the
timeout so that the test can be run without using a timeout
multiplier.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_python_botocore.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_botocore.py b/support/testing/tests/package/test_python_botocore.py
index 48c2f3cc02..f123993c08 100644
--- a/support/testing/tests/package/test_python_botocore.py
+++ b/support/testing/tests/package/test_python_botocore.py
@@ -12,7 +12,7 @@ class TestPythonPy3Botocore(TestPythonPackageBase):
         BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
         """
     sample_scripts = ["tests/package/sample_python_botocore.py"]
-    timeout = 10
+    timeout = 30
 
     def login(self):
         ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")

--===============2144216622691564885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2144216622691564885==--
