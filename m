Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849CCC433FE
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 13:42:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2435060F9B
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 13:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2435060F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E26AD6080B;
	Mon,  8 Nov 2021 13:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYOhVm1h1_Ne; Mon,  8 Nov 2021 13:42:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5211660801;
	Mon,  8 Nov 2021 13:42:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B51FA1BF331
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 13:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A21B3402AF
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 13:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3-6Z0xtXWFI for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 13:41:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6BBC402B4
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 13:41:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4129A8B67B; Mon,  8 Nov 2021 13:38:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 14:40:39 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 4f4d21358c8e83809732c257ba4f39272d4ff32f
X-Git-Newrev: 22bf059f43aa4e5e02be45e21fb49f59e594b4ff
X-Patchwork-Hint: ignore
Message-Id: <20211108133806.4129A8B67B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/go: security bump
 to version 1.16.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=22bf059f43aa4e5e02be45e21fb49f59e594b4ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

go1.16.10 (released 2021-11-04) includes security fixes to the archive/zip
and debug/macho packages, as well as bug fixes to the compiler, linker,
runtime, the misc/wasm directory, and to the net/http package.

https://golang.org/doc/devel/release#go1.16.minor

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 39eec5b228..10bbb741e0 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  0a1cc7fd7bd20448f71ebed64d846138850d5099b18cf5cc10a4fc45160d8c3d  go1.16.9.src.tar.gz
+sha256  a905472011585e403d00d2a41de7ced29b8884309d73482a307f689fd0f320b5  go1.16.10.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index cff2fa2c52..8a65e20380 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.9
+GO_VERSION = 1.16.10
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
