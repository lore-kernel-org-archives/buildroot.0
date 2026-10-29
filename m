Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24083606A323
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VbqPHZ30
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01746817AD;
	Fri, 30 Oct 2026 14:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCU5Ppj_ysq0; Fri, 30 Oct 2026 14:20:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 08941817A2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370040;
	b=Ig2bORG4+66Bn8yP/gKCHWBAE4MneVxE8gBpgE/s4plB8EyK6E6vfOWCdLhitxWfx+3p
	 RaKXXquz+CImGaU1rS30UWbzwXK/pzXvTeeiWI5J06JsUpbxH31HHbk+TdteyTb5XnVOH
	 CRI+8cyalKCaSAGtUA2d/AGSgLFgUosT3JV2BKjQhOlBqHL3hW3zB6bVP9ZTzVjCBcit+
	 jDmA3galK9FCJp1u7vSiZ2V3NlH+bpx2QBwA0odR3SDus9XPWdBfd2Va/QvgxdGDFgtKY
	 zvP/Jwo/B25HvBqDpBM9FkpNJxOZA1XMCgdqPA0rSeeIgOjVQvsb8mhIQf/jRQ1RsgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=0a89dNMXJ8j979/VIgujQxHknVA56bUkHK+sCPGMFYU=;
	b=QVDdw/s7rlemY5FQQFJMxe0npMeMC5Spxc/tUdFX0fH0PCOfN7h7F89E2OehF5lP3X8L
	 jHyiSC9qzpUEiNUWQMgBzeJgpxzKlnET2PblJB1VeiJlZbqnunp6ngF//ITW7owhnXqas
	 0Kzz3WR+eTZRYG/qZCd2bjUhSbg4/yhHbJqVKrYodR9YsmkW8AchpSWk9Yt9gyrBJyamv
	 S6ijHZcCK/xnCHhFIiv8JVzVxqESTUfl/yZCOyE6xzkE3SmLrk24OnxsQSYC7xqyacq8F
	 haj7dVRLsR80cwAmrbuPKJJ7OdHDMArcidcpUuFpnX3MWWs3t8tTFzD+4VIgkLKltZg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370040;
	bh=0a89dNMXJ8j979/VIgujQxHknVA56bUkHK+sCPGMFYU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VbqPHZ30WD1Nt2MIK/t/P29cqpfTc/3EcLAKATUpig0OH1qNVUboGw9mxnX6enP4r
	 Qiis+LB3d8TmOroewcHbGvlnAzOuTeFkT0fQxYElwXGt3f9Yg4pKrTx+q3qi3vnqm4
	 UqPoxZ7jFL8QG1JhKaUurgSHybOCqR1LpEZ3h9hHLdLwV1nFkrg308d4vyi/P3xz7X
	 giYDNPGlVy6Ssjzs3ZwA/v1z1tXNZBNoTiIPCTEh3mhmoEXYE9XILbPs3Mq7n3/0FO
	 79el91sdBgpLKbE/BuXkn4fbPdFwaLLo5CXaaNXDbQT+gLL3ass5YE7BM8CNLn9AQ3
	 NpFdudc3BzskQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08941817A2;
	Fri, 30 Oct 2026 14:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 851C0D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 660AD812F5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pir-C1ZyG8py for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2A335812F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=i9YUQFhGDjquMw6OcMIruj8EC6kKyeIRGLgMMv4639z6HIfoumdStoN6Ih3wcb98KlLE
 BFnwGsGJi8MNTdQzN1EKTNijyVNLquDzQw4vHCDO/DcYusm3QD4ldEEWUncKQnreaOA1W
 VfhsvA6X5/BQbTiEzaUvUhyW0NaGKALfQ6bY8bfa13mgzItZqw5h2RTNToV62TmvXKzQ3
 HzjQ9hvCTS9Yolhrxc7Sx9/rAr2jVjckNp+A0ormvZHmrUPv0ivGOnPLVdN9g4Is6BBLi
 RLEHFsQnTmOPUa86Hvgf137lkeLNCvgms+Cmf3/NizAMTYoaQmdGa5zwwU92CkjQD7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ke8K6k/yeHOg79EmLH/16unLUA/1LyEpu5gcvcXs1Qw=;
 b=nQvKSahnWzibyQzHGHWSc/HP6ckFtWlqevn1w6BW9dx5KMMOSIGO0MsFGjWu+XNIjy2y
 aUOD0cPaVf2oUXbP1PeVdTv/iIXa2gyuX+Q6R8q2+0AL3Vi4i0rfuLSC7SQ1B6tN8g/7R
 Y+TaW0ZyoiWxNYxS8OrSWFKKZaS7db2F48sxcXnnN15tXvPlLzxnIkyQCxDurhPX4tCHy
 aheav16ng22yfSmoTZB7dKqu2uJejtVl2J8nXsJljF2FY4OBwMWX0LIAdBHHdi01jz4kq
 FsQAl5ZE3AUnF8+1rwott0qaHGfndzzr72AlivHXV932sTzVpHwYb/AleeksPAqds+A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A335812F9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48AFF9D388; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 4810c499198bda0ac1189257fb6525b8d5d87e04
X-Git-Newrev: 2b3f15445f090a6c92ce055e32acc37f8a5de898
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.48AFF9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/mesa3d: crocus
 Gallium driver needs precomp-compiler
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
Content-Type: multipart/mixed; boundary="===============5162490655773822824=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5162490655773822824==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b3f15445f090a6c92ce055e32acc37f8a5de898
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit 59ed1137e9bb8c0157be3dc91a1cc462211dd3c7 bumped the
package to 26.0.0 which added upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/b72d347d1c3b9e829971fbdabf993b68776083c1
requiring the precomp-compiler for the crocus driver.

Add the necessary dependencies to fix a configure error:

../output-1/build/mesa3d-26.1.8/meson.build:945:3: ERROR:
 Feature llvm cannot be disabled: CLC requires LLVM

caused by
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L945

which checks the value in the variable with_clc.

When the precomp-compiler is not provided by host-mesa3d the meson
configure option mesa-clc does not contain 'system' causing
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L939
the variable with_clc to be filled, among others, with the content of with_driver_using_cl:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L939

which contains 'true' when the crocus driver is enabled:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L925

So we need to provide the precomp-compiler also for the crocus driver.

Fixes:
https://autobuild.buildroot.org/results/baa718e140264a9aa64c3a8f4114ca1b05f740e3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a538bf0ac93e030e8ad8106865d11559a448b655)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/mesa3d/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index feed6b68fe..e18d25eb8e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -110,10 +110,18 @@ comment "Gallium drivers"
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
 	bool "Gallium crocus driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
+	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for gen4-7 Intel GPUs.
 
+comment "crocus driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence

--===============5162490655773822824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5162490655773822824==--
