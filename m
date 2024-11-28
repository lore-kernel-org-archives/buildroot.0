Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A19CE77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCB868116F;
	Sun,  8 Dec 2024 13:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnVptqbONi0s; Sun,  8 Dec 2024 13:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0943B811FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0943B811FF;
	Sun,  8 Dec 2024 13:08:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 082FA979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1067606F1
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnrwXWuQqthM for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B5426082C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B5426082C
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5756986B75; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Nov 2024 21:19:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb3bf58290852448af09616160b4c003403802a5
X-Git-Newrev: a6db4cde0fcbe7f047305a38b461668f4a9b553c
X-Patchwork-Hint: ignore
Message-Id: <20241208130653.5756986B75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncdu: bump to version 1.21
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6db4cde0fcbe7f047305a38b461668f4a9b553c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 1.20, see:
https://dev.yorhel.nl/ncdu/changes

This commit also update the _SITE URL to use https.

The autoconf configure script of this new version (generated with
autoconf 2.72) now requires pkg-config. Therefore, this commit also
adds host-pkgconf in _DEPENDENCIES.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncdu/ncdu.hash | 8 ++++----
 package/ncdu/ncdu.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index cfb44b7d31..40faf9bd0d 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,10 +1,10 @@
 # From https://dev.yorhel.nl/ncdu
 # After checking pgp signature from:
-# https://dev.yorhel.nl/download/ncdu-1.20.tar.gz.asc
+# https://dev.yorhel.nl/download/ncdu-1.21.tar.gz.asc
 # With key 74460D32B80810EBA9AFA2E962394C698C2739FA
-md5  563966db4c3c34d61cc890a85ddedae0  ncdu-1.20.tar.gz
-sha1  1a3543cfbbe3e402d6347cf688468327064941b9  ncdu-1.20.tar.gz
-sha256  5fe2bb841abe72374bb242dbb93293c4ae053078432d896a7481b2ff10be9572  ncdu-1.20.tar.gz
+md5  3d5f399a00ca2ac3ba319e8cb99118ab  ncdu-1.21.tar.gz
+sha1  98c365e681f2c42a54d6277bea041d5a7104d934  ncdu-1.21.tar.gz
+sha256  a894d3a9b46bce578a6039bef48f54533ec402fb589b0769bfbb1d1edf9601a6  ncdu-1.21.tar.gz
 
 # computed locally
 sha256  a324e25fe6af7fa45286b34a516b4c5a11544344bc80efb74fc51033b2e76df4  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index cff824fd74..c8c691605a 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.20
-NCDU_SITE = http://dev.yorhel.nl/download
+NCDU_VERSION = 1.21
+NCDU_SITE = https://dev.yorhel.nl/download
 
-NCDU_DEPENDENCIES = ncurses
+NCDU_DEPENDENCIES = host-pkgconf ncurses
 
 NCDU_LICENSE = MIT
 NCDU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
