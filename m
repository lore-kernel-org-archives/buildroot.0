Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C534FC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 747C6814B5;
	Tue, 26 Dec 2023 20:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 747C6814B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F4y0vZomry4N; Tue, 26 Dec 2023 20:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE0D5814AB;
	Tue, 26 Dec 2023 20:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE0D5814AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85C721BF591
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EBBE814AB
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EBBE814AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ney8SoQqlS5 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:25:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A2B28122A
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A2B28122A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65BF783601; Tue, 26 Dec 2023 20:25:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 21:23:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 312f4ab4c8a79e8cdc40dfed6870ac2aea981883
X-Git-Newrev: 01689a9a65dceb15d453130b663a78ad9669aae5
X-Patchwork-Hint: ignore
Message-Id: <20231226202534.65BF783601@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: security bump to version
 1.17.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=01689a9a65dceb15d453130b663a78ad9669aae5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A couple of build fixes and bug fixes detected by fuzzing.

Corrects these issues:
 - CVE-2023-49462
 - CVE-2023-49463

https://github.com/strukturag/libheif/releases/tag/v1.17.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libheif/libheif.hash | 2 +-
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 6ea3ba6eec..a2ca065b7a 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  38ab01938ef419dbebb98346dc0b1c8bb503a0449ea61a0e409a988786c2af5b  libheif-1.17.5.tar.gz
+sha256  8390baf4913eda0a183e132cec62b875fb2ef507ced5ddddc98dfd2f17780aee  libheif-1.17.6.tar.gz
 sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 419a864ef3..bd307deb7b 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.17.5
+LIBHEIF_VERSION = 1.17.6
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
