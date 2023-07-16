Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DAEEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 08:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B479C81761;
	Sun, 16 Jul 2023 08:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B479C81761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAHUK4QVLawG; Sun, 16 Jul 2023 08:54:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF18181759;
	Sun, 16 Jul 2023 08:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF18181759
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6541F1BF372
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 08:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 475F581759
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 08:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 475F581759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nl4CaL-aAU2 for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 08:54:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C0B481757
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C0B481757
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 08:54:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88971A4C029A
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 10:54:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39028)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKxW9-00027u-0w
 for buildroot@buildroot.org; Sun, 16 Jul 2023 10:54:13 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 10:54:13 +0200
Message-Id: <20230716085413.3684644-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689497653;
 bh=eJp0aNBZydgqF/3itHntJI1nv0rC/LQvDdplm3H0SEw=;
 h=From:To:Subject:Date:From;
 b=RkO6GqErM6zIEQ1F+BfjlyPHpQaPFPEud9KXlFBn8JGf3M9c2iEF7j/wiVLtlSmrf
 8M8bGgFveMyv/3Up6Un8tBqLpnIXxGQaI3xa3kvCkHj57AeSfZYK0fwFZM1EUJNqm3
 eb2TSW3M/VeCQgmSmw2j3YxArCA6+yGCHREXwpLBeBvSY4UrAbsqbx8xYtSovjlHZX
 vHaBGWD2SAb/Kt6uNdKfi6gBSowHpnEWNdTA5ePj6/7lUBOZ71s41aLvviUfmYB717
 YyTuC71LzSlgvpVkgLQ3dt0k/XMMYd+oO7c9uPL/+1WGWRM7GRX0Ve0ELHahI8gEYo
 QUCWbkR98K0jA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=RkO6GqEr
Subject: [Buildroot] [PATCH 1/1] package/vulkan-headers: bump version to
 1.3.257
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/vulkan-headers/vulkan-headers.hash | 2 +-
 package/vulkan-headers/vulkan-headers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vulkan-headers/vulkan-headers.hash b/package/vulkan-headers/vulkan-headers.hash
index c43736405c..cf213d8b52 100644
--- a/package/vulkan-headers/vulkan-headers.hash
+++ b/package/vulkan-headers/vulkan-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7239108c372f1fbe365bd8d1610ca2bb4e72b73b2151f2551bf9df54dd539639  vulkan-headers-1.2.203.tar.gz
+sha256  e3ee02eff07ebcdb0ddfd06366d986c889f3392b6c4d79615bb06aefc1fda900  vulkan-headers-1.3.257.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/vulkan-headers/vulkan-headers.mk b/package/vulkan-headers/vulkan-headers.mk
index 13cae1e685..c42b005abe 100644
--- a/package/vulkan-headers/vulkan-headers.mk
+++ b/package/vulkan-headers/vulkan-headers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VULKAN_HEADERS_VERSION = 1.2.203
+VULKAN_HEADERS_VERSION = 1.3.257
 VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,v$(VULKAN_HEADERS_VERSION))
 VULKAN_HEADERS_LICENSE = Apache-2.0
 VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
