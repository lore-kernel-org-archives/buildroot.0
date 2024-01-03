Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752ADC3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 06:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E230981EF5;
	Wed,  3 Jan 2024 06:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E230981EF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fv9LvIQL2BzF; Wed,  3 Jan 2024 06:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 383F781ECF;
	Wed,  3 Jan 2024 06:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 383F781ECF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87C661BF346
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 06:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FBB260BD6
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 06:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FBB260BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pgfnkluJymaQ for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 06:33:06 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F03A60B91
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 06:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F03A60B91
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a2819e25069so138778566b.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 22:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704263584; x=1704868384;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6UPgDU3lzK7t/pRLxX5hLo4D8CG+AsO8OKcz73yhLcA=;
 b=X6UPEY5YYek1ip0OxjdrknG4P5ITc5q2lVqIV5lG1qxkqKzKqnizy5RGmxRiNcMr56
 0EWlLCpSjPEZdoZMj3+UcbsovXlIFVQeRyl8k1QZqkSLnygnhz5FqqBP/0J5ci3qaUU5
 8thp/I/w8HaL+gmI0KQJgwrO1Q4S6tLcHWO3+Kcj5YuqcrC1fKy40FGXP2r1q/63oYWZ
 +8vjOCxqkWfxWFUNmqpfP4RT0yWnthyCdsgEnMNwrLr/l5MCvUJHpimuaj0nAo2mlDxL
 4hiK8XaNKDUvqaCFOcFwK9jqsfwwuQD2Yh0ukgBy9wXOZU7KxJ/5P7hNNseW4xUCS0Ol
 sfKA==
X-Gm-Message-State: AOJu0Yz+gDVtzg+u1I3Mzb5n5VRjyDgoyGG0jy3OyRjTktxtNLY3y7E4
 XvbdhCCoJVVGr8TS6E9z/sQ78PqHTcw=
X-Google-Smtp-Source: AGHT+IE7ppDB7LEamJQfe9V5wqpfxFZx3PJew4S+gSloLwR5wczELCwZ9UJX4erz2ap0Cr+3VkUmEw==
X-Received: by 2002:a17:907:6d1c:b0:a24:da44:efb4 with SMTP id
 sa28-20020a1709076d1c00b00a24da44efb4mr11597589ejc.23.1704263584034; 
 Tue, 02 Jan 2024 22:33:04 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl.
 [31.11.218.106]) by smtp.gmail.com with ESMTPSA id
 h15-20020a17090791cf00b00a1db76f99c8sm12505797ejz.93.2024.01.02.22.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 22:33:03 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 07:33:01 +0100
Message-Id: <20240103063301.6858-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704263584; x=1704868384; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6UPgDU3lzK7t/pRLxX5hLo4D8CG+AsO8OKcz73yhLcA=;
 b=AGm1/0u9bURd+/iLAy3kKH5MIajarT5gFJQTqhm/da9uLs/qUFIclXfptzdljg8MZl
 Q94GBXxmqR90Iqn4X3A5R2qQFoQzjZGtjAzLO9GGdDBwQce0dM1J7jng9wWMNYRvo8I+
 30413hSFnO1jcSGNPhB0gXSvjpYHYJYxhcvllL68MNuUhdSj0Xi+vNrdTKptQkErqw45
 1fZE2wKi26tMEMlF6VLg1PjUokvLcLFFZuRjuYxGx88PRJGc2KodbV4B/F7y86PYumZq
 8KcqcOeDs6j1CJBK02sSwVKOjqK8RfNQAFcZ2Sumo85L2DYi0IRMOitEEIKoVA/Z149t
 JHJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AGm1/0u9
Subject: [Buildroot] [PATCH] configs/broadcom_northstar_defconfig: specify
 kernel & headers versions
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKRXZlbiB0aG91Z2ggTm9y
dGhzdGFydCBwbGF0Zm9ybSBzdXBwb3J0IGlzIHdlbGwgdXBzdHJlYW1lZCBpdCBtYXkgYWx3YXlz
CmhhcHBlbiB0aGF0IHNvbWUga2VybmVsIGNoYW5nZSBhZmZlY3RzL2JyZWFrcyBzb21ldGhpbmcu
IEl0J3MgYSBnb29kCnByYWN0aWNlIHRvIHNwZWNpZnkgZml4ZWQgdmVyc2lvbnMgZm9yIGtlcm5l
bCAmIExpbnV4IGhlYWRlcnMuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFs
QG1pbGVja2kucGw+Ci0tLQogY29uZmlncy9icm9hZGNvbV9ub3J0aHN0YXJfZGVmY29uZmlnIHwg
MyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9jb25m
aWdzL2Jyb2FkY29tX25vcnRoc3Rhcl9kZWZjb25maWcgYi9jb25maWdzL2Jyb2FkY29tX25vcnRo
c3Rhcl9kZWZjb25maWcKaW5kZXggOWFlNzE2NzI2ZC4uYmJkMzY4YWM3OSAxMDA2NDQKLS0tIGEv
Y29uZmlncy9icm9hZGNvbV9ub3J0aHN0YXJfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvYnJvYWRj
b21fbm9ydGhzdGFyX2RlZmNvbmZpZwpAQCAtMSw3ICsxLDEwIEBACiBCUjJfYXJtPXkKIEJSMl9j
b3J0ZXhfYTk9eQorQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzY9eQog
QlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvYnJvYWRjb20vbm9ydGhzdGFyL3Bv
c3QtaW1hZ2Uuc2giCiBCUjJfTElOVVhfS0VSTkVMPXkKK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT049eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi42Ljki
CiBCUjJfTElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09ORklHPXkKIEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9icm9hZGNvbS9ub3J0aHN0YXIvbGludXguY29uZmln
IgogQlIyX0xJTlVYX0tFUk5FTF9BUFBFTkRFRF9aSU1BR0U9eQotLSAKMi4zNS4zCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
