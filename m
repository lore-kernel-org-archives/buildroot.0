Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAF5FA3743
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CE23812BE;
	Sun, 30 Oct 2022 22:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CE23812BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEWE9GHx4kSZ; Sun, 30 Oct 2022 22:30:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73A7981286;
	Sun, 30 Oct 2022 22:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A7981286
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D47FF1BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF74F402C3
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF74F402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2KWWPXcCYK48 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:30:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 875BF402A4
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 875BF402A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 736DB876EC; Sun, 30 Oct 2022 22:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 23:30:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0773fad16c39b383312deec2f35f7fd626ac9cb4
X-Git-Newrev: 1a236c99f4ec2f52fa2baefe5a21190ab623cfc7
X-Patchwork-Hint: ignore
Message-Id: <20221030223042.736DB876EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s6-networking: bump to v2.5.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a236c99f4ec2f52fa2baefe5a21190ab623cfc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Summary of changes:

 - skalibs dependency bumped to 2.12.0.0
 - s6-dns dependency bumped to 2.3.5.4
 - skalibs dependency bumped to 2.11.1.0
 - execline optional dependency bumped to 2.8.2.0
 - s6 dependency bumped to 2.11.0.1
 - The obsolete minidentd program has been removed.
 - LibreSSL optional dependency bumped to 3.3.4
 - LibreTLS optional dependency bumped to 3.3.4
 - Client certificates are now properly supported in s6-tlsd-io.

License hash updated due to copyright year change.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-networking/s6-networking.hash | 4 ++--
 package/s6-networking/s6-networking.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
index 9e333866d3..1890f95221 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a3fbca789dc5c82b3055fdbd2f55110902198f3136447617ce8f8b79fa8aa554  s6-networking-2.4.1.1.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  7ac79d4de3d9c13532e444ab7497c4e04ad0fa7229d502984d9dc7d48aa64418  s6-networking-2.5.1.1.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index 03807f0652..f740f22635 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_NETWORKING_VERSION = 2.4.1.1
+S6_NETWORKING_VERSION = 2.5.1.1
 S6_NETWORKING_SITE = http://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
