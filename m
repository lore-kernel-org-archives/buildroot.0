Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032E6C61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A950B80C80;
	Tue, 25 Aug 2026 08:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_szFbmKjmYY; Tue, 25 Aug 2026 08:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787646897;
	bh=a6VU/r5NKclins92TtKtTCJ1KPWNoikN3DG7R+D8XqE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I8cUorhd/UNYWE3mkBd72q6UjZ3mTq+NTjbxbmiag/9wlmIN5W9v0ohZkJuge7IFi
	 Whrl3hKdanSu9jCQW8EdatVw6K0l36GFKXb6IYX2QfeYoJpj5jvB+sJNwftKq0cGNP
	 ykMjG+GcPoD38pyJTnZsXZy5S/dj1QTOFVrhqoDx4ufbkndPRv1/EbrBhYvdGLTwax
	 cqBzj9zYrFDaJsUlzGDm1eVRbl2EeeWPgPteuBO+SzWg2gfSnV5do1F54l9f3+3k9p
	 ZKTspWyxVmhNDFABbeIcEhioXyjY9szza7fwCLLoQREEwJ0N3aN8nwn4LaucpXuAtK
	 PONTIazErZ1Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABD2980C74;
	Tue, 25 Aug 2026 08:34:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E2D2279
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0008E6060B
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRjXwijEb9nH for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 426D16060A
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:34:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEABF91622; Tue, 25 Aug 2026 08:33:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 10:34:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c782302e2fc7ed4c87e893ad291adadd3467b7f9
X-Git-Newrev: 06426297c4e50c3394d494b7cd907b9c84222d85
X-Patchwork-Hint: ignore
Message-Id: <20260825083359.AEABF91622@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: refine
 BR2_TOOLCHAIN_HAS_LIBQUADMATH definition
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06426297c4e50c3394d494b7cd907b9c84222d85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In commit a2380157f6688c5c065fa19060a2c33145bab95b ("toolchain: enable
libquadmath for PowerPC with VSX"), the definition of
BR2_TOOLCHAIN_HAS_LIBQUADMATH has been extended to also be true when
BR2_POWERPC_CPU_HAS_VSX.

However, practical experiments show that when 64-bit VSX-capable cores
are used in 32-bit mode, libquadmath is not built by GCC, causing
build failures:

cp: cannot stat '/home/autobuild/autobuild/instance-3/output-1/host/powerpc-buildroot-linux-musl/lib*/libquadmath*': No such file or directory

We did an extensive testing, building the 27 combinations of:

- GCC versions: 14, 15, 16
- C library: glibc, uclibc, musl
- PowerPC 32-bit, PowerPC 64-bit, PowerPC 64-bit little endian

This testing provides the following results:

|      gcc14 |       powerpc64 |      glibc |         OK |
|      gcc14 |     powerpc64le |      glibc |         OK |
|      gcc14 |     powerpc64le |       musl |         OK |
|      gcc14 |     powerpc64le |     uclibc |    SKIPPED |
|      gcc14 |       powerpc64 |       musl |         OK |
|      gcc14 |       powerpc64 |     uclibc |    SKIPPED |
|      gcc14 |         powerpc |      glibc |     FAILED |
|      gcc14 |         powerpc |       musl |     FAILED |
|      gcc14 |         powerpc |     uclibc |     FAILED |
|      gcc15 |       powerpc64 |      glibc |         OK |
|      gcc15 |     powerpc64le |      glibc |         OK |
|      gcc15 |     powerpc64le |       musl |         OK |
|      gcc15 |     powerpc64le |     uclibc |    SKIPPED |
|      gcc15 |       powerpc64 |       musl |         OK |
|      gcc15 |       powerpc64 |     uclibc |    SKIPPED |
|      gcc15 |         powerpc |      glibc |     FAILED |
|      gcc15 |         powerpc |       musl |     FAILED |
|      gcc15 |         powerpc |     uclibc |     FAILED |
|      gcc16 |       powerpc64 |      glibc |         OK |
|      gcc16 |     powerpc64le |      glibc |         OK |
|      gcc16 |     powerpc64le |       musl |         OK |
|      gcc16 |     powerpc64le |     uclibc |    SKIPPED |
|      gcc16 |       powerpc64 |       musl |         OK |
|      gcc16 |       powerpc64 |     uclibc |    SKIPPED |
|      gcc16 |         powerpc |      glibc |     FAILED |
|      gcc16 |         powerpc |       musl |     FAILED |
|      gcc16 |         powerpc |     uclibc |     FAILED |

The "SKIPPED" are when the configuration is not possible: uClibc
doesn't support powerpc64 or powerpc64le.

Then, as we can see, the build fails for all "powerpc"
configuration. Our conclusion is therefore that libquadmath is not
supported on PowerPC 32-bit. While we were not able to find direct
evidence in the gcc code base, this practical experiment shows that is
simply doesn't work on PowerPC 32-bit.

So, we take the logical action of adjusting
BR2_TOOLCHAIN_HAS_LIBQUADMATH so that it is true only on
powerpc64/powerpc64le.

Fixes:

  https://autobuild.buildroot.org/results/46d435c9f5086a8695f4f6cd4026bb0d194de13c/

Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 7762106bee..128f8faef2 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -989,12 +989,12 @@ config BR2_TOOLCHAIN_HAS_ATOMIC
 # - At least, libquadmath is available on:
 #   - i*86
 #   - x86_64
-#   - PowerPC with vector scalar (VSX) instruction set
+#   - PowerPC64 with vector scalar (VSX) instruction set
 # - When available, libquadmath requires wchar support.
 config BR2_TOOLCHAIN_HAS_LIBQUADMATH
 	bool
 	default y if BR2_i386 || BR2_x86_64
-	default y if BR2_POWERPC_CPU_HAS_VSX
+	default y if (BR2_powerpc64 || BR2_powerpc64le) && BR2_POWERPC_CPU_HAS_VSX
 
 comment "Bare metal toolchain"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
