Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FD2FD9E11
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F656407DE;
	Thu, 26 Feb 2026 20:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6pWhp4g2I2h; Thu, 26 Feb 2026 20:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BFAE407C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138654;
	bh=tU7k3TzqsHyVhuIqA3ICM7enqneUxzv4t1xbslXKmOw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AcJQA6RU9zuJGlQSDhq+vtiqN15EJ5+p0BlZapxb6ckOIqVndRCo49qbqmk4FRIh4
	 a87FPeNwqEbI1zq4g3psxD+PP/WmRnR2Vd8nHoRdOB3Dsbjbh8pGJpDqEQd91/f7MF
	 397QXzyBZOOHI6q9VHXcVibPH9Rai5OvncvOBs9YiyDH+NAwAblINaHWOkI4NKR4AU
	 yyvy7RhAonwLbA1zSHUYzGEHZ6Yu+f/BB05K/51fHG6H9k3GlwwZJPJOn2RM7qnULD
	 MyByiUObvi0MTRvZIEvZpuaoKdZEN0t6WMnVAAtS+x9E5ZLmqIzsmLzuxbDnN3gEj3
	 8JTeJvnVrT2Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BFAE407C9;
	Thu, 26 Feb 2026 20:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45AD01F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8763B40757
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWhI4sjQ2lFE for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BACEA4074E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BACEA4074E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B025F87506; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:24:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9677c64019e9875f51ff92bb13f7d6ce4980b226
X-Git-Newrev: 9cbe77ae94efadd4f2b2a35457c7683ecc846c36
X-Patchwork-Hint: ignore
Message-Id: <20260226204356.B025F87506@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/openblocks_a6:
 specify Linux license file
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9cbe77ae94efadd4f2b2a35457c7683ecc846c36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The used Linux kernel (4.14.336) does not contain the default license files
as those were only added in 4.16 with commit e00a844aca ("LICENSES: Add
Linux syscall note exception"), so specify the correct license file to fix:

make legal-info
..
cp: cannot stat '/path/to/output/build/linux-headers-4.14.336/LICENSES/preferred/GPL-2.0': No such file or directory

And add the sha256sum to the .hash file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien:
 - reword commit title
 - actually add BR2_LINUX_KERNEL_LICENSE_FILES in defconfig
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e78a710e8fefaf722d45d8031e542be5c5718e0e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/openblocks/a6/patches/linux/linux.hash | 1 +
 configs/openblocks_a6_defconfig              | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/openblocks/a6/patches/linux/linux.hash b/board/openblocks/a6/patches/linux/linux.hash
index b207306a2b..aa432012b0 100644
--- a/board/openblocks/a6/patches/linux/linux.hash
+++ b/board/openblocks/a6/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
+sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
index 754ec53937..e0ce4aa3fb 100644
--- a/configs/openblocks_a6_defconfig
+++ b/configs/openblocks_a6_defconfig
@@ -8,6 +8,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.336"
+BR2_LINUX_KERNEL_LICENSE_FILES="COPYING"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
