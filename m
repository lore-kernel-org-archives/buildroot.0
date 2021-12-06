Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C38C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 22:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 515AA60683;
	Mon,  6 Dec 2021 22:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCf4yt89DmA7; Mon,  6 Dec 2021 22:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB446060C;
	Mon,  6 Dec 2021 22:28:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9501BF232
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7956684BE3
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSCPrkjr3cow for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 22:28:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 102CE84BE2
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 22:28:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3AF668175F; Mon,  6 Dec 2021 22:23:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 23:09:56 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: ad6d3676790b1a220881082a95e90e18a3bfecc8
X-Git-Newrev: fa0df4790f8d394e3a06391415c064f3757207d8
X-Patchwork-Hint: ignore
Message-Id: <20211206222308.3AF668175F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/pcre: fix broken
 URL
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
Content-Type: multipart/mixed; boundary="===============5397951132087583313=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5397951132087583313==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fa0df4790f8d394e3a06391415c064f3757207d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

As stated on www.pcre.org:
"Note that the former ftp.pcre.org FTP site is no longer available."

Update _SITE URL to Sourceforge.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 236385c50f58190f0dafb342d1d6c5115068683e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre/pcre.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index c8498b7acf..219ac59786 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PCRE_VERSION = 8.44
-PCRE_SITE = https://ftp.pcre.org/pub/pcre
+PCRE_SITE = http://downloads.sourceforge.net/project/pcre/pcre/$(PCRE_VERSION)
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3-Clause
 PCRE_LICENSE_FILES = LICENCE

--===============5397951132087583313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5397951132087583313==--
