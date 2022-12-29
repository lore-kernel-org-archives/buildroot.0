Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B8CC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3ACA83F0D;
	Mon, 20 Feb 2023 23:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3ACA83F0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zo6Ds3K9zYr6; Mon, 20 Feb 2023 23:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1189383F0B;
	Mon, 20 Feb 2023 23:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1189383F0B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBDEB1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DA5761ABF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DA5761ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0aKb4a4XovH for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E656617B2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E656617B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F031A81979; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:03:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cdb77d0b86ca7e62b61d7f7e7947af591fe47e71
X-Git-Newrev: 7a2afdb7b1180bed3b6ad92c22c908805467ead3
X-Patchwork-Hint: ignore
Message-Id: <20230220205217.F031A81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mutt: bump to version
 2.2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a2afdb7b1180bed3b6ad92c22c908805467ead3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Mutt 2.2.9 was released on November 12, 2022. This is a bug-fix release,
fixing a build issue with recent GPGME releases.

Mutt 2.2.8 was released on November 5, 2022. This is a bug-fix release,
fixing a possible crash when using GPGME to view an application/pgp key
block. It also makes some changes to resizing and window size logic, and
enables batch-mode IMAP Fcc'ing.

https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-9-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 27e439183a..c475641ab5 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eb13858f58bb369f477bf652d90e9b6aaddd0d610acbea3455049e5efad36df1  mutt-2.2.7.tar.gz
+sha256  fa531b231d58fe1f30ceda0ed626683ea9ebdfb76ce47ef8bb27c2f77422cffb  mutt-2.2.9.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 7a4bc1b10c..0a98396d88 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.7
+MUTT_VERSION = 2.2.9
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
