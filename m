Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C7BE83827
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 19:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 569026059E;
	Mon, 16 Feb 2026 19:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWP3Kzv28AnM; Mon, 16 Feb 2026 19:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9039C60DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771271279;
	bh=E3FaFkbYcGZnayEcUkCcJtVoLNfeipqUzX7KE+yIjgI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VFSeDtcec+VSJqghXn/wKObolMWvqzxZh8iQ3M9X0G1ZSfmbm4MX4c4+8NaANIadS
	 b4blbIpxWZvqfHIyjrD2SOXscwiETA5eHEggaYkY16VDGa4bTzwDMkctLydV24qmqE
	 2obuHqMWLlFJKKby+QbBDf7G97xxzumyqepjKh7+RETlSts7DaKoQtCoeCPj/J3Z+l
	 YI5mryX4zDt6RfUy4r2kdTyYMSCmqsRaZZJLMHpzhdMsH8EaLHTql+COn0FdP41Nn/
	 m4fCxqhnmZJxEhNOkt0ObsA2haW6hQtkUFsRyb2nsRHamkfbfBEZKzdHfQ8lE8xpVc
	 jJOBwx89nAbhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9039C60DE2;
	Mon, 16 Feb 2026 19:47:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32C31270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20F7140A5B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krzas5lu7eGu for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 19:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C99940A1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C99940A1C
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:47:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 109C086F1A; Mon, 16 Feb 2026 19:47:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 20:47:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9900ba6208ce286ca6531e1dc93b8a5cc322d408
X-Git-Newrev: 7bbe1e0979c1432acd62f76b2d16ff8339064397
X-Patchwork-Hint: ignore
Message-Id: <20260216194757.109C086F1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sheevaplug: specify Linux license
 file
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7bbe1e0979c1432acd62f76b2d16ff8339064397
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The used Linux kernel (4.14.336) does not contain the default license files
as those were only added in 4.16 with commit e00a844aca ("LICENSES: Add
Linux syscall note exception"), so specify the correct license file to fix:

make legal-info
..
cp: cannot stat '/path/to/output/build/linux-headers-4.14.336/LICENSES/preferred/GPL-2.0': No such file or directory

And add the sha256sum to the .hash file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: reword commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/sheevaplug/patches/linux/linux.hash | 1 +
 configs/sheevaplug_defconfig              | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/sheevaplug/patches/linux/linux.hash b/board/sheevaplug/patches/linux/linux.hash
index b207306a2b..aa432012b0 100644
--- a/board/sheevaplug/patches/linux/linux.hash
+++ b/board/sheevaplug/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
+sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 855efedafa..a6a324213c 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -7,6 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.336"
+BR2_LINUX_KERNEL_LICENSE_FILES="COPYING"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
