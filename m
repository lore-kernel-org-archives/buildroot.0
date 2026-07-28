Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0326CC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1E8460AE6;
	Fri, 31 Jul 2026 11:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukn-0IvKiCvJ; Fri, 31 Jul 2026 11:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36D960AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499106;
	bh=HRvgkZ01SJlSvwZftypSVABhBX0nImsWZZ7gzRlBEWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=adVPin1YtqlF4Z9efi1b+p/Zjc8iZ2YVNArKeYGP70hF0JToJ6TEBZQ1bNpH6ZEM0
	 vyeSdaB5p1o4zt1daR8aYfr5qdyq+2nhm6L+vPgnch9e7VBgFEWsRFlkxZ0FVtdfwJ
	 0aCkrIfJEG7Ue7Q0Ta4pzST8qxMbd/iZ+idnxWJxxTMTx6DuhP3zPIjFV4nDmYsvxO
	 +YShHL/BrREyvhm+ipvOpxaEAgRvB4yJMNo0u4sGPMG2MfqHeHSn/JTsQ88/oB5CSB
	 +sSxCVjuhqcmB1WRKQlTuoLA7jD3/2OEeyTxzZ83i8iOUEoytJcV96BiGpMlOFzIOu
	 FinkiVcT5eWDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E36D960AFF;
	Fri, 31 Jul 2026 11:58:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ACB5197
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C97340471
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJTTiAJ0Riat for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 890BE40463
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 890BE40463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79C0C8B741; Fri, 31 Jul 2026 11:57:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:36:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 608967e670f2537b82467c5c2df1f15db578b2e8
X-Git-Newrev: c936fe14b7903bba5c4d9c0c515d2564ddc03e07
X-Patchwork-Hint: ignore
Message-Id: <20260731115729.79C0C8B741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/go: security bump
 to version 1.26.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c936fe14b7903bba5c4d9c0c515d2564ddc03e07
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following security issues:

CVE-2026-39822: os: root escape via symlink plus trailing slash

go1.26.5 (released 2026-07-07) includes security fixes to the
crypto/tls and os packages, as well as bug fixes to the compiler,
the runtime, the go command, and the net, os, and syscall packages.

https://go.dev/doc/devel/release#go1.26.5

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6e12744652e4e727fe7ff9c1de44309348ef63ed)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 69f2a3139c..6c9c20be69 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  1c646875d0aa8799133184ed57cf79ff24bdefe8c8820470602a9d3d6d9192b8  go1.26.3.src.tar.gz
-sha256  0ef3626a149b5811c813838c62b7d6618d03ea36047b32c90b0e4851cc42b1fa  go1.26.3.linux-386.tar.gz
-sha256  2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556  go1.26.3.linux-amd64.tar.gz
-sha256  9d89a3ea57d141c2b22d70083f2c8459ba3890f2d9e818e7e933b75614936565  go1.26.3.linux-arm64.tar.gz
-sha256  d44133d4c66b1451a1e247da26db7716f76a081c0169a75e6c84e1871e394320  go1.26.3.linux-armv6l.tar.gz
-sha256  dbd82b50530ead2beb1fd72215117380df3cb16332b51467116dc35b3691dd75  go1.26.3.linux-ppc64le.tar.gz
-sha256  5c0605b7175449f1c8e8cb02efaba2695caab914fad4dcedc764c2f4c6dfe6ca  go1.26.3.linux-s390x.tar.gz
+sha256  495be4bc87176ac567392e5b4116abd98466d33d7b49d41e764ccc6976b2dc42  go1.26.5.src.tar.gz
+sha256  88c162b204e6eefcc32499453b492e80209f4a4c78c33092636901c540fb0d05  go1.26.5.linux-386.tar.gz
+sha256  5c2c3b16caefa1d968a94c1daca04a7ca301a496d9b086e17ad77bb81393f053  go1.26.5.linux-amd64.tar.gz
+sha256  fe4789e92b1f33358680864bbe8704289e7bb5fc207d80623c308935bd696d49  go1.26.5.linux-arm64.tar.gz
+sha256  6dae9edab81c13bccf962dec15f1fd2ec26c14a6821b4d2c92dab4130c289d7a  go1.26.5.linux-armv6l.tar.gz
+sha256  c5d60e2b303bb612f20cd82786594b64874e73b35134025e27d3390bf284ae43  go1.26.5.linux-ppc64le.tar.gz
+sha256  09ce3c504c0323968b75a717244dca4f25cd4cf0443e5ff6bc0bfa74add89fa7  go1.26.5.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index ebd0d418ef..a64d7538f8 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.26.3
+GO_VERSION = 1.26.5
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
