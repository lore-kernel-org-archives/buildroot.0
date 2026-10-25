Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88266606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=POz9umOT
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DCC540600;
	Sun, 25 Oct 2026 20:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhZtZFPWrw3r; Sun, 25 Oct 2026 20:50:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6BE07405F5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961401;
	b=i5UWmXMCwbjMDkXlTGTYVKqaeUIE4wI4p8DYVl72AKmr8Tlh0EtngvF9BsKNR7OIlKjl
	 ajRue+xUfZ9bLdJzPMSi8KS6SJPZ8Mem6Nopt+aXiSvh9S4gRcnd3fG7ipK/BLWUFRgor
	 PH0TgMGJfVpHld9HRMn2aMrNtY9FmplkszKHFfpbKgHHO6jJS3roWlyiwl4mAANPU2rk+
	 CP5notN6F4zMrQUGcr0KOpfLZ8fUHYXWH+PD1IKg0MCT7BBui9Rer/jzEiDzoezoN0uGD
	 WJI12BPxbUn3W2eUngxLs/nA7fjg+cSPfqQLbGvIXgX0wYfQvLkFEIEi6EcWs3eco1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961401;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cIZWQbtsULLprLLxhGWPuX9KyJOYeg7GBqQrDX32JnE=;
	b=F/rWg0ceVMjxl2q94p44jBaDQpWHWahKgx+G98EMSK104R9iDqn5Tt0GtFU+K82D5ec2
	 P1bc1yBcXj0Q7j+/kHMs8JcFzRkXak2zTt+AeMYp3rR/IAw4a8zOlztdks40eJ3oKSXxo
	 +bj6WyEJ9pyG2e0smImCCYx6YwoMg6S4YxpyKOdXZdvuHh4lXlw+iThsf9maLBv3QnS3I
	 CvUafggEDRaLYT3AzDX1eYasbXe7oTOp8J6cZHueoI+U92+bjZ6ALhhYrm99A4bIh8Oba
	 8E73jKyM6YBZIx4Cs+2Vy75jQe77KpZ56TJ7p4mkDby5w8OL1ZILGMc3UoU6ARgut4Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961401;
	bh=cIZWQbtsULLprLLxhGWPuX9KyJOYeg7GBqQrDX32JnE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=POz9umOTvUDr+IIQv+EwvSeTL9YIpoTlZuB11HCZ+lud2amfAPw1VFmLOs0+f5rH5
	 iXn/pI2OzZq5SH4n46bHkPjNYSSlnZVUJ3gdQEmftDY8KKllHemtv7UQMjxb0nOkaF
	 cBoaNRrvRh4IxhpCnS0cMC+eNASfx9xzFhGQCFOg4FI5j11Guu9dICwoYVCUkY4mQX
	 E+tNpp1inxypybdKTO5BHCBgLNMtKpozu/D4o+nBI4HpBpDWiTz32nwQWJOL4H0cZA
	 eLHP3cifRy1vE6y0Y0TTFEJIJZeQEM728tpR/zpEc2rBBvtenAv1OsFB19YY4AQbeC
	 aBk7SSczlLw0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE07405F5;
	Sun, 25 Oct 2026 20:50:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A64D34
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF89A405F4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4u_TzNG02WB for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4C566405F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961393;
 b=df9rA0NuLk+hpdYS7yNUvqw07IGzhuYx23TG6dWuh50kxLnGKbjpCAHqm1Pm5X7jVuoh
 kJO2OndPewG+H7uc4Y5w6iPhWgSWwBkWtezu+ZiqXdPOC3hONgKYa9JdBwasMhIux55rP
 Oy7YAke+JzYzgVNPvpNg2QzjLAc3O3AAiTBN3GNA4P7v4WkWposAREdHQhzRanDjYBxHP
 /9gUxDPzcO0ByXoqPSJzUsLKUTwOcW4FzM3IMhiwampP5m3ZgMuXHrYYfjWIMompnK8Qb
 Pe+/spRof+Fj7FVrisjbj7HBXOil/vokviw1DQNUMwvrIOdzAjRQsbaB3WlbhbLFWvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961393;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eEWPF+XePMUTyhlAywWxUVMvuVNZY+AFuE9Iw481njg=;
 b=BuFH4qAdb6dWzTBECA2+wj1ZBf61RScZgqC1ycDNFdGUU3RRnu5mRcymrMbUQC8exp+p
 5+RKF1ePvuxvbVj1ngDCawcH52SRiqC9oZCU1MUaPRTt/bpkwynAqogdwlJz21pi+7CEc
 XGmXZfD7FMshcCbb+LHCbcGmtEbQN6ymRn6fvQgfr82EsRQaS9f5U6Ro/fC83s/rpYcdw
 HUtI+1Rgmaqbi5dXKnYIqYey/G2QuzB9qla4n1SzoN2Gdw/ixHhRgutsZEwt4DIug2kbT
 tZfIm4y527On96re2NKq1Emeh5FxCD1yWaKxeCUEG8C0mcW5438yYC1McFpY6u1GCMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C566405F5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A71AA9B9A7; Sun, 25 Oct 2026 20:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:49:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a330723fdeb170886baef9d80cdf2fbb12fae1c6
X-Git-Newrev: acaff39b3cd987f6f5f4bed6e8fb1f99b6218ca1
X-Patchwork-Hint: ignore
Message-Id: <20261025204827.A71AA9B9A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.18.58
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/acaff39b3cd987f6f5f4bed6e8fb1f99b6218ca1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/acmesystems/acqua-a5/patches/linux/linux.hash | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig        | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 67e419e2f0..fba0e6ea80 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  3712fc1ec839e4daac981176c8518912e8f452650aaedfe4381da4419613a431  linux-6.18.40.tar.xz
+sha256  069b19f9032c4dac8149ae4b6520c35debca0f42a9f6d52ee55ba6ca9b818013  linux-6.18.58.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 164132daa8..5b31f4c692 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.58"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index add3ad9f6f..ed74dd30d6 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.58"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
