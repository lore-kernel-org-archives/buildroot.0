Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E369C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:03:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66B9160F5E
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66B9160F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22F0840189;
	Tue, 17 Aug 2021 07:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZaBfXZo5M3B; Tue, 17 Aug 2021 07:03:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B1494037C;
	Tue, 17 Aug 2021 07:03:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE681BF341
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F6E8404DC
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxPRVob5HTq0 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 07:03:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD5ED404C4
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 07:03:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7CEFF8CA04; Tue, 17 Aug 2021 07:02:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 08:51:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 829ecf7d794b454a9fa9557b2420d624e3d3bb14
X-Git-Newrev: 825eec010c150d09e2b112bdbc7b36d19b23f031
X-Patchwork-Hint: ignore
Message-Id: <20210817070253.7CEFF8CA04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.16.7
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=825eec010c150d09e2b112bdbc7b36d19b23f031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.16.7 (released 2021-08-05) includes a security fix to the
net/http/httputil package, as well as bug fixes to the compiler, the
linker, the runtime, the go command, and the net/http package.

https://golang.org/doc/devel/release#go1.16

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index cd7f2b3813..0db83167ee 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  a3a5d4bc401b51db065e4f93b523347a4d343ae0c0b08a65c3423b05a138037d  go1.16.6.src.tar.gz
+sha256  1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac  go1.16.7.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 7d6355df92..82d9729e2b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.6
+GO_VERSION = 1.16.7
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
