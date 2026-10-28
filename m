Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1C5606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gyq6z0Ib;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ARxaehyR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15CDF6072E;
	Wed, 28 Oct 2026 22:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxW1PkxGTi1z; Wed, 28 Oct 2026 22:34:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 335896071D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226899;
	b=ohKPWL2yQjOTMkzEfOPIvXTgu4sxQ+xPmI7sEwmHx4LExarfaGcs/7X9PMrNknEbfkE1
	 WuktMRXT8cOUb/Cki9Wfc91T3ej9VIBDVMMx+0lET9XyuB+HGqK/B8POPzKN/x0SwcS88
	 hqBZaFOKXBBsWTyrSFIEkmLT3iWKDa0eUmqn6sISLv56yq3lknMjiKcEsCOLWZCbqpB77
	 27ZTSNPr1ZJeUG5ORFHihi0V4j03abSmr4sx9DZpWX5GO5DDpyj9zy6TrjvjpvdkFR0jU
	 2SmksJnJz6lqKxGat4UCqx8O22r3waQL4JSbpyMQAA1DdhlOH+qVccRvR2KTZEAlGgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226899;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tw31wVszLp9vaZdLesfL4tQX4gHrqkYVuPU52Hwxcc4=;
	b=RCv0h0hhntvJgL00gN80+AYl15iuyd5mi33fK2ikmH7AqvcXkwgCIQ2lTLOkmKx2wQjM
	 i9ZLdlp3r60RlVAj9A2yRwZz9tlx0MuykKh6QdNfReTWgBGkUl0fTHDgyqkWpGVhf15Xl
	 4982RcO6vkMGgvisbAeTFS++rXgnAVa+NND3NiGTViUwYsBDAGgNeBYfdKY7hchzKdRGI
	 UGLK+Zwx8V1xPQHuixjsZJHKLTdkW9inWmX4kqrHWCM9Du+QtZXBGCMLBN62xw0SVIsuG
	 XHMtOczrM+DDIDTu9iW7zn1eNflx1Qi20EF9R7AvRfb2wNHBI3ZlbZB4gIn3ojNxQPw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226899;
	bh=Tw31wVszLp9vaZdLesfL4tQX4gHrqkYVuPU52Hwxcc4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gyq6z0IbIVX4rhSIeJWK2+9xWweyER2qf6VWqqrik0qOtNVIFB1x3vGbG4Eggj83t
	 +WX4Xpgf19vY6KKdOPT9/POY8lNmXg/XdVGvSK5ZpBTRbPwwhOs2ah/t76XILwBdH/
	 fUr+aWPiCMcmaUV3EXZrjEnlb0f7ofGg9TRq0MA5TEmShLBHpQNimpzmk2pQaVk6Lx
	 iEx5ydMis5s1S+ism2e9/6erKTc0D3Ol2hZC1a6Qvb8SSW8dN4nHgG/Gfu5CJynJbX
	 VKSA/EM/tSfj+ezCNpFv+9niOsqAmggkxm7k51jDCjChzRSGgegaMLPR9pjCUWLdQK
	 xDzY1dmOYqmWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335896071D;
	Wed, 28 Oct 2026 22:34:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 993922E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B2F081174
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id totThsN6Mn0k for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:34:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A22CF81160
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226896;
 b=L3po/vcgGUH2fgWxN66d9d5AqQbVKIucctBPrLR5+Iz7VrXUEfLzu3TKJQJ8f1bx4vh4
 IlHTYRInx28YoVVpGGnaZZCjXAofvzgqE+eyOSR7DtC5jeI2ZRuApdVHZ73/tpAH1wXbt
 G01/CSlHIONAHpm/zQBfS4IWEzaDaoxXCFKGQT/zxKKlZ9Z1GjuNw0nutHB0HKrx8HxHf
 yLeksgp5ECBJuAUskUcE+fz5BI3v92oEJ7VinXqpFc9SrVxTlG+She8gJOTyZsRaI8lVf
 XGvbXG4SrLOOwvcWYCxTSECTASlyXW0Ict55aMbUxjw8Q0HDPOYOMwgvmi5V1TH79ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226896;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dgWJrDiIZQxJh6n3dAFVh1uoX0stUG5fOV6WQwgQWnI=;
 b=OMi3brenZ50kz5aRC+tgdRM5KtCfBsiGQV4Z3tQKVh+lRA8qzDxSk3rvyyFE0LexQSwF
 InG/Lk1oMYzejncRv1p9nNJYlEGbjekzPpgw10GGaI1ej/33lqMg4rFw1Jd6ICzs4SQc6
 UoZT4ak4EkRHaAqaOCUommjJgKqL4mDaKDkAnPK6Z9yVPuR+KTjdVWCw/m5m7Ys/N3chw
 Ozvn+c9uiYjCxUuPfROzV7Xu7gj2UafKo0NugtmVNMB/DwpBrFWxBIe95sXPmCXCgyBSW
 u+klgfVeH15M46nL7iD2pH7VwdHWTVYMXweaeLY2m5THn13qR17zaf59eP3p2Yf9fTA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ARxaehyR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ARxaehyR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A22CF81160
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226602;
 bh=dgWJrDiIZQxJh6n3dAFVh1uoX0stUG5fOV6WQwgQWnI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ARxaehyRc7CfdkWY+liuyqWZ7aoqI7ET95j74LVqXhQRogPFLBtrfM7603xuYORh9
 fJt5q6W9LY1NxDAItnSAsjzOWtKmLD3umSxFoK+u2LsAp5xoU+fQ/mxCHQ87XaRZOB
 dxa1ng/vtgL5gOJgk9yJVkTxVCGAB03mv18jve33lcCGSLyPvddFvvo++1YL7c208R
 cHn6FspwV+i7lwsmQIIp33rTZCYpdS2EFCJTJyN/4PHb42pqF5pv16Zz6CIDLkmEyX
 Kgo1O1C+jEYVqnZBiktBL1VdWjlPxwSL6FDQVtBbT5onEi3jwrwKjJEGEmWKNdMCjG
 IfjoN2754rNJQ==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 z8z08WiHrUELszbi6w6+m0Un4d2Pb59I1Zn4yO5gXzFEXJxcKRgMXIPx2S55sc9y8IAeU897jd4
 ItmqlFU/3DeaJT1jBOR26i1K3SojnvxCXPrnHOmi8uou12R51Uqh5/J6gWTOd4XNoevQ0map6Ke
 8ut6cdfIDFvG+Z0q9FfhMlP/apGvUc3Nv1J10eXCm4fFa1JX4EUFA3bQHfAtA6suuNGMaj7hETD
 O6zuhrnbdwLELnpVocZZCIgurS9JSh1qMBsjL74mqfyLhbgcXnFZ/OKZTs5zKMIeYer9Qg0X2i1
 mOpCSszRPL8o4zVcrbD1ojfI5HF/ORZujU4bEurKP5Fo7jwIo1aUEk0Z44+EFQyDb8XE9N45egN
 LXWawm4AkmJC3fa6KWOQSrggsbbimBsz+bfVPqNvEqYwKHcUrfX9CC6XewOcGD2lwLjTLw0GXFd
 o3WIJQWAvdKLzi7iGryBD1CK9X1g6AEZjIpN3yPd2n6DIoIaKdphSrHfB5UtFEpEeQExHMp44jT
 bcyFs0KUxsJWjEtG4jTfVeXvUI31y2v4/YLEY8psLEzCW0H4ENBGDDOiDyqCkAIlqiHO+L6Xfv0
 7FORDA==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E8588A4C6FE7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:30:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9K-000000001i7-1CDK
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:29 +0100
Message-ID: <20261028222936.514451-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 12/18] package/kodi-pvr-zattoo: bump version to
 22.2.3-Piers
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
https://github.com/rbuehlma/pvr.zattoo/commit/3a5b4bb46b7c89f1f6c5f5a6ebf30fc0728a5671

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-zattoo/Config.in            | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-zattoo/Config.in b/package/kodi-pvr-zattoo/Config.in
index 9a6eb3fec5..7596e7e7f7 100644
--- a/package/kodi-pvr-zattoo/Config.in
+++ b/package/kodi-pvr-zattoo/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_ZATTOO
 	bool "kodi-pvr-zattoo"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_TINYXML2
 	help
 	  Kodi PVR-Addon for Zattoo
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 8b5509d947..57e847e230 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d57efceff2f451cc8864d429abed6c7d808ea5092fddf3ece3f598d4a5e26b1f  kodi-pvr-zattoo-21.0.7-Omega.tar.gz
+sha256  0fb9f133124efa1e19b38fb7748e371295ed2d74c38b1b0ba907321a927a0a60  kodi-pvr-zattoo-22.2.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 12d2d5ff09..413b783d3a 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.7-Omega
+KODI_PVR_ZATTOO_VERSION = 22.2.3-Piers
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-KODI_PVR_ZATTOO_DEPENDENCIES = kodi rapidjson tinyxml2
+KODI_PVR_ZATTOO_DEPENDENCIES = json-for-modern-cpp kodi tinyxml2
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
