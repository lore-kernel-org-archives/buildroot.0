Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7BD606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 19:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WEPdtfP8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jMww+NzQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F190280D99;
	Sun,  1 Nov 2026 19:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fO7y9BvAka0a; Sun,  1 Nov 2026 19:18:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 133EB80D9D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793560693;
	b=FVhhd/DCpFSNmHZ2WryGEPTrr695nymu2TTm4mw22ZM7Xy+l7HXN6lBC40yTSfSUCq0G
	 uKcyLz7Ag7QqwC3TH4D0+LzDlzuXnz10Rj0vBhzTn2u68gjAnfNEi0jqn95IfC1/ePF4j
	 9u5piGDsYQn2n2hd83GJ9DWm9cTyCtWH/JYQ6th00WrLzSsSxvMDt8SUac/OgD5cpjSsh
	 Glxcd3qjyq4fS+/NurUwYWayw6HJ9WAAwa7qGtpfBklSumVa7ZMp5lvuURoUoMW7sBW21
	 vD2iRqBDFHK67Fm+fGPuDMEYsYj5aTxupKWjGE+V1op/tG1LHlAsrd3CF67tG8c40bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793560693;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zZSpvQWRSIRfbVfu/1GzwkGf2A0NKfjA+R6Hztwb1pw=;
	b=GjhHWRSQd98L7t90uq4/2ceYitwhfD3faALQJEEN01txsfgPV/bpjFxv4wikpgmbxu5d
	 C36qrCDk8Woqx2OT69KpKk3/sVtUw+dw4SM26H+qNkHEUAumLVRfu7hEoCd0EKn4POx1C
	 9qB01Z17a+fAJqWDFMpGqvBj4oEpPbQ1V6aH4CY6H0YMn994Yg9xaA+/Tyy0r4aT/+Cbt
	 AoBk6vejvOb9+UoyzOezs5fbWOR+9fppjXmmq+n69/6C34U72Jq6dRpQ+zPnkIrvfJvzC
	 9O2sla9cv07w0BajIPNHfmIvy80pgWXcKbpLSWJrUq2nfESz5DGhNaPzz46pAoVDPWQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793560693;
	bh=zZSpvQWRSIRfbVfu/1GzwkGf2A0NKfjA+R6Hztwb1pw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WEPdtfP8L3d9lwAyghab1UqKv4SDFwb9CEZ/g7lwRcxgWEZItdNcVd6744tLqvJUD
	 nbblE1dfBgiUFFRhky41rPxtV01WbALrcWxOehonImIL06zuX58W1Fx5EmqANqPDoR
	 XI57cFh6FvyyR4QIPzq/UAr2NArqzNTJhfOH/6o+KWxfzAoxgv7cky0Gzo7JZi43/H
	 IXGnDzPjYAcjRjNVvLAeByF+7eSgWBEuxGscrIGX9QG3HrDBrTyNNwJVDPZlPBrY5G
	 RS0ZYXn6vnAsFvafwejdcsXV0NLwVY0mbcb8eAnFViqy9qXOsG9jmLgxCbZtsY3cGT
	 hAjG+hFhTg4Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 133EB80D9D;
	Sun,  1 Nov 2026 19:18:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC6104B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 19:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE156400A8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 19:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXvGRGOthH8e for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 19:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 87A5B4004D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793560691;
 b=NO5/hPFIv1FAfpV4dh8WwDO2DJAMqH1ib30KG/X85EVDJ/T89RV19rvjGlRbUuzsKfSD
 zIl+RFfj1wb7nCXddAKqteU+9lZDMTybg6Wa0a0NIC2v6tVFx6mWkBOBWKkEafgmXXxKu
 dhEO7fGZNdl7hAy8jhRFvccXvrg9DdbBsp1fAhr1lzd3HwOhyYzTCv2fenk1601UmWtmF
 zpPf5xMYNEMK91ifVsBxe++1UKMVafaeyOSuoF5eIZLnz9Bc4cfmndCg2E7+7bCvnZokf
 5LcVcRiAHwcDM2bItNmKab8G8PBTg4jgji4Ex2m5QhqglYTd3ar99ZYbLF27V9lMvaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793560691;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=fEtZbeJJw6iM6rI5n99sQmFKU9YrDmX5yO0FCukLWo0=;
 b=WQYVTLwBtIQyo2I7YCdh36FSJJpTC1cN17gDTWc9DIjKDKUzaVDu+rWftQSeEqUlYlPP
 oFTIYwgcDg91gZ4/IWkeFyO9z8+c1d6oBkd/OxiGoY/9F7caeMyOg9H+hu3HF6RB+1U4y
 gEJ+hE1KKwxSKf6gPAaoLJ3b5f+bK3JoV95RlXDy07/lEfaWRFXmvSnKnVS1MP9ig8wx8
 KfMuHYasU+bfMTlyLP7kzwMlxyxW/TxH+kflLnm7zAq0GQJmOEAaq9G5pcqXUoHDw2d0c
 oJydo2EIjJYVyUepQ/Le6MlDvVTOncBRPWk3/qIoCpQSEh/6Twbu7unOnFR+UgcXmtQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jMww+NzQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jMww+NzQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87A5B4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 19:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793560658;
 bh=fEtZbeJJw6iM6rI5n99sQmFKU9YrDmX5yO0FCukLWo0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jMww+NzQVtISgHvmXru1U2XoQmFB+hUgOGvDdUhTb3hSohAclS9xbQd4ENIbfTcPT
 c046NKb1zo7iIg07j3Qa8+vjyA7rLZMiyGvCsSsJZTtvT5UjtFsMnBBVTxhY6slu3x
 BvGJ2j2P6Mf7SL+jo0CmDhc2RfNosYM/Nq2jdu/qeyBP122eYdcWhgff0gkw65XWuH
 KYrJaybBetrknhO8ms0rvo+BjCrVbRjFieVpQfNibWD8VNy0it6AHoYNfeOiQvA4/F
 OTfiieb5U4eVyVWnhiX6k6s5hATmAWHDyJ0Ixtaid6za9tBGzHFnH8tLjF+Xt+jA0S
 8Q7j3VeDnuMew==
