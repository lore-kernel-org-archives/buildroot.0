Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B79D60A6791
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZCbP/uQI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BaValxJ3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67ECC6080B;
	Wed,  4 Nov 2026 21:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxhFwbybiwBQ; Wed,  4 Nov 2026 21:09:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6DF526078E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826555;
	b=tMPO/2VXp1yDdmxCGH/D56YQa0/TXZtN87EPBgrXFziZu35h5Ucl8L/ekoo+dabvLZXE
	 EuBX1y9EqkxsXo9oRgpBsGb9QFlSHU48zAOrEcHAyJaD7b87aWHKuLB/1hdhmV8U87Bit
	 ql9hE1OvaYfuZUGZjI10IpyEN9/GtgiTeuX0EDYWWIi2/YYF5hJ5KebOToa6Wyjoa9FzU
	 tb7DME/n3oOGf4rwExbtwyfj/EsDga2uvcY394UaXdr0KhE9CLPDa9D9JTzq7Ts3Wac63
	 +TNvMaCw00pa4l1e1VWrtXImv4NyzRttv19tPz4KVmhgfky9Dsx3yD/lWtyqxojb70A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826555;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=MV4o1Sv/fyCni7AOa2Ztf5VMNAgC70zR+OgpxZ+/rII=;
	b=MoBEJPiKmqsoa+g+DJxZvlXBkvG21CGsUuXcytetI2+mQ7x34Nu2J65gMRrXHYkRZsc5
	 vO9pfNecQ8ONRElApTXWPFNFdhJU/hYb876PxWyD7OkHAocG8+W+iPQ8VYJW72LcZ+aMr
	 Wr9/DVakrs8m8U07HtFJyvOeZA2lXqDwFv1Bigi50r9j9ZmQp0txJUSKfRvv0iE33GUDw
	 9iu35SAzHDOYcQaaq08zGSgQkPFP3Y2d+0FjJqtOTgSb7yBTpjAEzsTFXwWWv1DI3VlHp
	 kDolu5LwjSES4vocAg79GtZXuUTYU+jmNSK5nRz1G7VkU0VH28W7cmmHjkHpc2YuBRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826555;
	bh=MV4o1Sv/fyCni7AOa2Ztf5VMNAgC70zR+OgpxZ+/rII=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZCbP/uQIBDIt5pTqlKr//VMdnzx+pvHdXCQnIpQapI4PSSo70h0YUOQTCX9Fz01dq
	 VPMVdDRS9clxJQUxK7Xrs3NBK3rWZor7xdd2riUOSTwh/g0jpW3q22MwG9TT0ecHV8
	 ldQx6Sr/q5jZdOr6WpnU+Aor8SRZ+ePAnv6eM6NT9drM5He0ueKR/fkFnMDzlcZieg
	 cP7lqMXGF2iTyrRdN1uPZPGkmaV443z6dhtOnnqa8478pcHb0gLEbG1hYLjLybCs0D
	 cOqfE11uIE33l2VyurFdz9aizxaH8X6ZYLM2mN+6VIY+tFobS5c0kpVqbCuT8kehZB
	 dajY9/I3taSqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DF526078E;
	Wed,  4 Nov 2026 21:09:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88C34AFC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AE0E4013C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCwd32OJc3rd for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:09:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 662B94008E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=BaValxJ3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 662B94008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:09:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so8561835e9.2
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793826550; x=1794431350; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FVLLrk2sMIp5O259o+A0Zee//T46pBjdAPXyqV8OSWg=;
 b=BaValxJ3e0WTjNEwaN+OgNv9m3ocsm8SLwsCgF6tnupxNZaVPvA+IIuCengWQjjTDY
 w7e9FCsdRGya6wzYZK2/pMWO6/+DRqbZHBpjmWue6Wx65jkDu/kgborrqQm1zsAxM7qc
 7MO63DZtni8XI8disNox1vMbYREXUkqu9p96HOmzCIoH+e41NyJNOhJV4/yS7kORLXmL
 aXInd2v8RUk8yNb0rDaRkYbUlTOgL/eJbSrneGq7wp4v8H5Vxg3TTwvivCujE/VlYZ1U
 ut48YzuDXlv3NeUw9lTz97/ifqvV6gBo97KGiry2OOK7KZ6eEcI8Q4PI0BW3wc30xHop
 nInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793826550; x=1794431350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FVLLrk2sMIp5O259o+A0Zee//T46pBjdAPXyqV8OSWg=;
 b=we5r9p9Xa+ysKG/1ygv4lp4JWIvIRRIhi0bMsSx3fdJqny092Y3j2MUZzrYSumBuc/
 0MRNyDsI+4waOAK1YShIGb/Oa1dAl7kanERiAn4btrB+ogcwxY2Zbvvl3d/IUaGjEOgK
 Y45uB05SRkw4z9/gYCIp6qXzyMTNmjawDPIYeUhHobqCcpsOX5UoGDhXlUFuB7y5OwJB
 lSawebJoK3iomh/AV2MwVP/V83/ceFoWp2jOUXO47JbmV9bVW92UjJRkK0mKpmJUmrYO
 hllGvmzJu5UZAtfe8UavjkqlWt8pwY+XYK0AUJ1yLIL9qGO1tQk4E9FwocezLAsXmGLS
 Li0Q==
