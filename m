Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CA8C7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1039340584;
	Sat, 25 Feb 2023 09:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1039340584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IOt8DspXVrD; Sat, 25 Feb 2023 09:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C4CC40B86;
	Sat, 25 Feb 2023 09:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C4CC40B86
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E39831BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC8DB40017
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC8DB40017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pt73AOnYBNxD for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:39:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E60E1405F7
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E60E1405F7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D575986911; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:38:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5d310772d71f547146684673c7113f208a31b5f
X-Git-Newrev: 723ecc92979183a08a28176c6bf65c5555a88263
X-Patchwork-Hint: ignore
Message-Id: <20230225093924.D575986911@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: fix CPE ID version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=723ecc92979183a08a28176c6bf65c5555a88263
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CPE ID is wrong since the addition of the package in commit
27b8d0ba8c4004819e092fb81c0f64f284b3aa4a, the correct CPE ID is
cpe:2.3:a:ntpsec:ntpsec:1.2.2:*:*:*:*:*:*:*, not
cpe:2.3:a:ntpsec:ntpsec:1.2:2:*:*:*:*:*:*

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ntpsec/ntpsec.mk | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index c7fa2f85a8..e612e982ec 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,12 +4,9 @@
 #
 ################################################################################
 
-NTPSEC_VERSION_MAJOR = 1
-NTPSEC_VERSION_MINOR = 2
-NTPSEC_VERSION_POINT = 2
-NTPSEC_VERSION = $(NTPSEC_VERSION_MAJOR)_$(NTPSEC_VERSION_MINOR)_$(NTPSEC_VERSION_POINT)
-NTPSEC_SOURCE = ntpsec-NTPsec_$(NTPSEC_VERSION).tar.bz2
-NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(NTPSEC_VERSION)
+NTPSEC_VERSION = 1.2.2
+NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
+NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = BSD-2-Clause, NTP, BSD-3-Clause, MIT, CC-BY-4.0 (docs)
 NTPSEC_LICENSE_FILES = \
 	LICENSES/BSD-2 \
@@ -20,8 +17,6 @@ NTPSEC_LICENSE_FILES = \
 	docs/copyright.adoc
 
 NTPSEC_CPE_ID_VENDOR = ntpsec
-NTPSEC_CPE_ID_VERSION = $(NTPSEC_VERSION_MAJOR).$(NTPSEC_VERSION_MINOR)
-NTPSEC_CPE_ID_UPDATE = $(NTPSEC_VERSION_POINT)
 
 NTPSEC_DEPENDENCIES = \
 	host-bison \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
