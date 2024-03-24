Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B97C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A991540642;
	Sun, 24 Mar 2024 14:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdGrm_e5LfUp; Sun, 24 Mar 2024 14:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43DED406CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43DED406CB;
	Sun, 24 Mar 2024 14:59:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17C9C1BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21B5540340
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhCBExqBsIjo for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A362C40343
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A362C40343
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DC8D83AEB; Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:49:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00f7bd06d66b05ec694f8a3e90d56e5c4f532e6b
X-Git-Newrev: f85a1eb173954cfcdda1c0e947913bba598290d8
X-Patchwork-Hint: ignore
Message-Id: <20240324145836.9DC8D83AEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/neon: drop unrecognized rpath
 option
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f85a1eb173954cfcdda1c0e947913bba598290d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rpath is an unrecognized option since the addition of the package in
commit 59a9c02e1355bcd630a207e8be319a044597ad1d

Fixes: 59a9c02e1355bcd630a207e8be319a044597ad1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/neon/neon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index a801eae28f..e7872df3c9 100644
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
