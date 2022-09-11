Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6469C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 20:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B25844F3;
	Sun, 11 Sep 2022 20:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B25844F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yS-YlBjdrOYe; Sun, 11 Sep 2022 20:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45F7F844ED;
	Sun, 11 Sep 2022 20:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45F7F844ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F5951BF4E2
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 20:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB866424DC
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 20:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB866424DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqQBDWldbKUQ for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 20:37:13 +0000 (UTC)
X-Greylist: delayed 00:10:17 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A27741E44
Received: from forward105p.mail.yandex.net (forward105p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:108])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A27741E44
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 20:37:12 +0000 (UTC)
Received: from myt6-265321db07ea.qloud-c.yandex.net
 (myt6-265321db07ea.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:2626:0:640:2653:21db])
 by forward105p.mail.yandex.net (Yandex) with ESMTP id 460CB2FD8A5F
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 23:19:56 +0300 (MSK)
Received: by myt6-265321db07ea.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id bRgSRBemCE-JtiqHpjb; Sun, 11 Sep 2022 23:19:55 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 23:19:35 +0300
Message-Id: <20220911201936.2205800-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; t=1662927595; 
 bh=AifQbL4At/WE7R1WGGXBsDGgxYhcV6jqWl0oqm+yp3M=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=VeIKGXT37uM+Hy5KQtw/goMVW3eJBuy8Kw3ry1NQqNW1VnP7bNM+8U85TFNqbdYRn
 eZIJEw5BSnx9vM45A8+hQfB+R1r4XuO7gr8n4+RaGOstI0V0IU7tCz1G1lMHhUbupb
 TRJLw3zGcMrlq4mKZeTzPOqevvgj29NWQFHHCFhU=
X-Mailman-Original-Authentication-Results: myt6-265321db07ea.qloud-c.yandex.net; dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.11
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

VGhpcyBpcyBzdGFibGUgYnVnZml4IHJlbGVhc2Ugb2YgbGlibWRieC4gU28gaXQgaXMgcmVhc29u
YWJsZSB0byBiYWNrcG9ydAp0aGlzIHBhdGNoIHRvIGFsbCBhcHBsaWNhYmxlIHJlbGVhc2VzL2Jy
YW5jaGVzIG9mIEJ1aWxkcm9vdC4KClJlbGVhc2Ugbm90ZXMgc2luY2UgdjAuMTEuODoKIC0gZm9y
IHYwLjExLjkgIGh0dHBzOi8vZ2l0ZmxpYy5ydS9wcm9qZWN0L2VydGhpbmsvbGlibWRieC9yZWxl
YXNlLzQ3NDI2NzFlLWE2OTEtNDVhNS04OGRlLWM2MzQxZjc2MmQwYgogLSBmb3IgdjAuMTEuMTAg
aHR0cHM6Ly9naXRmbGljLnJ1L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4L3JlbGVhc2UvMjg4NmRh
ZWItZjU4My00YzMwLWJlZGUtYjhlNjA5NjVjODM0CiAtIGZvciB2MC4xMS4xMSBodHRwczovL2dp
dGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvcmVsZWFzZS83ZjFhMDI2ZC0yOGFhLTRk
OTItYTFlMC1hMWE3NWViZTBiM2QKClRoZSBjb21wbGV0ZSBDaGFuZ2VMb2c6IGh0dHBzOi8vZ2l0
ZmxpYy5ydS9wcm9qZWN0L2VydGhpbmsvbGlibWRieC9ibG9iP2ZpbGU9Q2hhbmdlTG9nLm1kCgpT
aWduZWQtb2ZmLWJ5OiDQm9C10L7QvdC40LQg0K7RgNGM0LXQsiAoTGVvbmlkIFl1cmlldikgPGxl
b0B5dXJpZXYucnU+Ci0tLQogcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCB8IDQgKysrKwog
cGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4
L2xpYm1kYnguaGFzaCBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKaW5kZXggM2YyYmUx
MzRjMy4uMDcyZTRiYmU2NSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFz
aAorKysgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoCkBAIC0xLDQgKzEsOCBAQAogIyBI
YXNoZXMgZnJvbTogaHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9yZWxlYXNlL1NIQTI1NlNVTVMK
K3NoYTI1NiAgZDJjODFkYjcxNmEzM2QwMDdjYzc1NzAyZWNmM2M0NWNmYjdjMzNhMjI2MWZiYWNj
ZWQ2OTQ1MjA0ZWNlMWI2NyAgbGlibWRieC1hbWFsZ2FtYXRlZC0wLjExLjExLnRhci54egorc2hh
MjU2ICBkNDk4ZjJlYmJmZDk2OTUyZmJmN2FjMjFhOTY1ZDQyZjZhOTgwZDFmNGYzY2Y3YWVhZTg1
ODBkNTQ4NTViNjUxICBsaWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTIuMS50YXIueHoKK3NoYTI1NiAg
ZTA0ZGIzOTZmMTBhMWM1NTBiMTJhMTgxZjg4OTIwYThmMmI0ZDYyNGI2YjhmNjc0Mjk0YTQ2MjBi
NWNhNzA3OSAgbGlibWRieC1hbWFsZ2FtYXRlZC0wLjExLjEwLnRhci54egorc2hhMjU2ICBhYTFk
MjZmZTdlMWE0MWI2N2M2NjI2Mjc0MmZiOWZkOGU4ZDk2ODZhMzQzZjBlZjY5M2E1Yjk3OWIwZWFk
YWQyICBsaWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTEuOS50YXIueHoKIHNoYTI1NiAgMDYwMTFmMzYx
NDgxZWU3YWRjMjExMWU0OGI3YjEyMTM4NDI5NGUwYjZiOGYxMGM3NWU3ODg2NjI5Mjk3YjI3OSAg
bGlibWRieC1hbWFsZ2FtYXRlZC0wLjExLjgudGFyLnh6CiBzaGEyNTYgIDNhOWZiNmE0Y2Q5NDFl
NjQ2NTk3MjM1NTE4NzE0MzczZmRhMWNhNmQ0YzVlMjM2NjlhZmU3MGVhODdjMjA5NDAgIGxpYm1k
YngtYW1hbGdhbWF0ZWQtMC4xMS43LnRhci54egogCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1k
YngvbGlibWRieC5tayBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rCmluZGV4IDEzMGZlOTY3
OTMuLjAxOGMwZGI4NDAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rCisr
KyBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotTElCTURCWF9WRVJTSU9OID0gMC4xMS44CitMSUJNREJYX1ZF
UlNJT04gPSAwLjExLjExCiBMSUJNREJYX1NPVVJDRSA9IGxpYm1kYngtYW1hbGdhbWF0ZWQtJChM
SUJNREJYX1ZFUlNJT04pLnRhci54egogTElCTURCWF9TSVRFID0gaHR0cHM6Ly9saWJtZGJ4LmRx
ZGtmYS5ydS9yZWxlYXNlCiBMSUJNREJYX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCi0t
IAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
