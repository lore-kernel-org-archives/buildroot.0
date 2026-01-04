Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8E3C2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21A6C80D5C;
	Sun,  4 Jan 2026 10:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esKVidP7jr5u; Sun,  4 Jan 2026 10:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D4F280D43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767524037;
	bh=XmmVyGGOLSvgrt1GudwlzBlr4dThkkNF1NA5ABqUsXQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DsyImjf//1g0HyO4z1lcAtKhni3HIv1m6xVkAWuvyx3tuzothg1pAdpAIulT9STHn
	 EKPfypqMHFWcxckuSJNzdTzCNA4/nHjD+sgYZqZlT8fPLfOXSgCHE4maE3wu/tVBli
	 1C8edXcfrX5B//9EtqkTQYab3qX0rADWSgTXjv717WK769uN+3xVAOtMZcB4Ln8Y6m
	 UWcAPtiMGy5xqtlx4v5dGn4hvl2zkclg8jJkYqDfHfXYQDxEQsSf+G8DDc8wECWz+I
	 +x0F5GgAoWbb832P5GbyRICreDGBc7VHSSRF6H84dX5IDwAlBp9q5kxvl/vufpLfVg
	 reeVvvI5ToiVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D4F280D43;
	Sun,  4 Jan 2026 10:53:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AA3A249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20CB580D43
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4r3kI8ZmYYST for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77BF380D38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77BF380D38
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:53:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62F41881CC; Sun,  4 Jan 2026 10:53:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 11:53:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e779d6e57add2e1a78addb02ab45fbdd6a457e0
X-Git-Newrev: 8e76564b0e745b5fc77f35c1bb7e8c8099822842
X-Patchwork-Hint: ignore
Message-Id: <20260104105355.62F41881CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add flac runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8e76564b0e745b5fc77f35c1bb7e8c8099822842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_flac.py | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 42f9d03643..f982e3123a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1899,6 +1899,7 @@ F:	support/testing/tests/package/test_exfatprogs.py
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
