Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ABCC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 09:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AFC042490;
	Tue, 19 Apr 2022 09:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ypna9ZEDQMwz; Tue, 19 Apr 2022 09:03:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDAC14189C;
	Tue, 19 Apr 2022 09:03:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13F671BF29C
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E35E612D3
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HyxTtRCfv9k for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 09:03:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0280612D2
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:03:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so1028432wmn.1
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+FoDY0nM87YQUFolW8+jd3QzwmKTBotAC8RhcZkxp/4=;
 b=ER3N9qAG05qkcei+blXi+470rPgDndcsvKUbAXvntLtJzLBfNyOmBGHtfSeadDmR82
 pYwoEk+dqCES4x6hWgoSMMeKq0ozv3mK5wJgth9igyuZ/EMMqvbnMIf6hRgTX4noHKK/
 taGphmLn6z4usaLuV1FUNZEDvolAOtMIu7Wap7UxkXMi3Sgx0saynP0tjPlLbPR3dydz
 2Miy0dpyJO0Qmpt8OksX8iKABU8B/dpmfZjOFuBG/pyPhnDdvDfD+LpNqcmNpP7bm25r
 S4s3brRz/7nL6qHhI2i6esFO3IjTc1xVEPlCJ4iABgFhvkcYN1B0SUsD5qTglP7Eb1iq
 iVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+FoDY0nM87YQUFolW8+jd3QzwmKTBotAC8RhcZkxp/4=;
 b=BHaIzlGG/gNb0hKx9KfeGnZmLPNV/WF4M2a8O0pwCJQhdUBfSq6VPH2+jjpOGQvucR
 nrIT+/Wpz7zgFKlyeOc5rJ1hAU/gpzKHrYQtCtlvNV/8pGrrJOnr7pokUvr19cI/+Sru
 P4LTal5dnOfO3NH0BeWU/GDVl/mZnxZjbzpI0n+XOefyD/sdkrwS+S356Q1QQiTEptG6
 JKVDbgNQI/BJVMDxf0oXy2vcBNRoL7P3N9GzrQYx46pojLA+o4/1psGF1V2Vqt5SUXLK
 lNgXeFB7p7MAvMGeykp9y08BBabOYaT9fWgQxnfABOSxSUCuteijkMw0V2IkZJnPP41J
 tD7A==
X-Gm-Message-State: AOAM5307Yng0cHfvT933cmxHA5cwtc+hqfRx4cZJxOiJr0JBCPIqfzmT
 mWnpn4GLdOkl11NDQ6WAU8XzngKJwnQ=
X-Google-Smtp-Source: ABdhPJyMfbKiHcJpnl9T74drAJIHLMi704W36ysddWUy+cZ82nXalFI6MBtTupRrgmwpdowKStqE5g==
X-Received: by 2002:a05:600c:1d18:b0:38f:f19c:37ee with SMTP id
 l24-20020a05600c1d1800b0038ff19c37eemr19353871wms.88.1650358983667; 
 Tue, 19 Apr 2022 02:03:03 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adfb781000000b002060d4a8bd9sm12637516wre.17.2022.04.19.02.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:03:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 11:00:55 +0200
