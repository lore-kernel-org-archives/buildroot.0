Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60805606A31E
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eT1k/IuM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D7BD40E97;
	Wed, 21 Oct 2026 20:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01MyZdTSwCfd; Wed, 21 Oct 2026 20:04:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 46E0F40D14
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613082;
	b=liu8ay/2VNLZLCUIQF/N9XFOv510aGJ/xo/gDtlJctwMk+gBhh1HPt5IF4+huzmVyyGy
	 rhs2v6hYEG9J42mdD0jtpf6TZyF7Eu+HQoFlEMIdAlO+NG8TUokAiqNFogszmVCFanQb8
	 AglgJFaPN9fz9U7krWx8GeYr9uvwLdifxPKsUIT2od6GGevG/ZVZdoBVas79qJmbd98iq
	 8bgW5zhXLDOcq69mLhJoIEHW0fQQXi7MuF5xk4yw3Gup1IRZtQ2LmQbbSYQA1Euf2Vxd1
	 Ei6pdAORCkEoDFbia9ged1q3/34QCyroj7BRQWOt8ga7RHBD722RPjvOV5dTG4wevIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613082;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=d1aFoyVlQE5FSbjWMlXF1w9CtVR6W51d3yuoMUfNUKE=;
	b=mMSo/P+BRClfQZrxjZncKVnQJcvMKsOL9nMXqEmlmKtuK7FcqsKXdYRHwHZnet1kdj+O
	 vusrzhdHGZfngcjFAglRthbaAVpLdixcjMau3fcdsEs0jLB3nPVjEnTNWAHnfe3QcNUdS
	 qd2vrzn3gUCCosoCl+hUCqjLNAD3g4iuNAFGT+uPQIYZ9fcDRduwg00A80t/0Q5fFUyeI
	 TKlwaq1HVTNmkIjSWeWuGPJapAVV6TpmSUM3OFLGGY3g3G95SvV8zuaiiecm7XEnBUZiN
	 cuNhk+E19t9Hgsbv3qEIGPQgO6LxU2bLoot0T/bGmhFuK7hqDAFDqC6JFVRBjcbYPwA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613082;
	bh=d1aFoyVlQE5FSbjWMlXF1w9CtVR6W51d3yuoMUfNUKE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eT1k/IuMi7pUtxNKj2mTthoUqiHHr0VIQBb1USJ8czHCux8V90EEhHfJvqBxbMwOh
	 5mJyQWVMzneuCUcYRtIUTqQf9W0OFCd4oJ7a9QLcvhPoqEa7NlS/gOkhyRHxu5+DcC
	 og4+t5L/x+uYLYO42Tp1BpFwcjXZaYB5FsTYcyFVlbDnUd1gc3y9mzTvztPARJ23KL
	 T57zBd8ea4hLUw71EB6hmAue7khhMHErRvwZibhdvY8kgqqCM84zSyUQ/VGGIjHkqH
	 O/dkIpIiMs+FdiOtBOR8Khv5kxcdq7qGoH2La6spfqoOkcvz1R7zUYB5eDHSZ7J9HV
	 98QHEC57rA9UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E0F40D14;
	Wed, 21 Oct 2026 20:04:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81D221184
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6858981854
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wK3gGIJSUGHO for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A556E80C8E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613077;
 b=TvxON1AhEOAxkgzC5wm73hA2UL0gXcXmQTwkyRQ3HFK8j2mmkHlwLG0R1gWVd3/kcOOp
 Wq/D207BzwoY6smdKqsRsldD+h6jUk9SZe0bSlUSGA7UE8b+Wnu6XVKPP3bktwGv46RaH
 43SDQsYdtMWF+SuBTn2srbDxZcR5bvroTCJ/u55aGHU+DBoWfOYkIsO01oWQe4EKRdh5r
 hbmQsgcozbzwsE4hUY8lZ22rdOgRsPk3IRpQAbAeCjLWGNqtMzdqHi69SI64ryDlAc/ok
 WGyxLri2j/mM2OaG5uf3a83kMBFOWcUe0nXcSs85VmSFuU412cmsKixDpTs4A9H8mIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Uxd6ekrrfwixAFz53GnYpCrFqDNaxI9akhoT85UAIFk=;
 b=odv1qyg1Vw+x4fUl4fSsXgyceWeAnnAjoniDegks7CTSuG+TzJ5+lCEF9MUHu8w8OY68
 1UQ/F4BBpxpcgPui6pe+1s8LlkqmCa5XgS/g9tljpKEen6wc0nda7OXhfHQjwxc8KKqcq
 KkRpj9uewZU3ItGjSUR4G5eJRPMkI9drCYLadKJNYv130Zi5Soa5+r9s384MI78kIPAHJ
 F0NyxdhfzdCEvEPafemGDzOpoj9veEpprAOo/hThCMGIzzxMpRI7JWd4ZrEhCy28OpjkN
 LK/H7HJSD49JdSCahk+sJFR7t5KfSMh4+Jz1HZH1aG+ywcYHGF/BsRUfgkhBPPoJTVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A556E80C8E
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08C0B99B20; Wed, 21 Oct 2026 20:03:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 22:04:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 436d7fae9ae3092d89e8a8485cfe1d64a290acf6
X-Git-Newrev: 93ff6ffeaa8cd470ed677a9235e54a9a4d3bb90b
X-Patchwork-Hint: ignore
Message-Id: <20261021200314.08C0B99B20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx93-evk_defconfig: switch to
 Bootlin glibc toolchain
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93ff6ffeaa8cd470ed677a9235e54a9a4d3bb90b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

As recommended since:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx93-evk_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/imx93-evk_defconfig b/configs/imx93-evk_defconfig
index 05ab4ae7af..8c85c0e7cc 100644
--- a/configs/imx93-evk_defconfig
+++ b/configs/imx93-evk_defconfig
@@ -1,7 +1,9 @@
 BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx93-evk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
