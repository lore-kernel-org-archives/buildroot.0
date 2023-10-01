Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664FDE78480
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 18:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B37E820FF;
	Sun,  1 Oct 2023 18:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B37E820FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZt4aRcwNlh6; Sun,  1 Oct 2023 18:46:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A50820F0;
	Sun,  1 Oct 2023 18:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0A50820F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E793C1BF8A8
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C20D960DFE
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C20D960DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPcWm_SAOtA6 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 18:46:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9DEB60AF8
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 18:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9DEB60AF8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B71E783A4B; Sun,  1 Oct 2023 18:46:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 20:25:28 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: df2180cd89c96572a34de01c107a2cc60ed287a3
X-Git-Newrev: 962ec546d0ae6a27bff0baf3bce22194cd1ff78e
X-Patchwork-Hint: ignore
Message-Id: <20231001184642.B71E783A4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/librsvg: security
 bump to version 2.50.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=962ec546d0ae6a27bff0baf3bce22194cd1ff78e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix CVE-2023-38633: A directory traversal problem in the URL decoder of
librsvg before 2.56.3 could be used by local or remote attackers to
disclose files (on the local filesystem outside of the expected area),
as demonstrated by href=".?../../../../../../../../../../etc/passwd" in
an xi:include element.

https://gitlab.gnome.org/GNOME/librsvg/-/blob/2.50.9/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e7988c7060d7d8b137d18721ef773ef266114690)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
