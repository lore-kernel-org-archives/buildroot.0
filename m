Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3042CD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF8E683F60;
	Tue, 13 Jan 2026 19:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t10pRA5yRWoX; Tue, 13 Jan 2026 19:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C5FB83F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333292;
	bh=9xGGd1uW6RBXaIl7eYIdZTgLJyWj0PyxSSUshgOw9ag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EBGX8ZBu+LzOr9hKMrordRU8NqYtxLfKXeKm/FnyNMiETZMDurM/HGBmTPyhqg6ot
	 5RgQr+xj0peeEyuXEnfYiZ5VVDZbyI4vqn2/8depBr/2clXG9er/r/MUqFxDqgwFEm
	 DmmfEoo79bIINqna8eK10Yx6Yt+J4u0WLjn4IGZLAphqUUV0I119TCOTkj7h9Yklr2
	 Lp/bXMv7iXdGMqG3BgorBcPvbziaQd5Ux0cRIM4KAuIWbaW6f6JPGAeZnZZDJGnX3K
	 eezDq5QU4ZfJm2puGPIE8I1EWDvKlnq0Ht4Vijg2G/DCT6eMcPJgAKNLEg1rLqtW3n
	 1j5oTs0LYZGpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C5FB83F28;
	Tue, 13 Jan 2026 19:41:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AFF31C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8087A406F1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQ6TbkR4-FYH for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B847440373
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B847440373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B664E80840; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:22:21 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 86bf49e0f67a3e67e411c2c9865b2fa9f96400e0
X-Git-Newrev: ed5ec9571d1fb2c99c99146d13e6fd760f7591aa
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.B664E80840@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing: add
 opus-tools runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed5ec9571d1fb2c99c99146d13e6fd760f7591aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7f1c2b9d693b2d54151d6b72ea55d7f55a8fdaa7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                       |  1 +
 support/testing/tests/package/test_opus_tools.py | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 76e140000c..3a77cebf41 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1983,6 +1983,7 @@ F:	support/testing/tests/package/test_oath_toolkit.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_openblas.py
 F:	support/testing/tests/package/test_openocd.py
+F:	support/testing/tests/package/test_opus_tools.py
 F:	support/testing/tests/package/test_parted.py
 F:	support/testing/tests/package/test_patch.py
 F:	support/testing/tests/package/test_patch/
diff --git a/support/testing/tests/package/test_opus_tools.py b/support/testing/tests/package/test_opus_tools.py
new file mode 100644
index 0000000000..89b76fb954
--- /dev/null
+++ b/support/testing/tests/package/test_opus_tools.py
@@ -0,0 +1,18 @@
+from tests.package.test_audio_codec_base import TestAudioCodecBase
+
+
+class TestOpusTools(TestAudioCodecBase):
+    __test__ = True
+    config = TestAudioCodecBase.config + \
+        """
+        BR2_PACKAGE_OPUS_TOOLS=y
+        """
+    encoded_file = "encoded.opus"
+
+    def encode_test(self, input_filename):
+        cmd = f"opusenc {input_filename} {self.encoded_file}"
+        self.assertRunOk(cmd)
+
+    def decode_test(self, output_filename):
+        cmd = f"opusdec {self.encoded_file} {output_filename}"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
