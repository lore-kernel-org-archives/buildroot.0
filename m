Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30277C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 06:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9266940A9D;
	Wed, 13 Apr 2022 06:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxlH0eAkmmgr; Wed, 13 Apr 2022 06:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B1A1409EE;
	Wed, 13 Apr 2022 06:39:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22E2D1BF8C7
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 06:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10D188261C
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 06:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id labxNfqDymXK for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 06:39:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D5C482612
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 06:39:21 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bq30so1782926lfb.3
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 23:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8PzbmeNqxjXweU0pQEXnSJZa3X9ZnLqAxDAaAJC1JB0=;
 b=hHE/+KT3kkhl7B2taP5DPJ+ZvKrGQHOn+2oN98xMs0pbPZb5a0Sm3jFX4sC3TCMdnM
 QkUzRgiy9wmSRZGzu0zbT7Z4MhJNYZC2QoDHbQIFEMQfNL0yko3hxdHAtxfGHEFySzdm
 jD8TBjy0gHT7P7uQuX+Jc8f++hLWeR0wjfkU21JXZ11Ab6EjH/MDQeRmFcwGrQ60Hkmf
 tWZAHcSVRgjD08tbFlqMGjgKGoqL3nfUiPT/Zzx7gWXvmzNta4PStPEy85cbjsZC4rkX
 YWsg598j0e17manmiZapP4HV/Nqcg8hChBx9yjRMirGXugIr8d/+Shfoi6Vs6angzCa5
 55aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8PzbmeNqxjXweU0pQEXnSJZa3X9ZnLqAxDAaAJC1JB0=;
 b=oOsvkuWkIJBfVg92GdBj6S6mUDwHy3Kx5N+oh0u/RG0MhQ94963U5rHbjznSq9SfCi
 9+PvPEzKe2EH88Z5qOslC1/UTSwD6UzVrs1jYXl1MAPzro6bZmwSYSHxP4CZoiTUzxF4
 bA39UIGhKEo2Zujcevy4mH14kqcY0T9Jh0sNniFcjThnKg5IrZefSMocDG5JGY+Y9SLp
 LXGTjXgr2eq7oTYFiOFhciwIMRJHz4EDeMrzqGPlPB11idzUMiXLLeiqzkyoOlhaY45M
 S2OESjaC+jw2RsSKyqpCvfbQFZdY5l6n/SkvZ86QiLTpFlBuasHmP3dPJ5xluxBDNdX2
 EikQ==
X-Gm-Message-State: AOAM533640uAOP9anUdBnt6y9im3MIptmS0M3C7mtrvUDtadZaumy1Og
 EGkJbXCqdaycMX93N/J98QXdiSM2u9HhzKB7BnZvcFwl
X-Google-Smtp-Source: ABdhPJyDZe/IdhqZCj0L9AXdKDT3P0ouB07RJ8UFsRcFDiFN2KN2uQykaJQkhOU2CNqWD1FprYQftQ==
X-Received: by 2002:a05:6512:1529:b0:432:2c53:f9e7 with SMTP id
 bq41-20020a056512152900b004322c53f9e7mr27790579lfb.139.1649831958850; 
 Tue, 12 Apr 2022 23:39:18 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (dxtytb4cm6b7h2fdms59t-3.rev.dnainternet.fi.
 [2001:14ba:9c01:e0:4ad0:766b:106a:7e7b])
 by smtp.googlemail.com with ESMTPSA id
 194-20020a2e05cb000000b0024b5c059e31sm1197015ljf.138.2022.04.12.23.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 23:39:07 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 09:38:58 +0300
Message-Id: <20220413063858.8491-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/wpa_supplicant: Add overrides
 configuration option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Mika Joenpera <mika.joenpera@unikie.com>,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogTWlrYSBKb2VucGVyYSA8bWlrYS5qb2VucGVyYUB1bmlraWUuY29tPgoKT3ZlcnJpZGVz
