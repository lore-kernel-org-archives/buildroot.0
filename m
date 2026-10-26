Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97AC606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eP3pmRpw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=NH0QVRQ/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79A6460649;
	Mon, 26 Oct 2026 07:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mF6YQYvzuaB; Mon, 26 Oct 2026 07:55:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 86CFD6063A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793001319;
	b=h/5TvuwhLOdfihWVZSlZwVnIpBP1Z3OA1p4aH4AJExWc0Cm26iZDrstDmoNJTeVmMfj+
	 5nB6ml0vivHU7vudRKizq+kz5alLlNgRJcTJwMQAnmYDhyIHz5QqFfOUzlwAfE4bVgaDP
	 0leDjaNaOMcZgoRPyDh2gO29KrUP58cEgULNwxrXzhEfsVd5kEwrPcTgjrJ1Teu0CakvA
	 QJIPiu715SxHISp6UCYZ8YEX9k7LkGrj6SY+iQh2K2SUZwOgfEx5I4RSdoaaEEUu+O0d8
	 FFUX35rkLfd7g0EjidG3HDIbLxNwo3Bj+JjIv8DwN5jU422PU/yfwl4BtO5LeQZpW9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793001319;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U3+YC+hFTiDpBA8B/dY6Dj0buEI3eS/u+hj7OV4nb/U=;
	b=Ojbqtzf/aNne4R8az/E0tA/q97Au3/k0dzgJeTkWO76XmZp7qlO7zGwS7F6TWmQ20NTD
	 4Ydix2WJxgwQYyJEWQQII60PTewKlTQewpQtjJC+DwA9/fi7RlIq9NdOcVgFKsr1peOX5
	 6KKc3BWp5nzQE5hsTHXAUYw30kiXFLytN/yFAj4gnVtiF38XmsEU1MP53yhH30Z4SKn4Y
	 J+0eRq2XycyM4bnwwChiiEt3EZX7IrYfQHxTzUYzhAbXRlp9plDfW0FozWNmzon704Van
	 hmXWEPvgoH1hHML/LqX9VSeeHdSeARPViYMT9+F+tOEDS92TzSfE0SRpvBYaUDHF6cQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b="NH0QVRQ/";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793001319;
	bh=U3+YC+hFTiDpBA8B/dY6Dj0buEI3eS/u+hj7OV4nb/U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=eP3pmRpw5LhMPclSNzF0l3CX1pdQtZvV31M7JokOGGL5ONOMiGOkQoeuO3nCOqOIp
	 pBaW6Q0H+CWjGGneaIpCj36CR4FqyKON96iu1H318imB+IdW9Q6n6zOks+wzQHK28N
	 N8vDdB6MWauOC/XaVUQsD3CDZV3QZwR9M8ljYUqejazVi7ev+C4EyBb1QzVQyDOEt/
	 RTePK+6n1tAjqLjl/kXvDf0f6cFtXR1OTi75XkkNx8YYh7UvIbrB3Ygb+shNO1zNjR
	 9Lq9lpZmi4oe9gntuRVWIP6x42Ic8F32RkAlBMH0/yltFbh0cr5D6e6O3Owtwz5Av6
	 OehS8fDgtwdxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86CFD6063A;
	Mon, 26 Oct 2026 07:55:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E166D334
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 07:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C73516063A
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 07:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_MDWnXeRT5D for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 07:55:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 97A2860623
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793001317;
 b=YlqTfMv5C93blvkyi802JaXvX3A+1O55Y/X+Ri0ENb8vuKeORmo/mi16+FRdIX913cto
 y6EZEUBzcYCjHSD33MjM4IWvCoQ4Sd50B9Spwc4tsMQvf3cPlHZ3hs2siHuFCo9WYEfZp
 lXkxvhh9eOLZj2Lb3ijkt8+5zCTn78XZ+Z7+0nPAbvOmPGbfKL14jsyR52pMZl1VkRkfH
 Kf1AjR+xTMgXlLHv7WE/i5nhXGHnRxEjPbbhTlccd6+EYtlM8TcUL1Nww+MDJzd/9VyuI
 VRj6pEL22HeDOHabUS68iVJs8HwsTAgpsTvUkDl/R35ipXxuscmhaJFj6+9NWyV93Kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793001317;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=DguMMc8yo1ujEVqS/ZK8jl/GwbYj2aBMpu69UFgnRVo=;
 b=S/bdJkZsm25AFb+Xq0v3GuSJ2oaq8N6TI7NiXzQvSdAzQdOWZZXhqSPq6kxEWjY6z/9d
 HSeSKQ/7maT/D4+9bMGa4Wu4dEJLkUr69WTG8oeAiILSBkconvKs+hhhpFFxqQeFVA5Iq
 VIMgPc/O6RHNxxsgs9PW9q1FWR+oZNCriZqOVcY0KMYEx47zsheomnJpN2y47WbfQelSS
 6MXt8hIlIUc8t832Wpy6sLLUmEO5CcEH4HfXuZ9inYSgCRfJiyTgZ0oYigtyU8jJ3tE/s
 1Hv0uweYiSgAdElOpgdigakpTupp/69Dmz2Rf/18Oo8sAuU2fSc8bpf4HEnEtdfmAfA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b="NH0QVRQ/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::636"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NH0QVRQ/
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97A2860623
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 07:55:14 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c4550d8ab15so329141166b.2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1793001312; x=1793606112; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DguMMc8yo1ujEVqS/ZK8jl/GwbYj2aBMpu69UFgnRVo=;
 b=NH0QVRQ/mlcIMTpZUkwCOpVAixIejKft6NfGSxS6C5J1SizTHvFtJOI2PikkIo8K2j
 p5X+gl5k/CjLTGucW5+83MywqCrzgnnpXqvduX4nB33B2EsQAlVBxgOJUeHc0Tw/KfkH
 y+IruBrtAsQ30i1DAS54/4mh3f+/yRbeVDCkoQ6OoT07K4igATTLGzNtQEYsJCV18zix
 8+f8ncQLt1SK9WsZZFCp62X5ZntQoiOD8nzcovWpmBWQ0Dy+HQJZdfhxNEMxLtKjUOA9
 u0N3LRTo0b0PVulcxJPzh4MYz6EmD1F9gupMUl9eX/op8/j+3JJTd6Vt5t1jzGuxEGeM
 f2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793001312; x=1793606112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DguMMc8yo1ujEVqS/ZK8jl/GwbYj2aBMpu69UFgnRVo=;
 b=B8C1LUz50Fv4LjcGxD3P7BSbqSb+tSdD2LdEweszxxp8sp2hAA1NnXotzSHsUZ0wFf
 BQPhQceKr268SslMYU6jxU+CybLB9sfeiLEsLwgbPL++aXfwp/PBV/6msgWdDr3hB7/A
 Awco1OYW+3ZB41Ai3eO6nbdDbSqYe1Flu2SEVIdoWrVynAKqkOLE0+UnyF0PXwTjx1z5
 rWDyuq0boWMLyeA+xU83IR97HF1yJ9GWsbSCVr4kdklDTR0QB2BWdB2srYsAL8VcLDk1
 RxOFjsH4Rufe1vlMahC+hmkbmBmsau2G/s4Rkgbj3VkNVM/OKS2mwgm4pqlUb8q1LOiO
 zpMA==
