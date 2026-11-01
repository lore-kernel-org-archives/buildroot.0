Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712AA606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X78us8YU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=nElVdpUS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B1D180F39;
	Sun,  1 Nov 2026 10:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RrOwy_sn_Sb; Sun,  1 Nov 2026 10:46:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F0A3F80F40
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793529982;
	b=K56/OTIxAitKAepe28bvUpqK1W6JmjC2U15/yacwYPX1moY6CLD4y6qHyevPt1BxNgrS
	 83iqTdQFuheNIp5NGXjqFBSTnEOUi1D3mab/daVVr5YVt21EpEz9YqPOi0KHlMnyoMr/f
	 da2/T3lvqu03M34CQCOoWQkUSVgoBs34Iscd7FCxvEQySUq+UuqlyiwMqVplq7aZmqoLc
	 R9ExhVCJXGlNofJZ7cxySSQJ2gQJ/dx1m7Qb6Pf/fptvbPQx05S5Ihi0ZV17hdMd53JIg
	 1bgqILqYxFkY4/cV568cRcxrQugNwXVHB+59cru4GQFwfO6AyxPrBj9sMASnWJqGOIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793529982;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jDRoYYdxjahOUHjHmXGEzPhzrbYq8ggNJkLWShCxfXc=;
	b=cC1dAKFw2kmknDa+H7LBVdgEvnr5qFczNDmTJehrjf/1283oVRVDZYqfocrS5TvCrluo
	 EbI3PLPQP+mlfrTcuz5aZV8ZbVVweqcPKh3d9qP+dkqLvT47MZdAD8ZiqjMcpWpuMbVgh
	 2iZpJF9TxG8Oq1MRmwakFNfp4v3reW+HMjXRilzqoG+OT7N3ldSXuN0u1pxJoELDgTgk+
	 sOIYb1LNTaeWp/yPqSaxMBRX9ZiIajegR0vlq9kT9SuuoTjgmg89FhI/tnjz4veLggkhi
	 ngruLOFnUlKQHqp2Xie+nKEXukS0t/DBsb49dMOp3QCBmzCRotEFDctMBQlO8p+cKMw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793529982;
	bh=jDRoYYdxjahOUHjHmXGEzPhzrbYq8ggNJkLWShCxfXc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X78us8YUvoIyWZzu6Ji0hN7jCZl1NdmNf90N1HNR+WZA3Epqs1wu31o2IRUbp+HwU
	 sqrYi7ionloJoLfNVyFfAt0D1/jZRkFFUFZuR4nAsSlfCqIjxjYDQBxyFUxKaKDqAo
	 04rB17rjYWGa0CZ1Zi/aRqMsAbJHoX1wqQ3yZEu5GHu3/R5eKbXviJlQ8eN6/uHBuH
	 /EXwrWNUXq98qnTvS1wiQd8AfMRmZ4zBiQDDd+m8IAqNFYav5/txDjJ91qHIPJ5CFj
	 aLL862uGa6B7CiP4+nHjPTM0DDzf6YwkO5xNHQEDb3knzlJCR90/kCwYwyvkUFOvBh
	 Y+282ULKgD9Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A3F80F40;
	Sun,  1 Nov 2026 10:46:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6DF94BC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BC22405CB
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNMtrVTfInGd for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 10:46:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 320FF4048A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793529979;
 b=GipeK7HQsrY2ee2M34//U2ZakYWD6Cn7hu48qTWsAxznKxIzpWGbjinGJnJPS2kZrQ6u
 BucITSRcDQhaApfybsntqUkw/0FqR2tFaAzKRT+TK6LbcjpNEJYstcvNOqXODbzX2rW+q
 dRkEiawZlHsaCtSqZYZGRxN7v/YAUOXFW4cgl35+MB5NEVFgrHZDxmJ4DPQsYJZrhJ71M
 ucxQMNPnW0z/NzAz0gFFLvqeOModNFQ3YbHY8O5GhqqwDd1hvISHwGQXc9GabGvAIddfx
 +nIcQVOGXqe6+9eemYps3zk7m9LmF8hs4s/C9P0XkxGl41EErPYSIUooHINhbo5H2YA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793529979;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ipMJjbtcXS22dYoIusteY89sns2M+6N7H6j+L8apgPk=;
 b=jtP/LPubKL/2EMuWFay8U2jyU1Ea3h78rH4HwCvn9rQxrJbTghlK9OyDQjlJCNQLFcIY
 D+Msx04xz3FtjHCUKjiKBlDaBQPGffLjtKnZtnbtawpM4IzklYL2vdLLs3All/qbJsXhM
 LlyEXzUkNocpAoHnbbRIldqAhfNFhJs50SFunOok24rrOiiR30XkkP2ycM1Rp3ZpUv6iI
 bsHgNhraJJIo7PAAFMwutYC31yAuXxCKvBCIMGVKsmcr7VocOb/qUa/bAXKr62qt1Some
 8IPqgMFesMklvNQ2kfK848615v1RslDlaXRCyALev/5INQdYIrE6I3mvFc96umCBNxQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nElVdpUS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nElVdpUS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 320FF4048A
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793529937;
 bh=ipMJjbtcXS22dYoIusteY89sns2M+6N7H6j+L8apgPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nElVdpUSJwAi3Y9oo7AU0EdXlCTBi4OY3vJaWjIKaxgHycsBdkIrwIttCH8jeZIVO
 owg2Mxi6g8Veogb8kyHnPCQcCKib8hz6Y2EkjsrolSToK7l+5jg8NYZgwaK185elhL
 alMt5ih9Um+zuCgWwvibdRhs30vQ4Tppxtio4CPv+zNi6xn3JOKjQiqlY02cWJdnzZ
 20rmTFPaQhE38HmzGptX3qtW2SZkB5uJ/yTF9ttd1/RZpI/nU8tspUpodYpgb/o7JD
 L4jf8i0KK632Jtvc43nZuC8F8VEi9yRHLOTlBn+d1pgeqxfBDma9vsiF6JeeTZZMR8
 jhq/1waTTQ3Xg==
