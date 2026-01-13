Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF386D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A143960D71;
	Tue, 13 Jan 2026 19:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSPZt8kSSIIT; Tue, 13 Jan 2026 19:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A941260D58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333020;
	bh=JCbFP+nRH0engxxOW5gNjb5N0/myU97I/OpJiZa2r+4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nrCsatXUVBByYgxUyRGuxXrACxDDkxP2yeBgjdx1d+dmo+c4XYZd7piLbhXG/cyfD
	 apatkh+2BPWzZy2edt1sQM+2Pty6yCWE/gCLkp6jW/M7E6VYo3A7L2vOP7p0fzKvfB
	 lIg9tehWCfOwOPkwMq3JDOxSQn4huxfXX9uHBRQW6KHru0uLb+I1UHHRoN1skJeFB6
	 0ADYSZs8+HLFjRTcpGt7wCTXdT1bHLCyojZV2+easbs7cvK6Jj+ry80q2vgYwbuzkq
	 y+VbyjwJ3ibmVaIF99qE80vfXLi+TGhMZzfDuCHmeLmny6tNhmJIZ2RgbI7512swGm
	 qeVWNR8ZbYweg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A941260D58;
	Tue, 13 Jan 2026 19:37:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02B05231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA05582E19
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwLjkufAn543 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 106AB82D12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 106AB82D12
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E43886E71; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 09:33:46 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 997ee1124deeaa4392d950d454cdb0a68e46fcbb
X-Git-Newrev: 55db4c933316ff2ab5a0fce6f2ae35c76cdd71eb
X-Patchwork-Hint: ignore
Message-Id: <20260113193620.0E43886E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=55db4c933316ff2ab5a0fce6f2ae35c76cdd71eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Update the latest kernel releases to:
 - 6.12.61 -> 6.12.65
 - 6.6.119 -> 6.6.120
 - 6.1.159 -> 6.1.160

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1af6412017..a589d8cb38 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.61" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.65" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index b86f257367..5585746d5a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,9 +2,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1a69745105528676f12f29dc2494945d96cb23666dcc5223794abc22415f1735  linux-6.12.61.tar.xz
-sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
-sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
+sha256  54e852667af35c0ed06cfc81311e65fa7f5f798a3bfcf78a559d3b4785a139c1  linux-6.12.65.tar.xz
+sha256  405c332d59eedc4fd78863ff07a06c040dfeef651e58f022910a5ac953e4dc21  linux-6.6.120.tar.xz
+sha256  0e8546a8437558be17ef5a87142055347bf2e7e9863ee58bb3996cbf0fd28496  linux-6.1.160.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
 sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1b49a701de..c3b530a2b8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -431,9 +431,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.61"	if BR2_KERNEL_HEADERS_6_12
+	default "6.1.160"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.120"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.65"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
