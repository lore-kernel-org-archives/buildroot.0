Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FB0C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 14:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 250658198A;
	Wed,  4 Jan 2023 14:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 250658198A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktqFTJusNzfZ; Wed,  4 Jan 2023 14:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 645EA8195D;
	Wed,  4 Jan 2023 14:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 645EA8195D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D86A1BF8C7
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 14:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 797CF60AB1
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 14:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 797CF60AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDgC1xeMhBvm for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 14:32:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F59360C2B
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 14:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F59360C2B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89200874DA; Wed,  4 Jan 2023 14:32:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 15:29:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83c4edf83953bb86257e6b6e3b07f974fc66a37e
X-Git-Newrev: 456f18409861a0bee1d553d530cef8bf3482ee7a
X-Patchwork-Hint: ignore
Message-Id: <20230104143228.89200874DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libksba: security bump to version
 1.6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=456f18409861a0bee1d553d530cef8bf3482ee7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-47629

See also:
https://gnupg.org/blog/20221017-pepe-left-the-ksba.html

For changelog see:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=log;h=libksba-1.6.3

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libksba/libksba.hash | 2 +-
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 77485c0cb6..5c6c5eda7a 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971  libksba-1.6.2.tar.bz2
+sha256  3f72c68db30971ebbf14367527719423f0a4d5f8103fc9f4a1c01a9fa440de5c  libksba-1.6.3.tar.bz2
 
 # Hash for license files:
 sha256  8f1b87e551d97b2b23b6d3403a5d598c63ea89824cb8ee351f631f6cab2beaa5  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 727a836cf4..b7c0508df8 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.2
+LIBKSBA_VERSION = 1.6.3
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
