Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D458FC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 08:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56E3F428B9;
	Thu,  6 Jan 2022 08:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NP5Bt42UK1n; Thu,  6 Jan 2022 08:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0EF2428B6;
	Thu,  6 Jan 2022 08:38:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2A611BF422
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9BF2428BE
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zf86E9E2d3TV for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 08:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 067F1428B4
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 08:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B181283342; Thu,  6 Jan 2022 08:32:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 09:34:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63b72a7c15bcd56fe1570e3f7ecd43993c0fde90
X-Git-Newrev: a2f11c0cbf312b339ae9c686a7734494a096ec24
X-Patchwork-Hint: ignore
Message-Id: <20220106083242.B181283342@busybox.osuosl.org>
Subject: [Buildroot] [git commit] testing/infra: Add docstrings to base test
 classes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2f11c0cbf312b339ae9c686a7734494a096ec24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It wasn't immediately obvious to me what the two Buildroot base test
classes were for, so add docstrings to explain the differences between
BRConfigTest and BRTest.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/infra/basetest.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index a97a814441..96c6848dfc 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -29,6 +29,7 @@ MINIMAL_CONFIG = \
 
 
 class BRConfigTest(unittest.TestCase):
+    """Test up to the configure stage."""
     config = None
     br2_external = list()
     downloaddir = None
@@ -66,6 +67,7 @@ class BRConfigTest(unittest.TestCase):
 
 
 class BRTest(BRConfigTest):
+    """Test up to the build stage and instantiate an emulator."""
     def __init__(self, names):
         super(BRTest, self).__init__(names)
         self.emulator = None
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
