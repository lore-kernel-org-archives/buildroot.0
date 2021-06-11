Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1324C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:00:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8861D60F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8861D60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F951405C5;
	Tue,  3 Aug 2021 23:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S40RUM4KHLuP; Tue,  3 Aug 2021 23:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A36E3406A1;
	Tue,  3 Aug 2021 23:00:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 265561BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 994784061A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPLaMoOthIFu for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E30CB40621
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2F265843F5; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Jun 2021 12:05:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 50fc126b8ecca747af1bb53f14fcb39b7b9965fd
X-Git-Newrev: d495593de17e04ed36094fa899f0710dfbbc9f01
X-Patchwork-Hint: ignore
Message-Id: <20210803210949.2F265843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpg123: bump version
 to 1.25.15
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d495593de17e04ed36094fa899f0710dfbbc9f01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bugfix release. From the release notes:

Some backports of important fixes to the 1.25 series, for very conservative
people.

libmpg123: Backport bit reservoir CRC fix from 1.26
libmpg123: Backport part2_3_length regression fix (bug 312).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash | 8 ++++----
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 02c40ad086..e5fb09b46a 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.13/
-sha1 2b6428dc563c56fb1374191d1244c8ac928e4d89  mpg123-1.25.13.tar.bz2
-md5 294a6c30546504ec3d0deac2b2ea22be  mpg123-1.25.13.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.25.15/
+sha1  286fcb83afad3ecbfea60434d3ee1b6d7f41bb7c  mpg123-1.25.15.tar.bz2
+md5  9a050d4b3573661c606f8095a3f34ca3  mpg123-1.25.15.tar.bz2
 # Locally calculated
-sha256 90306848359c793fd43b9906e52201df18775742dc3c81c06ab67a806509890a  mpg123-1.25.13.tar.bz2
+sha256  503a76d82d97f1a6513bbeb284e460a99fb17ef80f23a661d8fc026ce6adcbbc  mpg123-1.25.15.tar.bz2
 # License file
 sha256  f40e0dd86b27b52e429b693a87b3ca63ae0a98a4d142e77207aa6bdf1db7a295  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 588a4ffc32..9aa9cd1c10 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.25.13
+MPG123_VERSION = 1.25.15
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