X-Gm-Message-State: AFq9FYI3D5YJacaWU3cn5zIUfunb1DmnhAHFDx5E/ynpnWZBH6RTJ07u
 k63N4Xi5AHvaKAPdFf1vKkeM5ReQ5XmFbcvEZtaVeGfzu/7dSv102502uRp05Q==
X-Gm-Gg: AYBFou16bLXVHl1fjxXfqMmDbn30NDkQ+HmWHn5haKOMFA1Z8GiSoLCHzIatuLZKKmg
 KHTVDqXvO+q914gwf1xaQVJMREAeHvor6kA8aTB7DXiVvAfpB595hI3SjYrBcy2h+HQB6FF5Cbe
 x+zlt8S5RQKLzzAcaXiHcSV59x0d5jXaDMGr4hSzS6PIL3TLwZZYxHEdYzx+q5SuO6sWqS3ieHh
 xba7ig3qCcvvDuVhC9S0cLGxpYvRJe93KeX6OwI+PztFFvClvEjEfeLlQ6p7c9Gimn0jPkEKPsA
 qNGxa5W3tx0h25Asd4lkdODnptj2jyP/00lI9RetTm93dyL8eQNUliEDyh5OmzX78vgMao6R1Sx
 Au2fsZ47Wt2aHoT+bqKJFnUrfdRmDA0i5Ad0EBlw7y2+1IQQCpgV9ilo7ryGKN4i+SxJYnN83FM
 2TOsb7wPYp0ptT11Wp8V0SFvryjvEXOok2AYOb/2GZxgHPWlSevuWWB0jZZt+hjv2MBVJBLMg00
 fT7u/2UbpQyZL07onWG5yRA53ozf8kx9NrNHmJgWHxFpyt9ZNzGspsj4f4a69NyDBodWJH+z0Bn
 gCG3XT0z5y1Rd1gRo0fkVj6+A5XsStWY6Cs=