X-KAS-Sym: v3:f51bdf72230551df:ucr7yDXRooWdslSDRqcvcYDSgJhetnl3KDrZuVM6Kywq4
 vP2bL/whU08maPRhLd+FSCef9vnSZC35lHpFL2dy21u4T2gVVboWp98rCs80jHag6st+EioXS7x
 fp1tdFDXbDtnJ8UXvra5BJnUbhuXqz+tTX11gLYv3vjqRDHfVO4gddIYzgUm5doC+RyhT4S553c
 gX7leJ6pvw5lR1uI23sElMEqtBgPRpmIqDE3uej1DHjNW/WV+lJfjXj1EqVcMS5k4/qyOz8UK3z
 idTcP8d8stTEAOnneIvM6kNfsA3Jvuz1xX9hDulWnvZzK+fxs2O8TfNboe1TVIItYWk7tWDA==:
 jHig4497yOoMkaeLWOQ1Wy/sCvmpnEmoZK7LaQnL1apiVBRSCrfr+gEcHlw6TrBb+FSrmFTo+Fu
 RT6O6cxqspqrWHoj7E+Csx5r/HCDFUNRtwBNl4VG5CEUGpBNHmnsZ7jrH10pvw/iGMegmOngSXO
 w3nPZCC97XLBSk0W909ZXBL3gmbjcvl/22UVOTKsQXeS5PQftlG+FsjLp2ENysTK0DqS2gzNCfw
 e1aNJwKiMQuRYB+vqetXWPdyZLEBNAzqs6pmk8kv4gMPjkL9WWyLUBnJhoGAid2rIZUd9fVHXdt
 BVRhB3ZUXFDNSntx2I/c+3ydeVy81Te1NEICXpfy07fJeyNcm699JiPAY9biti+EjLg0rm4E6vg
 eISe85gmDrGyKNdeQFPeb2a0ZkPAQ/gmEJ2TAgIOoygYh5e7Gw2PaqecQS+13ZoJAbXWxBnzEog
 ueRygMOW8irmyV57O19qATAAcDOZRyHUj7tXDn55eX3SsJfTKN/RU1FnibXcjEgxDaAhlMeblZk
 RGzfl7tL9ZffP2xjVtKJHKt55dxwWvTvqh/pIUGc8pUKMfEmKVDWmG3XWiKLi5myAdf/pZTquCa
 xzQYMN50OIcRzUpLD5qeklw/JiioAVCi4NZcydRsmqH49/ZWzrnVNyNgSVJ/Xm2zNKoDGsB34sU
 kHwOGT4v1YuNOZ2MMSDGwUd1Jhw==
