Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD16CD1297
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C7DC40490;
	Mon,  8 Apr 2024 20:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYeHXDaebB1N; Mon,  8 Apr 2024 20:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D793741467
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D793741467;
	Mon,  8 Apr 2024 20:58:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9EC1BF95D
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 293E460A4C
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKVHjm-55Zdp for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7508C605BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7508C605BD
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 345A985C8F; Mon,  8 Apr 2024 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Apr 2024 22:54:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c456a564643c49915a8c9ab5a9f0583d3a64ad9
X-Git-Newrev: e9e3579555d3cccac1b5ecda0c9de375b8056d11
X-Patchwork-Hint: ignore
Message-Id: <20240408205850.345A985C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnpth: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9e3579555d3cccac1b5ecda0c9de375b8056d11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tests are enabled by default since the addition of the package in commit
5d74d39cb421611e7be8ee73a308d608c47cfa28

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
