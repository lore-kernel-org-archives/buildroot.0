Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549E1C982E1
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 10:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E7F606C8;
	Mon, 21 Sep 2026 10:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcVPXwrmOczu; Mon, 21 Sep 2026 10:22:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C24BB60673
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789986167;
	b=foFYOg5xZDhEpFEK067oXNpt22vr+30TzmC+s9xq61iFFCL186dQW0dARR1m/AqmNgm7
	 K4/QFQUtahZ3WCm9UNAnOtrnSh2iXtGvgCI7SYMyh7CNiKj1EBwLVEp428HmwMj1Ifad3
	 JSEoeZdqyina670an3nbEkX0fCAZ+T8nnGQk0LnnRUwhGYsAS11kRhaxRBlRUzYgq/ACH
	 mBkXz+g+d7osR5WdtkERc5zv4Q+gjAiYF99UjA4UWwIS0Ndhr/sg7kFk6Z1rTwC2mkkGI
	 kgYFVesWkZANB11mIAHlXIQXt3W+vLoF4ke5ld4weMgVtcZ6TviVl2GAWHV7z9twCkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789986167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=78l9VmMyePkb/0PaOHSn71F+h4rimD4OelPRXcM2OV0=;
	b=ZZIj4sRqx6vMg0ny8jqjXrvuR+kWbd07AGIExhtKqSXKBs8VWDIvMmhKlZqJtJSmcz8D
	 x/djdz7fchQgIjMTSb5i3JkyfNjhuzu24IusPHK/drwaH3Z0S7SMduPH/gNfj7MGkFVk2
	 B8PDXmvfAqKCETef4G3shllp1AlrALHGN/YbOUz5AldOpXQqYzkfwc9fnWS+DzmUG/5qG
	 K5SZaZREsBZ1C51Lfn0TCtUfxTnJqYQ1+MPhRNkWcMTafeRDt+ZVAXtvZzk1QPP13y1VA
	 3mM1vUlaAzA3Ufdr08meSTc0cjmRixC8WUrKkdKUkgcalPp8pcUra6bo2eI+HqArktg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789986167;
	bh=78l9VmMyePkb/0PaOHSn71F+h4rimD4OelPRXcM2OV0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dIWs6DV7Nf3yAB7E40/+vckT7TmENJus7fPJHMrT6m+29CPXdipCveKbm1Ivrto6f
	 G9bkl0pu7bQ/GjQ4wHnRHXtDEp0OY3P2uS6p76xqc3rb9rDs0RnPXj1fxelON4yzgk
	 T5XHJfJeelVuWbpPAip/WPoC7HTXHXOnpvDi89BxY1eMWV9IGVEMzgqwyMQYfRYNXy
	 QF+rw32r2HDcgNX+A03NX06RA2c2kKJ7KSqZKGpYFcnh7HjLPqwD0WIKr+3w2u2s4a
	 lr+rvPLy20Wh69I356bRTUodZVhrKfpJlHUccSvKr0KfNnXpGn+x3zTBPFsRkPe0yF
	 tDZ+W8zvcqZMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C24BB60673;
	Mon, 21 Sep 2026 10:22:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97BFB3AF
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 10:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89BAE40629
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 10:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGdgpi4TTYxl for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 10:22:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CFA39405AD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789986164;
 b=I06W76XKqnBDm3wOtoxPtpn1zKdvdhZoHboH16j7phjoRo52CCakk+SBWeJM7oyIFlMR
 W03pUtmANQvOZVzWCUulGtjL1tqM6M2ETVhVqRvvsm4G3NHuiskNm4Oeb2Zys5TGYxIig
 kA9Vu2RZ1e0A41wh7YGEeDm0uSV9OOUPr8CzMdcq2DyleOOkBMKBQVLnCPPrA8Lc4WrtF
 WCFM1ByWGiQxBXpVSwwn5XxiG9W1EiDeia+Oyynu8ydYr4Or4YX5vWfB+iCLy1AtM3fL3
 R2Vs1Jxv1EHzUHZSbcFOp6W/JVSAhLVA+pzrVp0mACaRWtn8Hn8yW4sIPd6Tu0ym7yQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789986164;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=hhFYxTT+u1gkp34SFAFQFLmcpmprK+41ZM0hf16UJAQ=;
 b=Zc/1h9qeZFaI0eckNJdTf3QBUWezMfb5gnTyBsPVpz2ekh4ehr6DNbyyxY5nt27wdE+3
 oJmFVRl7/GdYyDxD5j6j5QLda7Rk5i9YisWf/Aob/pfBd3e9VHoeTWoWwNChmYNIbLzMk
 NnNOH3TdOn3GWQbJ3vungRcpKFfrw5wGthGRkAtxKmsYMA1Z6KzIGGXVM9+Fj/xQF761v
 5bUcMtgyzEaCVdJE3BNeSinN4D8+ygiorD3zVWp6tXlQelbD8z8EmFisQZ5spnjy1G1u8
 1DHGpU+RaMXLBZCVbiz5VyUFM4i9fp9BvNXuGrmv2IgqTGT8qg3RRAaI6BKgkWcWF1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZVvFmKxb; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFA39405AD
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 10:22:42 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a6063d7dc4so3503505a12.3
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 03:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789986160; x=1790590960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hhFYxTT+u1gkp34SFAFQFLmcpmprK+41ZM0hf16UJAQ=;
 b=N998z1cGRVVw7QjOIY90+3BieGnQz3bhWXx1M3ACzb8py5J3PiQeDdb1gWX6Ub9BZZ
 L/Z0l6zIeHeR0kvkWjk8dC75Ma9Kt4yCTlqUBcK7YZgaXl3R7FRhTcT07FixgRhEGOFZ
 g9l0f5ln1nLWRXAJBUxCFlheByHgdxj/DzoiJCnGuUz3JblvBkrjRcgnW36MQz5n9fCp
 KPZZJgFEOylyNBK703zrx/lfYFFZzakCVhGcQiv3szmPFAyyvMaAnbqyW5TPYYvD34rF
 csZXujusMBtdekeOiGbkZvlxQXtOMVvBzUHaKHvpeY3T4mKDi/2X3RtdzQOuPme2iHDv
 DMeg==
