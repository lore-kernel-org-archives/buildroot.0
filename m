Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C3FC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD5764012B;
	Sun, 30 Oct 2022 22:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD5764012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BEzXhN3jnqjc; Sun, 30 Oct 2022 22:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E867940101;
	Sun, 30 Oct 2022 22:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E867940101
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 945B31BF28B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F8DD40101
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F8DD40101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuG60WyoSjZp for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:24:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EEBC400CE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EEBC400CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B7C6876C7; Sun, 30 Oct 2022 22:24:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 23:24:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8206cdb1cb8efe5046dfd59ad1f468000b0eecb
X-Git-Newrev: 8dd62133a771ecdd73a4ffab5ff7bba60ccb4bc3
X-Patchwork-Hint: ignore
Message-Id: <20221030222427.8B7C6876C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/execline: bump to v2.9.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dd62133a771ecdd73a4ffab5ff7bba60ccb4bc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Summary of changes:

 - skalibs dependency bumped to 2.12.0.0.
 - New options to wait: -o to wait for one of the listed processes,
   and -a to get the default behaviour.
 - wait now exits 99 on timeout.

License hash updated due to copyright year change.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/execline/execline.hash | 4 ++--
 package/execline/execline.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 706b131afd..1d72e2cb49 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a373f497d2335905d750e2f3be2ba47a028c11c4a7d5595dca9965c161e53aed  execline-2.8.0.1.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  01260fcaf80ffbca2a94aa55ea474dfb9e39b3033b55c8af88126791879531f6  execline-2.9.0.1.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index c348d924b7..38f4570ba4 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.8.0.1
+EXECLINE_VERSION = 2.9.0.1
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
