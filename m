Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED51EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AA0C60FA8;
	Thu, 14 Apr 2022 20:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfNNDv-ZUXbX; Thu, 14 Apr 2022 20:14:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A837060FA1;
	Thu, 14 Apr 2022 20:14:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBC171BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAB1D8136E
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6ACol23ogXL for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 233DD81365
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C100883D01; Thu, 14 Apr 2022 20:04:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:14:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83aeec71fd6488295292bd1886decfe1874f9442
X-Git-Newrev: 2b2d97780d98763aaa7953776a3d6b9e887b7f8d
X-Patchwork-Hint: ignore
Message-Id: <20220414200445.C100883D01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.17.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b2d97780d98763aaa7953776a3d6b9e887b7f8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.17.9 (released 2022-04-12) includes security fixes to the
crypto/elliptic and encoding/pem packages, as well as bug fixes to the
linker and runtime.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 85e6adfb8c..507887eaaa 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a  go1.17.8.src.tar.gz
+sha256  763ad4bafb80a9204458c5fa2b8e7327fa971aee454252c0e362c11236156813  go1.17.9.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 3df16c9a68..41c9a8648f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.8
+GO_VERSION = 1.17.9
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
