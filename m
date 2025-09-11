Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9143FCAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51311425D9;
	Thu, 11 Sep 2025 20:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnHe3YFM5EYk; Thu, 11 Sep 2025 20:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA76D42555
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA76D42555;
	Thu, 11 Sep 2025 20:04:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1E4F234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8869A42555
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDouooG4QS9h for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:04:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7073421D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7073421D4
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFA588438D; Thu, 11 Sep 2025 20:04:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:52:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74a4104aa9e3be878fc41eb24a31b70f24f19483
X-Git-Newrev: 4284ce939aa0bdbfe0bad53cc9be4d7b5aef0743
X-Patchwork-Hint: ignore
Message-Id: <20250911200421.CFA588438D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcanberra: remove optional
 dependency on libgtk2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4284ce939aa0bdbfe0bad53cc9be4d7b5aef0743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to drop libgtk2, let's remove the optional dependency
of libcanberra to libgtk2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libcanberra/libcanberra.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/libcanberra/libcanberra.mk b/package/libcanberra/libcanberra.mk
index 2505e58eb0..456d08563b 100644
--- a/package/libcanberra/libcanberra.mk
+++ b/package/libcanberra/libcanberra.mk
@@ -12,7 +12,12 @@ LIBCANBERRA_LICENSE_FILES = LGPL
 LIBCANBERRA_INSTALL_STAGING = YES
 
 LIBCANBERRA_DEPENDENCIES = host-pkgconf libtool libvorbis
-LIBCANBERRA_CONF_OPTS = --disable-oss --disable-null --disable-tdb --disable-lynx
+LIBCANBERRA_CONF_OPTS = \
+	--disable-oss \
+	--disable-null \
+	--disable-tdb \
+	--disable-lynx \
+	--disable-gtk
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBCANBERRA_CONF_OPTS += --enable-udev
@@ -42,13 +47,6 @@ else
 LIBCANBERRA_CONF_OPTS += --disable-gstreamer
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-LIBCANBERRA_CONF_OPTS += --enable-gtk
-LIBCANBERRA_DEPENDENCIES += libgtk2
-else
-LIBCANBERRA_CONF_OPTS += --disable-gtk
-endif
-
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 LIBCANBERRA_CONF_OPTS += --enable-gtk3
 LIBCANBERRA_DEPENDENCIES += libgtk3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
