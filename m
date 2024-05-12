Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AAFC25B5F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10C6C401CC;
	Sun, 12 May 2024 07:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kes3UAUC4b2d; Sun, 12 May 2024 07:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1722F403E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1722F403E2;
	Sun, 12 May 2024 07:05:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B0381BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55B114221D
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaSL5Y1C6EwX for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:05:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B76041F1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B76041F1B
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:05:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54EB487007; Sun, 12 May 2024 07:05:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 09:04:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e22e55abe471fabb9cdbdde1d63d1f5bbabe56df
X-Git-Newrev: 71c9da92b2e5af27cb4af915142e8604bf563740
X-Patchwork-Hint: ignore
Message-Id: <20240512070513.54EB487007@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_python_hid.py: drop unneeded explicit
 hidapi package
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

commit: https://git.buildroot.net/buildroot/commit/?id=71c9da92b2e5af27cb4af915142e8604bf563740
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-hid package got tweaked when applied in commit 4432b087902
(package/python-hid: new package) so it now selects
BR2_PACKAGE_HIDAPI, and we therefore do not need to explicitly enable
hidapi in the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python_hid.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_hid.py b/support/testing/tests/package/test_python_hid.py
index b7a280b766..68cefa8682 100644
--- a/support/testing/tests/package/test_python_hid.py
+++ b/support/testing/tests/package/test_python_hid.py
@@ -8,6 +8,5 @@ class TestPythonHid(TestPythonPackageBase):
         BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_HID=y
-        BR2_PACKAGE_HIDAPI=y
         """
     sample_scripts = ["tests/package/sample_python_hid.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