X-KAS-Sym: v3:f51bdf72230551df:mTCa8HbtN+8dJGXA6NU0yi3OXWxdzRavSEyygsnm2wRBD
 uihpmfBBGjcR0Y+S2PO5AYTE0rwDsoruGH2iF0mXF0IB8y6hb8urEFrM1Pu/YrjqveDA439cFVJ
 ZcfY7GD0+zcNVYHXaJH9nR3p1uQOK4tpAHjpsQs/bfIAAaSlUNXT/yEOZ6WyoSWW6m1tWpFr9NA
 /IjT40qp4IL1Z2oo16mSQspjop2ZpvVhnFld2Con3pcMkr9eu0aLoEC+SeKdwtftQ+ysp+JI/Vd
 Bs4AYrtSJpclB82kq8QRQi4jU3I0VcihQsPMao+L65xLjDBwbbPTau3ySRMdT0mob09K1pYw==:
 7MVKtPCBU53JUyLiRL5bP15mYzkDVe3StVqFKKyIwDKRQZoXci7/tWbRYFnW8q0B9KrQUw+FfY2
 sthvNl5Xfi7EmdI5xXp16sQmGGo6bfLcF2BRinUx0kYHNq7Yx98lqVwZp7bi0+QjwXD2pTMhtqd
 jZUBh521hkAPLsVyOLa9tGAvcMctzMOW6L9N/TZ0taMaWpZ5M+I2F3p7gjlbpTx52LTp9FJeRM9
 4IFNv0AoY+vdUmdHkEMM5NJWtVoJGMTDcSf4Bukjqt4YM8x85v2fz/Tov+rcVCBpbk1qS6g7sHX
 UjWO7WAW5tkcAad0G5BAFTUIRUnH74vup9Wo9DnqJffnRPODXtJJqqAlecXMOTB49wu+/5yOUpp
 TEvUiFCViw+9J5y4fmDRyvD2axeHfvaoU1qpDTm5qeD89tsRBF14vVIhRjIRKevRlZMpZgzx/2P
 T5d6sDjqstgNk4QireUHmiULWqsxBHm7LCDj8phwy22n2qSX4gN6cdjYBH4lcSD/KQK3uiwMrL+
 KDvMmYSn1UobN9pjc98dtZ3g6OolLSRFvZd2DtcqX88gLg3xgvjM9b0FzKu2oj4XxWysZbbEAW2
 q8MRv2tLWRTRSUcbdlv93AZ/J/cNiO0qgKrdL4HOC2Kst9uE1e9SbBIblk2G
