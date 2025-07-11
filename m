Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4AAC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE034181F;
	Thu, 17 Jul 2025 20:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJ6lC67ExIax; Thu, 17 Jul 2025 20:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE56A41820
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE56A41820;
	Thu, 17 Jul 2025 20:33:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB3D1A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98C126072A
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4elPljs5cTe for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAB8460666
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAB8460666
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C82AE86673; Thu, 17 Jul 2025 20:32:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 13:08:23 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 0493fe6fe210960e9eed7ceffe46906567f9a6dd
X-Git-Newrev: 538eaa586f628da9456be08190c80f4267a4c275
X-Patchwork-Hint: ignore
Message-Id: <20250717203255.C82AE86673@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] Revert "support/testing:
 enable lpxelinux for syslinux runtime test"
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

commit: https://git.buildroot.net/buildroot/commit/?id=538eaa586f628da9456be08190c80f4267a4c275
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This reverts commit 5d6d1da5e4da4c4184e16b06c6f8deab9eb8217b.

LPXELINUX is not present on 2025.05.x

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/boot/test_syslinux.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
index 17fe904263..41152cde7e 100644
--- a/support/testing/tests/boot/test_syslinux.py
+++ b/support/testing/tests/boot/test_syslinux.py
@@ -21,7 +21,6 @@ class TestSysLinuxBase(infra.basetest.BRTest):
         """
         BR2_TARGET_SYSLINUX=y
         BR2_TARGET_SYSLINUX_ISOLINUX=y
-        BR2_TARGET_SYSLINUX_LPXELINUX=y
         BR2_TARGET_SYSLINUX_PXELINUX=y
         BR2_TARGET_SYSLINUX_MBR=y
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
