Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB101CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 923F681DCB;
	Fri, 15 May 2026 17:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o29xdPmc4-z0; Fri, 15 May 2026 17:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DCD6821B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867261;
	bh=d6I4yO0shEd0sWqsZkPam3/N5E+aS9M1tJRlQJSh+JQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sg/CFc+XT1yDx1lCqfIsnbFTHKNVqZmVPOg9Rn7UR0M2HsUq4EyBf4VM7bSS3wlKM
	 RTi2QsaJzVELTW1VUTzItku+yAWW11byQykSaZfKXbKrHC2SCXLYr0HndGVXvI7Xok
	 XugyO3cnKVrAWMrEFAq6tsN9drzWTPPGoVJW8FKSEme+056UDCuTDAXI9rTQqmDKFp
	 jwO1KCd/q1Sg7X3DguNvrRjowLbm3Ma0t03QUUg61WHutnD0obkZ/0tRGN+mtoLgkp
	 RcFjrme8Ux7U+1+Oadi1EkYPQpIb99DuQSMiltzH92slKDL/Y8kQQVoNZXBDrS0tmk
	 xCjZUG8wbpl0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DCD6821B9;
	Fri, 15 May 2026 17:47:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0427445B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B325341DAB
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqlNYQMGaAeK for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C781E41D58
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C781E41D58
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11E40863DA; Fri, 15 May 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:52:42 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: e876211a2323801975da063a2b757937415efdb5
X-Git-Newrev: f204a673370e69e2de13e577f36ec4a52589e8e5
X-Patchwork-Hint: ignore
Message-Id: <20260515174641.11E40863DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 package/go-bootstrap-stage5: security bump to version 1.25.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f204a673370e69e2de13e577f36ec4a52589e8e5
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

go1.25.10 (released 2026-05-07) includes security fixes to the go command,
the pack tool, and the html/template, net, net/http, net/http/httputil,
net/mail, and syscall packages, as well as bug fixes to the go command, the
compiler, the linker, the runtime, and the crypto/fips140, go/types, and os
packages.

https://go.dev/doc/devel/release#go1.25.10

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c19e6d80fbcff18465a6839676195a91db18ace5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash | 2 +-
 package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
index 5e40ba7e6e..58391471d9 100644
--- a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
+++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e  go1.25.8.src.tar.gz
+sha256  20cf04a92e5af99748e341bc8996fa28090c9ac98765fa115ec5ddf41d7af41d  go1.25.10.src.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
index 9006e5bf44..85468414a2 100644
--- a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
+++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
@@ -6,7 +6,7 @@
 
 # Use last Go version that go-bootstrap-stage4 can build: v1.25.x
 # See https://go.dev/doc/go1.26#bootstrap
-GO_BOOTSTRAP_STAGE5_VERSION = 1.25.8
+GO_BOOTSTRAP_STAGE5_VERSION = 1.25.10
 GO_BOOTSTRAP_STAGE5_SITE = https://go.dev/dl
 GO_BOOTSTRAP_STAGE5_SOURCE = go$(GO_BOOTSTRAP_STAGE5_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
