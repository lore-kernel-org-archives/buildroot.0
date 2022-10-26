Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462D1C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D93D2405EB;
	Wed, 26 Oct 2022 19:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D93D2405EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9pB4eR-yD-O; Wed, 26 Oct 2022 19:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 162DB40547;
	Wed, 26 Oct 2022 19:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 162DB40547
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E1C41BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35D9181282
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35D9181282
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xx8YlfqMiyfI for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:50:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7E8181275
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7E8181275
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B082687131; Wed, 26 Oct 2022 19:50:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 21:49:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e548b7642ac14f2440427cb6ae11242680d3d935
X-Git-Newrev: ba57ca36b90371d35cd1421aec16e63aa3f43dbf
X-Patchwork-Hint: ignore
Message-Id: <20221026195017.B082687131@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to 1.19.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba57ca36b90371d35cd1421aec16e63aa3f43dbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.19.2 includes security fixes to the archive/tar, net/http/httputil, and
regexp packages, as well as bug fixes to the compiler, the linker, the runtime,
and the go/types package.

https://go.dev/doc/devel/release#go1.19
https://github.com/golang/go/issues?q=milestone%3AGo1.19.2+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 657475adef..f944bd5304 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  27871baa490f3401414ad793fba49086f6c855b1c584385ed7771e1204c7e179  go1.19.1.src.tar.gz
+sha256  2ce930d70a931de660fdaf271d70192793b1b240272645bf0275779f6704df6b  go1.19.2.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 9f0fbbde00..fe4d3a29a9 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.1
+GO_VERSION = 1.19.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
