Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B041C3ABB2
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 20:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B539840D1A;
	Wed, 28 May 2025 20:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SleB0J_Od-6k; Wed, 28 May 2025 20:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E025B40D0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E025B40D0E;
	Wed, 28 May 2025 20:31:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC855B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD9968156F
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpzwyJCVH6Xy for <buildroot@buildroot.org>;
 Wed, 28 May 2025 20:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A5981780
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18A5981780
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:31:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 032A987705; Wed, 28 May 2025 20:31:32 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 22:30:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 760b9b73e0f89a6387589d8ec78f29e5485bd99c
X-Git-Newrev: 305c40613ceab985bfa2abd094a96f3eb2aba5d9
X-Patchwork-Hint: ignore
Message-Id: <20250528203132.032A987705@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bpftrace: bump version
 to 0.23.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=305c40613ceab985bfa2abd094a96f3eb2aba5d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log since 0.19.1, see:
https://github.com/bpftrace/bpftrace/blob/v0.23.3/CHANGELOG.md

Note that since commit [1] updating llvm to 20.1.5, bpftrace is
failing to build at configuration time, with error message:

    CMake Error at CMakeLists.txt:184 (message):
      Unsupported LLVM version found via
      /buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include:
      20

    CMake Error at CMakeLists.txt:185 (message):
      Only versions between 6 and 17 are supported

This is because bpftrace version 0.19.1 does not support this
newer llvm version. This update to bpftrace to 0.23.3 resolve this
issue.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/e29dae109a217636381acd4f7be615a8744fe675

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bpftrace/bpftrace.hash | 2 +-
 package/bpftrace/bpftrace.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
index c2ecc927da..a3d62e072f 100644
--- a/package/bpftrace/bpftrace.hash
+++ b/package/bpftrace/bpftrace.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  b520340f28ce4d6f2fb2355f1675b6801ff8498ed9e8bff14abbbf6baff5a08e  bpftrace-0.19.1.tar.gz
+sha256  3b374c3618ff055d279ddd2fcf4393feb88b4b03284b8b6f69f1e0dedd20662c  bpftrace-0.23.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index dc4c9728cc..7ff0508486 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BPFTRACE_VERSION = 0.19.1
-BPFTRACE_SITE = $(call github,iovisor,bpftrace,v$(BPFTRACE_VERSION))
+BPFTRACE_VERSION = 0.23.3
+BPFTRACE_SITE = $(call github,bpftrace,bpftrace,v$(BPFTRACE_VERSION))
 BPFTRACE_LICENSE = Apache-2.0
 BPFTRACE_LICENSE_FILES = LICENSE
 BPFTRACE_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
