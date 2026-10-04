Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E72CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 12:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EADB80D1F;
	Sun,  4 Oct 2026 12:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24Vn3q6lvnoT; Sun,  4 Oct 2026 12:53:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9D95A80D21
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791118405;
	b=jTS6mnzckEesoNph49NFfUYxRCKa/+OejfEle4IL1w+l2uFJ8+DYLTjSgmbARuPOUiNv
	 WA52TB4099GU5aBlw/ftpN225NgYDZlMB412gPd1kbqwnZI30GbRnrDZP12pZ2aw71gsv
	 wUgs8qMvbIXje/mljVdpud80K3u1qsZm0MiyWWQicRWzXkSbHEGofODg96002DHLcj+BF
	 lIP1PsG25Z672Y4MHQ9ivXznc2S4Q0aQlRItFJ2HIGC+eqLQYTBhH+YsPV+5AY9oIxixA
	 eOZzgmc0jEMJcQnr3x2MoudwHD1Pqk5/mnMxM9QxHaWVa4qTsM8k9+XGGMcp50SCovA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791118405;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3i9e32f5eEiDY+oLKPl79KXQQB0V0ls+CJc6lwl6pc4=;
	b=B7c1HZdjwkJ9GTVKQRW2O5dSQXETczWC2WQWBqqrUBvKY3n0yazMmPJ/9Vp5sewUPUY2
	 tOfrgAY0BvozxBqC2em2pn36FpJRDeV+cndWePPNrPRpikaJUuDjRynmTJaNkgjLx+RGF
	 XsRU2S7IOLAGLa5treUJrAMeklXhTsISqUIwvnpI/Lk5f7CtK8YwJIS+8NiVL3TDUSaKq
	 +JhGVF0VAlvFBXq6tXtxoSZQtqTs1y48ZUdGFdgxu9voU4KDeRgBPB8rykBgjSb27Rp3y
	 OmtD+5OEh8ymwhy83mltF7iKVypSfnc0m9xWT2zb11HMCOg7k3hzT7mNdz2lQRVbadA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791118405;
	bh=3i9e32f5eEiDY+oLKPl79KXQQB0V0ls+CJc6lwl6pc4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JEB6acQ4AfjqkfuBRQ2aeJd3zAFJ62IA8ztJt6JUwDFf4eXvanmZxFE+l/fLJBxeW
	 PI7/rrDQl6Pux0FveexsNq8OJkdgLxx20jL37ekxEy66Wf37zgRe6/x4aDVNS92dd6
	 K0KwB/NI80pC2cIedTHhYaYTMnjOpwnv9O634rAyjJg/gXD+D7BKXxTpsfRl/eLPid
	 X9OwXurtbM7W0ymGwO41lxbqyQg6ecwJUM5P+qvmq1l1JNcpUsV3mchmOVCNgQOS1I
	 lOqVaOvetPEBadE7sACR9cYARtT5mXoQbqzOOPcRg/qwnxpQeJFMDtreDneL/8oRnV
	 QFCbWKpV+9iEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D95A80D21;
	Sun,  4 Oct 2026 12:53:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AE5B32F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59AAD40702
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1RnOQxSuk_1 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 12:53:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 915D4406E4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791118402;
 b=gj71PQvFprWj/1O21Xli1FOd3SRZA8gRhgvmjINv2GTMu6X8DGbMBIyDxwSqFYp7QL3D
 FftL7kWiaLC5HKPG+lWaeCaYCYNRufWChHPH9NPlEjHmCt+RNipdnJrZ9KYT4r35z5/Zl
 tSrmm2QYXAmwcuo+/dqwlrn0Pf/dsX6BNMEAUQuggSD+OkJ2OBAg441WRo9pHhvaaNxaX
 vNBDhDudlJsHj3H/EA6AOE6R/pL/11r6wb/GT3ejLnn3oVqf0gJ0B00WYP2GAi7udNFbA
 mL0OjgnlE23O/8Ik8nrgkP/fzaxLy8kKKGr/Luje/VuXTKK3PrG8fX+5k7KdkxUctYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791118402;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DpFhfSMrVzOQZ7U0Imxx9eStdSLqxaKmnEQA9nKyBho=;
 b=tdHU5SeGKH8neJNZHlNQviNmzA3ZTzRyfxKiavNyN2Ll+XWrZhbYtIm//g47Ya5Kvylk
 n6mI26N7SxFTHJVjSM+E3nijQiOVlAJ7vZLdVHTtQOVVR21+9PtYXL0QdjGjIh4yxD146
 2tHeyX3trF8aeGMWEiDT1CJatW2Q88d9L9VXjzCblWBdqQJwNukJSVgz+Ju0sjmewLlAf
 /4kk21xC1uIOjo6gtAs+8jApieB9qD5E8jId9dhZATpSpqB7LFyfg2E8614cIM9puUvCq
 wR1YwDlvCnUuUZFiA6JrxK3QrB93BE+T8TEbngQ1cwo7a48h+iH1XvNy3iFLJAhgiKQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 915D4406E4
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:53:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 548B08B661; Sun,  4 Oct 2026 12:52:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 09:27:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fca0899dd6cbeb9e6c7442d4b53513f7a29e98f4
X-Git-Newrev: 722647d5abf5d56041eab7db7a7c7179105c8f40
X-Patchwork-Hint: ignore
Message-Id: <20261004125207.548B08B661@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aer-inject: bump version to 36d5b4f
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/722647d5abf5d56041eab7db7a7c7179105c8f40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drop 0001-libgen-basename.patch, applied upstream, see commit 197f51d.

