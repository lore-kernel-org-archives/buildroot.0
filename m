Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3212C2BA1B
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 21:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B809E60638;
	Wed, 12 Mar 2025 21:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNlLutLKdIf0; Wed, 12 Mar 2025 21:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF16F60D5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF16F60D5A;
	Wed, 12 Mar 2025 21:56:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E9142375
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 21:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 429EC60B77
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 21:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtnproO_iWvQ for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 21:56:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65D7B60BC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65D7B60BC6
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 21:56:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 538E487ED8; Wed, 12 Mar 2025 21:56:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Mar 2025 22:53:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a199751e5bbfede9e9879d4bfb0bec7c9f4aa871
X-Git-Newrev: 6979ee5db031caecec362d908cca17952c0b1e4a
X-Patchwork-Hint: ignore
Message-Id: <20250312215630.538E487ED8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{odb,
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
