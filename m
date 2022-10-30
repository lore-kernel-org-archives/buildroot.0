Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399C9C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F39402C4;
	Sun, 30 Oct 2022 22:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F39402C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nqH7EbRVgoG; Sun, 30 Oct 2022 22:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 987B8402A4;
	Sun, 30 Oct 2022 22:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 987B8402A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 291211BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 028A080B57
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 028A080B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v633tEfWG840 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:28:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32ABE80B42
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32ABE80B42
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FC66876DA; Sun, 30 Oct 2022 22:28:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 23:27:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80b1d93d8b783e59ae65a0940e74955dbef3f462
X-Git-Newrev: 5aac1d0105a73133fd886acc6c5195ca28f7e17f
X-Patchwork-Hint: ignore
Message-Id: <20221030222858.1FC66876DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s6-linux-utils: bump to v2.6.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5aac1d0105a73133fd886acc6c5195ca28f7e17f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Summary of changes:

 - skalibs dependency bumped to 2.12.0.0.
 - s6-fillurandompool has been replaced with the new rngseed program.

License hash updated due to copyright year change.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-linux-utils/s6-linux-utils.hash | 4 ++--
 package/s6-linux-utils/s6-linux-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index 27e7eb7b7a..c932a4363a 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  c300dbf36b533083f82c6827830c55ce34bfc6cd493c782f207d199669a345ba  s6-linux-utils-2.5.1.5.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  6c7132734a0c8287002ee6910c469f175a97d766a8023c0c33af8ba92643ed59  s6-linux-utils-2.6.0.0.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index 995ff1b855..ffa3ffac5b 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_UTILS_VERSION = 2.5.1.5
+S6_LINUX_UTILS_VERSION = 2.6.0.0
 S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
 S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