IGNvbmZpZ3VyYXRpb24gcG9zc2liaWxpdHkgZW5hYmxlZCB0aHJvdWdoCndwYV9zdXBwbGljYW50
IGNvbmZpZ3VyYXRpb24gZmlsZS4KClNpZ25lZC1vZmYtYnk6IE1pa2EgSm9lbnBlcmEgPG1pa2Eu
am9lbnBlcmFAdW5pa2llLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9z
ZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Ci0tLQogcGFja2FnZS93cGFfc3VwcGxpY2FudC9Db25m
aWcuaW4gICAgICAgICB8ICA3ICsrKysrKysKIHBhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1
cHBsaWNhbnQubWsgfCAxMiArKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluIGIv
cGFja2FnZS93cGFfc3VwcGxpY2FudC9Db25maWcuaW4KaW5kZXggOGYwOTVjZGYyZC4uYmI0Yjc4
NDMzZSAxMDA2NDQKLS0tIGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC9Db25maWcuaW4KKysrIGIv
cGFja2FnZS93cGFfc3VwcGxpY2FudC9Db25maWcuaW4KQEAgLTg0LDYgKzg0LDEzIEBAIGNvbmZp
ZyBCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FOVF9NRVNIX05FVFdPUktJTkcKIAkgIEVuYWJsZSBz
dXBwb3J0IGZvciBvcGVuIGFuZCBzZWN1cmVkIG1lc2ggbmV0d29ya2luZwogCSAgKElFRUUgODAy
LjExcykKIAorY29uZmlnIEJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5UX09WRVJSSURFUworCWJv
b2wgIkVuYWJsZSBIVC9WSFQgb3ZlcnJpZGVzIgorCWhlbHAKKwkgIEVuYWJsZSB3cGFfc3VwcGxp
Y2FudCBvdmVycmlkZXMgZm9yIEhUIGFuZCBWSFQgKGRpc2FibGUKKwkgIEhUL0hUNDAsIG1hc2sg
TUNTIHJhdGVzLCBldGMuKSBpbiB3cGFfc3VwcGxpY2FudAorCSAgY29uZmlndXJhdGlvbiBmaWxl
LgorCiBjb25maWcgQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfQVVUT1NDQU4KIAlib29sICJF
bmFibGUgYXV0b3NjYW4iCiAJaGVscApkaWZmIC0tZ2l0IGEvcGFja2FnZS93cGFfc3VwcGxpY2Fu
dC93cGFfc3VwcGxpY2FudC5tayBiL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNh
bnQubWsKaW5kZXggM2MwYjBjMWRmYy4uZDg1N2IzMmIxOSAxMDA2NDQKLS0tIGEvcGFja2FnZS93
cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5taworKysgYi9wYWNrYWdlL3dwYV9zdXBwbGlj
YW50L3dwYV9zdXBwbGljYW50Lm1rCkBAIC0xMTAsNiArMTEwLDE4IEBAIGVsc2UKIFdQQV9TVVBQ
TElDQU5UX0NPTkZJR19ESVNBQkxFICs9IENPTkZJR19NRVNICiBlbmRpZgogCitpZmVxICgkKEJS
Ml9QQUNLQUdFX1dQQV9TVVBQTElDQU5UX09WRVJSSURFUykseSkKK1dQQV9TVVBQTElDQU5UX0NP
TkZJR19FTkFCTEUgKz0gXAorCUNPTkZJR19IVF9PVkVSUklERVMgXAorCUNPTkZJR19WSFRfT1ZF
UlJJREVTIFwKKwlDT05GSUdfSEVfT1ZFUlJJREVTCitlbHNlCitXUEFfU1VQUExJQ0FOVF9DT05G
SUdfRElTQUJMRSArPSBcCisJQ09ORklHX0hUX09WRVJSSURFUyBcCisJQ09ORklHX1ZIVF9PVkVS
UklERVMgXAorCUNPTkZJR19IRV9PVkVSUklERVMKK2VuZGlmCisKIGlmZXEgKCQoQlIyX1BBQ0tB
R0VfV1BBX1NVUFBMSUNBTlRfQVVUT1NDQU4pLHkpCiBXUEFfU1VQUExJQ0FOVF9DT05GSUdfRU5B
QkxFICs9IFwKIAlDT05GSUdfQVVUT1NDQU5fRVhQT05FTlRJQUwgXAotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
