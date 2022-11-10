Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A09C4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 11:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08C4D60EA6;
	Thu, 10 Nov 2022 11:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08C4D60EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a6VOZzJSFSJL; Thu, 10 Nov 2022 11:18:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CF6860E5F;
	Thu, 10 Nov 2022 11:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CF6860E5F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53B871BF423
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 11:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A3E2410A3
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 11:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A3E2410A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wTf6XKgvzIw for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 11:18:22 +0000 (UTC)
X-Greylist: delayed 00:06:59 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7525740896
Received: from forward107o.mail.yandex.net (forward107o.mail.yandex.net
 [37.140.190.210])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7525740896
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 11:18:20 +0000 (UTC)
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
 by forward107o.mail.yandex.net (Yandex) with ESMTP id 255A76AFEE25
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 14:11:13 +0300 (MSK)
Received: from vla5-1ef2161cc1d7.qloud-c.yandex.net
 (vla5-1ef2161cc1d7.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3607:0:640:1ef2:161c])
 by forward103q.mail.yandex.net (Yandex) with ESMTP id 2161056A0002
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 14:11:13 +0300 (MSK)
Received: by vla5-1ef2161cc1d7.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 6hmK98isul-BCZWQ0BV; Thu, 10 Nov 2022 14:11:12 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Thu, 10 Nov 2022 14:11:08 +0300
Message-Id: <20221110111109.99724-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; t=1668078672; 
 bh=U75v463cqW/XYPePS9ZH1OCjGLy113bsN/hSqQGXUSI=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=gMjIVCqMq7b395WZpnJP2vLwS3tbfAtjpNTun1SBff2/GR8Z4P8O1woWwcYidq2ud
 OFXKBZ9VZwPoW5xWz7C2xtJmYarLpx9dNN46KbtToecCanydg8hbeSqEBz5CCEVYmB
 r3UrSQ5a4QiFMKb3kUzO4+9aXZEHogycoRfbx0rc=
