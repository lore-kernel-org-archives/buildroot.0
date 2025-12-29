Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D94CD3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 10:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F5CC60AE6;
	Mon, 29 Dec 2025 10:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJuiBbJNtspe; Mon, 29 Dec 2025 10:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B05C460773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767004804;
	bh=DE3hGRYSyHs0pN4+beaHE7Zfwwu1Z2Y9qnU9E2PTxOo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gq7lMn22pw5kc0SCVraFVjQgnHfCgfUYzKju/e1wWdnjnl2qNTu2QELSFZIQP1RQi
	 dvVvnLFnuegzvaRwTdkSfzeKTklKRq7Z7skwtNJ9FdjOZ98qq75QXY3n89GO2Nxo3n
	 wUwqT6whYuEqDAU/7s7yVhNfDxGuJO6Qlg/+Upd3A8OKyWUBAwpPz504kcwyzagIoq
	 WbMf6OOHrFv4azbgw5gciFnSffJVW0WBsKizsaiBEsKZ1PhAYEb1sbNBUQxH9GFkyG
	 gnzs88L8jiqF1vTFMaBQBbb8gtt04bbiA1Z2Nh/Txqv00cvjgng4gA9Z33Kupt3Djt
	 8YMlmV39eYw5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B05C460773;
	Mon, 29 Dec 2025 10:40:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFDFFD8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1C3A60AE1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVUhSWzAxr3D for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 10:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4616A606C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4616A606C5
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:40:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 360AB87A6D; Mon, 29 Dec 2025 10:40:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 11:26:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6aa2e0e655ac765493f454d305f41e2161134bd9
X-Git-Newrev: dd295e5ba3fd68373da4e83837cd65266c978928
X-Patchwork-Hint: ignore
Message-Id: <20251229104002.360AB87A6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wtfutil: bump version to 0.47.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dd295e5ba3fd68373da4e83837cd65266c978928
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/wtfutil/wtf/releases

Needs bump of go to >= 1.25.4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wtfutil/wtfutil.hash | 2 +-
 package/wtfutil/wtfutil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wtfutil/wtfutil.hash b/package/wtfutil/wtfutil.hash
index d4afbdc050..9e90731ac3 100644
--- a/package/wtfutil/wtfutil.hash
+++ b/package/wtfutil/wtfutil.hash
@@ -1,2 +1,2 @@
-sha256  1f2a3a037b0e4967039d2241cbe2ba3693a60bd92bd0047cc3361b0faad2a7b6  wtfutil-0.41.0-go2.tar.gz
+sha256  1283e2338e5ca35a7c65596192f151859ab14ea3299321dcf1bb17de30904ceb  wtfutil-0.47.1-go2.tar.gz
 sha256  b59f3dbd83c6aa4e003b6eafa80bc53f0629e4d164e8b125c56869c2603dbc8f  LICENSE.md
diff --git a/package/wtfutil/wtfutil.mk b/package/wtfutil/wtfutil.mk
index 54fea09574..3b92a5797d 100644
--- a/package/wtfutil/wtfutil.mk
+++ b/package/wtfutil/wtfutil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WTFUTIL_VERSION = 0.41.0
+WTFUTIL_VERSION = 0.47.1
 WTFUTIL_SITE = $(call github,wtfutil,wtf,v$(WTFUTIL_VERSION))
 WTFUTIL_LICENSE = MPL-2.0
 WTFUTIL_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
