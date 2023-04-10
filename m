Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBD3C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE82060644;
	Mon, 10 Apr 2023 19:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE82060644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7e8KDHZBRePx; Mon, 10 Apr 2023 19:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5DD26FF05;
	Mon, 10 Apr 2023 19:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5DD26FF05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3B81BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 155A381376
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 155A381376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F57aHHBYOmhJ for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:43:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35A3C81373
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A3C81373
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2288583DDA; Mon, 10 Apr 2023 19:43:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:32:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38b798da73ba69c9e1d8279805b621f80b98bc64
X-Git-Newrev: 5d03d2346a993f55762e14d6a697be2e98a59eea
X-Patchwork-Hint: ignore
Message-Id: <20230410194348.2288583DDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libv4l: bump version to 1.24.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d03d2346a993f55762e14d6a697be2e98a59eea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- disable new v4l2-tracer option (fails to compile with rpi4_64 configuration)

For details see [1].

[1] https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=stable-1.24

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libv4l/libv4l.hash | 2 +-
 package/libv4l/libv4l.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index d99d5e0992..4f694de34b 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
 # https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.20.0.tar.bz2.asc
 # with key 05D0169C26E41593418129DF199A64FADFB500FF
-sha256  65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31  v4l-utils-1.22.1.tar.bz2
+sha256  cbb7fe8a6307f5ce533a05cded70bb93c3ba06395ab9b6d007eb53b75d805f5b  v4l-utils-1.24.1.tar.bz2
 
 # Locally calculated
 sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index fd69b7ac7a..1142a7442f 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.22.1
+LIBV4L_VERSION = 1.24.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
-LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap
+LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap --disable-v4l2-tracer
 # needed to get utils/qv4l link flags right
 LIBV4L_AUTORECONF = YES
 # add host-gettext for AM_ICONV macro
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
