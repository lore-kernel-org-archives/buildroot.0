Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F18C04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 18:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1623641BBF;
	Fri,  9 Dec 2022 18:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1623641BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvXUuDgEhhkP; Fri,  9 Dec 2022 18:03:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0185941BAE;
	Fri,  9 Dec 2022 18:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0185941BAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF3541BF973
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 18:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3C2561197
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 18:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3C2561197
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMkkf-V8lfcp for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 18:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCE936118F
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 18:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCE936118F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A82D685EC2; Fri,  9 Dec 2022 18:03:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 19:00:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87a09b105bb9762cee1245856a9b0a27a89887d3
X-Git-Newrev: 090d126da88c1d529bf073626e423fceeb3cf9d5
X-Patchwork-Hint: ignore
Message-Id: <20221209180306.A82D685EC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.19.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=090d126da88c1d529bf073626e423fceeb3cf9d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes 2 security fixes following the security policy.

 - CVE-2022-41720: https://go.dev/issue/56694
 - CVE-2022-41717: https://go.dev/issue/56350

https://groups.google.com/g/golang-nuts/c/rQgaDWEvUrE
https://github.com/golang/go/issues?q=milestone%3AGo1.19.4+label%3ACherryPickApproved+

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 866e7e0d59..d35db10213 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  18ac263e39210bcf68d85f4370e97fb1734166995a1f63fb38b4f6e07d90d212  go1.19.3.src.tar.gz
+sha256  eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368  go1.19.4.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fd4caa2e5a..44e0c622c9 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.3
+GO_VERSION = 1.19.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
