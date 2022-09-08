Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27BDC54EE9
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 14:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B17B36F928;
	Thu,  8 Sep 2022 14:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B17B36F928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9gxLebUhrl3r; Thu,  8 Sep 2022 14:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0F5060AF2;
	Thu,  8 Sep 2022 14:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0F5060AF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D21E1BF321
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 14:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25B1E40105
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 14:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25B1E40105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O5MUQ8Ve6KXn for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 14:25:08 +0000 (UTC)
X-Greylist: delayed 00:07:14 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37A04409DE
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37A04409DE
 for <buildroot@buildroot.org>; Thu,  8 Sep 2022 14:25:07 +0000 (UTC)
Date: Thu, 08 Sep 2022 14:17:32 +0000
To: buildroot@buildroot.org
Message-ID: <20220908141620.2258877-1-fhunleth@troodon-software.com>
Feedback-ID: 38965776:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=troodon-software.com; s=protonmail2; t=1662646656; x=1662905856;
 bh=c14doq0CJpbiswSSeToDuIuiDU5E0MdNVbhV/zNeCG8=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=l+sriGto4hV2qQz56ye/1/O4rKmvs5BZ+PTqUKh09y3qDUl1NmsuHz4ijwYsGWW1t
 cgC4OPUGOZ4VE+v7aw6In6htPbC+IRLQB+DvzB32yBsoJPQe6jAzUZQvqBjCvf3f0g
 NwW89MZ7yVozlRUISZaYL5bVJD0rLdNoeZ68XbsAGbQDuWFCynr6zuKTgIPXsoc9dO
 LAhI13uWwC7jN8u+C16qK8QaL89K7r5Lb7+YM8pmaDTJwqxqvoYi7Mi+fLc+drso1j
 4YkprFIZBUBFUGCqta3jH7Gc6CyUaDWEGFEIfBSQsCuJ6iGbxDEqxZY6sPXDLmRhFg
 orgfo1NmUZaog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=troodon-software.com header.i=@troodon-software.com
 header.a=rsa-sha256 header.s=protonmail2 header.b=l+sriGto
X-Mailman-Original-Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (2048-bit key) header.d=troodon-software.com
 header.i=@troodon-software.com header.b="l+sriGto"
Subject: [Buildroot] [PATCH] package/fwup: bump to v1.9.1
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
From: Frank Hunleth via buildroot <buildroot@buildroot.org>
Reply-To: Frank Hunleth <fhunleth@troodon-software.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release fixes a compiler error when using glibc 2.36.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/fwup/fwup.hash | 2 +-
 package/fwup/fwup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fwup/fwup.hash b/package/fwup/fwup.hash
index 2e5b2b1f6c..51ec444bcb 100644
--- a/package/fwup/fwup.hash
+++ b/package/fwup/fwup.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  18ae6753145cef2fd5f5fc83e29c2d883e570668d8aa064ee6c94d4c5e44d73d  fwup-1.9.0.tar.gz
+sha256  9684551647f0ddd043f9ff46f7bec8eacb2da1ac29d6d8d5d775c346173b8e88  fwup-1.9.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 62016d94e3..a6395d583d 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-FWUP_VERSION = 1.9.0
+FWUP_VERSION = 1.9.1
 FWUP_SITE = $(call github,fwup-home,fwup,v$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
--
2.25.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
