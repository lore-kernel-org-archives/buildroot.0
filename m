Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF96CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B82960869;
	Tue,  3 Sep 2024 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKgImQokSsXe; Tue,  3 Sep 2024 19:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D50260878
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D50260878;
	Tue,  3 Sep 2024 19:35:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F29491BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC21540296
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqGcZYv988KI for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4942402EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4942402EE
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0A2486BB5; Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:30:38 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3ff877be290823fbbaf302c1ac57627c9f03e599
X-Git-Newrev: 6ca8443f989049c0a6992bbf46dd0892fb236f74
X-Patchwork-Hint: ignore
Message-Id: <20240903193519.B0A2486BB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: package:
 gpsd: fix test by enabling python support
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ca8443f989049c0a6992bbf46dd0892fb236f74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 9696d27756 "package/gpsd: condition python stuff to the proper
kconfig option" changed the condition in which the gpsd python scripts
are installed. After that change, the "gpsfake" command (which is a
python script) is no longer found and the runtime test is failing.

This commit fixes the issue by reflecting the change in the runtime
test Buildroot configuration.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b6f4d79df21b2affa1ccc5133c44647072d21058)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_gpsd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gpsd.py b/support/testing/tests/package/test_gpsd.py
index 7ca5973981..2c44e25cec 100644
--- a/support/testing/tests/package/test_gpsd.py
+++ b/support/testing/tests/package/test_gpsd.py
@@ -11,7 +11,7 @@ class TestGpsd(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         f"""
         BR2_PACKAGE_GPSD=y
-        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_GPSD_PYTHON=y
         BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
