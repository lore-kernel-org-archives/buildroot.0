Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40532C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 20:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA9E41D1C;
	Tue,  1 Jul 2025 20:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ha-1EdGwcKNy; Tue,  1 Jul 2025 20:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF314194C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DF314194C;
	Tue,  1 Jul 2025 20:14:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D8A179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE9A24194C
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQoW3pbZ-9_L for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 20:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F230840C7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F230840C7C
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:14:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF64D85171; Tue,  1 Jul 2025 20:14:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Jul 2025 21:48:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 901b9e19ed3741d0cc379ff8f145b2294a3bd09b
X-Git-Newrev: a6ddf2b91ddd037eaca947fdc99135f63fa0755c
X-Patchwork-Hint: ignore
Message-Id: <20250701201435.CF64D85171@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: enable lpxelinux for
 syslinux runtime test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a6ddf2b91ddd037eaca947fdc99135f63fa0755c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The syslinux runtime test (which is in fact a build-only test) ensures
that syslinux does get build at least once a week (via the gitlab-CI
weekly pipeline). Runtime testing would need much more work, though, but
nothing in syslinux is currently runtime tested anyway.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
