Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CD0C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB04783E6B;
	Mon, 20 Feb 2023 23:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB04783E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VB6zsm6QDOT; Mon, 20 Feb 2023 23:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F58C83E76;
	Mon, 20 Feb 2023 23:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F58C83E76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A892D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBA9D4174C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBA9D4174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1nI_C_fEkNe for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19D194174E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19D194174E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05CB486495; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:55:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9086723227c535010986d831954ec932d3e783fb
X-Git-Newrev: cb96dcaff49c259ad02fad428ab3ae3d210416e4
X-Patchwork-Hint: ignore
Message-Id: <20230220205238.05CB486495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gtk2-engines: switch
 to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb96dcaff49c259ad02fad428ab3ae3d210416e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gtk2-engines/gtk2-engines.hash | 2 +-
 package/gtk2-engines/gtk2-engines.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gtk2-engines/gtk2-engines.hash b/package/gtk2-engines/gtk2-engines.hash
index 20125c706c..71a0ecd213 100644
--- a/package/gtk2-engines/gtk2-engines.hash
+++ b/package/gtk2-engines/gtk2-engines.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk-engines/2.20/gtk-engines-2.20.2.sha256sum
+# From https://download.gnome.org/sources/gtk-engines/2.20/gtk-engines-2.20.2.sha256sum
 sha256  15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5  gtk-engines-2.20.2.tar.bz2
 # Locally computed
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index 5f145940b2..ea41bccaea 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -7,7 +7,7 @@
 GTK2_ENGINES_VERSION_MAJOR = 2.20
 GTK2_ENGINES_VERSION = $(GTK2_ENGINES_VERSION_MAJOR).2
 GTK2_ENGINES_SOURCE = gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
-GTK2_ENGINES_SITE = http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/$(GTK2_ENGINES_VERSION_MAJOR)
+GTK2_ENGINES_SITE = https://download.gnome.org/sources/gtk-engines/$(GTK2_ENGINES_VERSION_MAJOR)
 GTK2_ENGINES_DEPENDENCIES = libgtk2 host-intltool
 GTK2_ENGINES_LICENSE = LGPL-2.1+
 GTK2_ENGINES_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
