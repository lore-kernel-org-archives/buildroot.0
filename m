Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CE7606A31E
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GzSBPiWm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=VimvArjE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D906063F;
	Sun, 22 Nov 2026 22:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFPAvDrrUX6F; Sun, 22 Nov 2026 22:10:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ED7256061B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385437;
	b=CCkI8sAa6EZPsQCdh0fKRoebINgwi5kwaqN2q2+qfhFTvT16j32UUPJ8SRRW0qIcwwMm
	 TB9Qsi5Ir/11utrufoVAqwkiXp60VWAn3R4SbAV1RVyjZqWMUAfBBEptKomk/ZKNF8tW+
	 EB8Puk17ig1TCFYaAezGs0yhRzgnELGD1baCIhac//VI2Koc8jwm3mfwmSL+kNSc4FzWo
	 iS+/QwJpw4oHPzImYjYFpiW74XFKyUhECXGR/caNvuLZiqrM3f+cTKt9y74Jrut6CBXS2
	 RwADT6iMNLiaaWHP67lg2Dc7Qe6pkoGid9vY5CgLSgFYlhlRzEWi4kQG3WEr14cjMQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385437;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3DSvb/HXaCGpIIesh0QORIGLIyYfYcf9cXK6bdhxHzk=;
	b=NAwyCzJaYHj2wXX8F4GbSwahJAbwN5zJbGTY2ZDRQgMDhIIH9qcl9PoavmPboORpHV7z
	 K6CEhwUD41AlGuQ5Pr1WEkcbVVTvmMRupS1MuwVcDJqVQiPvSTGWOnZm6m3dPN62wSq0l
	 Il1D+WcnnhbovBSV1dfXHbpYcQ1OQXCRI8NVZhQKFr8VmF00gGPZdajRhaL/V32vFNdgO
	 NCUE8Ychicz6QxB3aRenC/6p6JBXFe3W9nOSQ5YC54r0z7Qm6ef3AdagEhs8u/ulOK5Nl
	 ti+TDLYoh2ZPb1VvOxnc69nt2K5eQ7msYlWW/UPBXOSDAALuBsucq/64DJidnNu0gTg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=VimvArjE;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385437;
	bh=3DSvb/HXaCGpIIesh0QORIGLIyYfYcf9cXK6bdhxHzk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GzSBPiWmTe4/Sc6/5uokhVz7y7nPyzyal2r/XODzLiH+1F1FXEMQa9ZR2WU1wbpLY
	 14z0PgwGf+/GvHASzTgG1/qpJcQro1MZZM+Uw1bc+OZJqncNnQNU3heyYn5fUq8XM5
	 Wfc7Xl3XGbd5BLaHNpseWFRnhsLkbWl7XpShPydQxWcwkRHcuR3J/0zrz9Qh4GSxlj
	 Tiz2GK3HchhDV/tRLthPZFtBNrrhJNm5G/WnLlcwxqkJmrJa45geI4Dl+S7EQ4inm3
	 kNLQqgLlDekhdk5UOUWpkGQ4/ZY3GnFH2KuL7BYqjD2/SbpdX8NZgSPe44rm0LbcYo
	 v/PLxF5OOUK2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED7256061B;
	Sun, 22 Nov 2026 22:10:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 653D3371
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57AAF6061B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1AwA4GX8ISg for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:10:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C8A8F6060B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VimvArjE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8A8F6060B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385417;
 bh=topuErDpL9wx5vBYyT1a9okG4rHJwjpMeh6F34Iwn+Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VimvArjE7zNNgOpVzpqUpbtQJqpPmEMat8WGrKXYIROsK3zLiWmMVCJVXyHFhSMG3
 UC+W/Ny2BUF6ud29zw/Najc3Qqs/K29Nr2dg8YqceEnMvhEl2ZB6Z9EbH7ZncZhPwV
 oOdUEL8xT2RqVMhqUcI3R7AR5OyU2gMMNHvEwDSzpU0ACmBOd1nUW53n1nTAjuQT+M
 ltVedAMLQLHRUwq65vIkMo0c/Ae44MmuLciNOdKpOy2jDUt5rBSya+s0J+9lX/h+Ly
 fzPm2mmoHph6v3SBEfbknx/AIxNub32Gdz2A7jO1piGj7jb0rNcl/bfUn2Zv0MnbYD
 RsRCCO4fvvT5Q==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 1l85wJnmZDsL95l97LEtBOJyRP2syjfu+nOBh1BrpUO37IZr9AwEZGzrHPVbSUerXHv4blq7ah6
 NdK8Qrescut/Yz8HiNF4UOreZ5A5+NrNa4zgNdZFQirV3cAvnjFUCb/Gav9CzzjRgp59P7aNNCn
 f6aEVKo+D62Jh1Vqz90iK7UGbdmuNTKYtzLGZF+Ba/oDFb0gF0oxEHMVFXF+oIlNXuam/ZIx3et
 ywiKiCDdcJeqiZqvf8tHRyYoN+OtL6Hy7+Zk1uKZpB+sbsSIXi1OaQF0VT3jX2vU8tej5W6PBTe
 5oWooTjv2FfQMjkuTswR1eE54bQsleXqWuojMtEJoirPET5fDAz+u+2nTb1GEFIoIxMLrBHVEGt
 zE1Dzjs056ac115tuFyd3uM+lNpPEUWpbVHHceBKZGg27+tN+zY0GxoGe/4c/Tfy6viSTWXvW/L
 VTm/Gb3EipX7PLdMuntNxFHyNU+WV7Nkhn8d8oGIbXpNSOiB7Zl6YHJF6M8JxyXDVppugFUnooW
 HEb8nXjOILmoBfcWTXO8IUXmTyMl4+ZqlbcO1qSxJ9J7es7I1tLkVNZ6IwexY2DwQZwGErllVuu
 6kFREc4oiJvnXKzLhreRZuTb4A3VqmzXhcDL003TUM2z6DY=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 38C8CA4C4E56;
 Sun, 22 Nov 2026 23:10:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-0bbE;
 Sun, 22 Nov 2026 22:10:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:09:55 +0100
