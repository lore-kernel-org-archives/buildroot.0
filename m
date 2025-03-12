Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E546C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E8F58210C;
	Mon, 19 May 2025 10:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgL_PfKKyd2v; Mon, 19 May 2025 10:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4199E81F96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4199E81F96;
	Mon, 19 May 2025 10:40:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08AADE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A10D40D52
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PO5fY-ToJee7 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38D2840D56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38D2840D56
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36F3C872E7; Mon, 19 May 2025 10:39:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Mar 2025 22:53:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a199751e5bbfede9e9879d4bfb0bec7c9f4aa871
X-Git-Newrev: 6979ee5db031caecec362d908cca17952c0b1e4a
X-Patchwork-Hint: ignore
Message-Id: <20250519103942.36F3C872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{odb,
 sdbusplus}: use "host <foo>" prompt
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

commit: https://git.buildroot.net/buildroot/commit/?id=6979ee5db031caecec362d908cca17952c0b1e4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For consistency with the other host packages.

Signed-off-by: Yevhen Babiichuk (DustDFG) <dfgdust@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/odb/Config.in.host       | 2 +-
 package/sdbusplus/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/odb/Config.in.host b/package/odb/Config.in.host
index e80a141be6..bff3142ee5 100644
--- a/package/odb/Config.in.host
+++ b/package/odb/Config.in.host
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HOST_ODB
-	bool "host-odb"
+	bool "host odb"
 	select BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
 	help
 	  This is a compiler that takes a specially crafted c++ header
diff --git a/package/sdbusplus/Config.in.host b/package/sdbusplus/Config.in.host
index 2b1d1ce31d..a9f8afe02b 100644
--- a/package/sdbusplus/Config.in.host
+++ b/package/sdbusplus/Config.in.host
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HOST_SDBUSPLUS
-	bool "host-sdbusplus"
+	bool "host sdbusplus"
 	select BR2_PACKAGE_HOST_PKGCONF
 	help
 	  A C++ library for sd-bus with a bindings and doc generator.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
