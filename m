Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C112606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dY67BCp1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AA7C81970;
	Fri, 30 Oct 2026 14:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUsK2B49XtgF; Fri, 30 Oct 2026 14:20:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 57914817B1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370044;
	b=Pcl7TD+yD4r3/g/glQJ76tbikKVD7bAXTQZxzMNLBd1i4mNzpp5GDoJriopYSQBaNtDc
	 2SoLFDxXc00TR5Ibt/6n3usH35EX31gRqlHWzurJUNkePlUonoorP1FHa/W4An5l+LIaB
	 1MkwbLVbsN/V05sbziIz6ocKVl7cARwCdLv93CM56yRUJZQGDbYLNGezWcxkkjTjM2f/q
	 70rk1Af7XwAz7bsSgQRiphNOvV+BHujgZuEx2oxtXetTU04hm6oqfwkMUnripKmSnf1g+
	 trxdAhwmSNszm+ptb70l1+G3gN2fXEki7Wd5w0Iz8Zzfupx4CCYVmBULWD90r8o8Vyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=c+Tfm0yUQLJxERX7JJPYvaaamOfnyI/f/u84u4/32gY=;
	b=SUrxj3UZJ7L0P/UVo2mLeaNGGric0WWK6IcMLpRkXlNqvHwPibG9if2AckCEU7doi4S1
	 w3GmWB9TITvR6Oz8D9QzfDLEQYNESGKlRFxSW4eHvOI5uhjPkaBQDZa3u7UmdyqUFenCv
	 6lus1p+XyIFtj+a6I7D1IuntJgBSnayURzichem3xGStNXPx1g+2115ZvbEDxQh+JyK9V
	 ilD8ZNdt3KWdU79VyZi1vJHibLBgrOgAGAjZ8r9a7VIumMG+0PRWGC3k8cTkixWMAVVJ8
	 5cDZTsjEN+eXzwj3cbLYG5VzURaQMNvZ5Xhlc2SMdrqI1k8USVsP43h2Ib09y6HLzBg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370044;
	bh=c+Tfm0yUQLJxERX7JJPYvaaamOfnyI/f/u84u4/32gY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dY67BCp1K+SKYAguNQNHqJLVlOlwNwPI6ZO2a8DKJ+wfSMFTNoVMWcvdeghMHjM5v
	 fhlntdYHE7CaWZD2P/UZTkFv9qBJ4IyijAVPhRpZe0dr3BDOdL8UNPRwYXjS56FXG4
	 w2rUZyAZOCJAaEyQIhn6/dBnM29kjya6L+j79JAuW41KYy622w975/i6nmioI83g6D
	 LUVS+Ymdmvj/NaXoZWY6L4oLVBCfN9IIDYo6V6N2QN8c+vWqV1LSK7PVhslhwXvV/a
	 N9ukoHMVoFzuO7Lu+gedxcfOSJCL3l0KRsRYPbej3UcPEnYCc8HXy05Z7NkR+oiPte
	 iBWgjTGtN7frg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57914817B1;
	Fri, 30 Oct 2026 14:20:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99527362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81896812F9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odcALmrojSMP for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 68B0F812E4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369896;
 b=XCs67hbxOT1SrNi2crYWPvRtpsiE6NqT0KscLlTOOyRUPFdUXwe1lzVjk4C4gm25OvdV
 rt37eLCD6jDWDTUfZjT4Cr0Yfb18hhTvDOVt4hbroUifdCVMCtef9HttQJB8pyz72INcu
 Cw1xomvb2R+31lwEJCK9o7KZP0M0oQ8HpODG4YGvoKSJw8ch4Txtrft9a7TufW2of6LJU
 gWNU7lKlw6Zd7ZIEQHVvOmeC+/uCRRZJuwbQG0JEtwCR36KeFrB8uXd1oYN1CT9mQGu6d
 xOjrnTdUACcHUUa12C8TFY7DovD4iWUGuh5Tpei1ZQk9l117Km1b5TGqqmQC9u0SmfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369896;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0jb3QidRuruOJhJGT6wKKkvzlosiq96rkFMRtD+rw1w=;
 b=QOdSbD5vrMcuGWmNHNJNtzQLIOP5mEebxKLS6fqfmJ0W96FsUspq7VdX6cpGuH6LsIk1
 vO5nbporD85NC6xOxRxfed51s7w8X9sep04tHvQIwtVD/0N2w7hPVzr698WrNxxPgLWXe
 jG9gCyOWfPFpVXtYe7YQV6B5yfmCECSCLOCqrvDuOEXaVubdbd6dgp5DNxXV64iwpm1J3
 znf6NLKztgJU1bUVeRzNUNUpjpuHYgCBGWy/XZMqBpHmbTKoIHh2kuQdM/DIhhGjb+ijS
 scVat41+ii3PcvN//O521P+2hUmnthmFVQMEESp9N1bv54RYgAkBCzTqoWf6Hi9vumg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68B0F812E4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86A719D38A; Fri, 30 Oct 2026 14:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:12 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 281903ea6e5b8b56958026ab01b6361fe2335ab0
X-Git-Newrev: f69f6443cf61a681aa6a056ad8a9ad27a4ca58f0
X-Patchwork-Hint: ignore
Message-Id: <20261030141648.86A719D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/mesa3d: radeonsi
 needs wchar
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3681697859348815063=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3681697859348815063==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f69f6443cf61a681aa6a056ad8a9ad27a4ca58f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_MESA3D_LLVM depends on BR2_USE_WCHAR, so does
BR2_PACKAGE_ELFUTILS.

Buildroot commit a24698054b4cf6c994c91d49513bbe5e7b270201 removed the
dependency to BR2_PACKAGE_MESA3D_LLVM from the radeonsi driver but
forgot to propagate the dependency to BR2_USE_WCHAR needed by elfutils
which still is a dependency for the radeonsi driver.

Fixes Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_ELFUTILS
  Depends on [n]: BR2_USE_WCHAR [=n] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y]
  Selected by [y]:
  - BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI [=y] && BR2_PACKAGE_MESA3D [=y] && BR2_USE_MMU [=y] && (BR2_i386 [=n] || BR2_x86_64 [=y])

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d46f1df72722855398efcb9771ae53d0a4484f99)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/mesa3d/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index f45a675445..98364563a4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -252,6 +252,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	bool "Gallium Radeon SI driver"
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_WCHAR # elfutils
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
@@ -272,6 +273,11 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 
 	  https://docs.mesa3d.org/envvars.html#envvar-AMD_DEBUG
 
+comment "gallium radeon SI driver needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	bool "Gallium vmware svga driver"
 	depends on BR2_i386 || BR2_x86_64

--===============3681697859348815063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3681697859348815063==--
