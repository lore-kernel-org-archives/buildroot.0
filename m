Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D685E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44732610BF;
	Thu, 19 Feb 2026 17:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vkfc7LzvfWMF; Thu, 19 Feb 2026 17:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA7AD61164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521952;
	bh=HIiFd+Wp4XMImw3RcpNnj02WiguwjMlqFhy79jsZrF4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EhHbJ8lqNBNnRc+XRqYq64lujgD3Yjddn7TgURCOm8Mf4TDkAYSLfv2m82eE828Jp
	 ilF8ocUJo+DOoZnOYedC1CXERMNkvZLT2cl1GM59F+CwvsKfM4rift0TvvoHk4S1bQ
	 C8NNe0ztxKbGsljS/ZERgtxn0Hj6zroLDS4JwA68ojjB838UNNzTEw92ONEPR38dOL
	 xc4p1TSRrdUcOev+ImJ/kATuwnlUmGiu4eVzjbpqu2YVDv+wKYpF9EPqsnEz51kDNC
	 /MZnhqSkp8udRhUtLMLXOGI4Ue75I17rZc2YWxKskTzujqW26ngUuc36NsETdJW4/2
	 h07i5scxNoJWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA7AD61164;
	Thu, 19 Feb 2026 17:25:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E021CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 296F480C50
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lw1fK7sh5zt2 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5159B83544
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5159B83544
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 420A0870D9; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 18:40:03 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: be7bd63d6ef7f4860424464f2de7d85f90ae9649
X-Git-Newrev: 5921f3decfb00dfd15f48c70fd046f58d89c189e
X-Patchwork-Hint: ignore
Message-Id: <20260219172537.420A0870D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5921f3decfb00dfd15f48c70fd046f58d89c189e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update the latest kernel releases to:
 - 6.12.65 -> 6.12.73
 - 6.6.120 -> 6.6.126
 - 6.1.160 -> 6.1.163
 - 5.15.197 -> 5.15.200
 - 5.10.247 -> 5.10.250

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5ba117c212..0dc2b6a729 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.65" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.73" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 658b6d9647..56a7b436e0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,12 +2,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  54e852667af35c0ed06cfc81311e65fa7f5f798a3bfcf78a559d3b4785a139c1  linux-6.12.65.tar.xz
-sha256  405c332d59eedc4fd78863ff07a06c040dfeef651e58f022910a5ac953e4dc21  linux-6.6.120.tar.xz
-sha256  0e8546a8437558be17ef5a87142055347bf2e7e9863ee58bb3996cbf0fd28496  linux-6.1.160.tar.xz
+sha256  4059d394cbf8e9548df36d37e0b8a80c4409ac4e14ecc5019a72a770ef7b41ba  linux-6.12.73.tar.xz
+sha256  16742f4e78abfec8cc9205fb3cf79d63c7e819c33bfc691402683402c350ee2f  linux-6.6.126.tar.xz
+sha256  fd2d033321bd15e0ad5669208b6e43f3f93ccecb059a512ca6b913ca940c38ea  linux-6.1.163.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
-sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
+sha256  fce4b1c86688880932ba8f755880cbf390a89453464bfd90b9a1b01a121c2998  linux-5.15.200.tar.xz
+sha256  47754da223a9f264b917be5d575a4dae03fc8777aa9e1b00473e973ee997d529  linux-5.10.250.tar.xz
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6f46ace4aa..12e68b5edd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -429,11 +429,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.160"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.120"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.65"	if BR2_KERNEL_HEADERS_6_12
+	default "5.10.250"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.200"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.163"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.126"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.73"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
