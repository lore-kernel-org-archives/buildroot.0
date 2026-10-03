Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B16CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 20:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B73E6066E;
	Sat,  3 Oct 2026 20:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ln7ta6uowV8O; Sat,  3 Oct 2026 20:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3BF3A6063F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791060848;
	b=XdChHnbfmlQ+C07/x+gfByPrfpVkR+yP4PeJePz3sAhTwiMk5Gm4WNCDs+QeTgA9kNZ9
	 a96lFnDsz7JdQwlFnv155/Zlp8sD77Tk7a/G3qP30qDcYWt07ksqaAjaOblBPQBqfY8a4
	 Tg0EUkjg7GI0JsCjRlHzULHHtyTNdwuIQFwR8QxTKXYaWm6Qsd4nOjQGSBrHbdk/wE8bB
	 vL3MCUeWgv7UgiSVfdjxgXlvZ6mwnzc0zQqF+VkmwOkTXXXPKF9A0sZUddvn49+m7MO7P
	 +swPSPmPsU0kvNJpufOR8U3xUUi+/+Q+We7QrOP48LYcgSt1WL+OHTflihkgjBcBtPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791060848;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uZsCVTa2+K9m4cD+xldPnAea3+4agdRPp8vY2vrhBXM=;
	b=DInmkqQ10+Oi07mRSEijvCmXwRXZi9BoHL/FY8nFgxtj8gXB7BSl/9lI8c6yckDF/sLz
	 UIASsJLd0b23tcdDjZqfHXdFfXna0RtXLh09Qv8KR1g9mFbQl0Agb1ymC4WP2O0lcFVpG
	 A0uT4fpCKP27vPxw+ohwCxBcNnmTLih00q5dZa8eC0m2MsBSuHqSzq6nbXr/T67GiGzhh
	 9gR8+GNmZ8lhZW6YMamCSYGN/ToYc1X21nvFLsUAvNGXg6IOomQmQAQdgHzSigI29rV4d
	 BQ65ivkcaBR3HMSb9vSkP5DnoGv+mDGGzcfUe8LQVYmCXl6HkdityES47HgznYnJjZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791060848;
	bh=uZsCVTa2+K9m4cD+xldPnAea3+4agdRPp8vY2vrhBXM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=RXQsc9CjAKG6TtiWIQC8kgPZHQA1Pordan3YK+byTB2pOy1Ijlj2cs/UyTicVtMJK
	 ge9su0sKLV1/5klidU9RRy9nkiVLlpLqwGvCtldyYYs4cP3IyL4PRgQEI96WDxdrO6
	 DL5JfPvObiGvMMd8c5ZuF/j98cEwl/+nH26Mp13Wfq6vKr+Yn6uCMiz2ekbrdDthEg
	 3PjyooxDm/En7+uBxby5c6XEaZgwFImJnu4vqyqUrxT0hQzhQaurRUeRY0WnxXQiLU
	 cj7Mnw93UDozd3ubYdFyL10Pw9wawGhSAAr/08GkE0FHUa9B0Ow8vOJYujGv9FDhYM
	 W3TxoqOlUwFxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BF3A6063F;
	Sat,  3 Oct 2026 20:54:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9AC72E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 20:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EA9A4007E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 20:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVTN8K2ju9No for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 20:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 524D540055
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791060845;
 b=HjR7qBm3GbKPbXVaWeyHGZYHMvqzbY9ktjm7EdMlzaGK9DwUstH8Gg1nlZ8MIj59xbKu
 gs5eyvbXjTX9/FG1U/rSIhWqPRfoBfXXchl0oykwCQBidpmbbnldK8MKM9DPZMK2RJ/9u
 L+PBdP2affneZD/OEZDglvYokZoVIkTCDYQTUrNSx19ZHlzV38B+YcU25Wl0LEoVtWDMS
 2t4gED2hdtvKwdl2ciHsX+RA8FKRrKevXyn0Jlw+mLMFN0h/u9V2X64w+qKh+vZx0NjfE
 DbldUwT4SJr33d3fXC/cHucUy+BSVj6IdEIxVyT7XCDrq3YZP7gfLdsRfomL6jStCkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791060845;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=c5rC42OBh6ANGagwJTw0eCGLPz77gG8LkdGPUyugsUU=;
 b=FCrxR26dVSQZ3kOiRVwyD43o6+AKRp2SvsGrpg+9aEHjbR+4/Lgdb8FcrgU36CuvybwZ
 usW6ItkigMmny0RJ3mPfrEJtPcaioyTcWe4fhlcC/d0nyK6Q7j+x8F/eQ3NF1GihRJ0nN
 F480NIAlUmYkRhY8sOg/39V8SmEiLZ48HJaC+RA6rC/iLjfsSpwqLAFaELCuVa476f79t
 x+8HSmTgTQfb8FD9hyyKuzNYFe+tEOsvt3329I0tZlSDv4fHaKc1Y7qx2zwkyqxL0efEM
 J3hv2GhfLXZqZNLxdRNR9+zmjfUK0sT+V3NZO4y5GI6cvBdb9ESvr1ePq9bQ15XD/nQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FyZnfcKX; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 524D540055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 20:54:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [91.160.0.144])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 34884B0053E;
 Sat,  3 Oct 2026 22:54:01 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>
Date: Sat,  3 Oct 2026 22:53:58 +0200
Message-ID: <20261003205358.2056107-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/aer-inject: bump version to 36d5b4f
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop 0001-libgen-basename.patch, applied upstream, see commit 197f51d.

Upstream now ships a LICENSE file (see commit 41cda6d).

Changelog:
https://github.com/intel/aer-inject/compare/9bd5e2c7886fca72f139cd8402488a2235957d41...36d5b4f59b88c37d8ecba20b2302bddfe38f1ec2

Tested with Buildroot's GitLab CI (test-pkg on all toolchains):
https://gitlab.com/vjardin/buildroot/-/pipelines/2909708410

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/aer-inject/0001-libgen-basename.patch | 35 -------------------
 package/aer-inject/aer-inject.hash            |  4 +--
 package/aer-inject/aer-inject.mk              |  4 +--
 3 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 package/aer-inject/0001-libgen-basename.patch

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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
