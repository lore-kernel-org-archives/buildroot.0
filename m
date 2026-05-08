Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53100CD342F
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 08:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0184041AB2;
	Fri,  8 May 2026 08:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6x3-OtCN4IeM; Fri,  8 May 2026 08:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3110D417A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778230319;
	bh=dEe9aWSgMloPC0sLloMR16WE2cATfCTfdVOamGZC5J4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=inFN2CknWu/P14iADJjxA+HEs5fGZBYgA+/yrR9dTPftbjtp/66Op9eMktKRDM5Uz
	 yFbgUfLA3mWQuZ73zdaVcBKY56UGn5wlJAbecU5nJ5akbYlOJ6Zq3iHZSuMopndH0p
	 86kbnO09OqPbcorODnGePs+io7Jh/rtpFdvh7UwBSTdS5bHlXjrv6y8HfuIgQ/mi3X
	 ZE6YEuQcuEtfY3xz+ADuBuchILBDO52xVzeK+MRrwAPx8FF8PwI8ID8wuwav0CzvnI
	 LEOl92ea7ogLxLANyXX6ACeugxwyo9eur4/yk3dCBOhHNpK9PVudD1MNQyX60RHHoL
	 fcjaJrDa3QLmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3110D417A0;
	Fri,  8 May 2026 08:51:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2C6E317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B81B8841D0
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWpj6IuvttYb for <buildroot@buildroot.org>;
 Fri,  8 May 2026 08:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD073841CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD073841CF
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:51:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9ED0D854C8; Fri,  8 May 2026 08:51:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 May 2026 10:29:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e049f6fef1fd1e1b0b6095e0ff9113312a7d7f81
X-Git-Newrev: 108f51c1b35479a8c1c3c3d9ab58589ef26217f3
X-Patchwork-Hint: ignore
Message-Id: <20260508085154.9ED0D854C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bubblewrap: security bump to
 version 0.11.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/108f51c1b35479a8c1c3c3d9ab58589ef26217f3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-41163, which affects any system using bubblewrap 0.11.x
using a setuid bubblewrap.

Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.11.2

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bubblewrap/bubblewrap.hash | 5 ++---
 package/bubblewrap/bubblewrap.mk   | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index 696c20ee07..e87d3c81cb 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,6 +1,5 @@
-# Also checked GPG signature from
-# https://github.com/containers/bubblewrap/releases/tag/v0.11.1
-sha256  c1b7455a1283b1295879a46d5f001dfd088c0bb0f238abb5e128b3583a246f71  bubblewrap-0.11.1.tar.xz
+# From https://github.com/containers/bubblewrap/releases/download/v0.11.2/bubblewrap-0.11.2.tar.xz.sha256sum
+sha256  69abc30005d2186baf7737feacd8da35633b93cf5af38838ecff17c5f8e924f6  bubblewrap-0.11.2.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index afbb29eab9..7838ab90b3 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.11.1
+BUBBLEWRAP_VERSION = 0.11.2
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
@@ -18,6 +18,7 @@ BUBBLEWRAP_CONF_OPTS = \
 	-Dman=disabled \
 	-Dpython=$(HOST_DIR)/bin/python \
 	-Drequire_userns=false \
+	-Dsupport_setuid=true \
 	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
