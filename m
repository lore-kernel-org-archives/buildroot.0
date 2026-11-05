Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B365606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=or37iOsQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3320181423;
	Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MX_sD4aBZMGQ; Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 378C581421
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981314;
	b=N6pqtbkZZ6npsKbCbm7jkopxJ2nyRiHVUV0chMTLjjFjOINzMud48dM9tDGrxnmIIs2H
	 Sw5SFnmm1UkRRpUYsQzuMtVqjpo+GszCZHKkDXMslN4v59iEmH6wLsF1y5i34TJNVHHsR
	 jTS1O0Ac8d6fUEguLS7w0NmoN3VONBQBl8ky6OMgvzniqm1cvloVcT7pb4xXlFaf4mvH3
	 VMZa4WqbcYVtd2BcHI76cMpO5hp/MlBwBYk7eBJIRBrahbFMTO2R8b8nwgXq0Hucn0VwI
	 gvYZolToWgTFERYCko2nU1MuJ36UGg0MSlJ2FTINY3Uz58owKtt6ZwEMeZ5lZ/n7OPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=uLZZgjYs136hD5UZiBh5ZopGWf0ZWYTG++qXqLpRmW0=;
	b=RVlZLAVu7dtTtc/LWUcoKzbLwO9xN4jQ4Nvi5OfEWmDgMYYlvCH7FtGSVZURc1uPd3Te
	 JiFNqxSXA+PnPZ2Rbvoxke4N8z2PVAcq0nElvZgCH7x8a9dPshOmAuEz3vN7B5rBplLm8
	 oohuX/6AKWsZAYF+wWJJGjTuqkTLokq9ClH48tkS2DlAZ9chctrl9lOd6GtECYFIgl8bR
	 F0FyJsQNnNDfyWJCY2lzgaMWdkPk/h/CWhqB0TneQy48TpB0YL7TJn4wMFbaGQhOkliEb
	 a/hIlCzriGS6xwITamuz0FZGgSPg9WpvXuCwnM4waRETzdmbhQdO8wdBqOv4Q481WPg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981314;
	bh=uLZZgjYs136hD5UZiBh5ZopGWf0ZWYTG++qXqLpRmW0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=or37iOsQQNbGUR4i3sMvWRd5qXWbDjKEOeH9jOnATOQNdvBLWeAHTjuk5hdAJXpYP
	 i8XRzM7xc4vlP8sghj35uXUUIIwlua1wnwwlOV0aAABoobXVWBca+hCqQBAxu4z1Pj
	 IXy/udeJ6FtA4GJhtaTh+mp6TFDnmjliG1biMVysTovgXMnJRk8RF1hxfnY+V74odn
	 QMhxOMVu0AOpctR+kNa8rWAyFiDKOnKC+9wrmzPhtjQHO8iklmKUf5CjCNvsDLOrpL
	 j8YKiCUOxyVXMotttoHsV5IE2Ccu8T6Swlmvualia9Fy6PeDyL+MLNs0cd5rSvHOU3
	 bUY2aobdN86Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 378C581421;
	Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EEF2E7AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E013F6061F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSZExu6viXVz for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3A41560890
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A41560890
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 657869E09B; Fri,  6 Nov 2026 16:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 46bb9d19dcf1112b89a32f967d52b40d38550576
X-Git-Newrev: 450c3ee6f7bd30af5cc857d8232c8ed47ba6b5da
X-Patchwork-Hint: ignore
Message-Id: <20261106160645.657869E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/drogon: needs a
 toolchain with wchar support
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
Content-Type: multipart/mixed; boundary="===============0676124597110647887=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0676124597110647887==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/450c3ee6f7bd30af5cc857d8232c8ed47ba6b5da
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 8aad652355035386e9de15f102549bed5395f022)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============0676124597110647887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0676124597110647887==--
