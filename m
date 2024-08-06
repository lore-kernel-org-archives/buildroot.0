Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE55C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 21:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAAA560792;
	Tue,  6 Aug 2024 21:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STdTdnXUHoi2; Tue,  6 Aug 2024 21:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC6EA6086C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC6EA6086C;
	Tue,  6 Aug 2024 21:23:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 047321BF30B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F329A6085A
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItI96wFhTr6K for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 21:23:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F3460792
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19F3460792
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 21:23:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1A64842BA; Tue,  6 Aug 2024 21:23:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 23:22:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a285b160fc0c106ccf9c42a7ebfd8cd5ed54744
X-Git-Newrev: 73e8652b57c8fd97bb7af6ef10e46301a22922e8
X-Patchwork-Hint: ignore
Message-Id: <20240806212307.C1A64842BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add lame runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=73e8652b57c8fd97bb7af6ef10e46301a22922e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_lame.py | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 44462dfdfd..c472aa4c53 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1897,6 +1897,7 @@ F:	support/testing/tests/package/test_kmod.py
 F:	support/testing/tests/package/test_kmod/
 F:	support/testing/tests/package/test_kmscube.py
 F:	support/testing/tests/package/test_kmscube/
+F:	support/testing/tests/package/test_lame.py
 F:	support/testing/tests/package/test_less.py
 F:	support/testing/tests/package/test_libcamera.py
 F:	support/testing/tests/package/test_libcamera/
diff --git a/support/testing/tests/package/test_lame.py b/support/testing/tests/package/test_lame.py
new file mode 100644
index 0000000000..bffb11672b
--- /dev/null
+++ b/support/testing/tests/package/test_lame.py
@@ -0,0 +1,20 @@
+from tests.package.test_audio_codec_base import TestAudioCodecBase
+
+
+class TestLame(TestAudioCodecBase):
+    __test__ = True
+    config = TestAudioCodecBase.config + \
+        """
+        BR2_PACKAGE_LAME=y
+        """
+    encoded_file = "encoded.mp3"
+
+    def encode_test(self, input_filename):
+        cmd = "lame --quiet"
+        cmd += f" {input_filename} {self.encoded_file}"
+        self.assertRunOk(cmd)
+
+    def decode_test(self, output_filename):
+        cmd = "lame --quiet --decode"
+        cmd += f" {self.encoded_file} {output_filename}"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
