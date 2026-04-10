Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38082F44844
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 12:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E30280D5E;
	Fri, 10 Apr 2026 12:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qA2aYvm0N1vS; Fri, 10 Apr 2026 12:04:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16A5080D89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775822691;
	bh=4WTP5ae9IIZsTvT0WNfpXUammiQiEA2oOe5ge/sDtGA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eF5tV7Y4tG5u15g0Fq4Hh95T75SrPL6CrNCEiyJ1AVP3JxcNqp3jNfRekfPspcSBv
	 PaqV0Bf5mNhC89KYbitmbs/nou+NU3HgkQ01dCVnmtA5Y3Ll+i1hua8xJZiwNGHmY5
	 186uc5VR5riwgLdfpqA35FP/E8Bf3+rjENBGlefXytQJwtaGI8dYIskZUFQgeqN+0L
	 BcPvWNQzaFvaNxb0AOlG2GKOkMSLhFoohdL6HeHhv45Qduhs+cavvgQ6nXFWNaBuZx
	 iBigkUqMRoz06ET/x5o3fF1RUUz8NDjw6qS3ipQ2Xu0eFliCn5BKnzW6sMBbGJ6TG4
	 5rwdvJ/+B0fyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A5080D89;
	Fri, 10 Apr 2026 12:04:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D2E51F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 12:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6358D409C7
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 12:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCSwrxrOfWFD for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 12:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22E54074C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A22E54074C
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 12:04:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E6E481096; Fri, 10 Apr 2026 12:04:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 13:49:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6938ec66c545e7f8681feee12671422d8b10f6b
X-Git-Newrev: 82518f8cb41f1377b7a65abc659adc96ffcbe05b
X-Patchwork-Hint: ignore
Message-Id: <20260410120448.2E6E481096@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.26.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/82518f8cb41f1377b7a65abc659adc96ffcbe05b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

go1.26.2 (released 2026-04-07) includes security fixes to the go command, the
compiler, and the archive/tar, crypto/tls, crypto/x509, html/template, and os
packages, as well as bug fixes to the go command, the go fix command, the
compiler, the linker, the runtime, and the net, net/http, and net/url packages.

CVE-2026-32289: html/template: JS template literal context incorrectly tracked
CVE-2026-33810: crypto/x509: excluded DNS constraints not properly applied to wildcard domains
CVE-2026-27144: cmd/compile: no-op interface conversion bypasses overlap checking
CVE-2026-27143: cmd/compile: possible memory corruption after bound check elimination
CVE-2026-32288: archive/tar: unbounded allocation when parsing old format GNU sparse map
CVE-2026-32283: crypto/tls: multiple key update handshake messages can cause connection to deadlock
CVE-2026-27140: cmd/go: trust layer bypass when using cgo and SWIG
CVE-2026-32280: crypto/x509: unexpected work during chain building
CVE-2026-32281: crypto/x509: inefficient policy validation

https://go.dev/doc/devel/release#go1.26.2
https://github.com/golang/go/issues?q=milestone%3AGo1.26.2+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>
[Julien: add "security" in commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index bae223882a..77be843c83 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  3172293d04b209dc1144698e7ba13f0477f6ba8c5ffd0be66c20fdbc9785dfbb  go1.26.1.src.tar.gz
-sha256  da75d696c6b9440fe9fb6418429f29eaeee947707ee8c6ddb567c558051a1cc2  go1.26.1.linux-386.tar.gz
-sha256  031f088e5d955bab8657ede27ad4e3bc5b7c1ba281f05f245bcc304f327c987a  go1.26.1.linux-amd64.tar.gz
-sha256  a290581cfe4fe28ddd737dde3095f3dbeb7f2e4065cab4eae44dfc53b760c2f7  go1.26.1.linux-arm64.tar.gz
-sha256  c9937198994dc173b87630a94a0d323442bef81bf7589b1170d55a8ebf759bda  go1.26.1.linux-armv6l.tar.gz
-sha256  f56eed002998f5f51fa07fd4ed0c5de5e02d51cec7a4007f771c7576620d9d45  go1.26.1.linux-ppc64le.tar.gz
-sha256  60fe623ef63e6338c055ec0e0e3f4fa85c97a056de2d2f6ee38591e2bfa9cdde  go1.26.1.linux-s390x.tar.gz
+sha256  2e91ebb6947a96e9436fb2b3926a8802efe63a6d375dffec4f82aa9dbd6fd43b  go1.26.2.src.tar.gz
+sha256  89835cdc4dfebde7fe28c9c6dc080bb3753f6b0354301966ff9f62d14991bd7d  go1.26.2.linux-386.tar.gz
+sha256  990e6b4bbba816dc3ee129eaeaf4b42f17c2800b88a2166c265ac1a200262282  go1.26.2.linux-amd64.tar.gz
+sha256  c958a1fe1b361391db163a485e21f5f228142d6f8b584f6bef89b26f66dc5b23  go1.26.2.linux-arm64.tar.gz
+sha256  0000e45577827b0a8868588c543cbe4232853def1d3d7a344ad6e60ce2b015c8  go1.26.2.linux-armv6l.tar.gz
+sha256  62b7645dd2404052535617c59e91cf03c7aa28e332dbaddbe4c0d7de7bcc6736  go1.26.2.linux-ppc64le.tar.gz
+sha256  410726ed10a0ea6745c2ea8da4f0e769fd3ce819cd4a41a67ad08b094d5dfc31  go1.26.2.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 6c57be0ad7..67948dc405 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.26.1
+GO_VERSION = 1.26.2
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
