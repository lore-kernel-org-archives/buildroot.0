Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19899D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E702A40E44;
	Tue, 13 Jan 2026 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5Og0wKNqVDh; Tue, 13 Jan 2026 21:00:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13E4F40E43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338034;
	bh=ejTzTMQsXQMg+ISQF5y1L+pv+Fv/B+x5bjraYxw8+6I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UmnfYTWypT6nPizdRFUwLTTGjOskrBWBEnBvB1KlHtyqjT1LvUtgA1GTed/uUcDob
	 nQ59S92KMmL2dHH+pKey5CtG7BmNLjS5yjHKvKY4KOnXthuJsKLxePrHx3IpX6MqaH
	 YTjy0cQiKOuAKDGDX3IiNbQDHdTZ/7WWMbOoul9gq+uHatBp5ETSB8uj9jJ6QYmZg3
	 uN6ea4SZzwqD3DK+C5iFmDT49a//vxilh0HG9AFXjroZuQd5aTpWbs1fn2UzSej1Jo
	 nzWeiuk6LsahOs09l3l5YU+lq9B434S5XVbhB5SF0H1f1gKwGrFW374Lh+DyIvfTMG
	 Hlw9uQgMqtf+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13E4F40E43;
	Tue, 13 Jan 2026 21:00:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DA6A231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3B2540790
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DllA6FrNrygA for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0C254078F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0C254078F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC3F980F55; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86177c0682990ea99497bfb58102130842d0f9ac
X-Git-Newrev: 016e6041c012e32bc936c09b46f8a740c0aa8f3d
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.BC3F980F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_mkfontscale: bump
 version to 1.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=016e6041c012e32bc936c09b46f8a740c0aa8f3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003471.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/mkfontscale/-/commit/a631117eb3d816e8b3fdb969017fc5d3c7357ba3

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash | 8 ++++----
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
index cad6c11365..eab8ddf403 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003144.html
-sha256  8ae3fb5b1fe7436e1f565060acaa3e2918fe745b0e4979b5593968914fe2d5c4  mkfontscale-1.2.2.tar.xz
-sha512  4c846816325347c91008d76b3a5610c1e58a8414fd55117e7ccf51310db4b20b8397ecf6c9177ff77322e27ee088bf034fd175c9210465c50b094bab8dada4b3  mkfontscale-1.2.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003471.html
+sha256  2921cdc344f1acee04bcd6ea1e29565c1308263006e134a9ee38cf9c9d6fe75e  mkfontscale-1.2.3.tar.xz
+sha512  816e7b2885bb7a4b2eb0e506b659600011bfa4ec1a3010243c2cc2241fa0b792f3c8de1dec1855a4d13de89405973967074e379b0d01dcf9de8a1277a2fc4296  mkfontscale-1.2.3.tar.xz
 # Locally computed
-sha256  80df6f5b759f7775042313e4586506db60f26fd15b98b532cf518bd8cf1e8488  COPYING
+sha256  7555388a38693cccb140946065534f4b7743aa334c883209a34f41abaeb62bd1  COPYING
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index 23b2e2283a..915241dfdf 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_MKFONTSCALE_VERSION = 1.2.2
+XAPP_MKFONTSCALE_VERSION = 1.2.3
 XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.xz
-XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_MKFONTSCALE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_MKFONTSCALE_LICENSE = MIT
 XAPP_MKFONTSCALE_LICENSE_FILES = COPYING
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
