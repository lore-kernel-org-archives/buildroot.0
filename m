Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F7BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0703D410E4;
	Sun, 29 May 2022 08:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oeTEEMA2tEJ4; Sun, 29 May 2022 08:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5D65401F0;
	Sun, 29 May 2022 08:37:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA9601BF96B
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 522F0847D0
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bP1PPVuuCPl6 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:35:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F364847D3
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:35:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2726C86536; Sun, 29 May 2022 08:24:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 10:12:40 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 86aabbd757c429b9777cf7d913c19485513eb150
X-Git-Newrev: 15c46c464420caf89b3fabca5cf0f58e0d2ed973
X-Patchwork-Hint: ignore
Message-Id: <20220529082411.2726C86536@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libpjsip:
 security bump to version 2.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=15c46c464420caf89b3fabca5cf0f58e0d2ed973
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Security Issue:
 - Potential buffer overflow in pjsip_auth_create_digest()
   (GHSA-73f7-48m9-w662 a.k.a. CVE-2022-24754)
 - Denial-of-service in XML parsing due to an infinite loop
   (GHSA-5x45-qp78-g4p4 a.k.a. CVE-2022-24763)
 - Potential stack buffer overflow when printing SDP into a buffer
   (GHSA-f5qg-pqcg-765m a.k.a. CVE-2022-24764)
 - Potential out-of-bound read/write when parsing RTCP FB RPSI
   (GHSA-vhxv-phmx-g52q a.k.a. CVE-2022-24786)
 - Potential infinite loop when parsing WAV format file
   (GHSA-rwgw-vwxg-q799 a.k.a. CVE-2022-24792)
 - Potential heap buffer overflow when parsing DNS packets
   (GHSA-p6g5-v97c-w5q4 a.k.a. CVE-2022-24793)

https://github.com/pjsip/pjproject/releases/tag/2.12.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2a62ff8274a124ecf0734daa6886d75f4b73f3cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.hash | 2 +-
 package/libpjsip/libpjsip.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index 74331ab6fb..b1ccdb2f37 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b3b94d9be4aba8f6d2d1cb164603e81b0a6ee17352f9e2ba5b58e325e610ca5a  pjproject-2.12.tar.gz
+sha256  d0feef6963b07934e821ba4328aecb4c36358515c1b3e507da5874555d713533  pjproject-2.12.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 32cfa8c53c..a3303d1e8a 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.12
+LIBPJSIP_VERSION = 2.12.1
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
-# https://github.com/pjsip/pjproject/archive/2.12.tar.gz
 
 LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
