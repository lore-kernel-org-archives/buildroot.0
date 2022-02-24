Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE17AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 21:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 965A9415A3;
	Thu, 24 Feb 2022 21:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFnTdKaUXLzY; Thu, 24 Feb 2022 21:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4EDB4090A;
	Thu, 24 Feb 2022 21:28:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC8231BF31E
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 21:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7769400B8
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 21:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=protonmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pb5om3kRTaf4 for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 21:28:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F5A440017
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 21:28:21 +0000 (UTC)
Date: Thu, 24 Feb 2022 21:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1645738097;
 bh=oGfjugONMn/Tb6LxvWWJfo06IiNkDziGS5RPnCjupY8=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=RK/BcplmHmBTkJ1yzfXHkJS4HHvWRjZDMlFbqdE+AjYABye/cLybpxrD5mi32FP/N
 bOogZyQLnOyxWHxTrENlirLwMOycON+qW3rWYAvCrITzQq6ib9pXVTNioTAUipVD5y
 NcYSJaVO9N4uI6bRjQzxt3dDtZyZGAdHYiTUbEacPDhlrxm3DsnMtY3Wft4pnx4MKo
 hjus4RuZ9/r8rk6kUw8rtjpA04UHLH3+/dtyZxM9bbMKQxhVzqhdO9Br3uLQzq8cRn
 BsK9hdclpG3BBsX937MskCZ5HRq6KPi5BF5+k5mJRWxmhCfV1xct0Rus5YS9a/nQ+F
 9vewC8FxIFNrw==
To: buildroot@buildroot.org
Message-ID: <20220224212755.4856-1-andrei.gherghescu@protonmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] directfb: change upstream site
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
From: Andrei Gherghescu via buildroot <buildroot@buildroot.org>
Reply-To: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
Cc: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The http://www.directfb.org/ has been down since 2015.
Use the Buildroot backup download site.

Fixes:
   - https://bugs.busybox.net/show_bug.cgi?id=13731

Signed-off-by: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
---
 package/directfb-examples/Config.in            | 6 ++++--
 package/directfb-examples/directfb-examples.mk | 2 +-
 package/directfb/directfb.mk                   | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
index 216e036577..4d5de03068 100644
--- a/package/directfb-examples/Config.in
+++ b/package/directfb-examples/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The DirectFB-examples package contains a set of simple
 	  DirectFB applications that can be used to test and demonstrate
-	  various DirectFB features.
+	  various DirectFB features. As of 4 October 2015, DirectFB's
+	  website http://www.directfb.org/ is down. See alternative site
+	  listed below.

-	  http://directfb.org/downloads/Extras/README.DirectFB-examples
+	  http://elinux.org/DirectFB
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 46263da733..c8d09b3e33 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -5,7 +5,7 @@
 ################################################################################

 DIRECTFB_EXAMPLES_VERSION = 1.7.0
-DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
+DIRECTFB_EXAMPLES_SITE = http://sources.buildroot.net/directfb-examples
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_LICENSE = MIT
 DIRECTFB_EXAMPLES_LICENSE_FILES = COPYING
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 0b32162d8f..56a396ab99 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -6,7 +6,7 @@

 DIRECTFB_VERSION_MAJOR = 1.7
 DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).7
-DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
+DIRECTFB_SITE = http://sources.buildroot.net/directfb
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPL-2.1+
 DIRECTFB_LICENSE_FILES = COPYING
--
2.35.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
