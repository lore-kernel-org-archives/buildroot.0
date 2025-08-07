Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EDFC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 14:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E9136086F;
	Thu,  7 Aug 2025 14:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KS0myn27WsgM; Thu,  7 Aug 2025 14:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8711060823
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8711060823;
	Thu,  7 Aug 2025 14:04:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0799B10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDB1E40172
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXC5nWqbGhdF for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 14:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E5CB400E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E5CB400E3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:04:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C27586FB6; Thu,  7 Aug 2025 14:04:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 16:02:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b15707056f7456c66566b9eb17e2ee23ad533df
X-Git-Newrev: 84a3a8f39a46716b8081bd7bdfac3a9fbbcba28d
X-Patchwork-Hint: ignore
Message-Id: <20250807140439.2C27586FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: bump version to 2.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=84a3a8f39a46716b8081bd7bdfac3a9fbbcba28d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release. From NEWS:

- don't implicitly unquote unnamed lines in gpioinfo
- remove useless variable in reconfigure example
- don't let struct line_config balloon out of control and trigger an OOM
- drop python3-config check from configure.ac

https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=759d831aa8846a5d007cac250f78d74a514e1ec9

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Boerge Struempfel <boerge.struempfel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpiod2/libgpiod2.hash | 2 +-
 package/libgpiod2/libgpiod2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index 2845a0ad94..24bcfafc6c 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  0e948049c309b87c220fb24ee0d605d7cd5b72f22376e608470903fffa2d4b18  libgpiod-2.2.1.tar.xz
+sha256  7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6d4bb1e4a56cfec0d  libgpiod-2.2.2.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index 9b47ab7c2a..c5b53f631b 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.2.1
+LIBGPIOD2_VERSION = 2.2.2
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
