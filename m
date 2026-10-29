Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C338606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ef8IPw3N
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14EB7607AC;
	Fri, 30 Oct 2026 14:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ab1sB6Zs7AXh; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E1F0860AEA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369159;
	b=Rj9HGhmDQmL1EJXopqaRCgUZ3iY+HpNnxri0Wds7R5Z5LXauxmC+hlfn7efDr429JOvm
	 tWtKuwCzkZjgHvUIOvERoq7IzaXUvJAt3jEqwaH/O1eQBKBp04dheW9OLcnFNPMJYo6iJ
	 jdN1iOFYH1YY6iiBj0yxM2Vm+W6hgXC7e0uqJiOSy868xgxGEsdZGCI0MVTLTMhReh7yq
	 HN7mWxbhgndWpPqd6mNWx54YyFXo+otAOdZXIeTsCPS4wu74psOb3Eia/kTAccPNHS2ml
	 1EXGEteTOkflGIhfA25IgBgrFgOglUn+LrP8SFJRHToOnHdWympIPg9bQRSxJZSrWcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EWGBi9MjaMP1EJhCXAsiPEm39Ihv4/s5sQZc5Yih5pA=;
	b=qnSZ48rVgAkL0fLitBmkZHTOyn6CcBXHZdKJUmYHlkPBdFOAulnnzfv5NwfW8OktQNDy
	 +OEvODehnHaGK9pK/ECtEFKTFKc4Zl26XupzwksXVJYAMuQrQINH94y4vAGj1OfLMjb/c
	 CoYs2J4f67/7exCE/0efRSisAD+lxFsNSLVxmPhaIHHRvfiFfh6CbWIHxoDmnVr1bH7zW
	 MnR3JSkLiCtkcZthmyZkITatZ6TFI6lWO4V+HaB3OzYGZ/I0XZwRZoc1VO+sxCwrLtI2n
	 n1UviXE/Yal+lrNHgeQfSSiAz+3QPiXgJS0KsbZm4cADKkMxVS1Myv5fgVLasuVCVPw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369159;
	bh=EWGBi9MjaMP1EJhCXAsiPEm39Ihv4/s5sQZc5Yih5pA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ef8IPw3Nnen9b64ancOWryx3QmhHGutdhqhPZJhdFkBNXBg0roPexiaRlMtcjxQS2
	 ak9uyXcuy0xTJoPsPtb2Z9I/vcCqAn75eriNMGLN0UYZ5Vw59JQ0cJ6VTk+Sk5ZKJf
	 KatShDur7AEPaPEibg40cforQRzVDSebBG2ZKqN9B0C052VHPN44YOatl5ES3XEGMh
	 ZTl4ub8ol8oJpK8+rB3QUn+aEf94sf3YNOx5DegZErHw/1nd0tLTwA80u8sP8vhVK1
	 3Vza8UQ3hQOy3T0G7OpqsEjRNk+3eVN+MUT7XN/fSoGqXeFViCez3Nw42ykQkNWgLB
	 9oLR5+Qqp3dWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F0860AEA;
	Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB044D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD2508116F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_rwQRY5HD_n for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A33A081185
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369155;
 b=tWp/gacJmyFxS1qiJrfeJJWk2CPKMvn5CULIiDzNVmh4zj/XHcmdD0/2Pjldp2LK3vRu
 99pdZAOFngM6e3UH40JWQwfC5AFMcbu3OtA15F2xjJLm0JaVJWs8t0YVaJvL0cPAckaVj
 RcGmjsPrFUlIUSYsVq3+iOjB8fKoiOHDUHJwFyWgp4UfMBfiLg8bI5A7+o5vQgHed5WN9
 NNG96NeGpxeke5KU+281j6G6hvjWbgEcNw6Zd4rGusPdMdv5hZ49RfTweCR5VauywF7se
 kQBiBFGYpmQn6qpO+uXaww9pKHO8l27u4u4cFuqAfShtGfJCZwUmFW0h+8Rp5sIIBmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369155;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YZgr3yBrBtam5CUOeyYz79sYfnJ7535NpvSJBtPJ02w=;
 b=PrHBi8RQmSGk35SgdOphkUE76bsXcZKK3yUzgx4ZH8Kfik66lFr97N0Jo+uj6uQoszWH
 czLyO4uZXIh9hAVkYbsACRgpdY4gXC4dlQjzrXsFMZnibRLjlPXTdEeB5fb3a0TPkOMj7
 H6CwKvO7QWk//FemZRvFkD4yQsOvB54HXaK+UTJYQVS2gHWBJeGOb4Am+v7Xo2/3xeVH+
 clrhcgdBylpaoCjMZVvDVSXbtsEAUYHa+OQlSZ1cCbtOn1qW3hd/9aaEITTBjIz5HTg2s
 1ujEiNAqLl3mgtwHPqhQaDRHe/+iBYYEBBu9pfak2PKVvT4g2q6oP3Vkv5NViDIv2jw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A33A081185
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 974F19D389; Fri, 30 Oct 2026 14:04:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 11:24:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9331eb7b5b3f62435b25704fddf5745577152992
X-Git-Newrev: 678f7b47d9a10e51013152d17454189291568485
X-Patchwork-Hint: ignore
Message-Id: <20261030140427.974F19D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 configs/acmesystems_acqua_a5_*: bump to Linux 6.12.114
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/678f7b47d9a10e51013152d17454189291568485
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/acmesystems/acqua-a5/patches/linux/linux.hash | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig        | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 6ce8a07bdc..205c68a00a 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a62b6a2d207ff72510e5f47156b7078e1e71797357412411b8e4fff97fc8f4c7  linux-6.12.98.tar.xz
+sha256  7a8589912bd7a8adb07fed074283652cf482a35facef8954554654f0154b4af3  linux-6.12.114.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 71a559df96..683b7744be 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.98"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.114"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 32d7692ce4..7fc8083a9c 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.98"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.114"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