Message-ID: <20261122221014.3945599-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 02/20] package/boost: fixup Config.in comments
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This commit fixes two issues in a few Config.in comments from the
boost package:

- Drop C++11 or C++14 comments, as the comments are about GCC
  versions. Yes ultimately the reason for having a minimal GCC version
  requirement is due to C++11 or C++14, but we don't mention this
  anywhere else in Buildroot and simply mention the GCC version
  dependency.

- Add missing spaces around >= sign for GCC version dependencies. This
  is consistent with what the rest of Buildroot does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 35e63138ff..92a6bc4ec5 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -54,7 +54,7 @@ config BR2_PACKAGE_BOOST_CONTEXT
 	help
 	  C++11 context switching library.
 
-comment "boost-context needs a toolchain w/ C++11, gcc>=4.8"
+comment "boost-context needs a toolchain w/ gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_BOOST_CONTRACT
@@ -81,7 +81,7 @@ config BR2_PACKAGE_BOOST_COROUTINE
 	  library is a header-only library and does not need to be
 	  selected.
 
-comment "boost-coroutine needs a toolchain w/ C++11, gcc>=4.8"
+comment "boost-coroutine needs a toolchain w/ gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "boost-coroutine needs a toolchain not affected by GCC bug 64735"
@@ -120,7 +120,7 @@ config BR2_PACKAGE_BOOST_FIBER
 	help
 	  C++11 userland threads library.
 
-comment "boost-fiber needs a toolchain w/ NPTL, C++11, gcc>=4.8"
+comment "boost-fiber needs a toolchain w/ NPTL, gcc >= 4.8"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -241,7 +241,7 @@ config BR2_PACKAGE_BOOST_MATH
 	  Octonions, like quaternions, are a relative of complex
 	  numbers.
 
-comment "boost-math needs a toolchain w/ C++14, gcc>=5.0"
+comment "boost-math needs a toolchain w/ gcc >= 5.0"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_BOOST_MPI
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
