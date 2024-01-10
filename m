Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68A4C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 595994361D;
	Wed, 10 Jan 2024 09:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 595994361D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIK92wiDhGyg; Wed, 10 Jan 2024 09:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22E6A4363B;
	Wed, 10 Jan 2024 09:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22E6A4363B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E540C1BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C82B043656
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C82B043656
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYvo8LO4AIGs for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FB25435DE
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FB25435DE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E920853BB; Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 10:36:36 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: ed75806fe9330d3b408d9e045f0ce36a8593dc3b
X-Git-Newrev: 71f9acc72b41d6a0b03731403845a7356cefd081
X-Patchwork-Hint: ignore
Message-Id: <20240110095132.7E920853BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/strongswan:
 security bump to version 5.9.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=71f9acc72b41d6a0b03731403845a7356cefd081
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

A vulnerability in charon-tkm related to processing DH public values was
discovered in strongSwan that can result in a buffer overflow and
potentially remote code execution. All versions since 5.3.0 are
affected.

https://www.strongswan.org/blog/2023/11/20/strongswan-vulnerability-(cve-2023-41913).html
https://github.com/strongswan/strongswan/blob/5.9.13/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9e5cbbb4134bf5730e91bc03fe01ab8cb571f0db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index de8f18747a..ed8cf0ae31 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.11.tar.bz2.md5
-md5  673e194cd256af77b46928179f2c81ad  strongswan-5.9.11.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.13.tar.bz2.md5
+md5  9ada6be0c89846fb7ded1787a17cfbb2  strongswan-5.9.13.tar.bz2
 # Calculated based on the hash above
-sha256  ddf53f1f26ad26979d5f55e8da95bd389552f5de3682e35593f9a70b2584ed2d  strongswan-5.9.11.tar.bz2
+sha256  56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55  strongswan-5.9.13.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 6058631696..36cb72f6be 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.11
+STRONGSWAN_VERSION = 5.9.13
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
