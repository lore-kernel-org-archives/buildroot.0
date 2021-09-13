Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C47FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:11:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 446846112D
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 446846112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C9D3607F5;
	Tue, 14 Sep 2021 06:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UnhtriRsx472; Tue, 14 Sep 2021 06:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A250607DC;
	Tue, 14 Sep 2021 06:11:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11C571BF31B
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5D3A40215
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOr-qHhrhOy9 for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 06:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9947F400C7
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 06:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 519908AC05; Tue, 14 Sep 2021 06:08:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:53:41 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a995385a61c62d468a4715e7591ade60150e3a35
X-Git-Newrev: bff6255da2d1979ab2594afd828dfe40e6350dde
X-Patchwork-Hint: ignore
Message-Id: <20210914060813.519908AC05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/go: bump version
 to 1.16
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bff6255da2d1979ab2594afd828dfe40e6350dde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes: https://golang.org/doc/go1.16

The latest Go release, version 1.16, arrives six months after Go 1.15. Most of
its changes are in the implementation of the toolchain, runtime, and libraries.

The linker changes in 1.16 extend the 1.15 improvements to all supported
architecture/OS combinations (the 1.15 performance improvements were primarily
focused on ELF-based OSes and amd64 architectures). For a representative set of
large Go programs, linking is 20-25% faster than 1.15 and requires 5-15% less
memory on average for linux/amd64, with larger improvements for other
architectures and OSes. Most binaries are also smaller as a result of more
aggressive symbol pruning.

According to the release notes, Go 1.16 drops support for x87 mode
compilation (GO386=387).  Support for non-SSE2 processors is now available
using soft float mode.  Buildroot will automatically set GO386=softfloat on
non-SSE2 processors.

Signed-off-by: Christian Stewart <christian@paral.in>

v1 -> v2:

 - added 386=softfloat handling re: Peter's review

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9c035502bf2f44dd7ce5c0dca2e03cdcd4ef3f88)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index d89c01911a..4181fb52c5 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  0662ae3813330280d5f1a97a2ee23bbdbe3a5a7cfa6001b24a9873a19a0dc7ec  go1.15.15.src.tar.gz
+sha256  7688063d55656105898f323d90a79a39c378d86fe89ae192eb3b7fc46347c95a  go1.16.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 913ee68482..f6cb2469a8 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.15
+GO_VERSION = 1.16
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
@@ -49,6 +49,10 @@ else ifeq ($(BR2_aarch64),y)
 GO_GOARCH = arm64
 else ifeq ($(BR2_i386),y)
 GO_GOARCH = 386
+# i386: use softfloat if no SSE2: https://golang.org/doc/go1.16#386
+ifneq ($(BR2_X86_CPU_HAS_SSE2),y)
+GO_GO386 = softfloat
+endif
 else ifeq ($(BR2_x86_64),y)
 GO_GOARCH = amd64
 else ifeq ($(BR2_powerpc64),y)
@@ -90,6 +94,7 @@ HOST_GO_CROSS_ENV = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
 	CXX_FOR_TARGET="$(TARGET_CXX)" \
 	GOARCH=$(GO_GOARCH) \
+	$(if $(GO_GO386),GO386=$(GO_GO386)) \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GO_ASSUME_CROSSCOMPILING=1
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
