Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4817EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 04:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68B7E423AF;
	Tue, 19 Apr 2022 04:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fxcKi7xUMrX; Tue, 19 Apr 2022 04:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E0E041EE7;
	Tue, 19 Apr 2022 04:34:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C10B21BF2C8
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 04:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7CD783F70
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 04:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sxt74a9nsSqE for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 04:34:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1B0883F48
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 04:33:59 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y32so27299354lfa.6
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 21:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XjNG6JbQlznVXttuMIFEk8KFyGZC7syZqsTMAi7+1Aw=;
 b=5O38MVD6XSZTDYGMu/gcssCF++4JclL84WamdWbws+FkUIkKxn9qu6i5Fu3cNuS3lD
 CLpk9FwvIRCKHWwNQt1KZ07X1qYl4/PNI+lLxUf2TCNr4ual9Vs+afyobYcuhpWsqZDb
 YLP9KW+R+cocqtkFx9r3w6Tec3PhxKfotBS9yMT+wJ2N3YUl9p5bnFAqBC2z6vycK+t+
 ++8k3LrcLPNm5Ft7DSXgkQhazZRe2hxMeBoopwo+onjG8/oxL8jwyYplIePUzOJid333
 3Kq4sgjPzZ6jna7YyxrJARN2J1msbX7Z+rzjcGjvUV3aLU7L+rxGJZa2qXBTs4VsEfAg
 vCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XjNG6JbQlznVXttuMIFEk8KFyGZC7syZqsTMAi7+1Aw=;
 b=VOTKN+K6O8yGF43UnJqkAqXNMoj/Yz5oguWE+ucYUXj1n+JJt4QBIcSDspw9MrRNjU
 d1x1+5WV9kt2lZqxqn88AZ7TYiN5qdhXNpNJqfbdxW+f2h+P2GEyvPiPNppgdKVhYe2+
 fXA2D4gmxb+nbzeaPsWtdIHPOG88lk0Xy+CeNY89P5fMFbt1Fb/Zyt5jbYfXtYbrnrqD
 E/PgEn1KgMeJEHRAZUci9UJi7R1vQ0gIpxUHhE1/0Hn1PBkGGAQLuHsZV6cBbkNcn5O6
 Vmi++vROZgEpSVrMNcBlW5qTlw30j+hGxP3m31LxDmWhoYjI4GqhoahVdJCRtcxErDLx
 a3rw==
X-Gm-Message-State: AOAM531SrvzW7WRcaMYUKR5fO2WEQ86bTysTvlSR/UTJv/B8d1s+P877
 92RHkgBeRmuZo7e51V7qZabvWNVZaeUFzZ1OIkzxhUL1
X-Google-Smtp-Source: ABdhPJwDXTDU9UhWRdHaTFD9O92in231flVgZEQ4SOWPF5/c4vrwpgELSusRz+xss5dvIkUwnhC2TA==
X-Received: by 2002:a05:6512:3d9f:b0:471:8f33:6779 with SMTP id
 k31-20020a0565123d9f00b004718f336779mr6047347lfv.117.1650342837249; 
 Mon, 18 Apr 2022 21:33:57 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (dxtytb4d9qnb4vw52pq1y-3.rev.dnainternet.fi.
 [2001:14ba:9c01:e0:7d6a:c388:cb36:636a])
 by smtp.googlemail.com with ESMTPSA id
 g15-20020a19e04f000000b0046fa7c1d8desm1129764lfj.55.2022.04.18.21.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 21:33:56 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 07:33:40 +0300
