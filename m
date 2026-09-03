Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591B1C624A4
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 09:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E144A4080B;
	Thu,  3 Sep 2026 09:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5SkibbFSXHo; Thu,  3 Sep 2026 09:54:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A8CC9407E5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788429263;
	b=g4goB4EvL7PCVOtXf8EarUJEHYhV1/kELwSApMS5DsO7Di4Tcx88v/lfjSqV+FYtnbcs
	 wItfUD5SjRS02Qx4YEQgCW2JF9g94X8TFHYZvuiF2as6Rw3QqbJM2dQM1IngXTJpncjlO
	 IVSIre0nH4wdQvMrF0KPoCeCvjaaHWyiQnLsBoxZvVAo3pi0nS1gOt4XPtxSMMGab+lFt
	 QVkoDQ5HCA5LeTRl46KsXw+4pNLxsdXgd95exAsEZoSEFMdkIr8o5qFMsvPow8eG1NHuu
	 jRRIzH1uHKeQZTLFIzMFE/ngeqq0O4ABNUK6V/wjEpHo/klcGmMpscd6imoGHr7IZ/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788429263;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ktck3u2UTOJ3OcSM8HR2EbLcIrooidJNiZO3TX3fez4=;
	b=YZLfSqnKArELTrQ4qkcGxxAp/WRsYaIwooOJLWs8j2MiDQDqltToxz5cHq6qzBSsZnDo
	 ulnQUYlAwvhxRyyrE/hWqdUgIeuSN5wmZLWOiqyINz+ejZ8ved8O2hMvuTuoXNg0bfH39
	 regPkC+et1uyXkGHkHomKbLxxgTItn0Yw5it7YUaLrvY72RZt6QQ7OnQawvKX9j35f74a
	 TSj7NH/PwGHWKcVSZGU75HCX8I0JGjvAHbFz+IYf4+owWjEtl+eJVbjX3yfW7Uu43pwwJ
	 31FdCgk38xbvZtP/DIp9UQiE1BUpYbKSeTL/ebHffcMuQjFKpVgFUnEbVm8dH1hLfrQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788429263;
	bh=Ktck3u2UTOJ3OcSM8HR2EbLcIrooidJNiZO3TX3fez4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=skeZbnIHAWbvWmtzEpeo7X8MVtIQw6vaJDbIVNIoDmQQ+ePXEOG/qbEkwqnyNBvad
	 DGyEhHuBB2x5snynAtmlmy5TePzspMOR4zpqJcT9IX6DQGE3N771GMd1oW4L8D2HMz
	 CLzjXJsifB/FbhYEqoEy7AEvNSrj4o0utYF3Et4ATHLg5N2OoDfAJRcNH1DeSzlHbT
	 ubQaG45BLz7TSNAESGXeZp+2aQM6kHmdB2n6ZUGNtfMxBrYwMJxutHMrJw9ewmvzi1
	 CE+ZAkZ0B4osKhfm0n8fuoRk81U2INJV5q+YWRHAbPkPlTIUo7yekVSJinAQVwPiIY
	 QYWG5XMegCi6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8CC9407E5;
	Thu,  3 Sep 2026 09:54:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1559C3AF
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 09:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFC50608B9
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 09:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVHFoZZd5K4I for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 09:54:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BDC84608A4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788429261;
 b=iE0PzAP2cccHX6DHFrLV8nqRXgmfDFOKiZfvbcMqRPFRRwmaNwfSIrPscXtrVof5jAp7
 9Uc80UZV2MMMNCSNC0+ErjUHuJc/w/y/FC+Ke4vo3Cm3TBTvOXyFDTv/yoQCAFOnGJIFQ
 Zg37+a6+5F/Ktgr1QcCWqWAYqWeYNb5ca8Ipg995uzonKKe85+KgkgvfLiWIRC+P103hM
 DUPyGRnCTJhrcRPdBSQ141kkC70Ryhf+jg06XwNQCuBk443x1RL6NNgibzDI1VnD9PZzX
 IfylD/jYq8ZkIgEgmR4IzhGLUsrf1kTrU2dST+NzDttgAcZMdGukwtC1sDYw8SP6duw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788429261;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=pwIS2IPdzCbjfdRQCWogZPyiGKm9h72xrnaInmnoKIg=;
 b=dn2OBDtNd9Gri5Y1DsciCfK8yAa5Ms04Yg1AhubAt85LZCG9PyqWGFSVlOwQEiyKCxNI
 VrrwNHkqUv6cmgW2GU9hXxcPdiGleg1Ys6DgSOXIgxwprNnR7rh5Hp2pLBuP3w1zfR0cZ
 Jwoq6lQk0EdN0TUpB3KnJZrDTCJtV+6YGGYz3VK2bSsdZXeqviVpycD/n866BVO3vg+rW
 T2FBXl4UvBrVjVfjfIawodFCU4egovV0AH32Sf9S6+7tfSpZj/yL5xglBx2NADoYA7Kfq
 23oXBjuXr5C4Ucp3iCnwmZJNy2hkP3GDHXaiTCZ5rTd3AqYfQfB8POqITQp63V4Wg1w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=itXuvhGw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDC84608A4
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 09:54:20 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6a61910369bso2620776a12.0
 for <buildroot@buildroot.org>; Thu, 03 Sep 2026 02:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788429258; x=1789034058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pwIS2IPdzCbjfdRQCWogZPyiGKm9h72xrnaInmnoKIg=;
 b=eDU7hmbV7+pEK5yP0vVITFEdLVA0p2E5ktnJSWevGc2wAb/3VbMZ7SB3ImRQ8rtVGG
 502WCDPfQbpVu16Z98V45NyyTXgElxFilkvZ2wbyHgEm0v/B56RxOrBSzgxY/0cSwnjn
 4P856kZYARTFCztWY8ojKuffpQl1n1QVD4yyZtJ2HzufVDUe8R2qZRtbL0lW4prfhXhi
 /TWg/rbZzGWc4VdvgLcA03dGY2leTbVATj766wTnz4p4jnIP+7Q+7GwzMTZ2rigUhaI9
 W4/rUUQkr6hG5iCJ8mcaJX1ZtCIFG7OT7RhyE/jjBESEBH/5qzKk82MlPYo/dc7z/EA/
 wliQ==
