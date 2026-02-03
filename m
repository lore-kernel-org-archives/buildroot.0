Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6932CE83060
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DC6F81A99;
	Tue,  3 Feb 2026 08:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44Io2oPkR30D; Tue,  3 Feb 2026 08:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 264E081A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106577;
	bh=br6AreuDrQ23PNZ2G41u2jBu42MNqRwX5fZz59RajuE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZD8hdF5i2V+8Iue2+LjPZ21psdDmQA6QAv8ZtqqeXkWd9hAdtsC1T/rSThbU8TE+O
	 PcB2qn30KXWb+k0v+HYK0lBdxYFFLrK+25MNf47P+M48jUrN5zs6WqwATz+/c+CC9Z
	 6ls/xiZT+g0W0M6FCAvetkzLGy3ac9P+lzvsbyvm9ZQYY4ptuoOW00iDjlSdAEF1On
	 PqvUnv/ip3a52ysSajhLhgCYQ3KhI3x2jq/jH3GrD4yYIbmCMPhnNiGdzQ4g2fnMXw
	 gJjqcsIwlZVlL3vzOiks9VAbYqHGdtynun9niAlm+GSh8RAk86NCiGD0uVyGWhFbwM
	 sSl1YEWfePdwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 264E081A47;
	Tue,  3 Feb 2026 08:16:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3F18F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26AD640B60
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKsREnkWNYG9 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 451F040B44
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 451F040B44
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 156D28431B; Tue,  3 Feb 2026 08:16:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 09:15:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bab0acff64a3accab4935a7245a3851a6369c35
X-Git-Newrev: 573a113edddf076b281da1897fa15556270c134d
X-Patchwork-Hint: ignore
Message-Id: <20260203081608.156D28431B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments/autobuild:
 replace MIPS64 toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=573a113edddf076b281da1897fa15556270c134d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The prebuilt MIPS64 toolchains are very old, causing build issues (for
example recently with the systemd v258 update). Replace them both a
single toolchain configuration that uses one of the mips64el Bootlin
toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../config-fragments/autobuild/bootlin-mips64el-glibc.config |  4 ++++
 support/config-fragments/autobuild/br-mips64-n64-full.config | 10 ----------
 .../autobuild/br-mips64r6-el-hf-glibc.config                 | 12 ------------
 support/config-fragments/autobuild/toolchain-configs.csv     |  3 +--
 4 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-mips64el-glibc.config b/support/config-fragments/autobuild/bootlin-mips64el-glibc.config
new file mode 100644
index 0000000000..d8bebd5d70
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-mips64el-glibc.config
@@ -0,0 +1,4 @@
+BR2_mips64el=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-mips64-n64-full.config b/support/config-fragments/autobuild/br-mips64-n64-full.config
deleted file mode 100644
index b89b74e76f..0000000000
--- a/support/config-fragments/autobuild/br-mips64-n64-full.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_mips64el=y
-BR2_MIPS_NABI64=y
-# BR2_MIPS_SOFT_FLOAT is not set
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
deleted file mode 100644
index edf04c356f..0000000000
--- a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
+++ /dev/null
@@ -1,12 +0,0 @@
-BR2_mips64el=y
-BR2_mips_64r6=y
-BR2_MIPS_NABI64=y
-# BR2_MIPS_SOFT_FLOAT is not set
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index ff8927eb37..3ea05775f8 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -28,6 +28,7 @@ support/config-fragments/autobuild/bootlin-m68k-5208-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-mips64el-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
@@ -47,5 +48,3 @@ support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
 support/config-fragments/autobuild/br-loongarch64-full-internal.config,any
 support/config-fragments/autobuild/br-loongarch64-internal-glibc.config,any
-support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
-support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
