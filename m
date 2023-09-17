Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE192CD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A59A405BE;
	Sun, 17 Sep 2023 12:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A59A405BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVoNDElR42tY; Sun, 17 Sep 2023 12:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEDA84058B;
	Sun, 17 Sep 2023 12:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEDA84058B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 572161BF870
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F7CA40111
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F7CA40111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4pi9G_wz3yrX for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:49:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B35140531
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B35140531
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A50287167; Sun, 17 Sep 2023 12:49:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 14:41:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fc24fbd173a3d7565d3b3db4adebcb2244568a5
X-Git-Newrev: 78959665b94b412d7a82ee43e3ede14278a5d924
X-Patchwork-Hint: ignore
Message-Id: <20230917124914.4A50287167@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: security bump to
 version 5.9.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=78959665b94b412d7a82ee43e3ede14278a5d924
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-26463: strongSwan 5.9.8 and 5.9.9 potentially allows remote
code execution because it uses a variable named "public" for two
different purposes within the same function. There is initially
incorrect access control, later followed by an expired pointer
dereference. One attack vector is sending an untrusted client
certificate during EAP-TLS. A server is affected only if it loads
plugins that implement TLS-based EAP methods (EAP-TLS, EAP-TTLS,
EAP-PEAP, or EAP-TNC). This is fixed in 5.9.10.

https://github.com/strongswan/strongswan/blob/5.9.11/NEWS
https://www.strongswan.org/blog/2023/03/02/strongswan-vulnerability-(cve-2023-26463).html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 4822f9152f..de8f18747a 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.8.tar.bz2.md5
-md5  f46b0d3e7aed88824650d0721c887443  strongswan-5.9.8.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.11.tar.bz2.md5
+md5  673e194cd256af77b46928179f2c81ad  strongswan-5.9.11.tar.bz2
 # Calculated based on the hash above
-sha256  d3303a43c0bd7b75a12b64855e8edcb53696f06190364f26d1533bde1f2e453c  strongswan-5.9.8.tar.bz2
+sha256  ddf53f1f26ad26979d5f55e8da95bd389552f5de3682e35593f9a70b2584ed2d  strongswan-5.9.11.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index cae1433e39..6058631696 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.8
+STRONGSWAN_VERSION = 5.9.11
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
