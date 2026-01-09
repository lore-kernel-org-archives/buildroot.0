Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BD2D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D18E083D06;
	Tue, 13 Jan 2026 19:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvuE0hnAz48V; Tue, 13 Jan 2026 19:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAA7083D94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333060;
	bh=XT1EDFv7O4JXtO0HK1EpfvOHckc3V89HCGv85xx6nXQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ORKRFaYNELrM3ufec6BrVVY1Wgv4hJrAxaYoLdpKEOqtbVZ5a9i2eKfz9lEssNxbV
	 rJ8xswoAGuneo+Uwt4aoZw/djrrpzX/qOImXDvzBA6kDgp8QGStMAYOZJoKNotqN5a
	 vIFvpEw7Wmg3Bzml16r04J827Ib2zf+rIYskvzeELwE5bvSI4KVGNn8oVXKqSM5a3V
	 68A8RHIwt1MIzn1nVNJVjDk17J6xbQjUaSskUnYJNrepTkT7n8Ik6TywBBfSevaU/W
	 CD+TCcVrC/xhCA031/fKopc1dSKj5F42Gjhis9RhuDw2VTkIudI2ufY6WszRsGByFO
	 cVMAf3QN0KE5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAA7083D94;
	Tue, 13 Jan 2026 19:37:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A84B1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED5044055B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rnw5KxOHIQ6R for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A561340447
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A561340447
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4C4286184; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:23:08 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 307ee23607f889961cb105fb4bae4236f2a6da07
X-Git-Newrev: 0bb1063b5443a0def920ccbb0e48671bd987ba1b
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.A4C4286184@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: add flac
 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bb1063b5443a0def920ccbb0e48671bd987ba1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8e76564b0e745b5fc77f35c1bb7e8c8099822842)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_flac.py | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1adf9c93dd..82dcc729ff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1860,6 +1860,7 @@ F:	support/testing/tests/package/test_exfatprogs.py
 F:	support/testing/tests/package/test_exfatprogs/
 F:	support/testing/tests/package/test_file.py
 F:	support/testing/tests/package/test_file/
+F:	support/testing/tests/package/test_flac.py
 F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_fping.py
diff --git a/support/testing/tests/package/test_flac.py b/support/testing/tests/package/test_flac.py
new file mode 100644
index 0000000000..9ee7bc1c0d
--- /dev/null
+++ b/support/testing/tests/package/test_flac.py
@@ -0,0 +1,20 @@
+from tests.package.test_audio_codec_base import TestAudioCodecBase
+
+
+class TestFlac(TestAudioCodecBase):
+    __test__ = True
+    config = TestAudioCodecBase.config + \
+        """
+        BR2_PACKAGE_FLAC=y
+        """
+    encoded_file = "encoded.flac"
+
+    def encode_test(self, input_filename):
+        cmd = "flac"
+        cmd += f" -o {self.encoded_file} {input_filename}"
+        self.assertRunOk(cmd)
+
+    def decode_test(self, output_filename):
+        cmd = "flac -d"
+        cmd += f" -o {output_filename} {self.encoded_file}"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
