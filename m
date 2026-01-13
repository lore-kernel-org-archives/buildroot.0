Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEAED2D0ED
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 12:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42AE96F699;
	Tue, 13 Jan 2026 12:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCteZdEYgOAz; Tue, 13 Jan 2026 12:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70CC76F683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768309161;
	bh=I9MZdI0RI7IUWdaZEZ1fzUZs16fexzvId2TreqlGiWw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IvQmkgIbUKq3hpKiTwIdMw5cAhcfvYHF91dCWUGx2Pk7vBfB/g4Rilr2UHJqRLhDp
	 SuvSjHMh9Q10Md2R1tBeFMI66PkV39Zh7aboe17HzLD5pKz+/70gFq9eGggM3tQa/W
	 99486QJF8RmFFbb2PtNKDo9ZiSlYKulA9I6CuLsYt/LmslRCjkdEKx7eBBpW6ibk9S
	 bZZl2uKMih1yAoU4Q6xvHnSp3SVolm8XqF/xmWQlUOqxoTVClA/u/Md93B5hopHeBJ
	 UiQA+TxLgfM8K0gshCVb0wnf2/L+YgRBH2GKIQ2rKEwIsfwYel4c3PJzVeI/pqFg+B
	 VQf+6moz9zRig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70CC76F683;
	Tue, 13 Jan 2026 12:59:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D81C231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 12:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EA8540BE2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 12:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tOAwIH3mpNd for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 12:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C55741CE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C55741CE3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 12:59:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4464588532; Tue, 13 Jan 2026 12:59:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 13:45:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0404092955cd1e800fc343df4ab80005745985d
X-Git-Newrev: 8b1dc96ec608abe14e3531e2dec9307c8dac3480
X-Patchwork-Hint: ignore
Message-Id: <20260113125918.4464588532@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{1, 6, 12,
 18}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b1dc96ec608abe14e3531e2dec9307c8dac3480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ca8dff1f4b..db74f4c337 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 11db3e59b6..cdfd260ef1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7a8879167b89c4bae077d6f39c4f2130769f05dbdad2aad914adab9afb7d7f9a  linux-6.18.3.tar.xz
-sha256  d1ad94a33681148efe884f4028970d69e332f2b003f0e8be53a1d25de38e49a2  linux-6.12.64.tar.xz
-sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
-sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
+sha256  54e852667af35c0ed06cfc81311e65fa7f5f798a3bfcf78a559d3b4785a139c1  linux-6.12.65.tar.xz
+sha256  405c332d59eedc4fd78863ff07a06c040dfeef651e58f022910a5ac953e4dc21  linux-6.6.120.tar.xz
+sha256  0e8546a8437558be17ef5a87142055347bf2e7e9863ee58bb3996cbf0fd28496  linux-6.1.160.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
 sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f28ccaffe0..4710fc79a9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -458,10 +458,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.64"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.3"	if BR2_KERNEL_HEADERS_6_18
+	default "6.1.160"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.120"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.65"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.5"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
