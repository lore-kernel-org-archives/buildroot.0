Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02563D5B16D
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 13:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C1E408F2;
	Sun, 14 Dec 2025 13:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWnewFtL9i8B; Sun, 14 Dec 2025 13:02:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07CB2408CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765717324;
	bh=vYquR3ispe99AtkfBnwr6fECTOIBI6uk/ZPadg3QcZQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r8Moqosp4AmgcITje5jnB7Zz1cLAXIO/gJC8zmsUWu9lTsY935riqL0srbqlV0s4u
	 QR798mY7/+492Vt54eQpRkg8pxCT7UiVAdm9NLX0RhNws+R7heOiyAxIXHJAwW/G+y
	 SVdMSDWQOELeyKGrOoGuuxv5eW5PkdzBWQpN6wOKK2hajBdKvp/Q1bQii6w0wiaORr
	 TBOHNsHdM0iGTNR/NS6ykgyCZCWjdFYRlpLA4KpTahP+ERHfU6P99rGVx8I53/TwDY
	 a/klhCxDjmAy9HRcE+kwdLxNpyTh6SPdUahQq1EYkbC1dSOSg+nQNlJ99tW+s2RmZT
	 PoFo13WWeeRMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07CB2408CE;
	Sun, 14 Dec 2025 13:02:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A744117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 13:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F42402DD
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 13:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpbSvxTdYnuP for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 13:02:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EFF7400C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EFF7400C0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 13:02:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89D9B86DE4; Sun, 14 Dec 2025 13:02:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 13:19:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61f5e2efcae5ece840a561ad56cdec04dad3a25d
X-Git-Newrev: 97e2f63bdf4cc992787c570b17b099c41c5535d2
X-Patchwork-Hint: ignore
Message-Id: <20251214130201.89D9B86DE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftrace: bump version to 0.24.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=97e2f63bdf4cc992787c570b17b099c41c5535d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/bpftrace/bpftrace/blob/v0.24.2/CHANGELOG.md

Version 0.24.0 contains: "Add support for LLVM 21"

Buildroot commit d6a7c0226333138721ae722b89e31a82cfb22ae0 bumped llvm to
the 21 series causing a build error with bpftrace:

CMake Error at CMakeLists.txt:168 (message):
  Unsupported LLVM version found via
  /home/autobuild/autobuild/instance-14/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include:
  21

CMake Error at CMakeLists.txt:169 (message):
  Only versions between 16 and 20 are supported

Fixes:
https://autobuild.buildroot.net/results/2bf/2bf26b4848796ab031ab0767b97aba63a35f1184/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bpftrace/bpftrace.hash | 2 +-
 package/bpftrace/bpftrace.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
index a3d62e072f..4add96aee3 100644
--- a/package/bpftrace/bpftrace.hash
+++ b/package/bpftrace/bpftrace.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  3b374c3618ff055d279ddd2fcf4393feb88b4b03284b8b6f69f1e0dedd20662c  bpftrace-0.23.3.tar.gz
+sha256  e0514aa3e1a032b0b2de2cf3c281bfee9b9e80509498e70ed78786bbd64db373  bpftrace-0.24.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 7ff0508486..4d7033eb9a 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTRACE_VERSION = 0.23.3
+BPFTRACE_VERSION = 0.24.2
 BPFTRACE_SITE = $(call github,bpftrace,bpftrace,v$(BPFTRACE_VERSION))
 BPFTRACE_LICENSE = Apache-2.0
 BPFTRACE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
