Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC666C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D58E408EF;
	Mon, 10 Apr 2023 21:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D58E408EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bcH8tqlfuMwt; Mon, 10 Apr 2023 21:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AD94408D5;
	Mon, 10 Apr 2023 21:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AD94408D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 652341BF3DA
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B71781E40
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B71781E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CItn2KH6cQCF for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:31:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A30481DE4
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A30481DE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66FC883EE8; Mon, 10 Apr 2023 21:31:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 23:30:37 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e0b0380de43e169c8ca667c25513442c59f8c4f8
X-Git-Newrev: 8d44a0369d9c5380c827e0ef0d31af9ad209979e
X-Patchwork-Hint: ignore
Message-Id: <20230410213149.66FC883EE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/go: security bump
 to version 1.19.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d44a0369d9c5380c827e0ef0d31af9ad209979e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit b7eaa9af7ba87f2eac1ec9d2f7116b4ecf4f78be)
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
