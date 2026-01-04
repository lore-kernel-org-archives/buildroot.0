Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAE1C2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65733607A5;
	Sun,  4 Jan 2026 10:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13M2ZWHw-MZT; Sun,  4 Jan 2026 10:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2FEA606F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767523735;
	bh=WZQz09O1WoVGvdtoSN/3d11DACEWZosMmvcKF0D0TW0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nTOsJtnyo5rzzEbn4W1dZ4TTRpACsGMeU/kVxWaoJquoSAi3o3xbB5lbISLpc5spU
	 m8bB+79yPoUSR22kcVxwhpGqtF2vhfaQ5auJgDkdFkN37SCouzLVe09Dx9kxokyV4n
	 xTJb+4PVWOR/G9k1v56V5L/cb4aMrLsrasgthxXhfrXSJ5e0apSDCqhALX/icfzfqR
	 AuUxt2GISgehHIH/fqSY0wEhm+fIkxx077TPm7Jg/Vu1ZvJAQQF6p/xIpUpkeBnZr7
	 Zr9Iuo/ze12QgkPrSiE+lPAZD/flmwZHL9BZ2V2IEZ/4geIA35tqLrGWl/ADuLcGOe
	 GHoL6rJ8ZbpCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2FEA606F0;
	Sun,  4 Jan 2026 10:48:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5567F37A
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47418606F0
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_DJ95ph2msA for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5636F606E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5636F606E2
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28968881CD; Sun,  4 Jan 2026 10:48:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 11:48:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fd7a468af91ce873d948aef1a41d870d3ed025d
X-Git-Newrev: 7f1c2b9d693b2d54151d6b72ea55d7f55a8fdaa7
X-Patchwork-Hint: ignore
Message-Id: <20260104104852.28968881CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add opus-tools runtime
 test
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f1c2b9d693b2d54151d6b72ea55d7f55a8fdaa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 support/testing/tests/package/test_opus_tools.py | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 62867225eb..42f9d03643 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1985,6 +1985,7 @@ F:	support/testing/tests/package/test_oath_toolkit.py
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