Upstream now ships a LICENSE file (see commit 41cda6d).

Changelog:
https://github.com/intel/aer-inject/compare/9bd5e2c7886fca72f139cd8402488a2235957d41...36d5b4f59b88c37d8ecba20b2302bddfe38f1ec2

Tested with Buildroot's GitLab CI (test-pkg on all toolchains):
https://gitlab.com/vjardin/buildroot/-/pipelines/2909708410

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aer-inject/0001-libgen-basename.patch | 35 ---------------------------
 package/aer-inject/aer-inject.hash            |  4 +--
 package/aer-inject/aer-inject.mk              |  4 +--
 3 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/package/aer-inject/0001-libgen-basename.patch b/package/aer-inject/0001-libgen-basename.patch
deleted file mode 100644
index 0762f5e305..0000000000
--- a/package/aer-inject/0001-libgen-basename.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 197f51d29a01f46750fa6928409301aa8f1163d7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 25 Mar 2024 09:04:40 -0700
-Subject: aer-inject: Include libgen.h for explicit basename prototype
-
-The prototype for basename has been removed from string.h in the latest
-versions of musl [1]. This absence of prototype is flagged as an error
-by some compilers, such as clang-18. To resolve this, include libgen.h
-explicitly, which provides the prototype for basename.
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[sathya: Updated the commit log]
-Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
-Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/knsathya/aer-inject.git/commit/?id=197f51d29a01f46750fa6928409301aa8f1163d7
-Signed-off-by: J. Neuschaefer <j.neuschaefer@gmx.net>
----
- aer-inject.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/aer-inject.c b/aer-inject.c
-index 74e7f72..eed1211 100644
---- a/aer-inject.c
-+++ b/aer-inject.c
-@@ -11,6 +11,7 @@
-  */
-
- #include <stdio.h>
-+#include <libgen.h>
- #include <stdlib.h>
- #include <string.h>
- #include <fcntl.h>
---
-cgit 1.2.3-korg
-
diff --git a/package/aer-inject/aer-inject.hash b/package/aer-inject/aer-inject.hash
index 3b9d144ec9..60621692df 100644
--- a/package/aer-inject/aer-inject.hash
+++ b/package/aer-inject/aer-inject.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7ed5994b48f1c0504add380ba4d186f48a5a22b9bc2dd90c79d0d2f0c183540c  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41-git4.tar.gz
-sha256  659a191d8775e05c6c6a9a4ba66b3577c577342bb83f20d393135eb6633c8973  README
+sha256  b377a24c9ef9cf2974c2c8e32849a7aaf9eac4608f9a2845391421003b791802  aer-inject-36d5b4f59b88c37d8ecba20b2302bddfe38f1ec2-git4.tar.gz
+sha256  0cc61b3cffb7dd6471c9db7094953a37a80e7b4691a1581e3eef3530fedca0ac  LICENSE
diff --git a/package/aer-inject/aer-inject.mk b/package/aer-inject/aer-inject.mk
index 7516ef63ac..541dda5839 100644
--- a/package/aer-inject/aer-inject.mk
+++ b/package/aer-inject/aer-inject.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-AER_INJECT_VERSION = 9bd5e2c7886fca72f139cd8402488a2235957d41
+AER_INJECT_VERSION = 36d5b4f59b88c37d8ecba20b2302bddfe38f1ec2
 AER_INJECT_SITE = https://github.com/intel/aer-inject.git
 AER_INJECT_SITE_METHOD = git
 AER_INJECT_LICENSE = GPL-2.0
-AER_INJECT_LICENSE_FILES = README
+AER_INJECT_LICENSE_FILES = LICENSE
 AER_INJECT_DEPENDENCIES = host-flex host-bison
 
 define AER_INJECT_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
