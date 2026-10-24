Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1E7606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hc56HR2l
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4F9140802;
	Sat, 24 Oct 2026 17:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUW8B0XwQ5PR; Sat, 24 Oct 2026 17:54:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A806340692
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792864456;
	b=fayusM/jSfil8Yx/NvCs4sB3YVHRS1X4qzqXSgRka0sLyb1sn2GwTzxO8UF9ljv5mvXP
	 PtWuf98M4aDL+1AfNsr20P3LknEztrz3EXyYZm8EMQ3Cz0RT6Stb9yGUpJd5iYeiDdZ9/
	 zUxLN7PVMYOj4OjyWlU+pEDCQqTTqpCZXHHHNJOxRJvc0Q8e1bAU/FD+5bY1DPbd86cHi
	 4kFLE/+smsZE+V5+F22cVA9GxPD9qAZEP/WONkI1kp2Wf3tAk4EVvJHMDtwK4Q058ggFi
	 9tfd0DLHYPC+MdasUJ/fviVjrGd0HVzmz4b44q8ZMzCqJcrnjXzkHn3/emNKwCaUZdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792864456;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=d24a1VM092r0FPQHT//MMPNUm/gJc8CTMdPWatTZrHk=;
	b=d56j/yO/VkLBg0fIJepOagHHTe+Lq1sp0N4KOYs0uRqXeUiF+3CM/OkxOlKgffTd5cA6
	 NYMm63BWd7+dhwp1icHD/4pcwgD1ql0iKebxXfKIVa/7UgST8ZnIMViad9ZkkZ5/LYLv4
	 9ogwxrMQcNCD8DfVKJ0sXEERtzcxe0tBJ6oN2Ni7C2LZBCjZz5McN1D2vlr+N547vNqj4
	 yRUos2jBin1CBN9Pq/jbV9JKSEBtjRt17AxTxQJp+521ahJBZuIZ7xc2O6evDdD3yG3aD
	 M+TLEIpl9qkvwi4TOLvM5xX54O6qTAbNFPVRpEsHE1ew/2XKgmig58EPsMezujAwWiA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792864456;
	bh=d24a1VM092r0FPQHT//MMPNUm/gJc8CTMdPWatTZrHk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hc56HR2lOlSb//g9EsQ5ZMgJt4A4NcPAkHOMDc891fS+hhV/CR2VjTKwXkJYE9gJn
	 X7ZFvjC3m+OMtJAqGqiDvUDabJaWydE71EjSrS6OChMtqmeiecNMYjUSEZNkdFdh+u
	 AXvyKUqJUmEJpr7FcJOLE3uRq5DRu29gTJUqKybKcroQZSyk7O4DvXUqWSmAD/y4Wo
	 HLlvHloJDEY5k5RCJh/7EmeP4elpRFXN1EXGYL2CsJaFYsv+OjCyRu6hxHJmGOh6Jv
	 OeyLgQgoa4Hta9kDr/a7vljShQTlG9VTVat0xLNI4sISHzJzvPortiCNTMjcursHeJ
	 3nTxI4mAcp88g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A806340692;
	Sat, 24 Oct 2026 17:54:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B8CA3D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12169406A1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Usk0sdL0qGxZ for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 17:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3119A40528
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792864453;
 b=rB5fWOjmsFhdYAq0YZ8rsSQW9qFhriy0rS8A0NHGyb/9W6vPCqfuV1sZfr6/TIwyiAR0
 Wv4x70fq8JJjn9qN2BLQwrxXkMjybuEnicG1LXkHFWulfsIZYu2MiCUdVz3oRb8zkQHUD
 iFcaULTkFImfdBA/l/am/scY/csWOq7Yts88O25td4w+DPzmWcpFTooylzoOzij9nkkan
 1s+l6CRInfbiwaVGdrP8sJFRfE6dHbKLMB/rI25xi9T9kQxpI7kmbT1tHv9CPZDF/lKOr
 wOTivBGzBeqew8coNYx+w4GHjL26leGWSBwwGHsmBC+iSr4Js74JeDyWxohWD/JfyXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792864453;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AaW+Gz/h77YIDFID3iVXOj+ZDRN1DhpFmO+89wi9Umc=;
 b=fF6YaNK66vIisuln1yDYm4VpSJm3X2Zk2d+2vrnHjhpu30PXq9n1aCuokMajU2apMc4J
 eykLqSRa6ottC7eXWBhUieo8qMUFv8gMjsWaAgNj9W8kI2vPhcORdXoWpjOBZS4ReWZIw
 swTj0BL4zzkw/9Dan4uvBh3t8zAGmY6xsVCkRU15rEgsiTaull4mDlACNZu5cFRaGxM6H
 CG886yv+t9skM9J4wQsFUu/CZz3sxJ4X/ZoHwb1PGtQpbzImu7OcT9nKA0WQvUNPXEQjd
 0ZkLp5Oz/3VhFql5V/1SB351dVrXD06K85SLvvyClLBJ+Un6AgCRcDy3Vb6EQaSrnFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3119A40528
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19F709C8B4; Sat, 24 Oct 2026 17:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 19:10:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80a5e7af62e6bb4b963173391d3547a1f879fe25
X-Git-Newrev: a538bf0ac93e030e8ad8106865d11559a448b655
X-Patchwork-Hint: ignore
Message-Id: <20261024175248.19F709C8B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: crocus Gallium driver
 needs precomp-compiler
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a538bf0ac93e030e8ad8106865d11559a448b655
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
