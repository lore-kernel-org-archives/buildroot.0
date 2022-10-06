Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A7BC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 232DE40D33;
	Thu,  6 Oct 2022 18:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 232DE40D33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQPDporNPkyP; Thu,  6 Oct 2022 18:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AF6B40BA5;
	Thu,  6 Oct 2022 18:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AF6B40BA5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10B601BF3D2
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 18:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E08F940BE3
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 18:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E08F940BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m9TE43Z_NRBc for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 18:46:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23AE440146
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 18:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23AE440146
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 034EE869A8; Thu,  6 Oct 2022 18:46:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 20:46:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9a0a0843e419a2842c1377217d7e2ac9c47d416
X-Git-Newrev: 1b77c2170d052e0b66ea132365c4c6747ca1cf7a
X-Patchwork-Hint: ignore
Message-Id: <20221006184636.034EE869A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/package/test_zfs:
 increase timeout for the ZFS tests
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
Content-Type: multipart/mixed; boundary="===============8555565606295064678=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8555565606295064678==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1b77c2170d052e0b66ea132365c4c6747ca1cf7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newest versions requires a bit more time to finish.

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_zfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 688b60d7c4..1f01ddd768 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -4,6 +4,7 @@ import infra.basetest
 
 
 class TestZfsBase(infra.basetest.BRTest):
+    timeout = 60 * 3
     config = \
         """
         BR2_x86_64=y
@@ -57,7 +58,7 @@ class TestZfsBase(infra.basetest.BRTest):
             "arc_summary",
         ]
         for cmd in cmds:
-            self.assertRunOk(cmd)
+            self.assertRunOk(cmd, timeout=self.timeout)
 
 
 class TestZfsGlibc(TestZfsBase):

--===============8555565606295064678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8555565606295064678==--
