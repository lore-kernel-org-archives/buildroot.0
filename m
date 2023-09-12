Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559DEEE3F31
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 21:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F15EE82005;
	Tue, 12 Sep 2023 21:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F15EE82005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osC3SuEo7Cld; Tue, 12 Sep 2023 21:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 391F181F4B;
	Tue, 12 Sep 2023 21:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 391F181F4B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5461BF421
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7728F4033A
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7728F4033A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fk1475AXSEAu for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 21:15:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACE384002B
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACE384002B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CAA286B4E; Tue, 12 Sep 2023 21:15:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 23:05:09 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: c57af4987e0f568805ea787c971a29e382c36769
X-Git-Newrev: a79ab91b97c833d3283ec12ed77d624012bff1df
X-Patchwork-Hint: ignore
Message-Id: <20230912211521.9CAA286B4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/lsof: change
 _LICENSE_FILES to use COPYING
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

commit: https://git.buildroot.net/buildroot/commit/?id=a79ab91b97c833d3283ec12ed77d624012bff1df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Commit e3322e2c7 "lsof: add license info" added the package license
info. At that time, lsof was at version 4.85. The package was not
including a dedicated license file. Instead, the license text was
copied in many files (source files, readmes, ...). It was then decided
to use the small source file "dialects/linux/dproto.h".

Recently, lsof added a COPYING license file. See [1]. This commit was
first included in lsof version 4.97.0. We can now use this file.

The license file hash is updated due to formatting changes. As a side
note, the copyright year in source file was 1997 (see [2]), whereas in
the new license file it is 2002. Source files have different copyright
dates, and can be as old as 1994, for example in [3]. The rest of the
license text remains unchanged.

[1] https://github.com/lsof-org/lsof/commit/62dab61cae3ca9e4d41ec573ae5cda0c5689c326
[2] https://github.com/lsof-org/lsof/blob/4.98.0/dialects/linux/dproto.h#L9
[3] https://github.com/lsof-org/lsof/blob/4.98.0/arg.c#L7

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 64490ea84c135a09b863de4d2ff75d0bfcfbdd96)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index b6a29b3cea..d9e85ac15c 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  80308a614508814ac70eb2ae1ed2c4344dcf6076fa60afc7734d6b1a79e62b16  lsof-4.98.0.tar.gz
-sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
+sha256  225222ff9bf38abc2cef7205e9b05c60935efa9ec28d1fd01e503c9316088718  COPYING
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 8d9c1b60e3..303622d111 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -7,9 +7,7 @@
 LSOF_VERSION = 4.98.0
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
-# License is repeated in each file, this is a relatively small one.
-# It is also defined in 00README, but that contains a lot of other cruft.
-LSOF_LICENSE_FILES = dialects/linux/dproto.h
+LSOF_LICENSE_FILES = COPYING
 LSOF_CPE_ID_VENDOR = lsof_project
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
