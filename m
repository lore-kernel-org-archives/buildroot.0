Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EFCC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5261C84167;
	Mon, 19 May 2025 10:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJfeh4xRAiCV; Mon, 19 May 2025 10:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88F6584169
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88F6584169;
	Mon, 19 May 2025 10:49:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D9FFD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8883441457
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oelWc0zO9wdA for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01CB540DCB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01CB540DCB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFF2784A21; Mon, 19 May 2025 10:39:48 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Apr 2025 13:59:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b74d876a9e064cc510e34952e3aad585e231468b
X-Git-Newrev: cac028add66c046b8f93137dbcc41138938e29ea
X-Patchwork-Hint: ignore
Message-Id: <20250519103948.EFF2784A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/hifive_unleashed: add
 missing uboot custom hash file
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cac028add66c046b8f93137dbcc41138938e29ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit [1] enabled BR2_DOWNLOAD_FORCE_CHECK_HASHES for
hifive_unleashed_defconfig and added custom hash files. But it forgot
to add the custom hash for uboot. It was not detected at that time
because the U-Boot version was the same as the default "latest"
version and was providing its hash.

This defconfig fails to build since the default "latest" was bumped
in commit [2].

This commit fixes the issue by adding the missing uboot hash.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167050

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/1ba1055d3da2d98874aae1eedf1983a2ed933605
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/c14ce5346d969e660cc788f2f4d8619b27c805a2

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/sifive/hifive-unleashed/patches/uboot/uboot.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/sifive/hifive-unleashed/patches/uboot/uboot.hash b/board/sifive/hifive-unleashed/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..50674352d7
--- /dev/null
+++ b/board/sifive/hifive-unleashed/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
