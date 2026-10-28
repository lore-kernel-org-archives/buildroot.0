Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10CA606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TTn4of1N;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=oEDYviXC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBFEB60725;
	Wed, 28 Oct 2026 22:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTscD8iH1Oib; Wed, 28 Oct 2026 22:31:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F3AD260709
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226663;
	b=QXz3XrYLGlnUDMK2y4rav6BXbh/FzqzAOp5DCYkzFULZYmUj2Twm6lTQ1y1111J6hifr
	 UIrsbUmEGFimPYRVMfRPC+iQ4/wqrYy9dbHmgc3krxi3Wi95VU9na6f8GWWj9BOyCOexA
	 LmVacBsJ2fUBPoayoEhXTNSa9SghAzM+lVfR7SBxMyyp13WXnXRZLbFsBT62KwewEbbjQ
	 ay4fWD+rWexI6k+hcz+ZqlGahZ5yHhdhhRQUuHpYllbY/yV3NRxYmzYKDvy8nnbIt7YN7
	 BH7RzPbst0zA/4fZbog/KBwZXkPAueejubcZoXARTOr6qFt24L6OPRsDkitT9KKVTTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226663;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RTlECLW31fqCmlUg12gMs/9LwmdZBIpRx7f4Arui+3E=;
	b=VcWPOnxSO7otdebxjP0PIrHTO7TCocA/Yc2wHJpiJHaBzes1RPvkWKlP5rh998TlUxwc
	 buJbf4xLW3CViuJcATQmB/VWWqEqifj0lAZ2L2VHfjacD5Auq/0Ge0Rfn2i1E+GuB3sBr
	 0GXBzsjff42V7752I/XvIFbPglAt7trr02j9muLg9JsCHkQK7Od15oBfvHUqKV5O4jHxP
	 lJVzske41oVe00ANqBR4EcMT2RK1P/pNecMkIWkTSEv9OcwVQtB9QoNdtAq73HSwVkfu2
	 weCX8jg8uKWZuk/f1QkGa66IMMT3vMBF68PO3v7s7BLbHXEGYtAhdTwP0+eXFghMwDg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226663;
	bh=RTlECLW31fqCmlUg12gMs/9LwmdZBIpRx7f4Arui+3E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TTn4of1NotvzaEvUTTNHzVb1aOxY6w0hC18SSAClLjP0y1+VnKY8r6zJSX63qWbr7
	 uQXN7ppoTHGJmxDMCw56V0PEwXWsSOpXW2O+VxVpk+pPzAx+QyDB/1q3DcW5tm+ftT
	 7D5hL3QjTliWPwYVM+Z5eiMwYz8iDmyqgfCHrXsNRILiaX6pXCu8y7rqHD52f3WsBy
	 M6HAY/6DYfEjcIfXgoEXapoXDqIcEtVF271cKYWY0nJgvlegtYGdXDvQFpXPja4ZY0
	 mZVr53kH5nN2hD80xVXZ6cTu97JHgqf59PoKDspeEi7KzmCzHzjOWg+ilho7D1Ecqs
	 R9wDwPLSlNYfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3AD260709;
	Wed, 28 Oct 2026 22:31:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56BE02E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4833640786
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N59sTs-FzKJa for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:31:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 53ED540743
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226660;
 b=dRC9mVN1fNY2nu8kEXq+GcDmHAt6nr1q+x6zrvNJNV8dDcna8Vlw64kVyqvb1eqJEKxE
 40DyJ8IX+cKgIJ7StmqZ12gU9GWaqlzru7gMpVX7jI9087yr24JhjwtisDFH8q/22THXM
 a4nlr/uZMjE6fzTSyQcALwx8cJYB5dmieEUaIWCmIvmfpseomciA39TSBQP1uw6G8f0yj
 hqoLkYVhp2Luu/JTb0Nh3mtbgdepDVznPjrHH9ZuqpBIU0iVpAjLIHJv/VumYmAv5cg10
 8Si4lCP9O6OOCfu8WLwnLDOhxJJ8nMp5txppPjwiG2QUXN4zSc8ZbILJh+YG8pPRLuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226660;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Vkd4nDKd3sF5RhskMQPoJjbwcBjABnbO/ITv9cx8Bu8=;
 b=UsIGnscLZmrUwr7Vf8B9bDO80qdZsKAVKw8rmfwxnZCDN18E02FNmmU6Xp2w3heL85FM
 lMyZTvp6DQnXz/LcAn62mTHvsT6T/dzne0HHi0yjv3FUkUa+dGsPzw9hQUWarRF9N2Pna
 MPkhL/yh0Ns7HA3lcGdirwGRKyNNjfn4KfI/1lqjbK9v43EZCGyZ1PaOlF5H8HFG/ffbV
 DWQopX13mmiEWdPBb/W3w/RgvVtos158NFDZzRWFkRgWY25Ehtm42AOT8swg+Fp/8t7WW
 f4QlaBvCb5KiOi0NhaRZnYST2Pu7tnUesbf5hOin4/5R5ozBAuGdHhP3NZLBqpk6Bzg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oEDYviXC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=oEDYviXC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53ED540743
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226543;
 bh=Vkd4nDKd3sF5RhskMQPoJjbwcBjABnbO/ITv9cx8Bu8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=oEDYviXCu0HyAMaxLbdHIeg/+wT+8tmvW17THt+Re4IKBGm0X5odjBTDYpHnOJ+ta
 u8iLtk4J3O8BI7pdP4zknE4hPVOF//vPV/E0EUbqKnGe8nuipnbOe9C4oskZEokO3N
 9CXSkXK2BFjjCyq8CxcoUevHiHY9qtZvGLgmYjIxp9mV8Yw56DLkn7KPYbgFiDlxwQ
 7sonIOclLErbCvJg/yyA4KR/LH45wa0DrYz6aSH0SCrRSjfGv/LZfbgES3xh+yhCpG
 W1bxLpblPXCF/k105k2St+tHHKSoq/6tIs6lF/tW12VgPmcHDUb1bOqL1IJEU3GbJw
 jQ87bK3gIVm7w==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 Vc0FfVQg7fWRqA+e4jaAn28UGSYxAtzKYfU4wP+NQ9HkjcSc1eiDwpjmnu8h+4znvNurXDkNO8x
 ztkW5pvDaEpCl8ERIgvSjo8Eu1x8hZ38nj7K2kRb19Kk7Skhvc0YsHQIxxp72e4VDMjIR/kzbEC
 /uc0WKS+0uK9pZhOJIbliE/dMslseD84dg3EQSdUa7Oc2a8CVWrWd6LA7bjCfTHD9tUZXr4jlem
 R+UYfUckqx8OEHoU2yuLl85XAEjKC6CmIeC6nXY51IuViwzkks0Ljp0pDluC71mb1L0H0GCjXBv
 3nU6VKhj719jPvYs8wZYfbooeo/unqTOSY2mPFpdWWQC1qI15t/V1e9UOaeqqKTiqPhPktsI2zj
 XqqqVdurKONk9WQiYa5KRaxqPeqnK6cvNhxPViXjSunqJ6PYmzOsgMNROQfrKuBXi52ntVLYfz4
 t0tfbIWSiuDkHrEOMTm9tuINf6f24YNaELYK/fAMug/CW3PSP5ZyeRWQxSWX2TOepP7ujdkUHUM
 4bfLtUMLCs89fV4VP8DaKsTzZVfiSxVHxiiCRyIpjyPjN/IiSrAH0SjsuImgTIPMb0YwtNv1tKz
 pzh3CA==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4B95FA4C6FD4
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC89-000000001Tt-0w8H
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:12 +0100
Message-ID: <20261028222822.490779-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 11/20] package/kodi-pvr-waipu: bump version to
 22.10.2-Piers
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replaced dependency rapidjson with nlohmann-json:
https://github.com/flubshi/pvr.waipu/commit/5d74289b7501625ab2d9098ac16af0f66b8b4b98

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/Config.in           | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-waipu/Config.in b/package/kodi-pvr-waipu/Config.in
index ee0cc2bdad..855e4ddc5f 100644
--- a/package/kodi-pvr-waipu/Config.in
+++ b/package/kodi-pvr-waipu/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_WAIPU
 	bool "kodi-pvr-waipu"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	help
 	  Waipu.tv PVR Plugin for Kodi
 
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 96cfeb940b..08a15e9f84 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80e4723a228b27447fe6e83c9e2aa4e9ebfc0d2a3618fbe0491b6d2440124b64  kodi-pvr-waipu-21.12.6-Omega.tar.gz
+sha256  dad83d50c2cc4584139a1e3b6def77c23ef800f69e5b4ccff70c54376e14476a  kodi-pvr-waipu-22.10.2-Piers.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 177c1236b1..5f86322f65 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.12.6-Omega
+KODI_PVR_WAIPU_VERSION = 22.10.2-Piers
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-KODI_PVR_WAIPU_DEPENDENCIES = kodi rapidjson
+KODI_PVR_WAIPU_DEPENDENCIES = json-for-modern-cpp kodi
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
