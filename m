Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4653C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAE7260615;
	Thu,  7 Aug 2025 17:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoHEYh8UEftZ; Thu,  7 Aug 2025 17:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBF7B60656
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBF7B60656;
	Thu,  7 Aug 2025 17:01:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE3831
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC42080BEE
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8VmxAvFX6Ba for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E636880C17
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E636880C17
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E450382AE0; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2f83e0ccb772ba561d85ee4ce162c75503a467d2
X-Git-Newrev: bc47ce6a422e2c6aa0ebe715efc77ae75df57f5e
X-Patchwork-Hint: ignore
Message-Id: <20250807170021.E450382AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libmicrohttpd:
 bump version to 1.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bc47ce6a422e2c6aa0ebe715efc77ae75df57f5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fix double-close bugs on bind() errors reported by MC on the list.

Removed MHD2 draft code, now in libmicrohttpd2.git.

Changelog: https://git.gnunet.org/libmicrohttpd.git/tree/ChangeLog

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2fd793312563c6fe9bdf8fb8632e0006a31092ec)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index f1b3f8b7d8..59c87a738d 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a89e09fc9b4de34dde19f4fcb4faaa1ce10299b9908db1132bbfa1de47882b94  libmicrohttpd-1.0.1.tar.gz
+sha256  df324fcd0834175dab07483133902d9774a605bfa298025f69883288fd20a8c7  libmicrohttpd-1.0.2.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 6998ffd1ae..335234c14b 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.1
+LIBMICROHTTPD_VERSION = 1.0.2
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
