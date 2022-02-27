Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2B8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 17:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AAFD40543;
	Sun, 27 Feb 2022 17:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ljX1HdNtGUv; Sun, 27 Feb 2022 17:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEE584053D;
	Sun, 27 Feb 2022 17:34:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22AC41BF285
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EB86607FF
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VF3nrn3RoExV for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 17:34:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C8B9607EC
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 17:34:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C6A4B82E00; Sun, 27 Feb 2022 17:26:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 18:33:18 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ec034ba9dee122c51cb59703c85df839dc973a54
X-Git-Newrev: b7ed73bcda079346fb1858d4f8e8e5c193b5d517
X-Patchwork-Hint: ignore
Message-Id: <20220227172612.C6A4B82E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/go: security bump
 to 1.16.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7ed73bcda079346fb1858d4f8e8e5c193b5d517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

go1.16.14 includes security fixes to the crypto/elliptic, math/big packages
and to the go command, as well as bug fixes to the compiler, linker,
runtime, the go command, and the debug/macho, debug/pe, net/http/httptest,
and testing packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 7071fcd99d..b4d4e05e3c 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  b0926654eaeb01ef43816638f42d7b1681f2d3f41b9559f07735522b7afad41a  go1.16.13.src.tar.gz
+sha256  467898cd3a216de54dcb9014f541efe77e9b79a7154dbc1fd2dd778b0c63fb56  go1.16.14.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index cac83c65ff..cc57d0d86d 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.13
+GO_VERSION = 1.16.14
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
