Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE94CEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BA0E61575;
	Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Si1a9--U7vT4; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A09261595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011423;
	bh=o1gdFxtCLh+3iXcCj9Uh407g78HgiPkyortKM30FT00=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q43uzOMPbsiKEgMDgMwJo3xtOGzFfDR4WSYY9qutOtTSJ9jZuaFs+yR86CTXlr6mj
	 6FUhil73Cnhqs+810WY1xZjkmHLZMUdX9TXmxZqs6zZ6x581KhyJmgCC9GxSsR0+aW
	 9pxjDpNQl/AiTl/RoGLfMqIi57WomlzPZnFw0YU98igr9lc8wTRoLk7eSuXEmanpRJ
	 bVC9ItNg1Z/Wbr4W3W3NyULdF5qHOIx8ep3rIw5vK0iNZaDSdtqEk1Xv4w3aWaKhKx
	 iRuhSywQuxJUFjIi+5nq4iidvCXfn7SxO7vZOkKvHfrs68PfdpljNifTycHle3uOpX
	 YOofI92Pw96Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A09261595;
	Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04508283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DF9D844B9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1vSoAKThO8f for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E85BD84543
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E85BD84543
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD0BD83A88; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:51:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9da1d2bc6addf84db695ff829d0dd93457921b49
X-Git-Newrev: f47fc0c87b49a2722a7e3dbe68edef14442a3ff1
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.DD0BD83A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/config-fragments/autobuild: add a really old toolchain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f47fc0c87b49a2722a7e3dbe68edef14442a3ff1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 85d47bbc40bb9b62d2b59b6f5653f6e69c494372)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index 8ef59965c7..b5c93d9e82 100644
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
