Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D877BC7EE2E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 10:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A7C060F97;
	Tue, 13 Jun 2023 10:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A7C060F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WGfVWx1d571i; Tue, 13 Jun 2023 10:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6DB560F00;
	Tue, 13 Jun 2023 10:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6DB560F00
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 005BE1BF2BE
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 10:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7176409F2
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 10:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7176409F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKnWzYEzften for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 10:50:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14C5B410A7
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14C5B410A7
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 10:50:24 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mgefy-1pdHDk1924-00h9GK; Tue, 13
 Jun 2023 12:50:20 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 12:50:14 +0200
Message-Id: <20230613105015.739870-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230613105015.739870-1-laurent@vivier.eu>
References: <20230613105015.739870-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:RUKAFiq6KUhpTCbXUM68X9+qZG3hMdQnJqhfzokqtOKm3EjXt6V
 5jovQ1r3rrk03Iy+QucVB5rpyJLMptIGU9hFLyUxiI9388c5cOHDsHPn7+xK7aQgvEUISrC
 GLHgeVHVEfEe5NkPe3H9hGyp7v056glAvPzGA+j/B41BoiOxjVL2QgMlY5TJsevXfrehi9G
 U4PxmR69UCWYd+tEtt0+A==
UI-OutboundReport: notjunk:1;M01:P0:HAI+PHdCXTY=;G4BQUuzOYs5ATs12h/WivZfBscz
 ZiQCW0vytgGZXkRsnGgn0fxdhCvWdii37swEzTuNggTB+89hgOsQXNDs05Rzqz87v+Fjn7F2q
 d/XtMII5ddstOPFbjMs6v5UeHwHux2my5TA4ZIrLk3JzgWzbgnubL2mJ8r1maOMA8QM08Stph
 MeG4lDjlCHoNkQ2Fu4M3gMcsN1/VU79ZjmJSYaVg1W2qtDu68yQUyC+2x4Vi3MpRLzkKwa/cq
 fYph8x4qzvxq8fSQVhjFO+2T/6UmEboSIctM8BWZFFrqS/NRpmJfPhXCsT7ch0HjYUmWpQgdS
 v8EE/u0VrltTEZ299e90N0RAPlCJ2RFv+0UABA5JeZ9rnzJtEaKLQv4+rU9rLW+1RZtj0qVam
 6m8mYw+eKnrEP+nsjhOjJr9t4/i9F6GbTgDL+gT9qDoLRyuNwkopPYg1FsipUrk0AuH3zvfZi
 nh4124+QB7NNMW9ZtWJP5AtTu44UjjiYrZy57afs7TQIlAQi1uaDUvQD36+qffOGdZcvg46dC
 kTLi6MLViPbmwZavXC/igQxL6Zc30sWKVrGgRM2X4n6ABXslX9pzmV6DsFt1KsK7GNK0/nRLv
 2iIErnGhA5m/jdy8B80Yiw/v61aU8bLQn5UavAq3or2nS3gZYq0nbJ7zabthoDOa7QUziIDqB
 sXB3gG4xBe1RgJIYcpjoiQ3KzrNXWcDPHSzCdFU+Lg==
