Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56CD606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Gh8CGR+o
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F61580DBB;
	Sun, 25 Oct 2026 20:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQPpV3BKJtQr; Sun, 25 Oct 2026 20:49:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B2B9B80DB1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961397;
	b=hzVMNA5eQryq0Jqun6aslu7uJ2rs5SvagQy1fuQYYw4aVupiSFWjYa/Lc2ex5niaUVPs
	 nD6UY1o5QLeVUBMpoKnJtjkCSrQIFiYErJndS2JfQvhMfWsU9TX/Sf7yHxpvkovchv2Sb
	 Ov3qlU/uYultJW+vBlv1tYQcc8Az7vyQpwHbq4n9KU7Fx8Jh3u10kimKA6W5VipUWOzM/
	 DzYAhcnQXMF3gEohsuz+C8dEYTlBde16l3NCzM83iVdgTiSiD2c2pfyk15odelyVS3SbF
	 Uh1iE1N+n2VqdEm24B4kNkhTNvX7lCx2oxQOQaEfGw2VxqUTb8ze07KTy6gyoBn3w7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961397;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gXECgTW3abCpfrhRps4x2nY9f7x6CgmLwAXl3AdEfBU=;
	b=bEIIaVqWhU6uzaXs4Mo2awnbPRsnOe1K/uMF1c997YnfaFmttJGHKIj8+Hir6CYImDST
	 a/y30jgA/8qSVUAp2IsSlM/bw9WUbfD1kyNf3FZ53VAtR9QcJGRx/5vPq6vRIyklSxLw7
	 ALtc2wyw8pgm/reO7tYKN9M/nnCLB2PYqVRlydQnHlGLmJq/DP1x1q918bvXcxPHwL8fa
	 YamZl5Sup2gls1pMfvAyt6pf4d39OkOLckAShpCKq3WIUWDlsp6+XLQ+i4ju60ApaEImH
	 2LNv/4Pi9GqzCMdbpEhFCcOCuXXQCv3Ij7Xo23jbpwL/0aUaDIK8vBfnFu5ZZkwIDdQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961397;
	bh=gXECgTW3abCpfrhRps4x2nY9f7x6CgmLwAXl3AdEfBU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gh8CGR+o4/r2LR4DwAo+1vLR/VFEOKWlgQdw5lRhexfPtgNEk0GjM2+wvk9B25CdH
	 YCNNihDQNrclZMbH9c2uz0z52xQpJfwp7KMsFuBdrKeXHcJHL6Fl6YkI3xz3N92JvC
	 re3Hw+t9tk3XfvAW6Aho7HrlBd5/rwlKplxYSyK2QDaDEAN9MGRvM6a/N+MacMG0sm
	 L2gckiFm2dwjE7hxtuMgx6Vxs9/25OvpJZ0bI7uV2N/hryd+3LQEUUKjDMDK4RfPU+
	 MHZScB0ndjDT+d7jQ6SO5gQf6sCMWlhx2lB0G/uNYTJwhE0tdus7/ogpdN/D2U7HJ4
	 PTBxqi1MBWC4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2B9B80DB1;
	Sun, 25 Oct 2026 20:49:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0A5B380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C67D580DB1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mM97QA_RS3Qx for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 33CA680C72
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961393;
 b=ZZ2UlHTgHsgEU3YWklT6IUmPDjQ07RcADrDBRRknN+MtmxbXdkuRUsp3HSi58mde7L/3
 5KxTYAnNpl6XKqG+3TePcZf/9WHZoPmoT2TldKYibW76u/bg86vRobMXzo/GhSAdqU473
 xozCK5WalBLESlT9xO6SwDnSuDWxvydwJjNqczng3ZBdOhM8ycQRhFnOu0qe74deCsnZl
 YTJ6hweem/BdnpEvBFfRi/PHJYmgdzRsVvEjS/x/1nGO1M5oaHh9MJa9nhrWIY8RB1U9v
 A3pbBxmj2iNVq4hfQQeSce3UpY2KH3imb95H+nxNTN1awkZpEK4A92Cump2o2lmgUew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961393;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=A/iQOjIt6t56AFmMyJmm4hwXlcgWudVA2Hf/nOVipCs=;
 b=if9GZpBYVobz+GeLvHsGxjqfBita3oOu2Rx8Jq1wdGkve0TjbCZERdY4prpJA9EYJmnp
 gtkBLWlSCYlNVXINL6rNCtPlBsCljrE+fxbuu/Jc2+mib565AItYICEyQsGfxIkINYBvC
 O0LwJoGOYBHuM+H7GCsYXLFn5p85ghJaesYzCDQkdFrMH84QK2/OCgW0B/vGK30RFHc5L
 V6+ugAk/La5Dm8BKIkfI0IF1lSNjowYIADWhC5No2oNFAc+4bV4mlkVoAKLxEAaaXG74s
 SeHB5c9zCMTmcOFYdOSwDN/MlSKugvkFFVzfUwwvVvIXtL+67ZWchz4MEnrM3lB6Kkg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33CA680C72
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B5AE9CE9F; Sun, 25 Oct 2026 20:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:49:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a578a247dc13a96563dcc3574b0d4604826fc87
X-Git-Newrev: a330723fdeb170886baef9d80cdf2fbb12fae1c6
X-Patchwork-Hint: ignore
Message-Id: <20261025204827.9B5AE9CE9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_acqua_a5_*: set issue
 and hostname
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a330723fdeb170886baef9d80cdf2fbb12fae1c6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Name the board type both on the welcoming banner and the hostname.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/acmesystems_acqua_a5_256mb_defconfig | 2 ++
 configs/acmesystems_acqua_a5_512mb_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 3eb805b530..164132daa8 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -6,6 +6,8 @@ BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="acqua"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Acqua A5"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 0664a268b0..add3ad9f6f 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -6,6 +6,8 @@ BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="acqua"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Acqua A5"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
