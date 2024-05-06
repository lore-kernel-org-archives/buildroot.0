Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35936C25B5F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01A5760899;
	Mon,  6 May 2024 10:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXxfdXLQ6Dg8; Mon,  6 May 2024 10:56:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E9D6089B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2E9D6089B;
	Mon,  6 May 2024 10:56:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FAC31BF33E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68D5360840
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHLjOrhPuj10 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEE2560841
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEE2560841
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:56:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6AF03864F4; Mon,  6 May 2024 10:56:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 12:54:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8773e0aba0bb6778cd8c1dddbce51c3cd4b2069d
X-Git-Newrev: 258a2d54b69c8ef4200ef18c2cf970f80cabf109
X-Patchwork-Hint: ignore
Message-Id: <20240506105620.6AF03864F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libnpth: disable
 tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=258a2d54b69c8ef4200ef18c2cf970f80cabf109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

tests are enabled by default since the addition of the package in commit
5d74d39cb421611e7be8ee73a308d608c47cfa28

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e9e3579555d3cccac1b5ecda0c9de375b8056d11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnpth/libnpth.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index 46c8154021..3fa5e1f905 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -12,5 +12,6 @@ LIBNPTH_LICENSE_FILES = COPYING.LIB
 LIBNPTH_INSTALL_STAGING = YES
 # 0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
 LIBNPTH_AUTORECONF = YES
+LIBNPTH_CONF_OPTS = --disable-tests
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