X-Gm-Message-State: APuU4Z9MQRQs+NoPChOoB0ozyyqxPPOZyAPw1nznCvQ+vvbCL+ORFl5h
 znS5URy2ITX4M5Q2FZK6edrTNoDjmQ0HremPGiATKNh8In48qK6T1KIy+atdsA==
X-Gm-Gg: AYBFou0bbbhfvjyKua52HPe81fwFnCUVgi8dqyNnDLXmwrlkduCZHUjRF8X5QKzaIDu
 2sN2xExoe7Ep465rxDcmWlzb9X6kj0CZnVl2ihcLOgGrEyRGBo0hke1GYXrPqQPKdN3UW7AW+IY
 FZaGtJ3gHeJ4JtXW+U+i5t6OL6UACUbK//WAXSoTol30VcJhsYSV+ibDYKAX2OUcy3vmOTHaUHW
 r2ll7GeL2L0xNSlDRO/CFTMGw2SXJPdcooN9s3bbwH7IX3Ng730JYU7OU4zZRQlbP3dn9a4JziW
 +XeTO1ojXw9JdJQlfRFd26Ya0KxFpSiLSTGHJPM9GvZyaQnSOZ1cK8oSvgF81zAF7njhHO553zh
 i5TCnciSLnllucnDA9+ezg8R8fWBzFA1HjQqaUC0xedbISi7JJ8O4iINzcsswfAEfz9blKYSo4F
 qeKOIKXICiVr9vwoNRIUg6e1esqEP1ksgua6t1zf7TqJRwUNgt4OP0xpzD1kLpHlAKPLQtsk+gB
 DJWJekzBwNWvsR8m7oDLTuHFDaZ4vHPtFJ0Ax3UEy2ZiUsOa4QF2pRsrykjRA4Mb6ylwuOmbkoS
 4GKypOM6/lKywTgxae9e+G3doCCkxUiWA9Hmma4QWNMvi+Hh2BTCornWOe6H8sKlg+PL4nUG7Ok
 =
X-Received: by 2002:a05:600c:4585:b0:4a7:8fe8:130c with SMTP id
 5b1f17b1804b1-4ac1889d5a1mr375414755e9.28.1793826549608; 
 Wed, 04 Nov 2026 13:09:09 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b412e48fd8sm72139735e9.1.2026.11.04.13.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:09:09 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:09:07 +0100
Message-Id: <20261104210907.3544694-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102085501.2118632-1-angelo.compagnucci@gmail.com>
References: <20261102085501.2118632-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/qt6/qt6coap: new package
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qt CoAP implements the client side of the Constrained Application
Protocol (CoAP), already available for Qt5 as qt5coap.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - bump to version 6.11.3, following the qt6 bump
  - drop the DEVELOPERS entry, already covered by package/qt6/

 package/qt6/Config.in            |  1 +
 package/qt6/qt6coap/Config.in    | 10 +++++++++
 package/qt6/qt6coap/qt6coap.hash |  9 ++++++++
 package/qt6/qt6coap/qt6coap.mk   | 35 ++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/qt6/qt6coap/Config.in
 create mode 100644 package/qt6/qt6coap/qt6coap.hash
 create mode 100644 package/qt6/qt6coap/qt6coap.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index d6ee9f3ea3..f3a540e9f8 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6charts/Config.in"
+source "package/qt6/qt6coap/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6graphs/Config.in"
diff --git a/package/qt6/qt6coap/Config.in b/package/qt6/qt6coap/Config.in
new file mode 100644
index 0000000000..81ab7e9ab5
--- /dev/null
+++ b/package/qt6/qt6coap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT6COAP
+	bool "qt6coap"
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6coap module.
+
+	  https://doc.qt.io/qt-6/qtcoap-index.html
diff --git a/package/qt6/qt6coap/qt6coap.hash b/package/qt6/qt6coap/qt6coap.hash
new file mode 100644
index 0000000000..edbd2bc7b7
--- /dev/null
+++ b/package/qt6/qt6coap/qt6coap.hash
@@ -0,0 +1,9 @@
+# Locally computed
+sha256  909e9820b08c77ae5a1d68f1325914f931ea3e25e9c6855493925b1ecd8d4fd5  qt6coap-6.11.3-git4.tar.gz
+
+# Hashes for license files
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6coap/qt6coap.mk b/package/qt6/qt6coap/qt6coap.mk
new file mode 100644
index 0000000000..af565ed5fa
--- /dev/null
+++ b/package/qt6/qt6coap/qt6coap.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# qt6coap
+#
+################################################################################
+
+QT6COAP_VERSION = $(QT6_VERSION)
+QT6COAP_SITE = $(QT6_GIT)/qt/qtcoap.git
+
+QT6COAP_INSTALL_STAGING = YES
+
+QT6COAP_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6COAP_CMAKE_BACKEND = ninja
+
+QT6COAP_LICENSE = \
+	BSD-3-Clause (examples), \
+	GFDL-1.3-invariants-only (docs), \
+	GPL-3.0
+
+QT6COAP_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-3.0-only.txt
+
+QT6COAP_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6COAP_DEPENDENCIES = \
+	qt6base
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
