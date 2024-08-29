Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078C7C71151
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 06:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23DF7412F5;
	Thu, 29 Aug 2024 06:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tH2OMZd6e82v; Thu, 29 Aug 2024 06:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BADA0412F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BADA0412F6;
	Thu, 29 Aug 2024 06:20:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 178951BF98E
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04DD2404DB
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzoJkpOHI59H for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 06:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09ED040207
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09ED040207
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:20:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F39B08661C; Thu, 29 Aug 2024 06:20:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 08:00:43 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cd8402978f4562891ed47fb068b88d5d754797e4
X-Git-Newrev: cc03fb2d1a83a89b4754c08430fb5a524d204507
X-Patchwork-Hint: ignore
Message-Id: <20240829062033.F39B08661C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] docs/manual: promote
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
Content-Type: multipart/mixed; boundary="===============1001662328128956034=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1001662328128956034==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cc03fb2d1a83a89b4754c08430fb5a524d204507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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

--===============1001662328128956034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1001662328128956034==--
