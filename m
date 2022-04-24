Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BD9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 00:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE73040328;
	Mon, 25 Apr 2022 00:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKX2v12qlYP3; Mon, 25 Apr 2022 00:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B145C40292;
	Mon, 25 Apr 2022 00:03:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03C621BF968
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 00:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E652F81990
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 00:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=yuriev.ru
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qEm2CsUUArU5 for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 00:03:49 +0000 (UTC)
X-Greylist: delayed 00:07:09 by SQLgrey-1.8.0
Received: from forward106p.mail.yandex.net (forward106p.mail.yandex.net
 [77.88.28.109])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9E1F8197D
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 00:03:48 +0000 (UTC)
Received: from myt5-4d7a402984d6.qloud-c.yandex.net
 (myt5-4d7a402984d6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1fa2:0:640:4d7a:4029])
 by forward106p.mail.yandex.net (Yandex) with ESMTP id 49EA22FC1200
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 02:56:34 +0300 (MSK)
Received: from myt5-aad1beefab42.qloud-c.yandex.net
 (myt5-aad1beefab42.qloud-c.yandex.net [2a02:6b8:c12:128:0:640:aad1:beef])
 by myt5-4d7a402984d6.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 YCySKfhw3q-uYg0UYm4; Mon, 25 Apr 2022 02:56:34 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yuriev.ru; s=mail;
 t=1650844594; bh=83xtX2slLiSON9KN/vp1ZfSzXlICnm30bfnyIyQpEy4=;
 h=Date:Subject:Cc:To:From:Message-Id;
 b=mvYsX70rd43RLoc09rKHbPyRmrvQhJnSqjceupUD0L5+F4E5Yp+jzNb1W6qlzQhfR
 S1YNNRzmIznwmiad61g1G0borppygdqudRLIuX8cgUDtvGsIqnBNzquYsrwvQzfbhm
 4eeRIt+MLxqXhZOwzXtnRoVFIAvLYG+CiNS8mTqc=
Authentication-Results: myt5-4d7a402984d6.qloud-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Received: by myt5-aad1beefab42.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id yf0hXBcWMB-uXMqxmFp; Mon, 25 Apr 2022 02:56:33 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 02:56:15 +0300
Message-Id: <20220424235618.471682-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmdbx: bump version to 0.11.7
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
YW5jaGVzIG9mIGJ1aWxkcm9vdC4KClJlbGVhc2Ugbm90ZXMgZm9yIHYwLjExLjcgaHR0cHM6Ly9n
aXRmbGljLnJ1L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4L3JlbGVhc2UvOTBlYzk5ODUtY2Q2MC00
ZDlhLThjOTgtODQxNzUwNmZkMjZkCgpUaGUgY29tcGxldGUgQ2hhbmdlTG9nOiBodHRwczovL2dp
dGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvYmxvYj9maWxlPUNoYW5nZUxvZy5tZAoK
U2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYpIDxs
ZW9AeXVyaWV2LnJ1PgotLS0KIHBhY2thZ2UvbGlibWRieC9Db25maWcuaW4gICAgfCAyICstCiBw
YWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL2xpYm1kYngvbGli
bWRieC5tayAgIHwgNiArKystLS0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9Db25maWcuaW4gYi9w
YWNrYWdlL2xpYm1kYngvQ29uZmlnLmluCmluZGV4IGQxM2Y3MzkzOGYuLjJjZGU3ZWQ1ZTkgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvbGlibWRieC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9saWJtZGJ4
L0NvbmZpZy5pbgpAQCAtMTMsNyArMTMsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElCTURCWAog
CSAgbGlibWRieCBzdXJwYXNzZXMgdGhlIGxlZ2VuZGFyeSBMTURCIGluIHRlcm1zIG9mCiAJICBy
ZWxpYWJpbGl0eSwgZmVhdHVyZXMgYW5kIHBlcmZvcm1hbmNlLgogCi0JICBodHRwczovL2dpdGh1
Yi5jb20vZXJ0aGluay9saWJtZGJ4CisJICBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRo
aW5rL2xpYm1kYngKIAogaWYgQlIyX1BBQ0tBR0VfTElCTURCWAogCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2xpYm1kYngvbGlibWRieC5oYXNoIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaApp
bmRleCAyNDgzZDE0ZGQxLi43ZDY2M2IzZGEwIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm1kYngv
bGlibWRieC5oYXNoCisrKyBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKQEAgLTEsNSAr
MSw1IEBACi0jIEhhc2hlcyBmcm9tOiBodHRwczovL2dpdGh1Yi5jb20vZXJ0aGluay9saWJtZGJ4
L3JlbGVhc2VzLwotc2hhMjU2ICA4ODRkZTUyOGY1YzJhYmFiMjE4N2I3YzRjODRiNzY5ZDI1NTFl
MWE3NDhjYmZkZjBhZTRjMGY1YzlmOGRiZDI3ICBsaWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTEuNC50
YXIuZ3oKKyMgSGFzaGVzIGZyb206IGh0dHBzOi8vbGlibWRieC53ZWJzaXRlLnlhbmRleGNsb3Vk
Lm5ldC9yZWxlYXNlL1NIQTI1NlNVTVMKK3NoYTI1NiAgM2E5ZmI2YTRjZDk0MWU2NDY1OTcyMzU1
MTg3MTQzNzNmZGExY2E2ZDRjNWUyMzY2OWFmZTcwZWE4N2MyMDk0MCAgbGlibWRieC1hbWFsZ2Ft
YXRlZC0wLjExLjcudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYgIDMxMGZl
MjVjODU4YTk1MTVmYzhjOGQ3ZDFmMjRhNjdjOTQ5NmY4NGE5MWUwYTBlNDFlYTk5NzViMTM3MWU1
NjkgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rIGIvcGFj
a2FnZS9saWJtZGJ4L2xpYm1kYngubWsKaW5kZXggMWFmZjhmYmI0ZC4uYTcwNTZiMjg1MCAxMDA2
NDQKLS0tIGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsKKysrIGIvcGFja2FnZS9saWJtZGJ4
L2xpYm1kYngubWsKQEAgLTQsOSArNCw5IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwog
Ci1MSUJNREJYX1ZFUlNJT04gPSAwLjExLjQKLUxJQk1EQlhfU09VUkNFID0gbGlibWRieC1hbWFs
Z2FtYXRlZC0kKExJQk1EQlhfVkVSU0lPTikudGFyLmd6Ci1MSUJNREJYX1NJVEUgPSBodHRwczov
L2dpdGh1Yi5jb20vZXJ0aGluay9saWJtZGJ4L3JlbGVhc2VzL2Rvd25sb2FkL3YkKExJQk1EQlhf
VkVSU0lPTikKK0xJQk1EQlhfVkVSU0lPTiA9IDAuMTEuNworTElCTURCWF9TT1VSQ0UgPSBsaWJt
ZGJ4LWFtYWxnYW1hdGVkLSQoTElCTURCWF9WRVJTSU9OKS50YXIueHoKK0xJQk1EQlhfU0lURSA9
IGh0dHBzOi8vbGlibWRieC53ZWJzaXRlLnlhbmRleGNsb3VkLm5ldC9yZWxlYXNlCiBMSUJNREJY
X1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCiBMSUJNREJYX0xJQ0VOU0UgPSBPTERBUC0y
LjgKIExJQk1EQlhfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuMzYuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
