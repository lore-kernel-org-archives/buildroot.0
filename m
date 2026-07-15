Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423B6C44508
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E61024066A;
	Wed, 15 Jul 2026 19:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6am9zngqfOh; Wed, 15 Jul 2026 19:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C5E40675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784142331;
	bh=IhwxhNokBR/oQuPwbIfK9lPY/sd59TzsTHyDwP/GlOs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b4yQA9RKdlcaxc4KTsnFVcpYSUn1OLpFVfEpGI8UKPFvcWTHygtVZzZm+W2SxmokN
	 jsVkbwQ0JLUpTsgegf6ZXeRLSI/rnP9GtjKicZtsYX+pMDEEFhfbHmAmNedp8td9rD
	 lavoJRW8G9UfFRh/t1xwLFOSb5CaGBoxUS1D0IHT+zmzQvD2K1AgzsaK3dUjrJeG3V
	 T0ew1j3E1kXnffNaD2yzBTVNHEX3B51z+fH0tyMwT/DNwy+j4Aeb7sozc747hPkF68
	 A8Nk0TdfV0Hu0/ni9lDCpAhm12FQYWGVKpNdJwuPpckyVSCNu88XTXAypN8RJPK7pv
	 /7sW5Bo5SrW4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C5E40675;
	Wed, 15 Jul 2026 19:05:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB28B320
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCE9F60621
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wryoDZgLtSR3 for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 297A0605C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 297A0605C9
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:05:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE2548896E; Wed, 15 Jul 2026 19:04:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 20:53:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b9fd8fd9b2984aebd0a51c39d2071c247d79d07
X-Git-Newrev: 96aac440dd79aeb7e1492247a59b01e52456280d
X-Patchwork-Hint: ignore
Message-Id: <20260715190452.BE2548896E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: bump version to 1.23.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96aac440dd79aeb7e1492247a59b01e52456280d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The go-mod has changed with upstream commit 870378ba1685 (Move skopeo to
go.podman.io), so adapt appropriately.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien: remove extra "." in commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index 20ceebeb8a..abd68d13f7 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b6e1f208c1048f7a80613e8154774e6a3fdc891aeb45325c8ed905be4dee48d8  skopeo-1.22.2-go2.tar.gz
+sha256  de96bfc2bb523c852af675ffdadd934484812ce190aa8620e1d5fd6c51442e25  skopeo-1.23.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index fe9becaaa6..c2fe201c7c 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.22.2
+SKOPEO_VERSION = 1.23.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
@@ -29,9 +29,11 @@ HOST_SKOPEO_DEPENDENCIES = \
 	host-pkgconf
 
 SKOPEO_GO_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/lib/pkgconfig
+SKOPEO_GOMOD = go.podman.io/skopeo
 SKOPEO_BUILD_TARGETS = cmd/skopeo
 
 HOST_SKOPEO_GO_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/lib/pkgconfig
+HOST_SKOPEO_GOMOD = go.podman.io/skopeo
 HOST_SKOPEO_BUILD_TARGETS = cmd/skopeo
 
 $(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
