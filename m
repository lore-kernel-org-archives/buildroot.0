Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369B7C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E35DB41949;
	Mon,  6 Jun 2022 12:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1aIyjlKTJA4; Mon,  6 Jun 2022 12:31:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06369418B3;
	Mon,  6 Jun 2022 12:31:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B4881BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88F3260746
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h9pVJd8Tvrm2 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:30:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85FC760675
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:30:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 65F7886D0E; Mon,  6 Jun 2022 12:18:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:30:25 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2c552913dd3c88acecb034fc473b3380ae57afe2
X-Git-Newrev: f9895b7045fcfc7f6aeb93a00badce5379d67f21
X-Patchwork-Hint: ignore
Message-Id: <20220606121859.65F7886D0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/unrar: security
 bump to version 6.1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9895b7045fcfc7f6aeb93a00badce5379d67f21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-30333: RARLAB UnRAR before 6.12 on Linux and UNIX allows
directory traversal to write to files during an extract (aka unpack)
operation, as demonstrated by creating a ~/.ssh/authorized_keys file.

6.12 application version corresponds to 6.1.7 source version:
https://github.com/debian-calibre/unrar-nonfree/compare/upstream/6.1.6...upstream/6.1.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7564f1de067e9e3cf0aa2662cab79b9834b54ff1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index e354753bb2..40e05a1a32 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d05022442009202a792e588bec58921c123ff046fc755f7f2272871a5bd79636  unrarsrc-6.1.3.tar.gz
+sha256  de75b6136958173fdfc530d38a0145b72342cf0d3842bf7bb120d336602d88ed  unrarsrc-6.1.7.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 6923660153..fee9fb753b 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 6.1.3
+UNRAR_VERSION = 6.1.7
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
