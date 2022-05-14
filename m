Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7631EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C8A782835;
	Sat, 14 May 2022 21:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNm-hSNKUauu; Sat, 14 May 2022 21:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AB34827F3;
	Sat, 14 May 2022 21:05:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A83291BF909
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96DC260DB2
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLVlJeaoDV3R for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:04:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEAB360C1C
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:04:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 67EF284C52; Sat, 14 May 2022 20:53:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 22:56:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33e947a2d5db2e7b8fb0cfc64183add77b29c347
X-Git-Newrev: 2a62ff8274a124ecf0734daa6886d75f4b73f3cd
X-Patchwork-Hint: ignore
Message-Id: <20220514205359.67EF284C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpjsip: security bump to version
 2.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a62ff8274a124ecf0734daa6886d75f4b73f3cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
