Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B041C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 08:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C969A81E66;
	Mon, 25 Mar 2024 08:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOashDxtWB1s; Mon, 25 Mar 2024 08:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA2FE81E5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA2FE81E5A;
	Mon, 25 Mar 2024 08:25:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 245A31BF3DB
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 08:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B96BE6073C
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 08:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siKAVKLQF-Ro for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 08:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B00FD605E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B00FD605E4
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 08:25:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AA1283D7B; Mon, 25 Mar 2024 08:25:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 09:20:16 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6ac268457b0123235ab8b327f4baa167c5a169bf
X-Git-Newrev: f244138016125a98274d7a741c8eb2eb97f1b2db
X-Patchwork-Hint: ignore
Message-Id: <20240325082507.9AA1283D7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/neon: drop
 unrecognized rpath option
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

commit: https://git.buildroot.net/buildroot/commit/?id=f244138016125a98274d7a741c8eb2eb97f1b2db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

rpath is an unrecognized option since the addition of the package in
commit 59a9c02e1355bcd630a207e8be319a044597ad1d

Fixes: 59a9c02e1355bcd630a207e8be319a044597ad1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit f85a1eb173954cfcdda1c0e947913bba598290d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neon/neon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 96ee608780..93870b9966 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -10,7 +10,7 @@ NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
 NEON_CPE_ID_VENDOR = webdav
 NEON_INSTALL_STAGING = YES
-NEON_CONF_OPTS = --without-gssapi --disable-rpath
+NEON_CONF_OPTS = --without-gssapi
 NEON_CONFIG_SCRIPTS = neon-config
 NEON_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NEON_CONF_ENV = ne_cv_libsfor_bindtextdomain=$(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
