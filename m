Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2DDF55105
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 20:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10FB583A62;
	Sat,  7 Mar 2026 20:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zLG8hQgGPmb; Sat,  7 Mar 2026 20:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49FCA83A88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772916632;
	bh=Z2wjpkxblEgTvj6Di1XQ2yJwcSsXWniluS2FhRc9Y+k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h4KI8utSQwsYBz2gluPFYkRAg0bj+EWSj1boQeg8dSNY7G5qCWoEzzZo/yYKxyzks
	 Ed4Nra4f5BF5vSOPe14LwvKmU+qzvpGJOkGbnNQbcMTe99+bRp65NpJEWaMlKaT8lf
	 7G5kKlgiCuHiesd79OyP/nU1dXy6FVvtYojm0bpKQbDdt5itHKU/Q+mz9bSa6SJPUx
	 7kJMsPeJANjDCJSYVMqpgICzP74g1Uf9MXcoBV+Le2Fi34XJYVF3p0eUlMlsINQmzG
	 JJNsdcHputmrzkl0LfGXHW7UYaQJ91C29a3TuL3bO9S8PvKx0CZlfya0ukFX6d7Hi1
	 ZaVJ31eakXy1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49FCA83A88;
	Sat,  7 Mar 2026 20:50:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C7EC158
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1279A60B05
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3IFkC8jdPta for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C71760AD3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C71760AD3
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6720C85A85; Sat,  7 Mar 2026 20:50:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 21:37:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c49eb8e3581de0641639804b21d87214019ee8e
X-Git-Newrev: 6b50692032ef1e284589822471d02eb92f446564
X-Patchwork-Hint: ignore
Message-Id: <20260307205030.6720C85A85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtorrent-rasterbar: bump version
 to 1.2.20
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b50692032ef1e284589822471d02eb92f446564
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/arvidn/libtorrent/releases/tag/v1.2.20

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.hash | 2 +-
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
index b1abe85d84..6b6175d9de 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eee8e99548dc5eb5e643e49db9202f4f97112c032dba883dfdc8144af5b6e40e  libtorrent-rasterbar-1.2.19.tar.gz
+sha256  ccbf8e8c21dc81635de95166b498922b4725f9725a23b2cfe2a6b2fead6fb9fc  libtorrent-rasterbar-1.2.20.tar.gz
 sha256  f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8  COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 6b497bbe58..2cc24c487a 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTORRENT_RASTERBAR_VERSION = 1.2.19
+LIBTORRENT_RASTERBAR_VERSION = 1.2.20
 LIBTORRENT_RASTERBAR_SITE = \
 	https://github.com/arvidn/libtorrent/releases/download/v$(LIBTORRENT_RASTERBAR_VERSION)
 LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