X-Mailman-Original-Authentication-Results: vla5-1ef2161cc1d7.qloud-c.yandex.net; dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.13
 "Swashplate"
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
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBzdGFibGUgYnVnZml4IHJlbGVhc2Ugb2YgbGlibWRieCwgaW4gRmFtaWx5IEdsb3J5
IGFuZAppbiBtZW1vcnkgb2YgQm9yaXMgWXVyaWV2ICh0aGUgaW52ZW50b3Igb2YgSGVsaWNvcHRl
ciBhbmQKU3dhc2hwbGF0ZSBpbiAxOTExKSBvbiBoaXMgMTMzcmQgYmlydGhkYXkuCgpJdCBpcyBy
ZWFzb25hYmxlIHRvIGJhY2twb3J0IHRoaXMgcGF0Y2ggdG8gYWxsIGFwcGxpY2FibGUgcmVsZWFz
ZXMvYnJhbmNoZXMgb2YgQnVpbGRyb290LgoKUmVsZWFzZSBub3RlcyBmb3IgdjAuMTEuMTMKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkZpeGVzOgoKIC0gRml4ZWQgYnVpbGRzIHdpdGggb2xk
ZXIgbGliYyB2ZXJzaW9ucyBhZnRlciB1c2luZyBgZmNudGw2NCgpYCAoYmFja3BvcnQpLgogLSBG
aXhlZCBidWlsZHMgd2l0aCAgb2xkZXIgYHN0ZGF0b21pYy5oYCB2ZXJzaW9ucywKICAgd2hlcmUg
dGhlIGBBVE9NSUNfKl9MT0NLX0ZSRUVgIG1hY3JvcyBtaXN0YWtlbmx5IHJlZGVmaW5lZCB1c2lu
ZyBmdW5jdGlvbnMgKGJhY2twb3J0KS4KIC0gQWRkZWQgd29ya2Fyb3VuZCBmb3IgYG1yZW1hcCgp
YCBkZWZlY3QgdG8gYXZvaWQgYXNzZXJ0aW9uIGZhaWx1cmUgKGJhY2twb3J0KS4KIC0gV29ya2Fy
b3VuZCBmb3IgYGVuY3J5cHRmc2AgYnVnKHMpIGluIHRoZSBgY29weV9maWxlX3JhbmdlYCBpbXBs
ZW1lbnRhdGlvbiAgKGJhY2twb3J0KS4KIC0gRml4ZWQgdW5leHBlY3RlZCBgTURCWF9CVVNZYCBm
cm9tIGBtZGJ4X2Vudl9zZXRfb3B0aW9uKClgLCBgbWRieF9lbnZfc2V0X3N5bmNieXRlcygpYAog
ICBhbmQgYG1kYnhfZW52X3NldF9zeW5jcGVyaW9kKClgIChiYWNrcG9ydCkuCiAtIENNYWtlIHJl
cXVpcmVtZW50cyBsb3dlcmVkIHRvIHZlcnNpb24gMy4wLjIgKGJhY2twb3J0KS4KIC0gQWRkZWQg
YWRtb25pdGlvbiBvZiBpbnNlY3VyZSBmb3IgUklTQy1WIChiYWNrcG9ydCkuCgpNaW5vcnM6Cgog
LSBNaW5vciBjbGFyaWZpY2F0aW9uIG91dHB1dCBvZiBgLS1oZWxwYCBmb3IgYG1kYnhfdGVzdGAg
KGJhY2twb3J0KS4KIC0gQWRkZWQgYWRtb25pdGlvbiBvZiBpbnNlY3VyZSBmb3IgUklTQy1WIChi
YWNrcG9ydCkuCiAtIFN0b2NoYXN0aWMgc2NyaXB0cyBhbmQgQ01ha2UgZmlsZXMgc3luY2hyb25p
emVkIHdpdGggdGhlIGBkZXZlbGAgYnJhbmNoLgogLSBVc2UgYC0tZG9udC1jaGVjay1yYW0tc2l6
ZWAgZm9yIHNtYWxsLXRlc3RzIG1ha2UtdGFyZ2V0cyAoYmFja3BvcnQpLgoKVGhlIGNvbXBsZXRl
IENoYW5nZUxvZzogaHR0cHM6Ly9naXRmbGljLnJ1L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4L2Js
b2I/ZmlsZT1DaGFuZ2VMb2cubWQKClNpZ25lZC1vZmYtYnk6INCb0LXQvtC90LjQtCDQrtGA0YzQ
tdCyIChMZW9uaWQgWXVyaWV2KSA8bGVvQHl1cmlldi5ydT4KLS0tCiBwYWNrYWdlL2xpYm1kYngv
bGlibWRieC5oYXNoIHwgMiArLQogcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2ggYi9wYWNrYWdlL2xpYm1kYngvbGli
bWRieC5oYXNoCmluZGV4IDc5YWYxODk2MzMuLmUzZmIzMDk0NjEgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKKysrIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFz
aApAQCAtMSw1ICsxLDUgQEAKICMgSGFzaGVzIGZyb206IGh0dHBzOi8vbGlibWRieC5kcWRrZmEu
cnUvcmVsZWFzZS9TSEEyNTZTVU1TCi1zaGEyNTYgIGRkZThmMzYyNjUwOWJiNzY0YjE3YzkzZmUw
NjI5Mzg5NjI1Y2I1MDM2MjUwMmViMWMyN2NhMjA4MzQyZjM4OTQgIGxpYm1kYngtYW1hbGdhbWF0
ZWQtMC4xMS4xMi50YXIueHoKK3NoYTI1NiAgOTQ0OWZkMzU3MTE5ZTE5OTAyMzYzYWI5MDEzNGQ4
MmM5YTcxM2I3MDYzOTRjMmExMzg5YjViYjQ3ODdiNTE2NCAgbGlibWRieC1hbWFsZ2FtYXRlZC0w
LjExLjEzLnRhci54egogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAzMTBmZTI1Yzg1
OGE5NTE1ZmM4YzhkN2QxZjI0YTY3Yzk0OTZmODRhOTFlMGEwZTQxZWE5OTc1YjEzNzFlNTY5ICBM
SUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tayBiL3BhY2thZ2Uv
bGlibWRieC9saWJtZGJ4Lm1rCmluZGV4IGFjMWEzYTBkNmYuLmExMzllMDYyZjYgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rCisrKyBiL3BhY2thZ2UvbGlibWRieC9saWJt
ZGJ4Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElC
TURCWF9WRVJTSU9OID0gMC4xMS4xMgorTElCTURCWF9WRVJTSU9OID0gMC4xMS4xMwogTElCTURC
WF9TT1VSQ0UgPSBsaWJtZGJ4LWFtYWxnYW1hdGVkLSQoTElCTURCWF9WRVJTSU9OKS50YXIueHoK
IExJQk1EQlhfU0lURSA9IGh0dHBzOi8vbGlibWRieC5kcWRrZmEucnUvcmVsZWFzZQogTElCTURC
WF9TVVBQT1JUU19JTl9TT1VSQ0VfQlVJTEQgPSBOTwotLSAKMi4zNC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
