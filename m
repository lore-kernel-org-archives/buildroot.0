Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D667C7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F04A561426;
	Wed,  5 Apr 2023 20:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F04A561426
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vb7ZDHnsSgGa; Wed,  5 Apr 2023 20:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B10561421;
	Wed,  5 Apr 2023 20:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B10561421
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC0931BF2E5
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4D80417BB
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D80417BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXu3wcQRG_cb for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:18:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C886C417B1
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C886C417B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0DD3838E9; Wed,  5 Apr 2023 20:18:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 22:17:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e763381b7d7c9c7971775087adbae9b9b156223
X-Git-Newrev: b7eaa9af7ba87f2eac1ec9d2f7116b4ecf4f78be
X-Patchwork-Hint: ignore
Message-Id: <20230405201850.B0DD3838E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.19.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7eaa9af7ba87f2eac1ec9d2f7116b4ecf4f78be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.19.8 (released 2023-04-04) includes security fixes to the go/parser,
html/template, mime/multipart, net/http, and net/textproto packages, as well as
bug fixes to the compiler, the linker, the runtime, and the time package.

Fixes security vulnerabilities:

go/parser: infinite loop in parsing (CVE-2023-24537)

html/template: backticks not treated as string delimiters (CVE-2023-24538)

net/http, net/textproto: denial of service from excessive memory
allocation (CVE-2023-24534)

net/http, net/textproto, mime/multipart: denial of service from excessive
resource consumption (CVE-2023-24536)

https://go.dev/doc/devel/release#go1.19.8
https://github.com/golang/go/issues?q=milestone%3AGo1.19.8+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 89e2fd952f..5488ed9710 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  775bdf285ceaba940da8a2fe20122500efd7a0b65dbcee85247854a8d7402633  go1.19.7.src.tar.gz
+sha256  1d7a67929dccafeaf8a29e55985bc2b789e0499cb1a17100039f084e3238da2f  go1.19.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index a94603f268..37554ddf86 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.7
+GO_VERSION = 1.19.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
