Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA066D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDE5F8401D;
	Tue, 13 Jan 2026 19:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_ZCV6wMvKpK; Tue, 13 Jan 2026 19:41:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E6083FF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333318;
	bh=HjvfdGtlDLP9htCX7nmyteXHo0supCdM41fEvIZ6le8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TCw3+9xFddLgM23/wQr5QvPEwEeFw+xBcX2+tEQGfCiV1A1PtFXeuhQvilQkKZyZK
	 pZwFzWdMEIBbDQPUUZC2jznLIQGO3ZonuCGFA4cRTn7KBN+HaqNe+QlxbDA+Wa2BOs
	 hJsEH1NpWX2lneG/2huDvhMuIevwtyepqtBTtDv/FSBwjND8ys258TJkHsOhYpENmt
	 BkLtq4qVC2EpUaydrK/YzLKh8tHz7A5R7P/usGYb43E4Wj0orm2roWIwyTaMRKIlZE
	 QeXdq+z0mxD4NgiuIpir7RiNlNeRfKfMNyn5GSL5Jy/XXfV7Su+QOn29h+51lCucvl
	 +92kDBklPD/Lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44E6083FF0;
	Tue, 13 Jan 2026 19:41:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11D0A231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D29982FB1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JiWt00dxzbq for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4539A82C7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4539A82C7C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 427BA83939; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 09:34:22 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: df60f3755123bb96ffa79f97e3c9cd3b5a1bced5
X-Git-Newrev: 1f642b56de2eb2476bae24a2282d51977f487b7e
X-Patchwork-Hint: ignore
Message-Id: <20260113194035.427BA83939@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] {linux,
 linux-headers}: bump 6.18.x, 6.17.x, 6.12.x, 6.6.x, 6.1.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f642b56de2eb2476bae24a2282d51977f487b7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Update the latest kernel releases to:
 - 6.18 -> 6.18.5
 - 6.17.11 -> 6.17.13
 - 6.12.61 -> 6.12.65
 - 6.6.119 -> 6.6.120
 - 6.1.159 -> 6.1.160

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index fb4e6f3a08..a865056622 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d82ccf83c3..4566117102 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9106a4605da9e31ff17659d958782b815f9591ab308d03b0ee21aad6c7dced4b  linux-6.18.tar.xz
-sha256  934b18af0125f114907bad482d7c5a97d58038970b9dce6162318e920caf257e  linux-6.17.11.tar.xz
-sha256  1a69745105528676f12f29dc2494945d96cb23666dcc5223794abc22415f1735  linux-6.12.61.tar.xz
-sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
-sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
+sha256  116802dc3ad1646163cc6ffe9bddba24a8069b569135ec0523cd799064f2edb9  linux-6.17.13.tar.xz
+sha256  54e852667af35c0ed06cfc81311e65fa7f5f798a3bfcf78a559d3b4785a139c1  linux-6.12.65.tar.xz
+sha256  405c332d59eedc4fd78863ff07a06c040dfeef651e58f022910a5ac953e4dc21  linux-6.6.120.tar.xz
+sha256  0e8546a8437558be17ef5a87142055347bf2e7e9863ee58bb3996cbf0fd28496  linux-6.1.160.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
 sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 412232a571..9fa1f2ffb7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -462,11 +462,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.61"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.11"	if BR2_KERNEL_HEADERS_6_17
-	default "6.18"		if BR2_KERNEL_HEADERS_6_18
+	default "6.1.160"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.120"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.65"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.13"	if BR2_KERNEL_HEADERS_6_17
+	default "6.18.5"		if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
