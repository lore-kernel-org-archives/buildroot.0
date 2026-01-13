Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABD6D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC5CD40CB9;
	Tue, 13 Jan 2026 20:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sym4orEqG3Oy; Tue, 13 Jan 2026 20:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2305840CA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337944;
	bh=9T1RFAAr60lJItUjI1tmUJ2CJmH/5p95y/Mnzfqt7lM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SKxIW4RwzWMLMGfMvhnAJoCVGLYL9EUVMVwNqf+4tPSYwlJmN9vEOpLt9LFEZ5Jsz
	 JpspEwoC1CNV10j2IURX9fzi4cdhlA/Z/wdNouuihWSdFG3udJZGuBlJGSByeAz+RH
	 2Gk94qHd9aPTtYo8z6wYddxgyNh+1C51LNqxOPyToT3CA5ugmSF3+8LR8uS1Ap2NQ4
	 PKkblRfRrrQPqsRe4KzSyKDJOeyqfxq50yUwAYoAkTGT9aIPHRM4DQpUxAZh1Xilpy
	 6k+seEM2mQ4k8VAOsh0kFwCPlZLmLiBGmUYiBstX7sRarIGdiDC8OGoyrK+DcaquEO
	 g3WotPkGbI6VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2305840CA9;
	Tue, 13 Jan 2026 20:59:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 311C01CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33A5380839
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xEioLqtwKUIK for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A1278101A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A1278101A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B0C08254B; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb760e4da06b1a412e224a87853183383f722987
X-Git-Newrev: 4ac3cddf7b6af137fb819ca928043973eb1fdc4c
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.6B0C08254B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xcmsdb: bump version to
 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ac3cddf7b6af137fb819ca928043973eb1fdc4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-October/003534.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash | 6 +++---
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
index 7590580d88..9625891d34 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003172.html
-sha256  3c77eec4537d5942bb0966973b787bfdaf7121f3125ffa81bb1c9708d4cf4f55  xcmsdb-1.0.6.tar.xz
-sha512  e47d9498ce496effbc44a66e70af91d9fe65c344a17916fd4990a4c84fa8879aa09b6695aeb6ef595f475c16a13c7c31d4c48449234564de7de38d7436764fae  xcmsdb-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003534.html
+sha256  5ec4068e488187b05ea92ee1362c96b78a90f19ccc7a1844c5921d70626bbc38  xcmsdb-1.0.7.tar.xz
+sha512  87bd13930385c16689bfb6eefe47860f3741ccede9ddee4a860bb763937828808aca2c2fcc56637c06c3b9f1a5ee5ffd5cadc039d93ff7b2375a004867ef9f22  xcmsdb-1.0.7.tar.xz
 # Locally computed
 sha256  c3bd4ac91beb08fee5272b17a3ddee8d2791cc5eaee5bce5271042a45fa4fa6a  COPYING
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index 4af341a027..7af3ab303b 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCMSDB_VERSION = 1.0.6
+XAPP_XCMSDB_VERSION = 1.0.7
 XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.xz
-XAPP_XCMSDB_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XCMSDB_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCMSDB_LICENSE = MIT
 XAPP_XCMSDB_LICENSE_FILES = COPYING
 XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
