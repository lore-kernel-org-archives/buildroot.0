Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C90AC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F9A980BDE;
	Sun, 15 Sep 2024 21:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nN6J-Fz6Ls5; Sun, 15 Sep 2024 21:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CED6980537
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CED6980537;
	Sun, 15 Sep 2024 21:41:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C7C51BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0207540A19
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwVrdPuhjCPQ for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5F9340A38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5F9340A38
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C26ED82285; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 15:58:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 559bb33ae71dd2358ca2314ccb24b56cc3809fc1
X-Git-Newrev: e9b0893a8e2ec57db0d2a353539511a9c988a9b4
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.C26ED82285@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go/go-src: share download
 directory with go
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9b0893a8e2ec57db0d2a353539511a9c988a9b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/go/go-src/go-src.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index 0d1a9b3187..340aada94c 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -6,6 +6,7 @@
 
 GO_SRC_SITE = https://storage.googleapis.com/golang
 GO_SRC_SOURCE = go$(GO_VERSION).src.tar.gz
+GO_SRC_DL_SUBDIR = go
 
 GO_SRC_LICENSE = BSD-3-Clause
 GO_SRC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
