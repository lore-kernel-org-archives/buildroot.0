Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B0E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fsHrYsM0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 050B98168C;
	Fri, 23 Oct 2026 12:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWCojIXae4IO; Fri, 23 Oct 2026 12:32:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AEDE7816E3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758759;
	b=lrjwClqD5MnxK/TWwXeYWUrvCXJKGfCfPIascxa1C5176uQgW7uAXjqf1V5nb9b2g8hZ
	 yzk1lKMcyoVQn06YzJU2UvzwZHQrw00tQ4YKa/UVfMKoT+OX0qfdLcEqNspLoSlUvpiZq
	 zX7j5pM0w7TCcOttpV3WAENFFHkeIUXhZ/mrFbxW8yHv9kHwadCFlHYLNaNuUIS7glTSG
	 oLLJUrU4OeNqXjRaZ0I4HZsqz81qpxtA7z3g8ZqXqXoGzgEpmYnKFwlgDVPbpfTdkN0BC
	 ZYB7IooJ3X1YTDVSzUnq5P9XcDF056+LVDuvwsYQbWHT9bxzkwwvZD5uCpXG+RJx5gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758759;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rFtPOPXEs4KhNPOEnUyOLTV8owzLUeYh7Kk1ilZJXYk=;
	b=sfOgdgLVNq7yBCqrAuQBBX/aNfumwoAOoZaEUwdlw+pIB0o1y0CftTOVB9i09DXOtXfl
	 xfgMDSemChZDRdu8Li4e+pZdtl51TLHOF8Rgz3wRakNf1jkIp2MxZQ91Rr9wvC4Vh9K53
	 Ln3l/1Lgt3ELsj684he2USJ16sybfenM4zqbD/oDMtuZXuYiaUlLu/Pw7MlTjIAKkdJ97
	 qy+iOZtydln/HUEWX/JN3/cDo9NsVvpSPePoajy07nzowNtMEukpVy7J4FpPQea+76OZr
	 jCoEcZE24CqVY6t+6HqoegGnHbeXnlCQbuxqqaLgVzOUIuBesQZ9hB6Jie9nAnHDfHA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758759;
	bh=rFtPOPXEs4KhNPOEnUyOLTV8owzLUeYh7Kk1ilZJXYk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fsHrYsM07UzhY/4sEIpmXS/FCT2XOEsY03VgGWFQ2mT/F9rPEC52zeNCDVdYoNHnR
	 xotDQGAlmxz1bXNpeWqLJfoY7a6mOa7W9wYZ0qPL8/j/5KtcJ75lBLjlVd+TCwOSgT
	 VK07PcMSwmARKKfF63YoZSBwILR2OZB0FErbK0o05dwRx54bm0rMJ3tvNDKIVpGXS1
	 9ntzOnoQGEuOW/HHa7AOorVR93p3BlsYiLPzoirI4NXQ5ZQiDXRXQGoWOsZgJ/6HhV
	 wxqI+YQESDLAZwxTd1ZxNAZOQUvPWtLStyuXE2LbVA6Xw5BPBzIjpvbvCV53PMQvyn
	 Fy+jSz2YRz37Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEDE7816E3;
	Fri, 23 Oct 2026 12:32:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 366A949D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2876A6068A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7qJjsZ6wG7x for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 63C4A6067E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758727;
 b=qlzKZsK1siVBnIwz95iaPMFRUUwPiDM4pYuJ0oXaTQ9GwIIgPVRld49ujZtd0aKE/1Pc
 V05F/NPs6dCs1/cSV85HPt9bOfW55pK3lj1sz/Qli5Kqy/HKZci/NLq5xMCgx1L9uP93Q
 hKOAEWfGEmDP/mHcYbLcYLYipu8fBSn4xv1KLq+78wrJAAZSjAiynS4ph4CZd+m9KZPZs
 0xYW6X2vcATVrx+bqxuHPjhQo08MYPPlCSzFPteh8iv43g50ZkYKtjzpwZf/Cv3AmJ0fp
 lfR5nyvMHwEpt9NRngDFNT6VC1HSeOq0dm24bN2vIG9tEkemFnUAs0fDqUMMV/U91Gw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758727;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BDGoYJqnA4HmjlU2QMyfRG+wQnIMaZdRUnBzLzm51N4=;
 b=DHzXSoHmdL8qjpr7UF+f/R+Md9VjbCiIzsunFVHWtB2XlKJM+cH2MBL942J2O1GkagX8
 N9ZJpU6SF8qrU8wO1jAlSg2ixHONzQGABH4rBn45/SKQ6gKggpSH9iDBPhdhx9BhoLfdw
 mMWiL58kd6K5mI0477FErbV2oVnrko7osSHhydITi/FdxpXwsUisgGpygBR6YqxVn9JeQ
 kLoAyVYYikYbvLHywIuwWp3fPNJoDxt2M0bIVYFo4QZoftaHneEQb/Qt3vZGRtsy79gl/
 tQ9Su7c3hfm1YcSYaHVdpFM50Rt065RsNJ0PuPUTgyGRjm6PGfL9nthAv5roIRrBRRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63C4A6067E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7E679C669; Fri, 23 Oct 2026 12:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:27 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 479e9eae324a163042aea2c93a6aada8aef62540
X-Git-Newrev: aa7f2143977774187382a04db36bf81e5ed71d49
X-Patchwork-Hint: ignore
Message-Id: <20261023123042.A7E679C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 configs/lafrite_defconfig: switch to Bootlin glibc toolchain
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
Content-Type: multipart/mixed; boundary="===============2793972580914062511=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2793972580914062511==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa7f2143977774187382a04db36bf81e5ed71d49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

As recommended since:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 437e7be84309782f322526a636526caa962ca784)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 configs/lafrite_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
index 5f70706fa0..2454d2b7ff 100644
--- a/configs/lafrite_defconfig
+++ b/configs/lafrite_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/librecomputer/lafrite/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

--===============2793972580914062511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2793972580914062511==--
