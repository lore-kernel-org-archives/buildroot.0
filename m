Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4CFCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0A2361367;
	Fri, 29 May 2026 08:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2D0eq5IZsOrc; Fri, 29 May 2026 08:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B8D6140E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043174;
	bh=3pfFGAm9NjDhHaJSVA5fm9rqZc/7TW+vlcVPh+sElnU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hCMU6zDY0zw8wSYHNxjdVBYs95RkUWGe4VXT5fgzgvBZuE1A+a9yFmldW89I217s2
	 vdHx32vt7AZLDczmM3N+JHzjnNKcmeWkDhHPzzR5KaGXHiUY20NFaq0G6pQt9YhQmZ
	 HXVWr0vqB+OFjDyp+B0FkASz+v+idsY3SN6l47w98/tLIaFUElHSvjuLtXNoNZeeoM
	 7PgzaweI1/CIqeD/k07Xi2vv61PjHtNOnWJqgiLDOgke5h4VFWFjOu7++WUCgZAaLO
	 8dHaRql7qAAt3n7wXFhVEgnDpHV+0C1Sn1UqFlhjun6F+/aE/r3bJ9Q4lVqaBJp3/2
	 JuDPTdZDXmyoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8B8D6140E;
	Fri, 29 May 2026 08:26:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 082AD28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F371F41F92
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfnsS4dmKuWy for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36BCC41F94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36BCC41F94
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CABBD87171; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 14:37:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 131ffd8b36941361f41ee287eaad42b33d944b5b
X-Git-Newrev: ac41813e665c3225e3bd91e716b2df4fe3b4cbba
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.CABBD87171@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/go: security bump
 to version 1.26.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac41813e665c3225e3bd91e716b2df4fe3b4cbba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 82518f8cb41f1377b7a65abc659adc96ffcbe05b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
