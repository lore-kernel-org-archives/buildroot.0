Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A0BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:55:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 185346056B
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 185346056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D204A403FF;
	Tue,  3 Aug 2021 22:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlh6ERg25CoX; Tue,  3 Aug 2021 22:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C693D4020C;
	Tue,  3 Aug 2021 22:55:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A68E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14E9C40628
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqrgJw6rmsjI for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CBFC40527
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D4B68843F5; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Jun 2021 21:36:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ac9855e761443dee4f9d461b83e12443d37e8678
X-Git-Newrev: 75d5e8fb9cd68388f1ae2f3724fef988b0fb4b70
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.D4B68843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gptfdisk: security
 bump version to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=75d5e8fb9cd68388f1ae2f3724fef988b0fb4b70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://sourceforge.net/p/gptfdisk/code/ci/master/tree/NEWS

Version 1.0.6 fixes CVE-2020-0256 & CVE-2021-0308.

Removed md5 hash.

Rebased patch due to upstream commit
https://sourceforge.net/p/gptfdisk/code/ci/6180deb472c302c47f4d4acff8f2123d10824364/#diff-3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch | 2 +-
 package/gptfdisk/gptfdisk.hash                                     | 7 +++----
 package/gptfdisk/gptfdisk.mk                                       | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch b/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch
index 518639387a..02f954531a 100644
--- a/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch
+++ b/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch
@@ -29,7 +29,7 @@ index 1b18cf2..4ebfde1 100644
  #include <iostream>
  #include <string>
  #include <sstream>
--#ifdef __APPLE__
+-#if defined (__APPLE__) || (__FreeBSD__)
  #include <ncurses.h>
 -#else
 -#include <ncursesw/ncurses.h>
diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index bff17dcc21..7894f2187d 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,6 +1,5 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.5/
-md5  58dac67c85e46ca87b587231549aefe6  gptfdisk-1.0.5.tar.gz
-sha1  b642aa628cbc9fa63e9a73dad5acc588042527ac  gptfdisk-1.0.5.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.7/
+sha1  406ab2596e1911c916dce677ce7e903076d94c6d  gptfdisk-1.0.7.tar.gz
 # Locally computed
-sha256  0e7d3987cd0488ecaf4b48761bc97f40b1dc089e5ff53c4b37abe30bc67dcb2f  gptfdisk-1.0.5.tar.gz
+sha256  754004b7f85b279287c7ac3c0469b1d7e0eae043a97a2e587b0560ca5f3828c0  gptfdisk-1.0.7.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index e848837b76..d92a527105 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.5
+GPTFDISK_VERSION = 1.0.7
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
