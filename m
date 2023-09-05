Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7302AC83F33
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 13:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2F7341811;
	Tue,  5 Sep 2023 13:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2F7341811
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6_Tht4T68Ua; Tue,  5 Sep 2023 13:30:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B43CB41802;
	Tue,  5 Sep 2023 13:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B43CB41802
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7380D1BF33C
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 13:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D2CF60BB6
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 13:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D2CF60BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akbmnuZ2bKeF for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 13:30:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CCF2606EB
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 13:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CCF2606EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECA358696B; Tue,  5 Sep 2023 13:30:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Sep 2023 15:24:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19921699b3aaed330343e65418ddca6833bb3cd1
X-Git-Newrev: b7488b4d685657e7d724d18ab1e7982e2148e271
X-Patchwork-Hint: ignore
Message-Id: <20230905133027.ECA358696B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtommath: security bump to
 version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7488b4d685657e7d724d18ab1e7982e2148e271
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a bugfix release only containing the fix to a potential integer underflow
which got assigned CVE-2023-36328.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch          | 2 +-
 package/libtommath/libtommath.hash                                      | 2 +-
 package/libtommath/libtommath.mk                                        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch b/package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch
index c25002ba70..1cf411b391 100644
--- a/package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch
+++ b/package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch
@@ -20,7 +20,7 @@ diff --git a/demo/test.c b/demo/test.c
 index 998f14b3..f719709d 100644
 --- a/demo/test.c
 +++ b/demo/test.c
-@@ -522,7 +522,7 @@ static int test_mp_invmod(void)
+@@ -625,7 +625,7 @@ static int test_mp_invmod(void)
  
  }
  
diff --git a/package/libtommath/libtommath.hash b/package/libtommath/libtommath.hash
index 9af489ef1a..4f5dd40231 100644
--- a/package/libtommath/libtommath.hash
+++ b/package/libtommath/libtommath.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  b7c75eecf680219484055fcedd686064409254ae44bc31a96c5032843c0e18b1  ltm-1.2.0.tar.xz
+sha256  986025d7b374276fee2e30e99f3649e4ac0db8a02257a37ee10eae72abed0d1f  ltm-1.2.1.tar.xz
 
 # Hashes for license files:
 sha256  2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  LICENSE
diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index bd3957d6c2..25d4e836bb 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOMMATH_VERSION = 1.2.0
+LIBTOMMATH_VERSION = 1.2.1
 LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
 LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
 LIBTOMMATH_LICENSE = Unlicense
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
