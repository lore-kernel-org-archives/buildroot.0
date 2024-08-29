Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EFBC761AE
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 06:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A026406FD;
	Thu, 29 Aug 2024 06:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6Hj5hQBwGdK; Thu, 29 Aug 2024 06:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 545004072F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 545004072F;
	Thu, 29 Aug 2024 06:22:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C190C1BF867
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC13D8145A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qh8Ut24c2a1o for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 06:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3F218144B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3F218144B
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:22:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1F9E8661C; Thu, 29 Aug 2024 06:22:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 08:00:37 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: e3b8078432404c0d4312e5b84788d1dd6502a008
X-Git-Newrev: cdc2e042a1dbed4a197d54feac74f62577096bd6
X-Patchwork-Hint: ignore
Message-Id: <20240829062205.D1F9E8661C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] docs/manual: promote
 using fixed version for kernel headers when contributing a board
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
Content-Type: multipart/mixed; boundary="===============1496101462345402109=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1496101462345402109==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cdc2e042a1dbed4a197d54feac74f62577096bd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

When the default (newest) kernel headers series changes the build can
break. Example error message:

  Incorrect selection of kernel headers: expected 6.8.x, got 6.5.x

In the above case the defconfig used:

  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.5.9"

The kernel headers were not specified, so the build defaulted to using
the kernel sources as header source and the default (newest) header
series. From .config:

  BR2_KERNEL_HEADERS_AS_KERNEL=y
  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y

Signed-off-by: Gero Schwäricke <gero.schwaericke@posteo.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit eb519ad7cc716347dbf0f9707ff282a97b21f623)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-board-support.adoc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-board-support.adoc b/docs/manual/adding-board-support.adoc
index 9501262086..be7699668d 100644
--- a/docs/manual/adding-board-support.adoc
+++ b/docs/manual/adding-board-support.adoc
@@ -32,7 +32,11 @@ Always use fixed versions or commit hashes for the different
 components, not the "latest" version. For example, set
 +BR2_LINUX_KERNEL_CUSTOM_VERSION=y+ and
 +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE+ to the kernel version you tested
-with.
+with. If you are using the buildroot toolchain +BR2_TOOLCHAIN_BUILDROOT+
+(which is the default), additionally ensure that the same kernel headers
+are used (+BR2_KERNEL_HEADERS_AS_KERNEL+, which is also the default) and
+set the custom kernel headers series to match your kernel version
+(+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_*+).
 
 It is recommended to use as much as possible upstream versions of the
 Linux kernel and bootloaders, and to use as much as possible default

--===============1496101462345402109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1496101462345402109==--
