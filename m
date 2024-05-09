Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C1AC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55B9F41F2B;
	Thu,  9 May 2024 17:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Nqsd87S_K4Z; Thu,  9 May 2024 17:24:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDF2341F2F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF2341F2F;
	Thu,  9 May 2024 17:24:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 107421BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6201B80F21
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxJ_yvnciy2R for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 814EC80FB7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 814EC80FB7
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:23:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E64486D3A; Thu,  9 May 2024 17:23:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 19:18:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c956bb7e3974b8769f6160a99309e9d2b06c57a
X-Git-Newrev: 1223c116665a3fb5ec44218b5f256d813dc1a28f
X-Patchwork-Hint: ignore
Message-Id: <20240509172345.7E64486D3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: fix URLs to some of the Java
 binaries
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1223c116665a3fb5ec44218b5f256d813dc1a28f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The URL at https://dlcdn.apache.org/commons only contains the latest
version... and it has already disappeared.

Instead, use https://archive.apache.org/dist/commons/, which contains
all previous versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi/kodi.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 97c60d49aa..09342ea1f0 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -64,8 +64,8 @@ KODI_LIBDVDNAV_VERSION = 6.1.1-Next-Nexus-Alpha2-2
 KODI_LIBDVDREAD_VERSION = 6.1.3-Next-Nexus-Alpha2-2
 KODI_EXTRA_DOWNLOADS += \
 	https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-groovy-binary-4.0.16.zip \
-	https://dlcdn.apache.org/commons/lang/binaries/commons-lang3-3.14.0-bin.tar.gz \
-	https://dlcdn.apache.org/commons/text/binaries/commons-text-1.11.0-bin.tar.gz \
+	https://archive.apache.org/dist/commons/lang/binaries/commons-lang3-3.14.0-bin.tar.gz \
+	https://archive.apache.org/dist/commons/text/binaries/commons-text-1.11.0-bin.tar.gz \
 	$(call github,xbmc,libdvdcss,$(KODI_LIBDVDCSS_VERSION))/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	$(call github,xbmc,libdvdnav,$(KODI_LIBDVDNAV_VERSION))/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	$(call github,xbmc,libdvdread,$(KODI_LIBDVDREAD_VERSION))/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
