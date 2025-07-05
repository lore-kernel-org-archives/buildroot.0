Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B12FC8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6C3C60EF6;
	Sat,  5 Jul 2025 17:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1dVSGRCoMuP; Sat,  5 Jul 2025 17:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE9B610BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AE9B610BB;
	Sat,  5 Jul 2025 17:47:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F554445
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62FA783A05
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DB2EwBurxK1n for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3663E83A3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3663E83A3A
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31AC985615; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 19:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef55ca4075081ec2f0f740204d2b44cd1e0cb00f
X-Git-Newrev: d4a3b9efdd76273d991a2e870c6ab521001c06ff
X-Patchwork-Hint: ignore
Message-Id: <20250705174709.31AC985615@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments: Add LoongArch64
 toolchain support
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4a3b9efdd76273d991a2e870c6ab521001c06ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add full/glibc variant of LoongArch64 internal toolchain.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/config-fragments/autobuild/br-loongarch64-full-internal.config | 3 +++
 .../config-fragments/autobuild/br-loongarch64-internal-glibc.config    | 3 +++
 support/config-fragments/autobuild/toolchain-configs.csv               | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/support/config-fragments/autobuild/br-loongarch64-full-internal.config b/support/config-fragments/autobuild/br-loongarch64-full-internal.config
new file mode 100644
index 0000000000..9faab86b3c
--- /dev/null
+++ b/support/config-fragments/autobuild/br-loongarch64-full-internal.config
@@ -0,0 +1,3 @@
+BR2_loongarch64=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-loongarch64-internal-glibc.config b/support/config-fragments/autobuild/br-loongarch64-internal-glibc.config
new file mode 100644
index 0000000000..a9ee70d559
--- /dev/null
+++ b/support/config-fragments/autobuild/br-loongarch64-internal-glibc.config
@@ -0,0 +1,3 @@
+BR2_loongarch64=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 047b22a9fa..d0002375d6 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -50,6 +50,8 @@ support/config-fragments/autobuild/br-arm-internal-full.config,any
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
 support/config-fragments/autobuild/br-arm-internal-musl.config,any
 support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
+support/config-fragments/autobuild/br-loongarch64-full-internal.config,any
+support/config-fragments/autobuild/br-loongarch64-internal-glibc.config,any
 support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
