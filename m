Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C005AC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A31443731;
	Wed, 10 Jan 2024 21:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A31443731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0d7T4l1EKHu; Wed, 10 Jan 2024 21:00:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44589436D7;
	Wed, 10 Jan 2024 21:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44589436D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 397F61BF277
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 127C083640
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 127C083640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zot-r2TFmdnE for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:59:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 408A083595
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 408A083595
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CC1F85DCA; Wed, 10 Jan 2024 20:59:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:49:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b54c17bb710acbd7eff4ee1547d3d399147b62fa
X-Git-Newrev: 8a170b8446585f98193bb3d780d0d8a427ff6c06
X-Patchwork-Hint: ignore
Message-Id: <20240110205957.2CC1F85DCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-glib: bump to version 1.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a170b8446585f98193bb3d780d0d8a427ff6c06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Handle new nls option added by
https://gitlab.gnome.org/GNOME/json-glib/-/commit/31998d84cb241a4c6343c97afc06ee24e60db032

https://download.gnome.org/sources/json-glib/1.8/json-glib-1.8.0.news

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/json-glib/json-glib.hash |  4 ++--
 package/json-glib/json-glib.mk   | 10 ++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index 0c3cf7f7f7..b78d708391 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/json-glib/1.6/json-glib-1.6.6.sha256sum
-sha256  96ec98be7a91f6dde33636720e3da2ff6ecbb90e76ccaa49497f31a6855a490e  json-glib-1.6.6.tar.xz
+# From https://download.gnome.org/sources/json-glib/1.8/json-glib-1.8.0.sha256sum
+sha256  97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454  json-glib-1.8.0.tar.xz
 
 # Hash for license file:
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index b7ff0bfd57..cd53f24cee 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JSON_GLIB_VERSION_MAJOR = 1.6
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
+JSON_GLIB_VERSION_MAJOR = 1.8
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).0
 JSON_GLIB_SITE = https://download.gnome.org/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPL-2.1+
@@ -25,6 +25,12 @@ else
 JSON_GLIB_CONF_OPTS += -Dintrospection=disabled
 endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+JSON_GLIB_CONF_OPTS += -Dnls=enabled
+else
+JSON_GLIB_CONF_OPTS += -Dnls=disabled
+endif
+
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
