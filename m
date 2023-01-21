Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6877C004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8B0E41A54;
	Sat, 21 Jan 2023 13:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8B0E41A54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LRlK3AEJ2XqY; Sat, 21 Jan 2023 13:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B97D241829;
	Sat, 21 Jan 2023 13:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B97D241829
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F0381BF847
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 753DE82CA5
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 753DE82CA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCy7XMVNHi3S for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE2EB82CDE
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE2EB82CDE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEB548694B; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:59:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 002774d8ba08b69127a7b3921d628472305c7c09
X-Git-Newrev: 97ceb937a1f3c359b14b524f636f5fddfa09d48d
X-Patchwork-Hint: ignore
Message-Id: <20230121131610.AEB548694B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mono-gtksharp3: switch to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=97ceb937a1f3c359b14b524f636f5fddfa09d48d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mono-gtksharp3/mono-gtksharp3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mono-gtksharp3/mono-gtksharp3.mk b/package/mono-gtksharp3/mono-gtksharp3.mk
index 126aabeda2..27fcda9482 100644
--- a/package/mono-gtksharp3/mono-gtksharp3.mk
+++ b/package/mono-gtksharp3/mono-gtksharp3.mk
@@ -6,7 +6,7 @@
 
 MONO_GTKSHARP3_VERSION_MAJOR = 2.99
 MONO_GTKSHARP3_VERSION = $(MONO_GTKSHARP3_VERSION_MAJOR).3
-MONO_GTKSHARP3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/$(MONO_GTKSHARP3_VERSION_MAJOR)
+MONO_GTKSHARP3_SITE = https://download.gnome.org/sources/gtk-sharp/$(MONO_GTKSHARP3_VERSION_MAJOR)
 MONO_GTKSHARP3_SOURCE = gtk-sharp-$(MONO_GTKSHARP3_VERSION).tar.xz
 MONO_GTKSHARP3_LICENSE = LGPL-2.0, MIT (cairo)
 MONO_GTKSHARP3_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
