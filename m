Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CDEE743C3
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EC1F614FC;
	Thu, 28 Sep 2023 21:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EC1F614FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQT6wOdMA368; Thu, 28 Sep 2023 21:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD2B461142;
	Thu, 28 Sep 2023 21:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD2B461142
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6ED71BF287
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 21:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8256D81440
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 21:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8256D81440
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dg4OV3GpqSJM for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 21:00:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38FB08142E
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 21:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38FB08142E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25A4382B59; Thu, 28 Sep 2023 21:00:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 22:59:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a164527045a2a1bda576ab9cb72122b5cbf2f67
X-Git-Newrev: e7988c7060d7d8b137d18721ef773ef266114690
X-Patchwork-Hint: ignore
Message-Id: <20230928210009.25A4382B59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/librsvg: security bump to version
 2.50.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7988c7060d7d8b137d18721ef773ef266114690
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-38633: A directory traversal problem in the URL decoder of
librsvg before 2.56.3 could be used by local or remote attackers to
disclose files (on the local filesystem outside of the expected area),
as demonstrated by href=".?../../../../../../../../../../etc/passwd" in
an xi:include element.

https://gitlab.gnome.org/GNOME/librsvg/-/blob/2.50.9/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/librsvg/librsvg.hash | 4 ++--
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index c8da3354f5..4eab8cdfba 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/librsvg/2.50/librsvg-2.50.7.sha256sum
-sha256  fffb61b08cd5282aaae147a02b305166a7426fad22a8b9427708f0f2fc426ebc  librsvg-2.50.7.tar.xz
+# From https://download.gnome.org/sources/librsvg/2.50/librsvg-2.50.9.sha256sum
+sha256  518905fffa879b6c7f3db1aae961cf31333e0eadc7b4cdd4f531707868c54b53  librsvg-2.50.9.tar.xz
 
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index df6559a858..81a6667817 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.50
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).7
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).9
 LIBRSVG_SITE = https://download.gnome.org/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
