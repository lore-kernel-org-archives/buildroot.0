Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCE3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 13:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0088F41884;
	Sat, 16 Apr 2022 13:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJ1BhinsRgr6; Sat, 16 Apr 2022 13:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCEBA41879;
	Sat, 16 Apr 2022 13:48:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F8AC1BF589
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 13:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AA2E84010
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 13:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPTE1-Ifhzok for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 13:47:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A93284027
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 13:47:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4C91083BAE; Sat, 16 Apr 2022 13:37:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 15:42:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 114487dfd2fbd6c54155a5d58d46aa52ad4869de
X-Git-Newrev: 9b9707d15ede8df3da32e908c6dd22aa0ea42483
X-Patchwork-Hint: ignore
Message-Id: <20220416133759.4C91083BAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mutt: security bump to version
 2.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b9707d15ede8df3da32e908c6dd22aa0ea42483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

CVE-2022-1328: mutt_decode_uuencoded() can read past the of the input line

Buffer Overflow in uudecoder in Mutt affecting all versions starting from
0.94.13 before 2.2.3 allows read past end of input line

For details, see the release notes:
https://marc.info/?l=mutt-users&m=164979464612885&w=2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index bbc9d459b0..952e0b7bc0 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e84597f06d03ca82f8ca3b5ec8bc294c150709b43ed2a0177bf479c3e3345314  mutt-2.2.0.tar.gz
+sha256  978addcdab454f447ed7d1de84b5767e714c30714285bf82e4a1745071d18d89  mutt-2.2.3.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 51178ef03d..45ae36530a 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.0
+MUTT_VERSION = 2.2.3
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