Message-Id: <20220419043340.5848-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/wpa_supplicant: add overrides
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
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogTWlrYSBKb2VucGVyYSA8bWlrYS5qb2VucGVyYUB1bmlraWUuY29tPgoKT3ZlcnJpZGVz
IGNvbmZpZ3VyYXRpb24gcG9zc2liaWxpdHkgZW5hYmxlZCB0aHJvdWdoCndwYV9zdXBwbGljYW50
IGNvbmZpZ3VyYXRpb24gZmlsZS4KClNpZ25lZC1vZmYtYnk6IE1pa2EgSm9lbnBlcmEgPG1pa2Eu
am9lbnBlcmFAdW5pa2llLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9z
ZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+ClJldmlld2VkLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVn
b3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Ci0tLQpbIHYxIC0+IHYyIF0KLSBhZGQgSEUgb3ZlcnJp
ZGVzCi0gY29zbWV0aWMgY2hhbmdlcwoKWyB2MiAtPiB2MyBdCi0gYWRkIG1pc3NpbmcgSEUgb3Zl
cnJpZGVzIGluIENvbmZpZy5pbgoKIHBhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluICAg
ICAgICAgfCAgNyArKysrKysrCiBwYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50
Lm1rIHwgMTIgKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3dwYV9zdXBwbGljYW50L0NvbmZpZy5pbiBiL3BhY2thZ2Uv
d3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluCmluZGV4IDhmMDk1Y2RmMmQuLmVmMjU1N2I4YjIgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uv
d3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluCkBAIC04NCw2ICs4NCwxMyBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfV1BBX1NVUFBMSUNBTlRfTUVTSF9ORVRXT1JLSU5HCiAJICBFbmFibGUgc3VwcG9ydCBm
b3Igb3BlbiBhbmQgc2VjdXJlZCBtZXNoIG5ldHdvcmtpbmcKIAkgIChJRUVFIDgwMi4xMXMpCiAK
K2NvbmZpZyBCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FOVF9PVkVSUklERVMKKwlib29sICJFbmFi
bGUgSFQvVkhUL0hFIG92ZXJyaWRlcyIKKwloZWxwCisJICBFbmFibGUgd3BhX3N1cHBsaWNhbnQg
b3ZlcnJpZGVzIGZvciBIVCwgVkhUIGFuZCBIRSAoZGlzYWJsZQorCSAgSFQvSFQ0MCwgbWFzayBN
Q1MgcmF0ZXMsIGV0Yy4pIGluIHdwYV9zdXBwbGljYW50CisJICBjb25maWd1cmF0aW9uIGZpbGUu
CisKIGNvbmZpZyBCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FOVF9BVVRPU0NBTgogCWJvb2wgIkVu
YWJsZSBhdXRvc2NhbiIKIAloZWxwCmRpZmYgLS1naXQgYS9wYWNrYWdlL3dwYV9zdXBwbGljYW50
L3dwYV9zdXBwbGljYW50Lm1rIGIvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2Fu
dC5tawppbmRleCAzYzBiMGMxZGZjLi5kODU3YjMyYjE5IDEwMDY0NAotLS0gYS9wYWNrYWdlL3dw
YV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rCisrKyBiL3BhY2thZ2Uvd3BhX3N1cHBsaWNh
bnQvd3BhX3N1cHBsaWNhbnQubWsKQEAgLTExMCw2ICsxMTAsMTggQEAgZWxzZQogV1BBX1NVUFBM
SUNBTlRfQ09ORklHX0RJU0FCTEUgKz0gQ09ORklHX01FU0gKIGVuZGlmCiAKK2lmZXEgKCQoQlIy
X1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfT1ZFUlJJREVTKSx5KQorV1BBX1NVUFBMSUNBTlRfQ09O
RklHX0VOQUJMRSArPSBcCisJQ09ORklHX0hUX09WRVJSSURFUyBcCisJQ09ORklHX1ZIVF9PVkVS
UklERVMgXAorCUNPTkZJR19IRV9PVkVSUklERVMKK2Vsc2UKK1dQQV9TVVBQTElDQU5UX0NPTkZJ
R19ESVNBQkxFICs9IFwKKwlDT05GSUdfSFRfT1ZFUlJJREVTIFwKKwlDT05GSUdfVkhUX09WRVJS
SURFUyBcCisJQ09ORklHX0hFX09WRVJSSURFUworZW5kaWYKKwogaWZlcSAoJChCUjJfUEFDS0FH
RV9XUEFfU1VQUExJQ0FOVF9BVVRPU0NBTikseSkKIFdQQV9TVVBQTElDQU5UX0NPTkZJR19FTkFC
TEUgKz0gXAogCUNPTkZJR19BVVRPU0NBTl9FWFBPTkVOVElBTCBcCi0tIAoyLjI1LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
