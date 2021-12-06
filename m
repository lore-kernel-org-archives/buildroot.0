Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1ABFC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B6E41C6D;
	Mon,  6 Dec 2021 18:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7mJkMQIRT23; Mon,  6 Dec 2021 18:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE24841C6A;
	Mon,  6 Dec 2021 18:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1A3A1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF46084B99
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9u4BlWsONsmD for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:15:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F4DC84B96
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:15:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 999ED81499; Mon,  6 Dec 2021 18:10:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 19:13:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46ccda3a2f8336b1568672cb9f0c19c6a86607e7
X-Git-Newrev: e72a25c33e2f1607499a43e6ccdb2f184c224871
X-Patchwork-Hint: ignore
Message-Id: <20211206181036.999ED81499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: drop autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=e72a25c33e2f1607499a43e6ccdb2f184c224871
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIGHTTPD_AUTORECONF=YES was added on master, but the package was changed to
build with meson on next, so this doesn't do anything any more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index e7a33e1a1d..7ca71e356a 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -12,8 +12,6 @@ LIGHTTPD_LICENSE = BSD-3-Clause
 LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
 LIGHTTPD_DEPENDENCIES = host-pkgconf
-# Issue in configure script provided in tarball
-LIGHTTPD_AUTORECONF = YES
 LIGHTTPD_CONF_OPTS = \
 	-Dwith_brotli=false \
 	-Dwith_dbi=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