Subject: [Buildroot] [PATCH v14 3/4] board/qemu/m68k-virt: Add virt-m68k
 linux config
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVpbGQgYSA1LjE5IChmaXJzdCB2ZXJzaW9uIHdpdGggdGhlIG02OGsgdmlydCBtYWNoaW5lKSBr
ZXJuZWwKZm9yICJxZW11LXN5c3RlbS1tNjhrIC1NIHZpcnQiIG1hY2hpbmUuCgpTaWduZWQtb2Zm
LWJ5OiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+ClJldmlld2VkLWJ5OiBDw6lk
cmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICsrCiBib2FyZC9xZW11L202OGstdmlydC9saW51eC5m
cmFnbWVudCAgICAgICAgfCAyMSArKysrKysrKysrKysrKysrKwogYm9hcmQvcWVtdS9tNjhrLXZp
cnQvcmVhZG1lLnR4dCAgICAgICAgICAgIHwgIDUgKysrKysKIGNvbmZpZ3MvcWVtdV9tNjhrX3Zp
cnRfcGV0aXRib290X2RlZmNvbmZpZyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysKIDQgZmls
ZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3Fl
bXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50CiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvcWVt
dS9tNjhrLXZpcnQvcmVhZG1lLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvcWVtdV9t
NjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZpZwoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9E
RVZFTE9QRVJTCmluZGV4IDdhYTU5ODBkZjdmMy4uODA0YTRjZDJjMWQ2IDEwMDY0NAotLS0gYS9E
RVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTE4MjAsNiArMTgyMCw4IEBAIEY6CXBhY2th
Z2Uvb3Blbi1sbGRwLwogCiBOOglMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+CiBG
OglwYWNrYWdlL3BldGl0Ym9vdC8KK0Y6CWJvYXJkL3FlbXUvbTY4ay12aXJ0LworRjoJY29uZmln
cy9xZW11X202OGtfdmlydF9wZXRpdGJvb3RfZGVmY29uZmlnCiAKIE46CUxlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+CiBGOglib290L2FmYm9vdC1zdG0zMi8KZGlmZiAtLWdpdCBhL2Jv
YXJkL3FlbXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50IGIvYm9hcmQvcWVtdS9tNjhrLXZpcnQv
bGludXguZnJhZ21lbnQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi40
OTQxNjk4MjYwMWMKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9xZW11L202OGstdmlydC9saW51
eC5mcmFnbWVudApAQCAtMCwwICsxLDIxIEBACitDT05GSUdfQkxLX0RFVl9JTklUUkQ9eQorQ09O
RklHX0tFWEVDPXkKK0NPTkZJR19CT09USU5GT19QUk9DPXkKK0NPTkZJR19ERVZUTVBGU19NT1VO
VD15CitDT05GSUdfTUQ9eQorQ09ORklHX01EX0xJTkVBUj15CitDT05GSUdfTURfTVVMVElQQVRI
PXkKK0NPTkZJR19NRF9GQVVMVFk9eQorQ09ORklHX0JMS19ERVZfRE09eQorQ09ORklHX0RNX1VO
U1RSSVBFRD15CitDT05GSUdfRE1fQ1JZUFQ9eQorQ09ORklHX0RNX1NOQVBTSE9UPXkKK0NPTkZJ
R19ETV9USElOX1BST1ZJU0lPTklORz15CitDT05GSUdfRE1fQ0FDSEU9eQorQ09ORklHX0RNX1dS
SVRFQ0FDSEU9eQorQ09ORklHX0RNX0VCUz15CitDT05GSUdfRE1fRVJBPXkKK0NPTkZJR19ETV9D
TE9ORT15CitDT05GSUdfRE1fTUlSUk9SPXkKK0NPTkZJR19ETV9SQUlEPXkKK0NPTkZJR19ETV9a
RVJPPXkKZGlmZiAtLWdpdCBhL2JvYXJkL3FlbXUvbTY4ay12aXJ0L3JlYWRtZS50eHQgYi9ib2Fy
ZC9xZW11L202OGstdmlydC9yZWFkbWUudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uNzE0Yjc0YzcwZWExCi0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvcWVtdS9t
NjhrLXZpcnQvcmVhZG1lLnR4dApAQCAtMCwwICsxLDUgQEAKK1J1biB0aGUgZW11bGF0aW9uIHdp
dGg6CisKKyBxZW11LXN5c3RlbS1tNjhrIC1NIHZpcnQgLWtlcm5lbCBvdXRwdXQvaW1hZ2VzL3Zt
bGludXggLWluaXRyZCBvdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5jcGlvLnh6IC1hcHBlbmQgImNvbnNv
bGU9dHR5R0YwIiAtLW5vZ3JhcGhpYyAjIHFlbXVfbTY4a192aXJ0X3BldGl0Ym9vdF9kZWZjb25m
aWcKKworVGhlIHBldGlib290IG1lbnUgd2lsbCBhcHBlYXIgaW4gdGhlIHRlcm1pbmFsIHdoZXJl
IFFFTVUgaGFzIGJlZW4gc3RhcnRlZC4KZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9tNjhrX3Zp
cnRfcGV0aXRib290X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9tNjhrX3ZpcnRfcGV0aXRib290
X2RlZmNvbmZpZwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjE4ODkw
YjFhNmZjMQotLS0gL2Rldi9udWxsCisrKyBiL2NvbmZpZ3MvcWVtdV9tNjhrX3ZpcnRfcGV0aXRi
b290X2RlZmNvbmZpZwpAQCAtMCwwICsxLDI2IEBACitCUjJfbTY4az15CitCUjJfVE9PTENIQUlO
X0JVSUxEUk9PVF9XQ0hBUj15CitCUjJfQ0NBQ0hFPXkKK0JSMl9SRUxST19OT05FPXkKK0JSMl9U
QVJHRVRfR0VORVJJQ19JU1NVRT0iV2VsY29tZSB0byBQZXRpdGJvb3QiCitCUjJfUk9PVEZTX0RF
VklDRV9DUkVBVElPTl9EWU5BTUlDX0VVREVWPXkKK0JSMl9ST09URlNfTUVSR0VEX1VTUj15CitC
UjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9xZW11L3Bvc3QtaW1hZ2Uuc2giCitC
UjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9IiQoQlIyX0RFRkNPTkZJRykiCitCUjJfTElOVVhf
S0VSTkVMPXkKK0JSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJ2aXJ0IgorQlIyX0xJTlVYX0tF
Uk5FTF9DT05GSUdfRlJBR01FTlRfRklMRVM9ImJvYXJkL3FlbXUvbTY4ay12aXJ0L2xpbnV4LmZy
YWdtZW50IgorQlIyX0xJTlVYX0tFUk5FTF9YWj15CitCUjJfUEFDS0FHRV9CVVNZQk9YX1NIT1df
T1RIRVJTPXkKK0JSMl9QQUNLQUdFX0tFWEVDPXkKK0JSMl9QQUNLQUdFX0tFWEVDX1pMSUI9eQor
QlIyX1BBQ0tBR0VfRVRIVE9PTD15CitCUjJfUEFDS0FHRV9ORVRfVE9PTFM9eQorQlIyX1BBQ0tB
R0VfTkVUQ0FUPXkKK0JSMl9QQUNLQUdFX1JTWU5DPXkKK0JSMl9QQUNLQUdFX1BFVElUQk9PVD15
CitCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkKK0JSMl9UQVJHRVRfUk9PVEZTX0NQSU9fWFo9eQor
IyBob3N0LXFlbXUgZm9yIGdpdGxhYiB0ZXN0aW5nCitCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eQor
QlIyX1BBQ0tBR0VfSE9TVF9RRU1VX1NZU1RFTV9NT0RFPXkKLS0gCjIuNDAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
