Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9B3D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7584B83F6D;
	Tue, 13 Jan 2026 19:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puLVTlGrvW3R; Tue, 13 Jan 2026 19:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF8383F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333295;
	bh=UhYq/2uN6CNrfSdyI5gaxf1eTmK+c33B7qWe+Uix21s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZuzyqxPmYAmeKPCIaKA+eZeEoE4BLxPi7jD2mvz4aLxSjsbwxUnIxIfRcIXfqqyQC
	 kWP599ghCJ6gaCK73T071O8B330FmEl4UpJdUsrPzYskwlz0BTptK6s0jgshW4bUm3
	 COl3qJvJKZLCeTt8+VpJjgzEmsSKHDNtr4cDUyoZd+hG6xu0g2v/GfNiBMiNJ4pCIM
	 srU2uc4mH0VG7jQjWBq47Ewy4ifR1IVxPFsGTG4R8BUO8DhoCD/A4ZKqfJvMMZQzQH
	 mXEtZHu6QeZRNjDV65aNeYPQXXLmlj8gAiOoa4VbEztGUWwsz4fEMpgVUNdE7vuQmv
	 4d7XkFi5ENSCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AF8383F3E;
	Tue, 13 Jan 2026 19:41:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 043A6231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAE97830E6
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASZV4l_ByMYH for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C36BC83126
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C36BC83126
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1DFF82271; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:22:23 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ed5ec9571d1fb2c99c99146d13e6fd760f7591aa
X-Git-Newrev: 6922f4b1fa2ccf4829e78538c75bc8b9dc9864b5
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.C1DFF82271@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing: add flac
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

commit: https://git.buildroot.net/buildroot/commit/?id=6922f4b1fa2ccf4829e78538c75bc8b9dc9864b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8e76564b0e745b5fc77f35c1bb7e8c8099822842)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_flac.py | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a77cebf41..b61fc3c57e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1897,6 +1897,7 @@ F:	support/testing/tests/package/test_exfatprogs.py
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