Received: from fli4l.lan.fli4l (p54a1b5d2.dip0.t-ipconnect.de [84.161.181.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7660A4C2E82;
 Sun,  1 Nov 2026 20:17:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40192)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNb3i-000000001Un-1QlM;
 Sun, 01 Nov 2026 19:17:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sun,  1 Nov 2026 20:17:36 +0100
Message-ID: <20261101191738.2091630-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101191738.2091630-1-bernd@kuhls.net>
References: <20261101191738.2091630-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 3/4] package/ffmpeg: remove patch 0004
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit f30bd1eb69c44793485e9f013249d020e3e19fc3 added patch
0004 to "add -latomic to pkg-config files".

A patch addressing the same problem was committed to ffmpeg 5.1 several
months later:
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/2f0a214a6202516b4dda2bb22b6b3ac20e465d6d

so we can remove patch 0004.

Buildroot commit fa36a6375dbeae131c596070570cec66c7bd2456 bumped the
package from 4.4.4 to 6.1.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series until this point passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/499900ce5babc40628f021d0a39fe60c1221089f

 .checkpackageignore                           |  1 -
 ...igure-add-extralibs-to-extralibs_xxx.patch | 47 -------------------
 2 files changed, 48 deletions(-)
 delete mode 100644 package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index a8c1baacbd..cd21cce1f8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -322,7 +322,6 @@ package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch li
 package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch lib_patch.Upstream
 package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch lib_patch.Upstream
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch lib_patch.Upstream
-package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch lib_patch.Upstream
 package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch lib_patch.Upstream
 package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch lib_patch.Upstream
 package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch lib_patch.Upstream
diff --git a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
deleted file mode 100644
index 050b34fd89..0000000000
--- a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0c288853630b7b4e004774c39945d4a804afcfa8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 6 Aug 2021 09:17:20 +0200
-Subject: [PATCH] configure: add extralibs to extralibs_xxx
-
-Add extralibs to extralibs_xxx (e.g. extralibs_avformat) to allow
-applications such as motion to retrieve ffmpeg dependencies such as
--latomic through pkg-config
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not upstreamable]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[rebased for 6.0]
----
- configure | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/configure b/configure
-index 0bb3a7cf2b..3bda99e415 100755
---- a/configure
-+++ b/configure
-@@ -7986,14 +7986,14 @@
- source_path=${source_path}
- LIBPREF=${LIBPREF}
- LIBSUF=${LIBSUF}
--extralibs_avutil="$avutil_extralibs"
--extralibs_avcodec="$avcodec_extralibs"
--extralibs_avformat="$avformat_extralibs"
--extralibs_avdevice="$avdevice_extralibs"
--extralibs_avfilter="$avfilter_extralibs"
--extralibs_postproc="$postproc_extralibs"
--extralibs_swscale="$swscale_extralibs"
--extralibs_swresample="$swresample_extralibs"
-+extralibs_avutil="$avutil_extralibs $extralibs"
-+extralibs_avcodec="$avcodec_extralibs $extralibs"
-+extralibs_avformat="$avformat_extralibs $extralibs"
-+extralibs_avdevice="$avdevice_extralibs $extralibs"
-+extralibs_avfilter="$avfilter_extralibs $extralibs"
-+extralibs_postproc="$postproc_extralibs $extralibs"
-+extralibs_swscale="$swscale_extralibs $extralibs"
-+extralibs_swresample="$swresample_extralibs $extralibs"
- EOF
- 
- for lib in $LIBRARY_LIST; do
--- 
-2.30.2
-
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
