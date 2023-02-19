Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B33BC636CC
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 20:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B020405AA;
	Sun, 19 Feb 2023 20:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B020405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PBQu05WAcNZ; Sun, 19 Feb 2023 20:55:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 587AF405A4;
	Sun, 19 Feb 2023 20:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 587AF405A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9BCC1BF2B6
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 20:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83BD681BB4
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 20:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83BD681BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I76XobvQbWAB for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 20:55:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEB1B81BBD
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 20:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB1B81BBD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F083860A7; Sun, 19 Feb 2023 20:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 21:54:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 273bec97fc34068281d44e57bc60fbcfed5c8342
X-Git-Newrev: 8797f3fb272e9c1a5fe6a1953cacf6e5065a133a
X-Patchwork-Hint: ignore
Message-Id: <20230219205533.9F083860A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speechd: disable kali support
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

commit: https://git.buildroot.net/buildroot/commit/?id=8797f3fb272e9c1a5fe6a1953cacf6e5065a133a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable kali support as it is not needed and raises the following build
failure without C++ since the addition of the package in commit
9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d:

  CXX      sd_kali-kali.o
/bin/sh: line 1: no: command not found

Fixes:
 - http://autobuild.buildroot.org/results/2f6c8b3674753d6a9f165117c70e7dad88505505

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/speechd/speechd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index 0d43e4b6fb..46c0672f59 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -12,6 +12,7 @@ SPEECHD_INSTALL_STAGING = YES
 # speechd source code is released without configure script
 SPEECHD_AUTORECONF = YES
 SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
+SPEECHD_CONF_OPTS = --without-kali
 
 # fix missing config.rpath (needed for autoreconf) in the codebase
 define SPEECHD_TOUCH_CONFIG_RPATH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
