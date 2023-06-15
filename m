Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D356EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 06:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF0DD4172F;
	Thu, 15 Jun 2023 06:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF0DD4172F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RS1B6wrYyXdh; Thu, 15 Jun 2023 06:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E76124190B;
	Thu, 15 Jun 2023 06:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E76124190B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18A851BF48C
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E397741F10
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E397741F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9-kFbJXNCu2 for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78BB641C60
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78BB641C60
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 650B7837C4; Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 08:44:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bbcfc9ca57fe83411db14daf88febda80ea7cc7
X-Git-Newrev: fd3ff0761c741723afc556f5eaf96e1941264eb4
X-Patchwork-Hint: ignore
Message-Id: <20230615065520.650B7837C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/graphicsmagick: security bump to
 version 1.3.40
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd3ff0761c741723afc556f5eaf96e1941264eb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

1.3.39:
- oss-fuzz: Several security fixes originating from oss-fuzz testing.
- ALL: Replace strcpy() with strlcpy(), replace strcat() with strlcat(),
  replace sprintf() with snprintf().  Prefer using bounded string functions.
  This change is made for the purpose of increasing safety than to address
  any existing demonstrated concern.

1.3.40:
- DCX: Fixed heap overflow when writing more than 1023 scenes, and also
  eliminated use of uninitialized memory.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Peter: mark as security fix, extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/graphicsmagick/graphicsmagick.hash | 2 +-
 package/graphicsmagick/graphicsmagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
index 80130da5d6..a894aedf11 100644
--- a/package/graphicsmagick/graphicsmagick.hash
+++ b/package/graphicsmagick/graphicsmagick.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d60cd9db59351d2b9cb19beb443170acaa28f073d13d258f67b3627635e32675  GraphicsMagick-1.3.38.tar.xz
+sha256  97dc1a9d4e89c77b25a3b24505e7ff1653b88f9bfe31f189ce10804b8efa7746  GraphicsMagick-1.3.40.tar.xz
 sha256  0a20e661de942ebe115a354d0ec6d1d42b93856ea765f813f350a5ce5024cdb7  Copyright.txt
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index dbaa8ddf70..76b826ceef 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHICSMAGICK_VERSION = 1.3.38
+GRAPHICSMAGICK_VERSION = 1.3.40
 GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
 GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
 GRAPHICSMAGICK_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
