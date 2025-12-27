Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9058FE8FDCD
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34631607AF;
	Sat, 27 Dec 2025 15:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9YlCZCUmZ6i; Sat, 27 Dec 2025 15:53:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F471607B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766850817;
	bh=f7b3qy9g6gR4cDFAkWyYiPA8QFQMFFrYDrYAYTWlTG0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fldrhyc9+AbiukJD8zgG9Pgn2SNKuUlDA1LPxyyEt5B5LDruPvZZy2VggfTcffeZ5
	 eb81+d95fgNLHv6OV5Dgn55iXZZacoBZ/wbaSjPDE2X4mMEJVNvZhXHWmz3ldW0EQv
	 4HKks2kRKSYogOIbGXNk2vZ3BDM/SS3vUoS9Te5NtF6zNJkoxZ/lVpF8SgdqmfN6Z9
	 LyKYGVMeXFu8q1igBxiwByzJXkhm0AkBjhL4UUBe8bJ+SDhO6yKu9kY8d2TtMGUFS0
	 KVKorhNyPPYnpYr2dlqQIEtbIkEC1mZ09On624cv2IO37mBaqkETn832FIo10K/pRF
	 RRBuWb5mDKUgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F471607B5;
	Sat, 27 Dec 2025 15:53:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 222B8D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D3CB40290
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlGFT9BvYTBM for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 694C640292
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 694C640292
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4630487798; Sat, 27 Dec 2025 15:53:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:53:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c9ec285796dd5bd7db39f11b74392534b028355
X-Git-Newrev: 016365cfe3f713541ddebad6d9c8d47973393238
X-Patchwork-Hint: ignore
Message-Id: <20251227155330.4630487798@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/upmpdcli: bump version to 1.9.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=016365cfe3f713541ddebad6d9c8d47973393238
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html

Switched _SITE to https.

Switched build system to meson after autotools were removed in version
1.8.10:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html#_2024_04_03_switching_the_build_tools_from_gnu_autotools_to_meson

Remove spotify-related configure option after upstream removed spotify
support:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html#UPMPDCLI-1.7.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/upmpdcli/upmpdcli.hash |  4 ++--
 package/upmpdcli/upmpdcli.mk   | 11 +++--------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index f585a73d7f..58899e0dd3 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.5.12.tar.gz.sha256:
-sha256  1d7b6ab360c2549a7e3eff4f261471761dd837e18327a3ca29de1981c090ff3b  upmpdcli-1.5.12.tar.gz
+# From https://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.9.7.tar.gz.sha256
+sha256  7b10cc35cae9377c542aba3983dfd39e34b4dd5fff64512f54feb87e64cf8609  upmpdcli-1.9.7.tar.gz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 2f001c51ee..d2d91114f3 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,17 +4,12 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.5.12
-UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+UPMPDCLI_VERSION = 1.9.7
+UPMPDCLI_SITE = https://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
 UPMPDCLI_DEPENDENCIES = host-pkgconf libmpdclient libupnpp libmicrohttpd jsoncpp
 
-# Disable spotify plugin which requires dlfcn.h
-ifeq ($(BR2_STATIC_LIBS),y)
-UPMPDCLI_CONF_OPTS += --disable-spotify
-endif
-
 # Upmpdcli only runs if user upmpdcli exists
 define UPMPDCLI_USERS
 	upmpdcli -1 upmpdcli -1 * - - audio Upmpdcli MPD UPnP Renderer Front-End
@@ -35,4 +30,4 @@ endef
 
 UPMPDCLI_POST_INSTALL_TARGET_HOOKS += UPMPDCLI_INSTALL_CONF_FILE
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
