Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96643C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE71617AB;
	Thu,  9 Mar 2023 20:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EE71617AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urzk-GnCp5I4; Thu,  9 Mar 2023 20:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E6C1607B5;
	Thu,  9 Mar 2023 20:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E6C1607B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9695A1BF97E
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70875419C5
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70875419C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id koX6UM2HeQeo for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:29:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B83E41999
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B83E41999
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 560B486B6F; Thu,  9 Mar 2023 20:29:03 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 21:12:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95c0a98054a4d8f45617f233130b198cc488e847
X-Git-Newrev: 33a208e5dac02df473f8325ee93c2e07489f9a62
X-Patchwork-Hint: ignore
Message-Id: <20230309202903.560B486B6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speechd: fix gettext version
 mismatch
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

commit: https://git.buildroot.net/buildroot/commit/?id=33a208e5dac02df473f8325ee93c2e07489f9a62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fix gettext version mismatch in case of BR2_SYSTEM_ENABLE_NLS and
  BR2_PACKAGE_PROVIDES_HOST_GETTEXT="host-gettext-gnu" by setting
  SPEECHD_GETTEXTIZE

Fixes:

  -  http://autobuild.buildroot.net/results/283333290c5adb48d0c6e592b3261992537f92d3

  Making all in po
  *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.19 but the autoconf macros are from gettext version 0.20

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/speechd/speechd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index dee94a6752..ec62980986 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -11,6 +11,7 @@ SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
 SPEECHD_INSTALL_STAGING = YES
 # speechd source code is released without configure script
 SPEECHD_AUTORECONF = YES
+SPEECHD_GETTEXTIZE = YES
 SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
 SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
 SPEECHD_CONF_OPTS = --without-kali
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
