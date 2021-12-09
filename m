Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2295AC433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 18:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B8A6422A4;
	Thu,  9 Dec 2021 18:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_j7UgvY4YNr; Thu,  9 Dec 2021 18:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E7664229F;
	Thu,  9 Dec 2021 18:17:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7691A1BF295
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 18:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D2BD4229F
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 18:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tEyQKHp-ENfc for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 18:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50EFC4229E
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 18:17:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E651781E68; Thu,  9 Dec 2021 18:12:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 Dec 2021 19:17:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fba568a16e9c994591b298d4f0111ed003d9fdc3
X-Git-Newrev: cc570eff964fbb2afb88b7e59ee08372ae0aaa32
X-Patchwork-Hint: ignore
Message-Id: <20211209181211.E651781E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre2: fix broken URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc570eff964fbb2afb88b7e59ee08372ae0aaa32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As stated on www.pcre.org:

    You can download the current release of the PCRE2 library from its
    official home on GitHub
    [...]
    Note that the former ftp.pcre.org FTP site is no longer available.

Update _SITE URL to the official home on Github.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[yann.morin.1998@free.fr: use Github, not SourceForge]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pcre2/pcre2.hash | 4 ++--
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 130ce1f596..2e86d8a193 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
-# Locally calculated after checking pgp signature
-# https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2.sig
+# Locally calculated after checking pgp signature and compared with the mirror on:
+# http://downloads.sourceforge.net/project/pcre/pcre2/10.37/pcre2-10.37.tar.bz2.sig
 sha256  4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270  pcre2-10.37.tar.bz2
 # Locally computed
 sha256  9c9488256e3612ec5ea40fd12abe7ec55a58f23bd36e6f465116c2b3cbffba02  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 220eb8a99c..398e7389f3 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PCRE2_VERSION = 10.37
-PCRE2_SITE = https://ftp.pcre.org/pub/pcre
+PCRE2_SITE = https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
 PCRE2_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
