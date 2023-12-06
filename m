Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C6EC4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 13:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B337E831AE;
	Wed,  6 Dec 2023 13:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B337E831AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUFSfOCsuvDz; Wed,  6 Dec 2023 13:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E870B83196;
	Wed,  6 Dec 2023 13:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E870B83196
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAB801BF34C
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 13:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F021614D0
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 13:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F021614D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7F3bgshLJhO for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 13:00:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 598C6614FF
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 13:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 598C6614FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2531E87A21; Wed,  6 Dec 2023 13:00:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Dec 2023 13:47:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35261f201cfdf4f701e98474239043cac84be28a
X-Git-Newrev: 6cf0f2a7eb249f498c325fb0ae137a8d4c3ef8d8
X-Patchwork-Hint: ignore
Message-Id: <20231206130009.2531E87A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: bump to version 1.10.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=6cf0f2a7eb249f498c325fb0ae137a8d4c3ef8d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=blob;f=NEWS;h=b767dc1170eb479b9a311cca4074c58e4eedaf0b;hb=aa1610866f8e42bdc272584f0a717f32ee050a22
https://dev.gnupg.org/T6817

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.hash | 4 ++--
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index cfbf9eaf17..ffe30e1455 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  0b9555960d84a09ea14e52360808f2e02e9c12d2  libgcrypt-1.10.2.tar.bz2
-sha256  3b9c02a004b68c256add99701de00b383accccf37177e0d6c58289664cce0c03  libgcrypt-1.10.2.tar.bz2
+sha1  359e1d01ad2eb9cd2db964ea96ef3712d0c2c649  libgcrypt-1.10.3.tar.bz2
+sha256  8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa  libgcrypt-1.10.3.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index b74838b649..2e4bf7448e 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.10.2
+LIBGCRYPT_VERSION = 1.10.3
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
