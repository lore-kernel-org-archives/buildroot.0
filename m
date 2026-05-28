Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C157CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 430A240BC6;
	Fri, 29 May 2026 08:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxMYCYadPuaF; Fri, 29 May 2026 08:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5333240C13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043169;
	bh=F/ablBReMQj/FaEQ+Ed6Brs5VWlLCUW957e2nf0+BzE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DCMSrorITNltKV9uKvn2IGPXpiSF+peaidG4GAjdkuATd0isByWrwXg1Tsed5dxXX
	 cw7dK9uxK4B0XJ9tp3Mw5Ds0jjSkjVfZGx+Us93NRqjODdvnHndC6vQq2yUU2nuv6U
	 diKi+wOGt1heYpRgtjcvdIiEvV7HUDQvFhUE26h98Cvn/26jrDimJocbpABmCxISOM
	 ip5JioHVHqoxBTVx41QX9tReNXIjq4rtY07SiR3FtPCpw3VTN+9wKRHqJfN+4hmeTA
	 JoPQ7xmgq3Bier5BpMz6EcUwKLaem13SEJGPVOt0CE4NR1kWP80kwCSGXrQLVOZVlQ
	 WPNCgKPsVuckQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5333240C13;
	Fri, 29 May 2026 08:26:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13EE5288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4504241F84
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNwkrmrICxZb for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1358041F8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1358041F8F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7473870C6; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 14:36:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0e2507d71095baa921902d17404a4361972eced3
X-Git-Newrev: c80ef3671584e7aa3596dddb955ba60db99d5811
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.A7473870C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/go: security bump
 to version 1.25.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c80ef3671584e7aa3596dddb955ba60db99d5811
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://go.dev/doc/devel/release#go1.25.5
https://groups.google.com/g/golang-announce/c/8FJoBkPddm4
Fixes CVE-2025-61727 & CVE-2025-61729.

https://go.dev/doc/devel/release#go1.25.4
https://groups.google.com/g/golang-announce/c/tVVHm9gnwl8

Updated _SITE because previous URL returns 403.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit eed28fd448ffe39822ee2d8d82c040fd7045865e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk |  2 +-
 package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk |  2 +-
 package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk |  2 +-
 package/go/go-src/go-src.mk                           |  2 +-
 package/go/go.hash                                    | 14 +++++++-------
 package/go/go.mk                                      |  2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
index 98bf624b57..47e4d157eb 100644
--- a/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
+++ b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
@@ -7,7 +7,7 @@
 # Use last Go version that go-bootstrap-stage1 can build: v1.19.x
 # See https://golang.org/doc/install/source#bootstrapFromSource
 GO_BOOTSTRAP_STAGE2_VERSION = 1.19.13
-GO_BOOTSTRAP_STAGE2_SITE = https://storage.googleapis.com/golang
+GO_BOOTSTRAP_STAGE2_SITE = https://go.dev/dl
 GO_BOOTSTRAP_STAGE2_SOURCE = go$(GO_BOOTSTRAP_STAGE2_VERSION).src.tar.gz
 
 GO_BOOTSTRAP_STAGE2_LICENSE = BSD-3-Clause
diff --git a/package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk b/package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
index bdc8459595..732888d305 100644
--- a/package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
+++ b/package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
@@ -7,7 +7,7 @@
 # Use last Go version that go-bootstrap-stage2 can build: v1.21.x
 # See https://go.dev/doc/go1.22#bootstrap
 GO_BOOTSTRAP_STAGE3_VERSION = 1.21.8
-GO_BOOTSTRAP_STAGE3_SITE = https://storage.googleapis.com/golang
+GO_BOOTSTRAP_STAGE3_SITE = https://go.dev/dl
 GO_BOOTSTRAP_STAGE3_SOURCE = go$(GO_BOOTSTRAP_STAGE3_VERSION).src.tar.gz
 
 GO_BOOTSTRAP_STAGE3_LICENSE = BSD-3-Clause
diff --git a/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
index db0c85e3d0..7c5beb1c9d 100644
--- a/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
+++ b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
@@ -7,7 +7,7 @@
 # Use last Go version that go-bootstrap-stage3 can build: v1.23.x
 # See https://go.dev/doc/go1.24#bootstrap
 GO_BOOTSTRAP_STAGE4_VERSION = 1.23.12
-GO_BOOTSTRAP_STAGE4_SITE = https://storage.googleapis.com/golang
+GO_BOOTSTRAP_STAGE4_SITE = https://go.dev/dl
 GO_BOOTSTRAP_STAGE4_SOURCE = go$(GO_BOOTSTRAP_STAGE4_VERSION).src.tar.gz
 
 GO_BOOTSTRAP_STAGE4_LICENSE = BSD-3-Clause
diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index 9a18b6afe8..ead535f4e0 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GO_SRC_VERSION = $(GO_VERSION)
-GO_SRC_SITE = https://storage.googleapis.com/golang
+GO_SRC_SITE = https://go.dev/dl
 GO_SRC_SOURCE = go$(GO_VERSION).src.tar.gz
 GO_SRC_DL_SUBDIR = go
 
diff --git a/package/go/go.hash b/package/go/go.hash
index 1dc1b99756..7c689f9144 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  a81a4ba593d0015e10c51e267de3ff07c7ac914dfca037d9517d029517097795  go1.25.3.src.tar.gz
-sha256  acb585c13e7acb10e3b53743c39a7996640c745dffd7d828758786bde92f44ca  go1.25.3.linux-386.tar.gz
-sha256  0335f314b6e7bfe08c3d0cfaa7c19db961b7b99fb20be62b0a826c992ad14e0f  go1.25.3.linux-amd64.tar.gz
-sha256  1d42ebc84999b5e2069f5e31b67d6fc5d67308adad3e178d5a2ee2c9ff2001f5  go1.25.3.linux-arm64.tar.gz
-sha256  3992bd28316484be0af36494124588581aa27e0659a436d607b11d534045bc1f  go1.25.3.linux-armv6l.tar.gz
-sha256  68d1a08bf3567f330717d821b266a0be1c5080bd05dc238b5a43a24ca0c47d7c  go1.25.3.linux-ppc64le.tar.gz
-sha256  a0b5ccd631743f01230030412fdc9252b18d96b4e63d44ba1c4e9469e79cfcb1  go1.25.3.linux-s390x.tar.gz
+sha256  22a5fd0a91efcd28a1b0537106b9959b2804b61f59c3758b51e8e5429c1a954f  go1.25.5.src.tar.gz
+sha256  db908a86e888574ed3432355ba5372ad3ef2c0821ba9b91ceaa0f6634620c40c  go1.25.5.linux-386.tar.gz
+sha256  9e9b755d63b36acf30c12a9a3fc379243714c1c6d3dd72861da637f336ebb35b  go1.25.5.linux-amd64.tar.gz
+sha256  b00b694903d126c588c378e72d3545549935d3982635ba3f7a964c9fa23fe3b9  go1.25.5.linux-arm64.tar.gz
+sha256  0b27e3dec8d04899d6941586d2aa2721c3dee67c739c1fc1b528188f3f6e8ab5  go1.25.5.linux-armv6l.tar.gz
+sha256  f0904b647b5b8561efc5d48bb59a34f2b7996afab83ccd41c93b1aeb2c0067e4  go1.25.5.linux-ppc64le.tar.gz
+sha256  a5d0a72b0dfd57f9c2c0cdd8b7e0f401e0afb9e8c304d3410f9b0982ce0953da  go1.25.5.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 85a40d4d36..c932baf018 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.25.3
+GO_VERSION = 1.25.5
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
