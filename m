Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF76C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 19:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5425F60C01;
	Sun, 12 Mar 2023 19:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5425F60C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oRsonPgM4L2i; Sun, 12 Mar 2023 19:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97C6160BC9;
	Sun, 12 Mar 2023 19:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C6160BC9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CFBE1BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 19:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 777798146F
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 19:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 777798146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6taNA6amiJh for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 19:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D58281467
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 19:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D58281467
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84F3986FA0; Sun, 12 Mar 2023 19:10:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 19:49:09 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: e392183150517469e91e6bc1461660f569df0b6b
X-Git-Newrev: 7219d2225f26d6498239aeec011cca399d415658
X-Patchwork-Hint: ignore
Message-Id: <20230312191011.84F3986FA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/ntpsec: fix CPE
 ID version
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

commit: https://git.buildroot.net/buildroot/commit/?id=7219d2225f26d6498239aeec011cca399d415658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

CPE ID is wrong since the addition of the package in commit
27b8d0ba8c4004819e092fb81c0f64f284b3aa4a, the correct CPE ID is
cpe:2.3:a:ntpsec:ntpsec:1.2.2:*:*:*:*:*:*:*, not
cpe:2.3:a:ntpsec:ntpsec:1.2:2:*:*:*:*:*:*

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 723ecc92979183a08a28176c6bf65c5555a88263)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
