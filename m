Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B6DC79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 18:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4B4940B65;
	Fri,  4 Sep 2026 18:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17iDA4Z-QWNF; Fri,  4 Sep 2026 18:43:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0F5E040B6C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788547426;
	b=Yu9LHJRVAjgA7AQ8exBiSTCi8TQN9TmrddUNy3926m+0SKIEkMB30ZMoAwD0Tk2tHpxI
	 1qAoGg9IifKaX5HTDi1Tsu1jLouMvjt/nIA2IrUWmSw2XWqKXHe352/aFoCbkjMMLa6H6
	 E8Guhggn3EK2gbQKChTHNalIuNU7RpGE0+Ad4X7NzwfdDBCy0UwYJ90aeLymYLidLcdts
	 fMVVUv3sHOlO0Zsi5wgT4AovadFrF802hjr41E1M94x9aBCb7wGUMkFlI3F9xFCbzgzlt
	 cZCMONqpCi1ryVkX4ZAEySaPwb8nG4exufD17jCl4zUR83YhxZrcxRmDdzUkkKCV1Mg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788547426;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=aDDov4YlM6qAjmx+LGsCEZGWUFOD2wGDJilQYGJBLE8=;
	b=WfRoIWAouIPjJiTJThpxGJWZBfR4CSaqMpsO4aLnVdNDvn8HLf+g2rWDjjO03faKloa3
	 Le7UkS7AvEsd7wgAmK40kJgjlr7WvHyzExDrvwNtL0sfINeRrRcgyEj0Sn4uRcGQ7BvQe
	 ckX+l9uF/23kvNUb+LIpyVe2KtXrr1inDrUXJ2iELkrvyexFcPx8QlW5hOHv7zXhbiatQ
	 tQSI2dOGoRvc4fVKq+VDH8PJhA5PAOGgzQTJxylORUOtlJj9OU/Ym518wOjRzAnuvkhEe
	 qWD+1+hiwscrtjBUSMX1pB4DTrPs/sKpz41BaOCMxqnNnyesop5aQUekrbXfhaUqjhg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788547426;
	bh=aDDov4YlM6qAjmx+LGsCEZGWUFOD2wGDJilQYGJBLE8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GejWl6nuMUYv3EYLjBQUw9byTOtkZTHveRH7WC3zfyIuXwa6uenos6Fi5q9083K6L
	 QL9MeukTjrMT+B7ERsw911JseX9hABEXnRyLOdtAEt2BAlxT1lwzxxs/ylD93wqIgH
	 sMSADrP6A8TzPLwrjCi4OpjpZQMofXUKtHDrZv69efx+N80WKLDPlY7BagRB1tIK6y
	 gwUjt+UE7XW/KcRCLbNd//1ve7fkm4filtk2VJ96snPtPNm+VFgFoy5bNB7IeCQE3o
	 M9rG2jDvY7ZzqjNK/WQVOK8KkAI0o4BIPP/wo/bdxf/l9rgk4dT6Wd4MnPGJwWlFFQ
	 2eTahDdpqPzPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F5E040B6C;
	Fri,  4 Sep 2026 18:43:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54CF93DA
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46E0760B89
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HF42u19APCyV for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 18:43:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2ECB9605EC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788547424;
 b=nFVptN6fYic0OKClrVEX1WuudWbAVsKwnCImQ0pkbH/RMeRXx7SSQo87He/6GjeTH5XZ
 rgE7jiIjBjFx+QRtqTRsUryuv27lAmZ+mrSkiO/SmQA/3qnpl+HAEaHTwfLk3ZYUgEkFN
 XaG1Ct9FIB+w2ld9llPczhhjgfBkon4jAeQCHRhCaSbSM5HSUXc/h0ajukU14FLPh4QtY
 D8mRFQUEkzEHBrIFsiyQUhVo/Eqf/EkjZrc/evj5Cb4NWjF9w1kzEDco0rfnWY2bxT5ue
 L1Lt0m/4s31Pf/KtN6ym2KfCk2J8XFKwNL++CS2M/7hWCQ/Q4WbNd4Nuv2t0mr7R88w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788547424;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=KCYng2MRv2iWONsxZ8ejMw1YGCjKhonxCuQGchf0Un8=;
 b=hvsamw1FaZrF78e/nBCgq1ASjZc38ucymqqau3GB2FS9b5O4IHePiPyJJoBNQeBV2w82
 T74DjtStTjG4IESHd19H2PQp255bEAl1mTrduOXm3d5zeS08OD/06w+59Ext31M+HczPx
 yi0Zevq1ffQLnPPYMc3JTCNOz/9gLq2HW94URGF5gfAT5FxIxjfBxacYW7MeaMchQo7A9
 L9QLqM72ONFPBVFtMrZywEMvGJtilocAJ/VydZrtLGJqVgdxFa5bRgJHx/o6LsmlSvQBa
 1USFpGeZ4kFg+1glEO80IZ2pTlkI5LE30n1wlaXdWOBh3JjPGxauYZ/5RQ+4JKKG30w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QuOqMCBY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QuOqMCBY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ECB9605EC
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788547422;
 bh=KCYng2MRv2iWONsxZ8ejMw1YGCjKhonxCuQGchf0Un8=;
 h=From:To:Cc:Subject:Date:From;
 b=QuOqMCBYG5eoGshFb0FF8P2/nneE2gncGJA26cs09LEmpVt/cx+tXqNTuVZk8qUFQ
 /hJ3vCxxLEdnCDls8AYd51vJhbpqXrd3Jatns71tBlt1tcTZvelY+pW2U+5WHXiTHb
 Xd+2bLmaeEFxOlSi/K5Fsl4S53ZoCCzRrQp0vSzfjxirbmvDB3XDMlEYeFeWqpqWOG
 l5MI+RUyOUgOv4FxdKba+LIpd0M3Q3PljFM7GUREcxzWH+Y5HrnO74a1E+M58St6zy
 vhM8bFVqnMOwkJWeoPT1qxz3ekLVwBQ/MMcomPkMXpnVYh4pB7mo/MWCUW62yGDI5I
 yvuVtUD4jIDKQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 09F16A4C1FC3;
 Fri,  4 Sep 2026 20:43:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43370)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2Yt3-000000005GK-3FvC;
 Fri, 04 Sep 2026 18:43:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  4 Sep 2026 20:43:41 +0200
Message-ID: <20260904184341.876117-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 1/1] package/llama-cpp: bump version to b10702
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/ggml-org/llama.cpp/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/f197e71e9df73fe6ca5f420b03782d909e9c518c

 package/llama-cpp/llama-cpp.hash | 2 +-
 package/llama-cpp/llama-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
index 3967bc2fbc..87e2ec3a80 100644
--- a/package/llama-cpp/llama-cpp.hash
+++ b/package/llama-cpp/llama-cpp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4f9fdf018339783722936d537573d40cca596262e42714f597b1c93299113cea  b8117.tar.gz
+sha256  ff9ba2d1d7435f44c259361fbde6ea7bcb74e2d2581ad89e9fa4d7625f703cd7  b10702.tar.gz
 # License
 sha256  94f29bbed6a22c35b992c5c6ebf0e7c92f13b836b90f36f461c9cf2f0f1d010d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
index a368d9d6b7..8044ca05b9 100644
--- a/package/llama-cpp/llama-cpp.mk
+++ b/package/llama-cpp/llama-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLAMA_CPP_VERSION = b8117
+LLAMA_CPP_VERSION = b10702
 LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz
 LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
 LLAMA_CPP_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
