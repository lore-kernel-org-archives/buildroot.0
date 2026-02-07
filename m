Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F45EE0AF1
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 21:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA3B8331B;
	Sat,  7 Feb 2026 21:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSuzKcFF2ghr; Sat,  7 Feb 2026 21:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7056783330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770500749;
	bh=mccUSkjAruSzdM4I/evhYF3j7CaksXUmKKJaBCDuIIg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fOQWdMo/AUvjMSp/h4NO/UzKbbSiyO5kXnxdVyUbBrvRU+l22VuktTBGLCE/M3ShG
	 Cb4MN6o6XciGGz9/wEHT21y2NSqLO12oGxZ4ROvTOFyLC7BNx+lvb9xec68KqUTyNl
	 f7Bw92bbNKyQkRy+BTRaKng1mp7TxLY041ZjIXHqwClXayE9crfF8g6wqGcZD0Yu8T
	 MHgrQeJvWBzf+jb59wVRZLX2C5AFm2zP9trzHOHrIFznSmIBmjRV+ZjHKLqSMOXMOB
	 my0WTIVwv8oElEZSzcTasW3lHMCtqnfZBm/brM4Ltmil08jBVPgcsoWZJtV1OP3lAM
	 F+izThLBwiJ+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7056783330;
	Sat,  7 Feb 2026 21:45:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 563F4173
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C95741BC0
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2ZBqOGwK2e1 for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 21:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EB2041BBF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EB2041BBF
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6011D86ABD; Sat,  7 Feb 2026 21:45:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Feb 2026 22:33:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd3c23999c5dba32ce51bba32cfd7a5e69daa149
X-Git-Newrev: 16a0560152c65b0c312912188573e9def9374654
X-Patchwork-Hint: ignore
Message-Id: <20260207214546.6011D86ABD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/blake3: add target support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16a0560152c65b0c312912188573e9def9374654
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Blake3 unconditionally enables C++ support, which unconditionally
requires C++20 when built with cmake >= 3.12, even when this is not
required.

Fixing this does not look trivial, and rather than botching the build,
just require C++20, available from gcc 8.x onward.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in        | 1 +
 package/blake3/Config.in | 8 ++++++++
 package/blake3/blake3.mk | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6284bea7f4..8346ef1a0e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2121,6 +2121,7 @@ menu "Other"
 	source "package/avro-c/Config.in"
 	source "package/basu/Config.in"
 	source "package/bdwgc/Config.in"
+	source "package/blake3/Config.in"
 	source "package/boost/Config.in"
 	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
diff --git a/package/blake3/Config.in b/package/blake3/Config.in
new file mode 100644
index 0000000000..afad6541d9
--- /dev/null
+++ b/package/blake3/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BLAKE3
+	bool "blake3"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8  # C++20
+	help
+	  BLAKE3 is a cryptographic hash function.
+
+	  https://github.com/BLAKE3-team/BLAKE3
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index a2094fc4c0..9218e5bbba 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -10,6 +10,11 @@ BLAKE3_SUBDIR = c
 BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
 BLAKE3_LICENSE_FILES = LICENSE_A2 LICENSE_A2LLVM LICENSE_CC0
 
+BLAKE3_INSTALL_STAGING = YES
+
+BLAKE3_CONF_OPTS = \
+	-DBLAKE3_USE_TBB=OFF \
+	-DBLAKE3_EXAMPLES=OFF
 HOST_BLAKE3_CONF_OPTS = \
 	-DBLAKE3_USE_TBB=OFF \
 	-DBLAKE3_EXAMPLES=OFF
@@ -23,4 +28,5 @@ HOST_BLAKE3_CONF_OPTS += \
 	-UCMAKE_C_COMPILER_LAUNCHER \
 	-UCMAKE_CXX_COMPILER_LAUNCHER
 
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
