Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BB5C004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8183E40549;
	Sat, 21 Jan 2023 13:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8183E40549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEDMDa4xPXsi; Sat, 21 Jan 2023 13:24:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C89514048A;
	Sat, 21 Jan 2023 13:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C89514048A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EF361BF40B
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A098C82CD4
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A098C82CD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CI7DsEyrwhGK for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB69E82C35
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB69E82C35
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6F6B8694D; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:59:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97ceb937a1f3c359b14b524f636f5fddfa09d48d
X-Git-Newrev: 6893eabaa05e2ad4c3fe375196e1b84e3cee3326
X-Patchwork-Hint: ignore
Message-Id: <20230121131610.B6F6B8694D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pango: switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=6893eabaa05e2ad4c3fe375196e1b84e3cee3326
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pango/pango.hash | 2 +-
 package/pango/pango.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 60a6809ab5..1dbc5c9197 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,4 +1,4 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.12.sha256sum
+# From https://download.gnome.org/sources/pango/1.50/pango-1.50.12.sha256sum
 sha256  caef96d27bbe792a6be92727c73468d832b13da57c8071ef79b9df69ee058fe3  pango-1.50.12.tar.xz
 
 # Locally computed
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 698894d0c8..f19faf0502 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -7,7 +7,7 @@
 PANGO_VERSION_MAJOR = 1.50
 PANGO_VERSION = $(PANGO_VERSION_MAJOR).12
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
-PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
+PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
 PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
