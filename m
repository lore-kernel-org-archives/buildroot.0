Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1913CEDE99F
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDBE260A5B;
	Thu, 14 Sep 2023 09:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDBE260A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ls-IEVA5ocZ; Thu, 14 Sep 2023 09:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0327A6120E;
	Thu, 14 Sep 2023 09:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0327A6120E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47B921BF42E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24543408D5
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24543408D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1kt0SPrlpt2Q for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:52:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07A25409E1
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07A25409E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0581C86F2B; Thu, 14 Sep 2023 09:52:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 11:50:49 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 6540e3d1cc203a6425925444a837ddc654ab95ef
X-Git-Newrev: 1cceeecaf4307819bb5bda2d8b784337546135ee
X-Patchwork-Hint: ignore
Message-Id: <20230914095230.0581C86F2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libtommath:
 security bump to version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cceeecaf4307819bb5bda2d8b784337546135ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This is a bugfix release only containing the fix to a potential integer underflow
which got assigned CVE-2023-36328.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b7488b4d685657e7d724d18ab1e7982e2148e271)
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