Received: from fli4l.lan.fli4l (p54a1b880.dip0.t-ipconnect.de [84.161.184.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BAEBEA4C0D18;
 Sun,  1 Nov 2026 11:45:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47698)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNT4D-000000004Gs-22Bj;
 Sun, 01 Nov 2026 10:45:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun,  1 Nov 2026 11:45:32 +0100
Message-ID: <20261101104535.1696412-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101104535.1696412-1-bernd@kuhls.net>
References: <20261101104535.1696412-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 4/6] package/libcamera-apps: bump version to
 1.14.0
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

This bump adds compatibility with ffmpeg 8.x while support for older
versions of ffmpeg was removed upstream:
https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65

Switched to tarball provided by upstream.

Rebased patch 0001.
Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 ...ecks-for-disable_rpi_features-option.patch |  9 ++--
 ...ore-Switch-libcamera-string-controls.patch | 46 ------------------
 ...ncoder-libav-Updates-for-ffmpeg-v7.1.patch | 48 -------------------
 ...oder-libav-fix-build-with-ffmpeg-7.0.patch | 37 --------------
 package/libcamera-apps/libcamera-apps.hash    |  3 +-
 package/libcamera-apps/libcamera-apps.mk      |  5 +-
 6 files changed, 10 insertions(+), 138 deletions(-)
 delete mode 100644 package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
 delete mode 100644 package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch
 delete mode 100644 package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch

diff --git a/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch b/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch
index 1aba972d13..6c0469b249 100644
--- a/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch
+++ b/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch
@@ -20,8 +20,9 @@ Fixes:
   673 |                         controls_.set(controls::rpi::ScalerCrops, libcamera::Span<const Rectangle>(crops.data(), crops.size()));
       |                                                 ^~~
 
-Upstream: https://github.com/raspberrypi/rpicam-apps/pull/827
+Upstream: https://github.com/raspberrypi/rpicam-apps/pull/827 (rejected)
 
+[Bernd: rebased for 1.14.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  core/rpicam_app.cpp | 2 ++
@@ -31,7 +32,7 @@ diff --git a/core/rpicam_app.cpp b/core/rpicam_app.cpp
 index bed69c0..1db784f 100644
 --- a/core/rpicam_app.cpp
 +++ b/core/rpicam_app.cpp
-@@ -637,6 +637,7 @@ void RPiCamApp::StartCamera()
+@@ -640,6 +640,7 @@ void RPiCamApp::StartCamera()
  	// This makes all the Request objects that we shall need.
  	makeRequests();
  
@@ -39,9 +40,9 @@ index bed69c0..1db784f 100644
  	// Build a list of initial controls that we must set in the camera before starting it.
  	// We don't overwrite anything the application may have set before calling us.
  	if (!controls_.get(controls::ScalerCrop) && !controls_.get(controls::rpi::ScalerCrops))
-@@ -672,6 +673,7 @@ void RPiCamApp::StartCamera()
+@@ -675,6 +676,7 @@ void RPiCamApp::StartCamera()
  		else
- 			controls_.set(controls::rpi::ScalerCrops, libcamera::Span<const Rectangle>(crops.data(), crops.size()));
+ 			controls_.set(controls::rpi::ScalerCrops, std::span<const Rectangle>(crops.data(), crops.size()));
  	}
 +#endif
  
