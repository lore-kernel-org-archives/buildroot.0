Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900D4E83060
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50B7C607EE;
	Tue,  3 Feb 2026 08:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4R6p5kaS4_wf; Tue,  3 Feb 2026 08:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64CD460804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106573;
	bh=wFqoD2LUqhgManjBl9/z8kijPFOAK4XSOpnfeLNeiL8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=apwRCAFSm6ZojIDXoA39gop04A45Y8Yt6FvPL9AmOBAmhJmYsBWEL9Mvhokm05S0T
	 dIhhpuM/AXrXB0viEsk+hpDEWP8oiaRa5IU+EGHnO8GicbQ1kHlqvVoqQx8mQelw1e
	 vRC3KWVuAlBPtgYSewjTzxnA87aYC1Xmo/sn8BjAhHLG+mjqcguUaTLw2Zov0m1kwC
	 LCVGiRmmDXBqknnKLgzsh5uIK/25R7gNyWacos4ZzNLsoT4BCon03okhLZ6Q0rFzOR
	 QtgjPZIPFuErQjQVEwQpKbjBFmFP0Qr9uSYkXOR+qLlriNk3ZxbvUrBVGu43YoIa80
	 v6mxtGHmSrV/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64CD460804;
	Tue,  3 Feb 2026 08:16:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28A1DF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B3B540B5A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6G-NxcSJmfOd for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DA0040B30
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DA0040B30
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23C5C8653D; Tue,  3 Feb 2026 08:16:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 09:15:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 573a113edddf076b281da1897fa15556270c134d
X-Git-Newrev: 85d47bbc40bb9b62d2b59b6f5653f6e69c494372
X-Patchwork-Hint: ignore
Message-Id: <20260203081608.23C5C8653D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: add a
 really old toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=85d47bbc40bb9b62d2b59b6f5653f6e69c494372
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Testing with a really old toolchain is helpful to catch issues related
to kernel headers version issues, gcc version issues, etc. We chose a
glibc toolchain though as old musl or uClibc-ng versions tend to lack
a number of features that are needed by modern software.

This toolchain is placed near the top of toolchain-configs.csv, so
that it is used as part of the "base" set of toolchain that test-pkg
uses, even without the -a option.

test-pkg takes the 6 first toolchains of this CSV file for its base
test, and actually the comment in toolchain-configs.csv was wrong
since commit 53a8c5150e5eeeb6dbbead0275dbf9141f507511, which removed a
toolchain from the base set, but not realizing that test-pkg would
anyway continue to test the first 6 toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../config-fragments/autobuild/bootlin-aarch64-glibc-old.config  | 9 +++++++++
 support/config-fragments/autobuild/toolchain-configs.csv         | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
new file mode 100644
index 0000000000..1b811f267a
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
@@ -0,0 +1,9 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 3ea05775f8..7103d903c9 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -18,6 +18,9 @@ support/config-fragments/autobuild/bootlin-x86-64-musl.config,x86_64
 # Test a MMU toolchain without dynamic library support
 support/config-fragments/autobuild/br-arm-full-static.config,x86_64
 
+# Test a really old toolchain (gcc 6.x, headers 4.9)
+support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config,x86_64
+
 # Toolchains used by test-pkg only when the '-a' option is passed:
 support/config-fragments/autobuild/arm-aarch64.config,x86_64
 support/config-fragments/autobuild/bootlin-aarch64-glibc.config,x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
