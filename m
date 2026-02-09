Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1247E94614
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 22:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75AB760DA8;
	Mon,  9 Feb 2026 22:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSvlvZSqxAVJ; Mon,  9 Feb 2026 22:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B81560DAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770676214;
	bh=Nocg3CkmAqYs2AHi6cx8ZlSuN5eApUESIL2lWluXZ64=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eoI8bud8DEqtOhLFPa7eTI4FwKRer6bj8qb9PtIntFbt315ygnsIB65k4hxcJHC0e
	 +FSRvBktxJcun3xkVHhirkvBvIGvx1/yuVlwZbY1Mem4NBhd7I0HFzPJ7xjm2GvMGp
	 p25/X6cZltxfdGFHKhA2WZcJ86vrcvXH5eTNA1stWuwzxuoxUgZzNaqIKF9Nu4LHIJ
	 fZvYzl9xs7t/eIxGVMfqd9vrXZwfJoQ+ERan58WAVfdusrdIl8JeGtdsEjRqpre1/L
	 Ag4ESHaJeLU3kKdtGDHlYwi2Rwz8FZ+Fl8HsHxmdbHXoOijJfIM1+qflKQKsGn5lHz
	 /INhO2O6WT0iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B81560DAD;
	Mon,  9 Feb 2026 22:30:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F4088219
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D970260DBB
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPgs_xkQF4eK for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 22:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA7AE60DAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA7AE60DAD
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:30:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B96AD83758; Mon,  9 Feb 2026 22:30:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 9 Feb 2026 23:14:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87d2e5ff59ffaa94000a4776a3f5ab7f60a23fda
X-Git-Newrev: 566150745bf61fdc1aee68fcf319bc4e8942960a
X-Patchwork-Hint: ignore
Message-Id: <20260209223010.B96AD83758@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.19 headers
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/566150745bf61fdc1aee68fcf319bc4e8942960a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

And add (and default to) 6.19 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/from-6.17/linux.hash                                  |  1 +
 package/linux-headers/6.19                                  |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 5 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index f158e49815..105f025729 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  303079a8250b8f381f82b03f90463d12ac98d4f6b149b761ea75af1323521357  linux-6.19.tar.xz
 sha256  030115ff8fb4cb536d8449dc40ebc3e314e86ba1b316a6ae21091a11cc930578  linux-6.18.9.tar.xz
 
 # Licenses hashes
diff --git a/package/linux-headers/6.19 b/package/linux-headers/6.19
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/6.19
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7b3efe74b2..b9c86168be 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_18
+	default BR2_KERNEL_HEADERS_6_19
 	help
 	  Select the kernel version to get headers from.
 
@@ -51,6 +51,10 @@ config BR2_KERNEL_HEADERS_6_12
 config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
+
+config BR2_KERNEL_HEADERS_6_19
+	bool "Linux 6.19.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -129,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_19
+	bool "6.19.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18
-	bool "6.18.x or later"
+	bool "6.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_17
@@ -462,6 +470,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.123"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.69"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.9"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19"		if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 99337a1873..51c5ae6f96 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -672,6 +672,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -685,6 +689,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
 	default "6.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	default "6.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	default "6.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 6991b899be..01c2371e15 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -173,8 +173,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_19
+	bool "6.19.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_18
-	bool "6.18.x or later"
+	bool "6.18.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_17
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
