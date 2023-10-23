Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7F7C25B46
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 17:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A03B4240B;
	Mon, 23 Oct 2023 17:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A03B4240B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrirIbvUjt-F; Mon, 23 Oct 2023 17:28:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E55423F8;
	Mon, 23 Oct 2023 17:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32E55423F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99E661BF955
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F3DB40012
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F3DB40012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTvVbOnZMv9c for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 530D0417EF
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 530D0417EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EDB485E8B; Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 19:18:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00583e1c16a5ee6297535307c6a5e6e7e8f38378
X-Git-Newrev: ef2aa9e6b5894b1f361d8573c9a03ecc5f588d18
X-Patchwork-Hint: ignore
Message-Id: <20231023172717.3EDB485E8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg: add curl support
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef2aa9e6b5894b1f361d8573c9a03ecc5f588d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: drop option, use package as condition]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opkg/opkg.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 3d46adb59a..ea870aa21a 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -10,7 +10,6 @@ OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
-OPKG_CONF_OPTS = --disable-curl
 
 ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
 OPKG_CONF_OPTS += --enable-gpg
@@ -22,6 +21,18 @@ else
 OPKG_CONF_OPTS += --disable-gpg
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+OPKG_DEPENDENCIES += libcurl
+OPKG_CONF_OPTS += --enable-curl
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPKG_CONF_OPTS += --enable-ssl-curl
+else
+OPKG_CONF_OPTS += --disable-ssl-curl
+endif
+else
+OPKG_CONF_OPTS += --disable-curl --disable-ssl-curl
+endif
+
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 OPKG_DEPENDENCIES += bzip2
 OPKG_CONF_OPTS += --enable-bzip2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
