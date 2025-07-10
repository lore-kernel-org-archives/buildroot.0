Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711A2C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4599560E4F;
	Fri, 11 Jul 2025 10:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NvmcjJeXU47; Fri, 11 Jul 2025 10:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 711E660B24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 711E660B24;
	Fri, 11 Jul 2025 10:21:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B82D199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39C37403E4
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rITFScfp1Sg5 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0EFD405C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0EFD405C8
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91C5986353; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:31:41 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 7569ec2a6ccaddea9679af6ffe77e5edf4c77e4c
X-Git-Newrev: 5d6d1da5e4da4c4184e16b06c6f8deab9eb8217b
X-Patchwork-Hint: ignore
Message-Id: <20250711102103.91C5986353@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] support/testing: enable
 lpxelinux for syslinux runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d6d1da5e4da4c4184e16b06c6f8deab9eb8217b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The syslinux runtime test (which is in fact a build-only test) ensures
that syslinux does get build at least once a week (via the gitlab-CI
weekly pipeline). Runtime testing would need much more work, though, but
nothing in syslinux is currently runtime tested anyway.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a6ddf2b91ddd037eaca947fdc99135f63fa0755c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/boot/test_syslinux.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
index 41152cde7e..17fe904263 100644
--- a/support/testing/tests/boot/test_syslinux.py
+++ b/support/testing/tests/boot/test_syslinux.py
@@ -21,6 +21,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
         """
         BR2_TARGET_SYSLINUX=y
         BR2_TARGET_SYSLINUX_ISOLINUX=y
+        BR2_TARGET_SYSLINUX_LPXELINUX=y
         BR2_TARGET_SYSLINUX_PXELINUX=y
         BR2_TARGET_SYSLINUX_MBR=y
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
