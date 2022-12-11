Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9FAC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47BF2814B3;
	Sun, 11 Dec 2022 13:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47BF2814B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wz7hGPToQeRY; Sun, 11 Dec 2022 13:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A2F381678;
	Sun, 11 Dec 2022 13:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A2F381678
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 147BA1BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DF3860B06
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DF3860B06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_447uyZp_wY for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:09:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE03760B8A
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE03760B8A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABB2B86099; Sun, 11 Dec 2022 13:09:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 11:50:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5a009920f0a79ecfcfa2778a61e4a49cdd4d6b3
X-Git-Newrev: 94170d3ecbbf751adfc55c79d6e5619b0a1ce018
X-Patchwork-Hint: ignore
Message-Id: <20221211130926.ABB2B86099@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncdu: bump to version 1.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=94170d3ecbbf751adfc55c79d6e5619b0a1ce018
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 1.17, see:
- https://dev.yorhel.nl/ncdu/changes

This commit also adds md5 and sha1 hashes published on the web site.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncdu/ncdu.hash | 4 +++-
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index c47b4f9bac..1e31eaea8e 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,5 +1,7 @@
 # From https://dev.yorhel.nl/ncdu
-sha256  810745a8ed1ab3788c87d3aea4cc1a14edf6ee226f764bcc383e024ba56adbf1  ncdu-1.17.tar.gz
+md5  4186b5be477cc3a0944619ade81f123b  ncdu-1.18.tar.gz
+sha1  d47ce3cdf317adadc1426817d07899c90b767aba  ncdu-1.18.tar.gz
+sha256  3c37a1a96580c9c5d2cc352dc3c5eef0d909158c05f1cc29db4712544c8b9f95  ncdu-1.18.tar.gz
 
 # computed locally
 sha256  4590cb935ff8a50cee76ce12c2cb0411c0b06e84c267b478579785dcf328660d  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index acfd496ec8..240ef9d8ea 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.17
+NCDU_VERSION = 1.18
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