Message-Id: <20220419090055.2029170-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/trinity: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSBvbiBtdXNsOgoKSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIC9udm1lZGF0YS9hdXRvYnVpbGQvaW5zdGFuY2UtMTcvb3V0cHV0LTEvaG9zdC9wb3dl
cnBjNjQtYnVpbGRyb290LWxpbnV4LW11c2wvc3lzcm9vdC91c3IvaW5jbHVkZS9hc20vaW9jdGwu
aDoxMiwKICAgICAgICAgICAgICAgICBmcm9tIC9udm1lZGF0YS9hdXRvYnVpbGQvaW5zdGFuY2Ut
MTcvb3V0cHV0LTEvaG9zdC9wb3dlcnBjNjQtYnVpbGRyb290LWxpbnV4LW11c2wvc3lzcm9vdC91
c3IvaW5jbHVkZS9saW51eC9pb2N0bC5oOjUsCiAgICAgICAgICAgICAgICAgZnJvbSAvbnZtZWRh
dGEvYXV0b2J1aWxkL2luc3RhbmNlLTE3L291dHB1dC0xL2hvc3QvcG93ZXJwYzY0LWJ1aWxkcm9v
dC1saW51eC1tdXNsL3N5c3Jvb3QvdXNyL2luY2x1ZGUvbGludXgvZnMuaDoxNCwKICAgICAgICAg
ICAgICAgICBmcm9tIGlvY3Rscy92ZnMuYzozOgppb2N0bHMvdmZzLmM6MTA5OjM1OiBlcnJvcjog
J2xvZmZfdCcgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5b3UgbWVh
biAnb2ZmX3QnPwogIDEwOSB8ICB7IC5uYW1lID0gIkZJT1FTSVpFIiwgLnJlcXVlc3QgPSBGSU9R
U0laRSwgfSwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn4KCkZpeGVzOgogLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9iN2Y0
NjA3Mjc1MWE4ZDcwZmEwMmYxYzYyNWM1Mjc5ZjcwYmVjODUzCgpTaWduZWQtb2ZmLWJ5OiBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiAuLi4vMDAwMy1V
c2UtZmNudGwtaC1mb3ItZGV2X3QtbW9kZV90LnBhdGNoICAgfCA0NiArKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvdHJpbml0eS8wMDAzLVVzZS1mY250bC1oLWZvci1kZXZfdC1tb2RlX3QucGF0Y2gK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3RyaW5pdHkvMDAwMy1Vc2UtZmNudGwtaC1mb3ItZGV2X3Qt
bW9kZV90LnBhdGNoIGIvcGFja2FnZS90cmluaXR5LzAwMDMtVXNlLWZjbnRsLWgtZm9yLWRldl90
LW1vZGVfdC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5jNGQ5
ODExYjhhCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS90cmluaXR5LzAwMDMtVXNlLWZjbnRs
LWgtZm9yLWRldl90LW1vZGVfdC5wYXRjaApAQCAtMCwwICsxLDQ2IEBACitGcm9tIGIxYTBhZWY5
OTc4ZDRhNDFlN2U2MDFjMjc3ZDRmYjFiMGNmYmVkODkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tOiBEYXZlIEpvbmVzIDxkYXZlakBjb2RlbW9ua2V5Lm9yZy51az4KK0RhdGU6IFRodSwg
MjYgQXVnIDIwMjEgMTE6MTc6MzQgLTA0MDAKK1N1YmplY3Q6IFtQQVRDSF0gVXNlIGZjbnRsLmgg
Zm9yIGRldl90ICYgbW9kZV90CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0
L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisK
K1Nob3VsZCBmaXg6CisKK0luIGZpbGUgaW5jbHVkZWQgZnJvbSAvdXNyL2luY2x1ZGUvYml0cy9z
dGF0eC5oOjMxLAorICAgICAgICAgICAgICAgICBmcm9tIC91c3IvaW5jbHVkZS9zeXMvc3RhdC5o
OjQ0NiwKKyAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2ZpbGVzLmg6MywKKyAgICAgICAg
ICAgICAgICAgZnJvbSBpbmNsdWRlL3NobS5oOjYsCisgICAgICAgICAgICAgICAgIGZyb20gc3lz
Y2FsbHMveDg2L21vZGlmeV9sZHQuYzoxMjoKKy91c3IvaW5jbHVkZS9saW51eC9zdGF0Lmg6NTc6
MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmF9fczY04oCZCisgIF9fczY0IHR2X3NlYzsK
KyAgXn5+fn4KKy91c3IvaW5jbHVkZS9saW51eC9zdGF0Lmg6NTg6MjogZXJyb3I6IHVua25vd24g
dHlwZSBuYW1lIOKAmF9fdTMy4oCZCisgIF9fdTMyIHR2X25zZWM7CisgIF5+fn5+CisvdXNyL2lu
Y2x1ZGUvbGludXgvc3RhdC5oOjU5OjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhfX3Mz
MuKAmQorICBfX3MzMiBfX3Jlc2VydmVkOworICBefn5+fgorL3Vzci9pbmNsdWRlL2xpbnV4L3N0
YXQuaDoxMDE6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmF9fdTMy4oCZCisgIF9fdTMy
IHN0eF9tYXNrOyAvKiBXaGF0IHJlc3VsdHMgd2VyZSB3cml0dGVuIFt1bmNvbmRdICovCisKK1tS
ZXRyaWV2ZWQgZnJvbToKK2h0dHBzOi8vZ2l0aHViLmNvbS9rZXJuZWxzbGFja2VyL3RyaW5pdHkv
Y29tbWl0L2IxYTBhZWY5OTc4ZDRhNDFlN2U2MDFjMjc3ZDRmYjFiMGNmYmVkODldCitTaWduZWQt
b2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KKy0t
LQorIGluY2x1ZGUvZmlsZXMuaCB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL2luY2x1ZGUvZmlsZXMuaCBiL2luY2x1
ZGUvZmlsZXMuaAoraW5kZXggMmE4ZTBlMmQuLmJhM2NjOThmIDEwMDY0NAorLS0tIGEvaW5jbHVk
ZS9maWxlcy5oCisrKysgYi9pbmNsdWRlL2ZpbGVzLmgKK0BAIC0xLDYgKzEsNiBAQAorICNwcmFn
bWEgb25jZQorIAorLSNpbmNsdWRlIDxzeXMvc3RhdC5oPgorKyNpbmNsdWRlIDxmY250bC5oPgor
ICNpbmNsdWRlICJmZC5oIgorIAorIHVuc2lnbmVkIGxvbmcgZ2V0X29fZmxhZ3Modm9pZCk7Ci0t
IAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
