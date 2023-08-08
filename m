Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED55C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A31F40BCB;
	Tue,  8 Aug 2023 17:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A31F40BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISewW8EMJjZe; Tue,  8 Aug 2023 17:28:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC91B405AA;
	Tue,  8 Aug 2023 17:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC91B405AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EF2C1BF59C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28D9F81E98
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28D9F81E98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XtLeaWTN-te3 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 17:28:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3136380D5E
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 17:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3136380D5E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DC1984B9E; Tue,  8 Aug 2023 17:28:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 19:28:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 606beef3527b0dacc7a3d8b870330b10f6dc566a
X-Git-Newrev: df5fd7dec45eb26a2ac97c494cf1904123e29c5f
X-Patchwork-Hint: ignore
Message-Id: <20230808172826.1DC1984B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go-bootstrap-stage2: bump version
 to 1.19.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=df5fd7dec45eb26a2ac97c494cf1904123e29c5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While it's not strictly necessary to update go-bootstrap-stage2, we can
continue to update the package to the latest 1.19.x until Go 1.19.x is
discontinued, at which point we can leave it at the final 1.19.x
version.

This package is only used when bootstrapping host-go.

go1.19.11 includes a security fix to the net/http package, as well as
bug fixes to cgo, the cover tool, the go command, the runtime, and the
go/printer package.

https://go.dev/doc/devel/release#go1.19.minor

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go-bootstrap-stage2/go-bootstrap-stage2.hash | 2 +-
 package/go-bootstrap-stage2/go-bootstrap-stage2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
index 874737ea2d..6d4c718a40 100644
--- a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  13755bcce529747d5f2930dee034730c86d02bd3e521ab3e2bbede548d3b953f  go1.19.10.src.tar.gz
+sha256  e25c9ab72d811142b7f41ff6da5165fec2d1be5feec3ef2c66bc0bdecb431489  go1.19.11.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
index 477c24299c..72f3200a2e 100644
--- a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
+++ b/package/go-bootstrap-stage2/go-bootstrap-stage2.mk
@@ -6,7 +6,7 @@
 
 # Use last Go version that go-bootstrap-stage1 can build: v1.19.x
 # See https://golang.org/doc/install/source#bootstrapFromSource
-GO_BOOTSTRAP_STAGE2_VERSION = 1.19.10
+GO_BOOTSTRAP_STAGE2_VERSION = 1.19.11
 GO_BOOTSTRAP_STAGE2_SITE = https://storage.googleapis.com/golang
 GO_BOOTSTRAP_STAGE2_SOURCE = go$(GO_BOOTSTRAP_STAGE2_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
