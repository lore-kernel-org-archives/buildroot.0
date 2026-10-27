Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9D2606A31E
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VTcq2fh/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CC24403A8;
	Tue, 27 Oct 2026 16:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GEuc4nuGu1i; Tue, 27 Oct 2026 16:15:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5E009403C0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117705;
	b=PgjlqUOwxC8gdIEJ8RDvglQWcO2gcvvFBdHzdJ7mHhmW+qS4sPbK6BmlVn76Gw9Ytan1
	 fsue14JStx1EtaWiwKFDF1S1JoqzBfx+PUCBh8dO5wpU+XhnT6NQW1+XiMUipIvNXKGQl
	 YY+ty083QsNyLVXdxkPKyy2tWLCopIg3iqUB3GR5ZIQE99WWZ5quJTsJG1DQVt6uYNTPc
	 NdngrsEFEzsvYYRobWy6kgV1lQIIlOBN8mF4lQnFmaJZ5RJNG9FHXxjDk6Lsdox0OLxOz
	 LQS+lvmyDA4ILxBuFpA8bC/tN5IH5imRba2gdm9hFiDtYGBAuslJR9/K+qetmgo684w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117705;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=akGZCAoJg4mg+3mgPfct3fQRBS+9rtxVtqx86oYSxa4=;
	b=BgidpOzPgp13HmDlkseYKW8i2bIQrPGbytEi34nJFg+qMROn0WcrQ5dFUu2XYStQ2RNs
	 EVllYzGD5LtHG7ZBaDJ/Bx3pPxy9cxkONPllHHjWrwTubpmgiY5yeQTlAvbXPu+XW98CV
	 EfsEpRJ+iZgB2JZnbKF600jUZ3NHl5UsLKWXi7QQb5SOUn5CXeyWeF4Z2bbcPNv7UHs+v
	 W/c9oriONRpHOhasp//Mis/z1jD7tO+xNv5iQzwe71ikPi9uJX+7vCqyOoo5c9x45B2S6
	 GDp0sNpr7M33jPHcvIrnzGF0yvyckDrTcFKaBUD+B8Y41tYbrCsbHEDyGbmespl7e6g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117705;
	bh=akGZCAoJg4mg+3mgPfct3fQRBS+9rtxVtqx86oYSxa4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VTcq2fh/IZEjOzU/yTqW78BnPYmdw0bEWqxgBjX7IZt9zi4B79MKFo03WqbbeSogB
	 ubj7hg7tSIiPGZwDaVJ5rfQe1bF4xK0Y1+Wk3Mic2CTaJE1l+sdZt87rMlj+MhXp4g
	 Nvp45Ny+0R6aGxe+2ElX6LiL5uYfCZy5Py5BiIDRxC6TYudaL3f8q/IIDVvtIqhHgK
	 p/Nv9y5RRlHNWB6OuDX1+M1mD6Y/zhk+4pMTpXqOgSGhwTkZFYU/iTUNnjbY3K9TBU
	 QhsIdC3VBy76HjFCgDoFI4gcp1i2K4GUmI9m54UpkGxxywoB0cIUyEHYSdwq0iITcp
	 eKpIYYxZuw6ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E009403C0;
	Tue, 27 Oct 2026 16:15:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1E68A32
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3D79403D8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wbv3qAqZw4am for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:15:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EFE71403A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117703;
 b=CnLL3OzSWHIKLKgX8YbBfEH4lE/c7cfpnvXO5Mnbv5/wnXrfhB0CVRmRDCc30zthvDEJ
 0NQ/BkwYGdslvVqsLNMwMn7riskW40zU+tmjX0LT3cA8VJKUjwyYr2uRpAe+S3IFhDxUv
 r6hv7BU1Mglsl7h93ArksBSKfDs/QzL9LfJCJbEgjpNUoSNrBlWSodPOsTLwJuh5wYhmr
 1acImNnNTjAX9laRa5iW4FcYFy64gQR1PFPl6UBYjX8Wb956bN03Drkqv8i/9YMMfwGEK
 xC0gWuik7flDRUHKeFAnxJcYv159IKV35talno2AxSnavagWBUv7fNHf7TcRTkDW+Cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117703;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RtL0+Qvn24fXRr0IQ663DaI6ipHO9ifDA458irPGL6Y=;
 b=qU9QKImLcpOx/M4ShZLZxFdLvQzrPPbDjM9jICBjeSXfkIqHrLVyrINHj6L6s7x3ie+8
 bj+72zrMPUeKY+HVucS/60ZcwCzm8Rv8rM0uN3RRBv0UuLrbdRIruAh71KtlIsvYuKeB6
 Izy+KIGY1awVfGE4tCxUvNRH6lxVBg7ltzRovS9uhpvky6exSG342Ag2ja80Y+iGsMwqE
 meHp6VBYFwub9i+vkmKfFJeK9Ez5dO1hEW2fNA8jr5SbU3/Kx/e+kRb7P1dW0rRHG93Cu
 fpVUA5PppqgJXB8R0c5UfQOV4u2LCZ9Ex0Qp0j0xUbMRFzrBN7M/ZwkNMSmEbT/17cA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFE71403A8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63A7F9D0F8; Tue, 27 Oct 2026 16:13:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:13:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a0fc179a01d18189bc64fdbf57b170709f600cb
X-Git-Newrev: 8aad652355035386e9de15f102549bed5395f022
X-Patchwork-Hint: ignore
Message-Id: <20261027161336.63A7F9D0F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drogon: needs a toolchain with
 wchar support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8aad652355035386e9de15f102549bed5395f022
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The trantor library bundled in drogon uses std::codecvt_utf8<wchar_t>
to convert strings between UTF-8 and std::wstring. Toolchains without
wide character support, such as uClibc without WCHAR, have a libstdc++
that lacks it, so any executable linked against trantor fails to link,
starting with the drogon examples.

ld: ../trantor/libtrantor.so.1.5.29: undefined reference to `std::codecvt_utf8<wchar_t, 1114111ul, (std::codecvt_mode)0>::codecvt_utf8(unsigned int)'

These conversions are part of the public API of trantor and drogon, so
they cannot be disabled. Add a dependency on BR2_USE_WCHAR, together
with the matching comment.

This issue has been present since the package was added, so it also
affects the 2026.08.x branch.

Fixes:
https://autobuild.buildroot.org/results/6b893fea68e25fd928daabff5cf034de76062ac1

Fixes: d38b4915e9437c5492836914c0a0fff12b4f1031 ("package/drogon: new package")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/drogon/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/drogon/Config.in b/package/drogon/Config.in
index ce8a8313bd..c5e20c2017 100644
--- a/package/drogon/Config.in
+++ b/package/drogon/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DROGON
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++17/20
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # std::codecvt_utf8<wchar_t>
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -45,8 +46,8 @@ config BR2_PACKAGE_DROGON_YAML_CONFIG
 
 endif
 
-comment "drogon needs a toolchain w/ C++, threads, gcc >= 11"
+comment "drogon needs a toolchain w/ C++, threads, wchar, gcc >= 11"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
