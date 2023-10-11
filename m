Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BB8CD68E9
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 08:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39BFC40BFB;
	Wed, 11 Oct 2023 08:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39BFC40BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 460UzB1eKdGJ; Wed, 11 Oct 2023 08:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 333A2403AA;
	Wed, 11 Oct 2023 08:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 333A2403AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9AC4A1BF32C
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 08:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 746D760FEE
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 08:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 746D760FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vhwKNUInXQpP for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 08:40:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0BF360BE9
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 08:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0BF360BE9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61340C0014;
 Wed, 11 Oct 2023 08:39:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qqUkz-000kIM-DX; Wed, 11 Oct 2023 10:39:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 10:39:51 +0200
Message-Id: <20231011083951.177891-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/libcue: security bump to version 2.3.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

CVE-2023-43641: Out-of-bounds array access in track_set_index
https://github.com/lipnitsk/libcue/security/advisories/GHSA-5982-x7hv-r9cj

For more details, see the github writeup:
https://github.blog/2023-10-09-coordinated-disclosure-1-click-rce-on-gnome-cve-2023-43641/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcue/libcue.hash | 2 +-
 package/libcue/libcue.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcue/libcue.hash b/package/libcue/libcue.hash
index 93ae2dacdb..47fe906e1a 100644
--- a/package/libcue/libcue.hash
+++ b/package/libcue/libcue.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f27bc3ebb2e892cd9d32a7bee6d84576a60f955f29f748b9b487b173712f1200  libcue-2.2.1.tar.gz
+sha256  cc1b3a65c60bd88b77a1ddd1574042d83cf7cc32b85fe9481c99613359eb7cfe  libcue-2.3.0.tar.gz
 sha256  c388d36583fa54e13b6d73ad924d0b68d073ed8a5771e17cb49104705df4504f  LICENSE
diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index 3edb4f3b69..7ef27f5a17 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCUE_VERSION = 2.2.1
+LIBCUE_VERSION = 2.3.0
 LIBCUE_SITE = $(call github,lipnitsk,libcue,v$(LIBCUE_VERSION))
 LIBCUE_LICENSE = GPL-2.0, BSD-2-Clause (rem.c)
 LIBCUE_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
