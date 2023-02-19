Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832D1C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31582612D9;
	Tue, 21 Feb 2023 01:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31582612D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXkhgmUlPcQq; Tue, 21 Feb 2023 01:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 789746128B;
	Tue, 21 Feb 2023 01:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 789746128B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6DD81BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53D0A414E7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53D0A414E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPBFD6GzeUdL for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1BE14182B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BE14182B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADFCA86495; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 21:54:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 273bec97fc34068281d44e57bc60fbcfed5c8342
X-Git-Newrev: 8797f3fb272e9c1a5fe6a1953cacf6e5065a133a
X-Patchwork-Hint: ignore
Message-Id: <20230220205302.ADFCA86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/speechd: disable kali
 support
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
