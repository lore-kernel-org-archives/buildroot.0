Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD36C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 19:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99051416C7;
	Sat,  5 Nov 2022 19:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99051416C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jBqdhZBO5Ni; Sat,  5 Nov 2022 19:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 870C8416BA;
	Sat,  5 Nov 2022 19:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 870C8416BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2601BF371
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 19:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 400F081A73
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 19:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 400F081A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mfbqmq_yxj-c for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 19:47:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC37681A65
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC37681A65
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 19:47:24 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 98E34240101
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:47:21 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4N4Sgs1hdPz6tmG;
 Sat,  5 Nov 2022 20:47:21 +0100 (CET)
From: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero@schwaericke.email>
To: buildroot@buildroot.org
Date: Sat,  5 Nov 2022 19:47:12 +0000
Message-Id: <20221105194712.541286-1-gero@schwaericke.email>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/cubietech/cubieboard1: add Cubieboard 1
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
Cc: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero@schwaericke.email>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qm9hcmQgc3VwcG9ydCBmb3IgdGhlIEN1YmllYm9hcmQgMSBmcm9tIEN1YmlldGVjaC4gQmFzZWQg
dGhlIGNvbmZpZyBmb3IKQ3ViaWVib2FyZCAyIGFuZCB0aGUgT2xpbWV4IEExMC1PTGludVhpbm8t
TElNRSB3aGljaCBpcyBhbHNvIGFuCkFsbHdpbm5lciBBMTAgYm9hcmQgKHN1bnhpIGtlcm5lbCku
CgpTaWduZWQtb2ZmLWJ5OiBHZXJvIFNjaHfDpHJpY2tlIDxnZXJvQHNjaHdhZXJpY2tlLmVtYWls
PgotLS0KIGJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMS9ib290LmNtZCAgICAgfCAgNyArKysr
KwogYm9hcmQvY3ViaWV0ZWNoL2N1YmllYm9hcmQxL2dlbmltYWdlLmNmZyB8IDM2ICsrKysrKysr
KysrKysrKysrKysrKysKIGNvbmZpZ3MvY3ViaWVib2FyZDFfZGVmY29uZmlnICAgICAgICAgICAg
fCAzOSArKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgODIgaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMS9i
b290LmNtZAogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMS9n
ZW5pbWFnZS5jZmcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2N1YmllYm9hcmQxX2RlZmNv
bmZpZwoKZGlmZiAtLWdpdCBhL2JvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMS9ib290LmNtZCBi
L2JvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMS9ib290LmNtZApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi5lZWZiZGM4MTY5Ci0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQv
Y3ViaWV0ZWNoL2N1YmllYm9hcmQxL2Jvb3QuY21kCkBAIC0wLDAgKzEsNyBAQAorIyBiYXNlZCBv
biBib2FyZC9jdWJpZWJvYXJkMi9ib290LmNtZAorCitzZXRlbnYgZmR0X2hpZ2ggZmZmZmZmZmYK
K3NldGVudiBib290YXJncyBjb25zb2xlPXR0eVMwLDExNTIwMCBlYXJseXByaW50ayByb290PS9k
ZXYvbW1jYmxrMHAyIHJvb3R3YWl0CitmYXRsb2FkIG1tYyAwICRrZXJuZWxfYWRkcl9yIHpJbWFn
ZQorZmF0bG9hZCBtbWMgMCAkZmR0X2FkZHJfciBzdW40aS1hMTAtY3ViaWVib2FyZC5kdGIKK2Jv
b3R6ICRrZXJuZWxfYWRkcl9yIC0gJGZkdF9hZGRyX3IKZGlmZiAtLWdpdCBhL2JvYXJkL2N1Ymll
dGVjaC9jdWJpZWJvYXJkMS9nZW5pbWFnZS5jZmcgYi9ib2FyZC9jdWJpZXRlY2gvY3ViaWVib2Fy
ZDEvZ2VuaW1hZ2UuY2ZnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjJl
ZDRkZGU5NTEKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9jdWJpZXRlY2gvY3ViaWVib2FyZDEv
Z2VuaW1hZ2UuY2ZnCkBAIC0wLDAgKzEsMzYgQEAKKyMgYmFzZWQgb24gYm9hcmQvY3ViaWVib2Fy
ZDIvZ2VuaW1hZ2UuY2ZnCisKK2ltYWdlIGJvb3QudmZhdCB7CisJdmZhdCB7CisJCWZpbGVzID0g
eworCQkJInpJbWFnZSIsCisJCQkic3VuNGktYTEwLWN1YmllYm9hcmQuZHRiIiwKKwkJCSJib290
LnNjciIKKwkJfQorCX0KKworCXNpemUgPSAxNk0KK30KKworaW1hZ2Ugc2RjYXJkLmltZyB7CisJ
aGRpbWFnZSB7CisJfQorCisJcGFydGl0aW9uIHUtYm9vdCB7CisJCWluLXBhcnRpdGlvbi10YWJs
ZSA9ICJubyIKKwkJaW1hZ2UgPSAidS1ib290LXN1bnhpLXdpdGgtc3BsLmJpbiIKKwkJb2Zmc2V0
ID0gOEsKKwkJc2l6ZSA9IDEwMTZLICMgMU1CIC0gOEtCCisJfQorCisJcGFydGl0aW9uIGJvb3Qg
eworCQlwYXJ0aXRpb24tdHlwZSA9IDB4QworCQlib290YWJsZSA9ICJ0cnVlIgorCQlpbWFnZSA9
ICJib290LnZmYXQiCisJfQorCisJcGFydGl0aW9uIHJvb3RmcyB7CisJCXBhcnRpdGlvbi10eXBl
ID0gMHg4MworCQlpbWFnZSA9ICJyb290ZnMuZXh0NCIKKwl9Cit9CmRpZmYgLS1naXQgYS9jb25m
aWdzL2N1YmllYm9hcmQxX2RlZmNvbmZpZyBiL2NvbmZpZ3MvY3ViaWVib2FyZDFfZGVmY29uZmln
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjYwMWQ0YWIzOGMKLS0tIC9k
ZXYvbnVsbAorKysgYi9jb25maWdzL2N1YmllYm9hcmQxX2RlZmNvbmZpZwpAQCAtMCwwICsxLDM5
IEBACisjIEFyY2hpdGVjdHVyZQorQlIyX2FybT15CitCUjJfY29ydGV4X2E4PXkKKworIyBUb29s
Y2hhaW4gb3B0aW9ucworQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzA9
eQorCisjIEJvb3Rsb2FkZXIKK0JSMl9UQVJHRVRfVUJPT1Q9eQorQlIyX1RBUkdFVF9VQk9PVF9D
VVNUT01fVkVSU0lPTj15CitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIy
MDIyLjA0IgorQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15CitCUjJfVEFS
R0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0iQ3ViaWVib2FyZCIKK0JSMl9UQVJHRVRfVUJPT1Rf
TkVFRFNfUFlMSUJGRFQ9eQorQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMPXkKK0JSMl9U
QVJHRVRfVUJPT1RfU1BMPXkKK0JSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUU9InUtYm9vdC1zdW54
aS13aXRoLXNwbC5iaW4iCitCUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTPXkKK0JSMl9QQUNL
QUdFX0hPU1RfVUJPT1RfVE9PTFNfQk9PVF9TQ1JJUFQ9eQorQlIyX1BBQ0tBR0VfSE9TVF9VQk9P
VF9UT09MU19CT09UX1NDUklQVF9TT1VSQ0U9ImJvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMS9i
b290LmNtZCIKKworIyBLZXJuZWwKK0JSMl9MSU5VWF9LRVJORUw9eQorQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fVkVSU0lPTj15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSI2LjAuMSIKK0JSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJzdW54aSIKK0JSMl9MSU5VWF9L
RVJORUxfRFRTX1NVUFBPUlQ9eQorQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InN1
bjRpLWExMC1jdWJpZWJvYXJkIgorCisjIEZpbGVzeXN0ZW0KK0JSMl9UQVJHRVRfUk9PVEZTX0VY
VDI9eQorQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKK0JSMl9ST09URlNfUE9TVF9JTUFHRV9T
Q1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKK0JSMl9ST09URlNfUE9TVF9TQ1JJ
UFRfQVJHUz0iLWMgYm9hcmQvY3ViaWV0ZWNoL2N1YmllYm9hcmQxL2dlbmltYWdlLmNmZyIKKwor
IyBIb3N0IFJlcXVpcmVtZW50cworQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15CitCUjJfUEFD
S0FHRV9IT1NUX0RPU0ZTVE9PTFM9eQorQlIyX1BBQ0tBR0VfSE9TVF9NVE9PTFM9eQotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
