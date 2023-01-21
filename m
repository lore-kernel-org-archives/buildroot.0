Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC01C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E73D83E3F;
	Mon, 20 Feb 2023 23:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E73D83E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EArtOglyJ0Ju; Mon, 20 Feb 2023 23:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5206083E3D;
	Mon, 20 Feb 2023 23:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5206083E3D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 757C01BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BBFE41750
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BBFE41750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53ASwl-pf0jZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EAE341751
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EAE341751
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C49B86495; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:51:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0e483a7340a4aeecf1d362328e06c2fcdec1dcae
X-Git-Newrev: 695dd042dbbe3eb3ccffb812b8dc38c2aa7202be
X-Patchwork-Hint: ignore
Message-Id: <20230220205237.9C49B86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gconf: switch to https
 download
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

commit: https://git.buildroot.net/buildroot/commit/?id=695dd042dbbe3eb3ccffb812b8dc38c2aa7202be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gconf/gconf.hash | 2 +-
 package/gconf/gconf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gconf/gconf.hash b/package/gconf/gconf.hash
index 56d754a69e..ad0064fa99 100644
--- a/package/gconf/gconf.hash
+++ b/package/gconf/gconf.hash
@@ -1,4 +1,4 @@
-# http://ftp.acc.umu.se/pub/gnome/sources/GConf/3.2/GConf-3.2.6.sha256sum
+# From https://download.gnome.org/sources/GConf/3.2/GConf-3.2.6.sha256sum
 sha256  1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c  GConf-3.2.6.tar.xz
 # License files, locally calculated
 sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
index c468d1433c..b84fa96082 100644
--- a/package/gconf/gconf.mk
+++ b/package/gconf/gconf.mk
@@ -6,7 +6,7 @@
 
 GCONF_VERSION = 3.2.6
 GCONF_SOURCE = GConf-$(GCONF_VERSION).tar.xz
-GCONF_SITE = http://ftp.gnome.org/pub/gnome/sources/GConf/3.2
+GCONF_SITE = https://download.gnome.org/sources/GConf/3.2
 GCONF_CONF_OPTS = --disable-orbit
 GCONF_DEPENDENCIES = dbus dbus-glib libglib2 libxml2 \
 	host-intltool $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