X-Gm-Message-State: AFuF++m8R938pL3unPIUdnkqdjIuoXiiEvtR5cXIXqgYOsiK0dteDQH/
 mbT7hTLtOjwYUAdBEleqasdoI9nnEpHGQgtOpsivArbfS8lOtWAbsViIAFJhBfHwR7SOYzy9p50
 kmdIA2W0=
X-Gm-Gg: AYBFou0767jhF/wmAGNI6kGFc4Bs2QlES70uwrxegbUoXPYgpQb3JDT7kmPThg9bWbK
 ISqQUo25I/41X2moc6+X3r+e5CpzJTkiaQqgHlT5YlXxPdt+Dandjn2qT+D/vSqk6k2eTfmtBpz
 byaPkUiS5fwkH9BkBaolU1qsyzRp5g94A9FtQZyM9aBWBFFs/1K+Wj5eoVhYwcm6xQ7gihtNV2R
 0yhmxgSAlZPZSOMdE+s0UAejXFWbwysHOS68yZ1QEIqd44NGkYTYE8gouvP6mFs7KOolxtVqWMM
 FEGUibEMZiCIpLj8uUxzSYEgT2ntANbhQlnkuzudMYuvnuzWHF2ot4WyEODTw6MOl73hJCYD9Bf
 1YHpy+PLPLY4/YMrOSfy/Z1ESfT8fHK5222PuCSrSALxZRh8ZoFgPDYIBxCe2wxdBjV2zLS8Xnv
 XcWHSr2meQW3REQZ8LY/WrmCfOiSTyv+rgj93RqKzjKSXnbaCrTbwvG99cKIhBH393SLSvSPU8m
 KymbMexfPZUEgaXHtyjl+ZJ
X-Received: by 2002:a05:6402:e02:b0:6aa:734b:1a2a with SMTP id
 4fb4d7f45d1cf-6aa734b1c11mr5251037a12.36.1789986160136; 
 Mon, 21 Sep 2026 03:22:40 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa67d81625sm4158263a12.5.2026.09.21.03.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 03:22:39 -0700 (PDT)
To: buildroot@buildroot.org
Cc: raphael.melotte@mind.be,
	Titouan Christophe <titouan.christophe@mind.be>
Date: Mon, 21 Sep 2026 12:22:18 +0200
Message-ID: <20260921102218.64667-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/fcft: use release tarball
 instead of archive
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Codeberg has changed the way it generate hashes for at least some of
the generated tarballs (see [1]).

This change affects tarballs generated by Codeberg, but not release
artifacts.
fcft turns out to have a proper release available, so use it.

[1]: https://codeberg.org/Codeberg/Community/issues/2861

(alternative to commit b7cfa2371bc1ebe83ea1c74db7fa45f360a2138a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/fcft/fcft.hash | 2 +-
 package/fcft/fcft.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
index 431f2218c6..86d68cb047 100644
--- a/package/fcft/fcft.hash
+++ b/package/fcft/fcft.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f48c793f354b8be95477e475dde7c98ac9d2628c52ecb42029dc6d20b52d787c  3.1.8.tar.gz
+sha256  028099126692625873410889a1d76cd82d5a71b5e350bd618320e48db15a8636  fcft-3.1.8.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
index 62c85a15c5..cd31ca5153 100644
--- a/package/fcft/fcft.mk
+++ b/package/fcft/fcft.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 FCFT_VERSION = 3.1.8
-FCFT_SOURCE = $(FCFT_VERSION).tar.gz
-FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
+FCFT_SITE = https://codeberg.org/dnkl/fcft/releases/download/$(FCFT_VERSION)
 FCFT_LICENSE = MIT
 FCFT_LICENSE_FILES = LICENSE
 FCFT_INSTALL_STAGING = YES
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