X-Gm-Message-State: AFuF++mcRUsgBwg65vY5SuLTJ5uJ75eP9EF2CCpMUAkhYWO7Bet4gHgl
 Fxc2X7dQmrXOHBZmrzQJFRhNkDJ34lVpR40aYrqqx1eg8JNhEgma+rC4ZCNjcw==
X-Gm-Gg: AYBFou214ym9lA/DGFOj6MBivmjS5R1N4marR0RwHJHbxBPjdBxpsifp9FoQth2Mh2w
 UavWlMoWiXmnQhbcfMdEnz3qwIGj7/s3ipuW5ul4I8S2L4pL16CSTC5L1Mq1Y9HZYFkcH5bQ4jS
 GU90ygN/sqUhWbGtEOidZ+ecqB6jV2LXd9lXfNfBXhuyj6cSrgIIeebN39JFTZ85fACprIAcyY0
 pA9Q7qNPSyvPy3l3dZUiqx2qt+8jg2zvazBcbZYEF9GllShfgvZUnx0PZB16QPL9UCdz75RRfaB
 /AD4GzVX2H69thzQHf8BA0eiz0UuBfM3MIqZ0A7aqVE1DDrjFYvqqrQt0UDN/8cThS/emsZuxRF
 xLAhakIRcTR8ciV2c1wx9ZcI4DNGC9omOBsac46IEEfzAU+xqZxbxtKV7l0xCqB6uH2wcwJ8YAo
 AUNsrVXT4Wz2ghRPHidGq18BFagrLfm/8jJb9HPp3JSz7akTMw9uN2jT3Yt/tsu3VdSQ1/2DknV
 QhL54I0gkLUzHX2Vt5Q8AC8hE0OT9vFACpgb/IhliI=
X-Received: by 2002:a17:907:9813:b0:c25:4e5:fe33 with SMTP id
 a640c23a62f3a-c25d555ccd3mr695577366b.24.1788429258300; 
 Thu, 03 Sep 2026 02:54:18 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c25f3eef879sm77380666b.6.2026.09.03.02.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 02:54:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  3 Sep 2026 11:54:15 +0200
Message-Id: <20260903095415.3657050-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/imlib2: add zlib dependency
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

The demo programs, which have always been built and are still enabled by
default, gained a zlib dependency in imlib2 1.12.3: upstream commit
f8a451043871 ("imlib2_load: Add crc32 printout") started using zlib's
crc32() in imlib2_load, and 31006b425e11 ("imlib2_view: Optionally show
crc32 of image data") did the same for imlib2_view. Both hardcoded -lz.

Upstream commit b9555030dace ("autofoo: don't hardcode zlib flags"),
first released in 1.12.4, replaced -lz with $(ZLIB_LIBS) and added an
unconditional PKG_CHECK_MODULES(ZLIB, zlib) to the demo programs branch
of configure, turning the previously silent link-time requirement into a
configure failure:

  checking for zlib... no
  configure: error: Package requirements (zlib) were not met:

  Package 'zlib' not found

As Buildroot went straight from 1.7.3 to 1.12.5 the intermediate state
was never packaged, but the dependency has in fact been missing since the
crc32 support landed.

Fixes: https://autobuild.buildroot.org/results/4e05404c353ef985d74757d0b1ec3eda2cdff523/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/imlib2/Config.in | 1 +
 package/imlib2/imlib2.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
index c47178f174..46edf375f3 100644
--- a/package/imlib2/Config.in
+++ b/package/imlib2/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_IMLIB2
 	bool "imlib2"
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_ZLIB
 	help
 	  Imlib 2 is the successor to Imlib. This library provides
 	  routines to load, save and render images in various formats.
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 5ad89289a4..c650981501 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -12,7 +12,7 @@ IMLIB2_LICENSE_FILES = COPYING COPYING-PLAIN
 IMLIB2_CPE_ID_VENDOR = enlightenment
 
 IMLIB2_INSTALL_STAGING = YES
-IMLIB2_DEPENDENCIES = host-pkgconf freetype
+IMLIB2_DEPENDENCIES = host-pkgconf freetype zlib
 IMLIB2_CONF_OPTS = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
 
 ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
