Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3F9C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:21:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7697E60D07
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7697E60D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51D7760AE4;
	Wed,  4 Aug 2021 00:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NejEbQzhH1Gl; Wed,  4 Aug 2021 00:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90AE760A70;
	Wed,  4 Aug 2021 00:21:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 628CC1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8208641466
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebspYsmb19eH for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F89440E55
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D9B3381278; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 22:26:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 531b2a10cda6bae78ecc141c9fe48f2024f71dbc
X-Git-Newrev: 43ac14512f303d8623332aeda7ae6eb71f75f65d
X-Patchwork-Hint: ignore
Message-Id: <20210803211013.D9B3381278@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/go-bootstrap: bump to
 version 1.4-bootstrap-20171003
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

commit: https://git.buildroot.net/buildroot/commit/?id=43ac14512f303d8623332aeda7ae6eb71f75f65d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See https://golang.org/doc/install/source#bootstrapFromSource

All Go compiler versions > 1.4.x (old) are written in Go, and require a existing
compiled Go version to use to build from source. Buildroot uses a 1.4.x version
in the "go-bootstrap" package to build a C-based Go compiler, and then uses that
compiler to build the main "host-go" compiler.

This commit updates to the latest 1.4.x go-bootstrap branch version recommended
in the documentation, which includes more compatibility fixes.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go-bootstrap/go-bootstrap.hash | 2 +-
 package/go-bootstrap/go-bootstrap.mk   | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/go-bootstrap/go-bootstrap.hash b/package/go-bootstrap/go-bootstrap.hash
index 03fd7d571f..0f186a5d55 100644
--- a/package/go-bootstrap/go-bootstrap.hash
+++ b/package/go-bootstrap/go-bootstrap.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959  go1.4.3.src.tar.gz
+sha256  f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52  go1.4-bootstrap-20171003.tar.gz
 sha256  dd26a7abddd02e2d0aba97805b31f248ef7835d9e10da289b22e3b8ab78b324d  LICENSE
diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index 6710e31561..71696a1540 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-GO_BOOTSTRAP_VERSION = 1.4.3
-GO_BOOTSTRAP_SITE = https://storage.googleapis.com/golang
-GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).src.tar.gz
+# Use last C-based Go compiler: v1.4.x
+# See https://golang.org/doc/install/source#bootstrapFromSource
+GO_BOOTSTRAP_VERSION = 1.4-bootstrap-20171003
+GO_BOOTSTRAP_SITE = https://dl.google.com/go
+GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).tar.gz
 
 GO_BOOTSTRAP_LICENSE = BSD-3-Clause
 GO_BOOTSTRAP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
