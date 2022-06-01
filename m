Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E91C416F6;
	Wed,  1 Jun 2022 21:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3dllBWgfnAnq; Wed,  1 Jun 2022 21:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F2FE416D6;
	Wed,  1 Jun 2022 21:47:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95CC81BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9212C83148
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d72kUs11zgRH for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:47:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1F5D82F98
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:47:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 131A18695E; Wed,  1 Jun 2022 21:35:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 23:47:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85af9a673d1e467271da4f4a377e8d425145b61d
X-Git-Newrev: 5507acd5df2a954b7559788dd03ead85245ad4a4
X-Patchwork-Hint: ignore
Message-Id: <20220601213547.131A18695E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: security bump to 1.0.41
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

commit: https://git.buildroot.net/buildroot/commit/?id=5507acd5df2a954b7559788dd03ead85245ad4a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2022-30295.

See here:
https://www.nozominetworks.com/blog/nozomi-networks-discovers-unpatched-dns-bug-in-popular-c-standard-library-putting-iot-at-risk/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 989c9d887a..3b29c351b5 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.40/uClibc-ng-1.0.40.tar.xz.sha256
-sha256  d863f01815a64174d5019c73475e8aff5b60848a13876e79daf5d3d83ce7f889  uClibc-ng-1.0.40.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.41/uClibc-ng-1.0.41.tar.xz.sha256
+sha256  b32a92a0218d95922d6976464e6ef51e2ebacfbcdb605820458d9dbb8a61e025  uClibc-ng-1.0.41.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index d79eaa1d0d..5006aa0cb6 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.40
+UCLIBC_VERSION = 1.0.41
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
