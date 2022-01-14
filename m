Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A197DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 15:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2781C4157B;
	Fri, 14 Jan 2022 15:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAgSfdXs007F; Fri, 14 Jan 2022 15:56:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6966941578;
	Fri, 14 Jan 2022 15:56:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8841A1BF5A2
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84D8B81442
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E6XeYhRudSgY for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 15:56:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7AE581434
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 15:56:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9A6AD835B1; Fri, 14 Jan 2022 15:50:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 16:53:49 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 05889c9c37d6367c4643c7992714ed461da6fe2e
X-Git-Newrev: a29b8c0e7ea48b7c74a921c32bae9199f466025b
X-Patchwork-Hint: ignore
Message-Id: <20220114155006.9A6AD835B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/pcre2: fix broken
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a29b8c0e7ea48b7c74a921c32bae9199f466025b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit cc570eff964fbb2afb88b7e59ee08372ae0aaa32)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