X-Received: by 2002:a17:907:86a5:b0:c39:34ba:2f6b with SMTP id
 a640c23a62f3a-c46bddfd4a0mr728641666b.26.1793001312300; 
 Mon, 26 Oct 2026 00:55:12 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c498f8e6badsm90272966b.22.2026.10.26.00.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 00:55:11 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 08:55:11 +0100
Message-Id: <20261026075511.3890089-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ccid: bump to version 1.8.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
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

Upstream removed the older releases from https://ccid.apdu.fr/files/,
only keeping the 1.8.x ones, so downloading ccid 1.5.2 fails:

  ERROR 404: Not Found.

The GitHub releases don't provide tarballs, so bump to the latest
version, 1.8.4.

Since 1.6.0, ccid uses meson instead of autotools:
- zlib is now a mandatory dependency, and flex is used to generate the
  tokenparser;
- the driver directory is taken from pcsc-lite's usbdropdir pkg-config
  variable, which is /usr/lib/pcsc/drivers, so --enable-usbdropdir is
  no longer needed;
- the udev rules are installed by meson (in /lib/udev/rules.d) when
  -Dudev-rules=true, instead of being copied to /etc/udev/rules.d by a
  hook.

The tarball is now xz-compressed. COPYING changed only in formatting and
the FSF address.

Release notes:
https://ccid.apdu.fr/

This is not caused by a Buildroot change: upstream removed the files.
All maintained branches use ccid 1.5.2 and are therefore affected as
well when the backup site is not used.

Fixes:
https://autobuild.buildroot.org/results/f12f2765606f8dff01e64a32fd38baaf65d6115c

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ccid/Config.in |  1 +
 package/ccid/ccid.hash |  6 +++---
 package/ccid/ccid.mk   | 20 ++++++++------------
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index c12733375b..5c3d754d46 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CCID
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_ZLIB
 	help
 	  PC/SC driver for USB CCID smart card readers
 
diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index fcd8d10ed9..97383f7f26 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,3 +1,3 @@
-# Locally computed
-sha256  13934487e6f8b48f699a16d367cc7a1af7a3ca874de721ac6e9633beb86e7219  ccid-1.5.2.tar.bz2
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
+# Locally computed after checking pgp signature
+sha256  4ff98151a7feb828a711e2f9d68c6b6065a97c597a81c2cbbd11d7f7edcfe743  ccid-1.8.4.tar.xz
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 0510b4c9ad..3bb4c19a7b 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,23 +4,19 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.5.2
-CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
+CCID_VERSION = 1.8.4
+CCID_SOURCE = ccid-$(CCID_VERSION).tar.xz
 CCID_SITE = https://ccid.apdu.fr/files
 CCID_LICENSE = LGPL-2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
-CCID_DEPENDENCIES = pcsc-lite host-pkgconf libusb
-CCID_CONF_OPTS = --enable-usbdropdir=/usr/lib/pcsc/drivers
+CCID_DEPENDENCIES = pcsc-lite host-flex host-pkgconf libusb zlib
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-define CCID_INSTALL_UDEV_RULES
-	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
-		cp $(@D)/src/92_pcscd_ccid.rules $(TARGET_DIR)/etc/udev/rules.d/ ; \
-	fi;
-endef
-
-CCID_POST_INSTALL_TARGET_HOOKS += CCID_INSTALL_UDEV_RULES
+CCID_DEPENDENCIES += udev
+CCID_CONF_OPTS += -Dudev-rules=true
+else
+CCID_CONF_OPTS += -Dudev-rules=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
