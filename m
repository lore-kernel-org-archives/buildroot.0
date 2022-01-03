Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E998CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 20:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF3A81D4D;
	Mon,  3 Jan 2022 20:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ELgSpv2zzXAg; Mon,  3 Jan 2022 20:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E80FA81D3D;
	Mon,  3 Jan 2022 20:46:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D91CE1BF9AA
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4965405BE
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m_DqkKRagr1y for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 20:45:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07226403AA
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 20:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 61DBF82DF2; Mon,  3 Jan 2022 20:39:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jan 2022 21:44:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 867b708ebdcf68f81bd07f91901d3ca12e94c9e7
X-Git-Newrev: c37cf14c4cd8b4a9ede2ab4aaa39f01b2a1a2bff
X-Patchwork-Hint: ignore
Message-Id: <20220103203945.61DBF82DF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump to version 3.37.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c37cf14c4cd8b4a9ede2ab4aaa39f01b2a1a2bff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 94f0127d19..604275ebfb 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  731a4651d4d4b36fc7d21db586b2de4dd00af31fd54fb5a9a4b7f492057479f7  sqlite-autoconf-3370000.tar.gz
+sha256  40f22a13bf38bbcd4c7ac79bcfb42a72d5aa40930c1f3f822e30ccce295f0f2e  sqlite-autoconf-3370100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index be060c3117..59b76ce164 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.37.0
-SQLITE_TAR_VERSION = 3370000
+SQLITE_VERSION = 3.37.1
+SQLITE_TAR_VERSION = 3370100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2021
 SQLITE_LICENSE = Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
