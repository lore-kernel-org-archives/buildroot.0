Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128E9EB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 08:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF04A60FCE;
	Fri, 16 Jun 2023 08:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF04A60FCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VT2-G4jIv2Nc; Fri, 16 Jun 2023 08:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D25D86147C;
	Fri, 16 Jun 2023 08:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D25D86147C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE92B1BF97E
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C48B341F68
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C48B341F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-8RZmsaLKsU for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 08:41:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF23541F1D
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 08:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF23541F1D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACDF083A1C; Fri, 16 Jun 2023 08:41:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 10:34:44 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 206dda4f2b177029fb81f4b96f4c239ddeba431b
X-Git-Newrev: 9da144a812f8744e99fffc7f9771fb39b416b090
X-Patchwork-Hint: ignore
Message-Id: <20230616084116.ACDF083A1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/graphicsmagick:
 security bump to version 1.3.40
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

commit: https://git.buildroot.net/buildroot/commit/?id=9da144a812f8744e99fffc7f9771fb39b416b090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit fd3ff0761c741723afc556f5eaf96e1941264eb4)
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
