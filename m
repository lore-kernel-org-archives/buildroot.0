Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66332CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F4B660F04;
	Sun, 24 Sep 2023 19:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F4B660F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8E0Egnzpnbn; Sun, 24 Sep 2023 19:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67B8E60F0F;
	Sun, 24 Sep 2023 19:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67B8E60F0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68BD01BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BD72410BA
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD72410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OuJdqm3Jl1yv for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:21:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19FF040999
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19FF040999
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 064548757C; Sun, 24 Sep 2023 19:21:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 21:17:43 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0d32769db9d7d85abeb2aaca0eb1218b9165606a
X-Git-Newrev: 702f3f4fae8e0ac4a3559e0da83778cc74d3a172
X-Patchwork-Hint: ignore
Message-Id: <20230924192136.064548757C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/webp: security
 bump to version 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=702f3f4fae8e0ac4a3559e0da83778cc74d3a172
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- security fixes for lossless encoder (#603, chromium: #1420107,
  #1455619, CVE-2023-1999)
- security fix for lossless decoder (chromium: #1479274,
  CVE-2023-4863)

https://github.com/webmproject/libwebp/blob/v1.3.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c88c1d3319dd24fa833455a2e7d96bc4585bab7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index 969e4cd3d7..adc543059b 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df  libwebp-1.2.4.tar.gz
+sha256  2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562aa09b4  libwebp-1.3.2.tar.gz
 sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 38a1564a63..33cb4bd507 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.2.4
+WEBP_VERSION = 1.3.2
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
