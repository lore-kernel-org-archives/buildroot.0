Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380D6C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 14:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB63841906;
	Fri, 16 Dec 2022 14:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB63841906
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6NTgwB6X_IK; Fri, 16 Dec 2022 14:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7EE641529;
	Fri, 16 Dec 2022 14:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7EE641529
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 810D41BF2A9
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D728404CF
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D728404CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4UavQGjPHjH for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 14:13:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 892EE403C6
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 14:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 892EE403C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75F168674C; Fri, 16 Dec 2022 14:13:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Dec 2022 15:10:35 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 01548a7be1a7a2cdb14b5ad12869dbcb09f31d44
X-Git-Newrev: 7b32bbb7ec6643edaa18bb943c6d834cd532499c
X-Patchwork-Hint: ignore
Message-Id: <20221216141327.75F168674C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/go: security bump
 to version 1.18.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b32bbb7ec6643edaa18bb943c6d834cd532499c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

go1.18.9 (released 2022-12-06) includes security fixes to the net/http and
os packages, as well as bug fixes to cgo, the compiler, the runtime, and the
crypto/x509 and os/exec packages

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 5edda2e600..22d4250954 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  1f79802305015479e77d8c641530bc54ec994657d5c5271e0172eb7118346a12  go1.18.8.src.tar.gz
+sha256  fbe7f09b96aca3db6faeaf180da8bb632868ec049731e355ff61695197c0e3ea  go1.18.9.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 5dda357e4a..0d588b8ffd 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.18.8
+GO_VERSION = 1.18.9
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
