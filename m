Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E325D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8E128025C;
	Tue, 13 Jan 2026 21:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHlFx75oclMb; Tue, 13 Jan 2026 21:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3F8A84080
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338041;
	bh=HJbMcUVgkgCK8cmhjzGpnqZzJhAPeEoWGeyL4+Q1y1I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QXpYcFKr+2rmRPSwSTVZMINX2lI5oerPkr3mGEgPaFytBcn619dKtRfLq5fpVwhPb
	 DeovxlGjy5EBnSgqFxquCJJRGK/yChD6d1NuV+vTJKX69Wd7YCNStwrRWWGyWYJlDs
	 aNijFlFI0S12bgPeIbgtNrMDkGvGa/2gSPWdNVwTZPwj2rdrk49NqQ1Mm8oQjn4IOK
	 NIw5CGdhxvN7dsnfbfGVf82o71Nkdk8IJHkH0GSoMIbqWjrsJ2Xq5fZT0Uas5lsJW6
	 too/EPxknyLQCJI5NUX0s3av66Gv6wHlbZ7XfWyh6RKUURkJaIFYNnxJ3yfY/n/Ehi
	 8FsFrVz8whdBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F8A84080;
	Tue, 13 Jan 2026 21:00:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F233231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8FB24079E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfOyXO0I4rse for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BF9D4079F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BF9D4079F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A22580E26; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdd7607b53d6baa26d9613380feb10c8f87c599e
X-Git-Newrev: 965a86b38ab6d9d74db5f114929a3eed3106ae01
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.5A22580E26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xbiff: bump version to
 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=965a86b38ab6d9d74db5f114929a3eed3106ae01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-January/003445.html

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xbiff/xapp_xbiff.hash | 8 +++-----
 package/x11r7/xapp_xbiff/xapp_xbiff.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.hash b/package/x11r7/xapp_xbiff/xapp_xbiff.hash
index 690c932e37..20fb16ca0f 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.hash
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003009.html
-md5  66dd3ebd6351b1911b831b89b2dba8ec  xbiff-1.0.4.tar.bz2
-sha1  193c0a2be1f7f374bb9d32217a198c92a63619e8  xbiff-1.0.4.tar.bz2
-sha256  e1e1a39628a5678585008ef7fb1ff2864edaaa0e062989c2331f8c74e0fec971  xbiff-1.0.4.tar.bz2
-sha512  0fb920a08640ec59f23d8a8a47bd244565dfbaff7a21c38a8a2abe1edb5eacabc970b5dbdc409163fc444fde5b75a2dc4e0114312938efec5b77228f3bf785ac  xbiff-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-January/003445.html
+sha256  cffb10e2488b09695da8377f395a4fed6d33f5eb9691322ebaa969e8ead7b0c2  xbiff-1.0.5.tar.xz
+sha512  4dd8943daf670dffb6e108b192977f6ad313d6b0535da0c809699e05f0509aba45be81c72af341e1fef31f59d0a5f209d87441230b3fdcecb4a7a8fe7a9c0658  xbiff-1.0.5.tar.xz
 # Locally computed
 sha256  9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index 2c3975c167..5c626acf19 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XBIFF_VERSION = 1.0.4
-XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
+XAPP_XBIFF_VERSION = 1.0.5
+XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.xz
 XAPP_XBIFF_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XBIFF_LICENSE = MIT
 XAPP_XBIFF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
