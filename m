Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFACD29DE7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC96A83C96;
	Tue, 13 Jan 2026 19:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MoGN46Bs8B-Z; Tue, 13 Jan 2026 19:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2059083C9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333040;
	bh=+O1tuS2EuEc0EOFx+z2TPK2uv9j5MxAH0MZoRv2xHKM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OSHbOa4onkcXEQqj+sLU42PzQ0lxJkKL7l2p3HqyicFrYxAyvV40uuf60btHfupRT
	 vkpJry8GXia8Fuc59Xvou30+fCGwsGdX5twwR8v0Bnj28cmSkMnYB7fUz5sJm/7Yb1
	 rycRc0jPHjd0V2RmtVl+wGZgcCQod9wZWtEbLViFrfQNlbW3yqIKVIILpb+gGEzo9K
	 ptxdzyGlZ7NokBXiqDwcTUGZ/YXUvdIHqMkH8qw8d72yOiHbQobp0fKPH6H5W+xl42
	 TMrEG/8XRsxuqBhXARapcwQHbYOVnjXPop4DFPl+vaVMwwvHEZBWjjP4NAdY6Xf8E8
	 DMEN4ebZ4aQCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2059083C9A;
	Tue, 13 Jan 2026 19:37:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FE111C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F31A4043B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXuTrwZ9P_cW for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BD0C4055D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BD0C4055D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B10486E71; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:23:06 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9621d102043be13bd0b2cacd6c6fe4b49f7c57c8
X-Git-Newrev: 307ee23607f889961cb105fb4bae4236f2a6da07
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.9B10486E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=307ee23607f889961cb105fb4bae4236f2a6da07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7f1c2b9d693b2d54151d6b72ea55d7f55a8fdaa7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                       |  1 +
 support/testing/tests/package/test_opus_tools.py | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index aff9f6668b..1adf9c93dd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1947,6 +1947,7 @@ F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
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
