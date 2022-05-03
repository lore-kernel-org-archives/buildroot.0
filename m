Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB3EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9204417B8;
	Tue,  3 May 2022 20:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7OVo0saKTP5F; Tue,  3 May 2022 20:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 854D0417BD;
	Tue,  3 May 2022 20:34:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B21C1BF9B2
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 364F2417BD
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFE46LQj0cws for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:34:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A7A4417B8
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:34:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 222BF854E8; Tue,  3 May 2022 20:23:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 22:33:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 593e8cb71f8f2ac69889424bbef5ab09c0dbb06e
X-Git-Newrev: 49f9a08223005584ca28c6f243ee5cb1d1e64f57
X-Patchwork-Hint: ignore
Message-Id: <20220503202359.222BF854E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: add test case for musl
 toolchain
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
Content-Type: multipart/mixed; boundary="===============3475385950522120129=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3475385950522120129==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=49f9a08223005584ca28c6f243ee5cb1d1e64f57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_zfs.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 1cc030e78c..8911dcfd9e 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -73,3 +73,8 @@ class TestZfsUclibc(TestZfsBase):
         """
 
 
+class TestZfsMusl(TestZfsBase):
+    config = TestZfsBase.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE=y
+        """

--===============3475385950522120129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3475385950522120129==--
