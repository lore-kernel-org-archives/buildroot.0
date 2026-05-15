Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D95CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC7D241E2B;
	Fri, 15 May 2026 17:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pEsx6qcsZUw; Fri, 15 May 2026 17:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE44641DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867262;
	bh=NFOqymwHYTKIqECdgcF+KIA3yussjVrYbMa5jTX7rdM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K7QTBUXFGhq9fJYbX6sQHOiSP+9DFnr+Noew50uj+dOK5zQFWa8qWGxuXiD/ufJZz
	 H7vLhjY0IBUiEiVVBTN+UGrbKt9Mt8NU1/Ga2EYpLYsKlrznctrXdebXdOcSp6dcmK
	 t2koEXTMd0lgbV6jIc5mjtV3gLYpVPPniNXUcWDQbBJ0wUDeOuwZTGa7xgvcP2ixug
	 g3KeTdnd4/5LhhoBKWtsV/JE3FYXcdJSzGYXkaj/5Eh96ByzKxSrQgIgpKKx2LxuN3
	 5X2K/CFzFNx4OO1BDqzDGej+zkDT0K1fM5tg8R9XDPtzR0Drrl8cK7WXMyjbEUeZFV
	 kvpw1LaIxDNCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE44641DED;
	Fri, 15 May 2026 17:47:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCFD723F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FE8B40FB1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcTH8Wv0FRSw for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B50FB40FAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B50FB40FAD
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F304A863D7; Fri, 15 May 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:52:37 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c023dc644a7dd157d307303578d4e47b053b02d8
X-Git-Newrev: e876211a2323801975da063a2b757937415efdb5
X-Patchwork-Hint: ignore
Message-Id: <20260515174640.F304A863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/go: security bump
 to version 1.26.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e876211a2323801975da063a2b757937415efdb5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes the following security issues:

CVE-2026-33811: net: crash when handling long CNAME response
CVE-2026-33814: net/http: infinite loop in HTTP/2 transport when given bad
                SETTINGS_MAX_FRAME_SIZE
CVE-2026-39817: cmd/go: "go tool pack" does not sanitize output paths
CVE-2026-39819: md/go: "go bug" follows symlinks in predictable temporary
                filenames
CVE-2026-39820: net/mail: quadratic string concatenation in consumeComment
CVE-2026-39823: html/template: bypass of meta content URL escaping causes
                XSS
CVE-2026-39825: net/http/httputil: ReverseProxy forwards queries with more
                than urlmaxqueryparams parameters
CVE-2026-39826: html/template: escaper bypass leads to XSS
CVE-2026-39836: net: panic in Dial and LookupPort when handling NUL byte on
                Windows
CVE-2026-42499: net/mail: quadratic string concatenation in consumePhrase
CVE-2026-42501: cmd/go: malicious module proxy can bypass checksum database

go1.26.3 (released 2026-05-07) includes security fixes to the go command,
the pack tool, and the html/template, net, net/http, net/http/httputil,
net/mail, and syscall packages, as well as bug fixes to the go command, the
go fix command, the compiler, the linker, the runtime, and the
crypto/fips140, crypto/tls, go/types, and os packages.

https://go.dev/doc/devel/release#go1.26.3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c465f0d8eb676cd10ef48a864766abde43ffb239)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 77be843c83..69f2a3139c 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  2e91ebb6947a96e9436fb2b3926a8802efe63a6d375dffec4f82aa9dbd6fd43b  go1.26.2.src.tar.gz
-sha256  89835cdc4dfebde7fe28c9c6dc080bb3753f6b0354301966ff9f62d14991bd7d  go1.26.2.linux-386.tar.gz
-sha256  990e6b4bbba816dc3ee129eaeaf4b42f17c2800b88a2166c265ac1a200262282  go1.26.2.linux-amd64.tar.gz
-sha256  c958a1fe1b361391db163a485e21f5f228142d6f8b584f6bef89b26f66dc5b23  go1.26.2.linux-arm64.tar.gz
-sha256  0000e45577827b0a8868588c543cbe4232853def1d3d7a344ad6e60ce2b015c8  go1.26.2.linux-armv6l.tar.gz
-sha256  62b7645dd2404052535617c59e91cf03c7aa28e332dbaddbe4c0d7de7bcc6736  go1.26.2.linux-ppc64le.tar.gz
-sha256  410726ed10a0ea6745c2ea8da4f0e769fd3ce819cd4a41a67ad08b094d5dfc31  go1.26.2.linux-s390x.tar.gz
+sha256  1c646875d0aa8799133184ed57cf79ff24bdefe8c8820470602a9d3d6d9192b8  go1.26.3.src.tar.gz
+sha256  0ef3626a149b5811c813838c62b7d6618d03ea36047b32c90b0e4851cc42b1fa  go1.26.3.linux-386.tar.gz
+sha256  2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556  go1.26.3.linux-amd64.tar.gz
+sha256  9d89a3ea57d141c2b22d70083f2c8459ba3890f2d9e818e7e933b75614936565  go1.26.3.linux-arm64.tar.gz
+sha256  d44133d4c66b1451a1e247da26db7716f76a081c0169a75e6c84e1871e394320  go1.26.3.linux-armv6l.tar.gz
+sha256  dbd82b50530ead2beb1fd72215117380df3cb16332b51467116dc35b3691dd75  go1.26.3.linux-ppc64le.tar.gz
+sha256  5c0605b7175449f1c8e8cb02efaba2695caab914fad4dcedc764c2f4c6dfe6ca  go1.26.3.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 67948dc405..ebd0d418ef 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.26.2
+GO_VERSION = 1.26.3
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
