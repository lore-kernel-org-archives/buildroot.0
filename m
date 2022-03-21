Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD30C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6D1360FB2;
	Mon, 21 Mar 2022 21:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZpPBAJkvH_C; Mon, 21 Mar 2022 21:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF55F60FAD;
	Mon, 21 Mar 2022 21:00:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 498CB1BF373
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36A0E40A5D
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sl53N4l-P9pW for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:00:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BD8440A30
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:00:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EB54D84C9F; Mon, 21 Mar 2022 20:51:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 21:56:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d6e5a8501ff509760dca5c1477281d3f3430ddf
X-Git-Newrev: 7b9c81cc4eefd0972b91abced472e2bce8b53fa2
X-Patchwork-Hint: ignore
Message-Id: <20220321205120.EB54D84C9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libodb: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b9c81cc4eefd0972b91abced472e2bce8b53fa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libodb/libodb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libodb/libodb.mk b/package/libodb/libodb.mk
index 11ca9de866..b25e8ac501 100644
--- a/package/libodb/libodb.mk
+++ b/package/libodb/libodb.mk
@@ -12,5 +12,7 @@ LIBODB_INSTALL_STAGING = YES
 LIBODB_LICENSE = GPL-2.0
 LIBODB_LICENSE_FILES = LICENSE
 LIBODB_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+HOST_LIBODB_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
