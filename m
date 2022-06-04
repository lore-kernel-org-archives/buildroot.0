Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C4BC43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 20:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F15B8434C;
	Sat,  4 Jun 2022 20:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dfQcPrPtgCpy; Sat,  4 Jun 2022 20:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 323CC8431E;
	Sat,  4 Jun 2022 20:56:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A63D01BF396
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 20:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 929844093B
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 20:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vv-C7TPiIJkU for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 20:56:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E084F40931
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 20:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 859F786B8B; Sat,  4 Jun 2022 20:45:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Jun 2022 22:54:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5899f480b2df8f6608051b4e586a255151fe8c1
X-Git-Newrev: d3e3728405fb3df5b3d523b3d81aecf0834f1a63
X-Patchwork-Hint: ignore
Message-Id: <20220604204500.859F786B8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.18.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3e3728405fb3df5b3d523b3d81aecf0834f1a63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.18.3 includes security fixes to the crypto/rand, crypto/tls, os/exec,
and path/filepath packages, as well as bug fixes to the compiler, and the
crypto/tls and text/template/parse packages.

https://go.dev/doc/devel/release#go1.18

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6a9480ff99..45af1fc06f 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  2c44d03ea2c34092137ab919ba602f2c261a038d08eb468528a3f3a28e5667e2  go1.18.2.src.tar.gz
+sha256  0012386ddcbb5f3350e407c679923811dbd283fcdc421724931614a842ecbc2d  go1.18.3.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f9445c7dd3..6767b1481d 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.18.2
+GO_VERSION = 1.18.3
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