diff --git a/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch b/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
deleted file mode 100644
index fcebffe3da..0000000000
--- a/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f3011b5fae183a463630b4168626dfefe9b4c74e Mon Sep 17 00:00:00 2001
-From: Naushir Patuck <naush@raspberrypi.com>
-Date: Thu, 16 Oct 2025 14:45:33 +0100
-Subject: [PATCH] core: Switch libcamera string controls to use
- std::string_view
-
-This is a change to the libcamera API, switch to std::string_view from
-std::string.
-
-Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
-
-Upstream: https://github.com/raspberrypi/rpicam-apps/commit/f3011b5fae183a463630b4168626dfefe9b4c74e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- core/options.cpp    | 2 +-
- core/rpicam_app.cpp | 3 +--
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/core/options.cpp b/core/options.cpp
-index cf704c2a..d3296548 100644
---- a/core/options.cpp
-+++ b/core/options.cpp
-@@ -418,7 +418,7 @@ bool OptsInternal::Parse(boost::program_options::variables_map &vm, RPiCamApp *a
- 	std::vector<std::shared_ptr<libcamera::Camera>> cameras = app->GetCameras();
- 	if (camera < cameras.size())
- 	{
--		const std::string cam_id = *cameras[camera]->properties().get(libcamera::properties::Model);
-+		const std::string_view cam_id = *cameras[camera]->properties().get(libcamera::properties::Model);
- 
- 		if (cam_id.find("imx708") != std::string::npos)
- 		{
-diff --git a/core/rpicam_app.cpp b/core/rpicam_app.cpp
-index 9e5a2d0c..0f0b5ffa 100644
---- a/core/rpicam_app.cpp
-+++ b/core/rpicam_app.cpp
-@@ -128,8 +128,7 @@ std::string const &RPiCamApp::CameraId() const
- 
- std::string RPiCamApp::CameraModel() const
- {
--	auto model = camera_->properties().get(properties::Model);
--	return model ? *model : camera_->id();
-+	return std::string(camera_->properties().get(properties::Model).value_or(camera_->id()));
- }
- 
- void RPiCamApp::OpenCamera()
diff --git a/package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch b/package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch
deleted file mode 100644
index 3b92ac3592..0000000000
--- a/package/libcamera-apps/0003-encoder-libav-Updates-for-ffmpeg-v7.1.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d67bc17a420b6c3519d4cfa24b4b4e5c7293165b Mon Sep 17 00:00:00 2001
-From: Naushir Patuck <naush@raspberrypi.com>
-Date: Wed, 8 Oct 2025 10:51:46 +0100
-Subject: [PATCH] encoder: libav: Updates for ffmpeg v7.1
-
-Fix some API breakages change for ffmpeg v7.1 packaged with Trixie.
-
-Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
-
-Upstream: https://github.com/raspberrypi/rpicam-apps/commit/d67bc17a420b6c3519d4cfa24b4b4e5c7293165b
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- encoder/libav_encoder.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/encoder/libav_encoder.cpp b/encoder/libav_encoder.cpp
-index 10c00e0..ba8b9fe 100644
---- a/encoder/libav_encoder.cpp
-+++ b/encoder/libav_encoder.cpp
-@@ -337,13 +337,13 @@ void LibAvEncoder::initAudioOutCodec(VideoOptions const *options, StreamInfo con
- #if LIBAVCODEC_VERSION_MAJOR < 61
- 	codec_ctx_[AudioOut]->sample_fmt = codec->sample_fmts[0];
- #else
--	enum AVSampleFormat **sample_fmts = nullptr;
-+	const enum AVSampleFormat *sample_fmts = nullptr;
- 	avcodec_get_supported_config(codec_ctx_[AudioOut], codec, AV_CODEC_CONFIG_SAMPLE_FORMAT, 0,
- 								 (const void **)&sample_fmts, nullptr);
- 	if (!sample_fmts)
- 		throw std::runtime_error("libav: no supported sample formats for audio codec");
- 	else
--		codec_ctx_[AudioOut]->sample_fmt = (*sample_fmts)[0];
-+		codec_ctx_[AudioOut]->sample_fmt = sample_fmts[0];
- #endif
- 
- 	codec_ctx_[AudioOut]->bit_rate = options->Get().audio_bitrate.bps();
-@@ -652,7 +652,7 @@ void LibAvEncoder::audioThread()
- 	uint32_t out_channels = codec_ctx_[AudioOut]->ch_layout.nb_channels;
- #endif
- 
--	SwrContext *conv;
-+	SwrContext *conv = nullptr;
- 	AVAudioFifo *fifo;
- 
- #if LIBAVUTIL_VERSION_MAJOR < 57
--- 
-2.47.3
-
diff --git a/package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch b/package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch
deleted file mode 100644
index ae525b77d2..0000000000
--- a/package/libcamera-apps/0004-encoder-libav-fix-build-with-ffmpeg-7.0.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1a4860f36cffe167965351b7a59be46d7a7ae5ec Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 10 Oct 2026 23:58:02 +0200
-Subject: [PATCH] encoder: libav: fix build with ffmpeg 7.0
-
-Adjust the version check according to ffmpeg docs:
-
-https://code.ffmpeg.org/FFmpeg/FFmpeg/src/tag/n9.0.2/doc/APIchanges#L446
-"2024-09-08 - 3305767560a - lavc 61.13.100 - avcodec.h
-  Add avcodec_get_supported_config() and enum AVCodecConfig; deprecate
-  AVCodec.pix_fmts, AVCodec.sample_fmts, AVCodec.supported_framerates,
-  AVCodec.supported_samplerates and AVCodec.ch_layouts."
-
-Upstream: not applicable, support for older ffmpeg versions was removed:
-https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- encoder/libav_encoder.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/encoder/libav_encoder.cpp b/encoder/libav_encoder.cpp
-index 31f5e55..8e24e7d 100644
---- a/encoder/libav_encoder.cpp
-+++ b/encoder/libav_encoder.cpp
-@@ -321,7 +321,7 @@ void LibAvEncoder::initAudioOutCodec(VideoOptions const *options, StreamInfo con
- 
- 	codec_ctx_[AudioOut]->sample_rate = options->Get().audio_samplerate ? options->Get().audio_samplerate
- 																  : stream_[AudioIn]->codecpar->sample_rate;
--#if LIBAVCODEC_VERSION_MAJOR < 61
-+#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(61, 13, 100))
- 	codec_ctx_[AudioOut]->sample_fmt = codec->sample_fmts[0];
- #else
- 	const enum AVSampleFormat *sample_fmts = nullptr;
--- 
-2.47.3
-
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index b11ea7fe67..615d033b1d 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,4 @@
+# From https://github.com/raspberrypi/rpicam-apps/releases/tag/v1.14.0
+sha256  f0c2315515faa47be2eec4492f5ffe9409f1993b66f3b9bc79c2fc653155611d  rpicam-apps_1.14.0.orig.tar.xz
 # Locally computed
-sha256  b5535933ebc398616fd1b261fa9e3755dfb419e10ee7866078a8a8d99f54a59a  libcamera-apps-v1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index df7be41496..af30ea2158 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = v1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a
-LIBCAMERA_APPS_SITE = $(call github,raspberrypi,rpicam-apps,$(LIBCAMERA_APPS_VERSION))
+LIBCAMERA_APPS_VERSION = 1.14.0
+LIBCAMERA_APPS_SITE = https://github.com/raspberrypi/rpicam-apps/releases/download/v$(LIBCAMERA_APPS_VERSION)
+LIBCAMERA_APPS_SOURCE =  rpicam-apps_$(LIBCAMERA_APPS_VERSION).orig.tar.xz
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
 LIBCAMERA_APPS_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
