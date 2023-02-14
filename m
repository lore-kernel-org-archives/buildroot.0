Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C5BC61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 15:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DABF40315;
	Tue, 14 Feb 2023 15:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DABF40315
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkTkuUIYHrrR; Tue, 14 Feb 2023 15:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B914C4035C;
	Tue, 14 Feb 2023 15:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B914C4035C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1B4F1BF852
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 15:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CBC8404F4
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 15:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CBC8404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJZyUnONcPOC for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 15:57:43 +0000 (UTC)
X-Greylist: delayed 00:05:20 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40B9140116
Received: from forward104j.mail.yandex.net (forward104j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::107])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40B9140116
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 15:57:42 +0000 (UTC)
Received: from sas8-838e1e461505.qloud-c.yandex.net
 (sas8-838e1e461505.qloud-c.yandex.net
 [IPv6:2a02:6b8:c1b:28d:0:640:838e:1e46])
 by forward104j.mail.yandex.net (Yandex) with ESMTP id C102F2F99EF9
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 18:51:41 +0300 (MSK)
Received: by sas8-838e1e461505.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id cplhq91YmiE1-5qMUR5M5; Tue, 14 Feb 2023 18:51:40 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 18:51:29 +0300
Message-Id: <20230214155129.679711-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; t=1676389901; 
 bh=xIcpW88r+3G4/Cpl27T5oeuCOxxjklrCnY4JB40pdbY=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=m0M4NWxtdPEwDkbjUzGV1n9of+JD8EAS8Ew3ZjvD2rjjwZIRgqI3PTFThsd6P/iTl
 WEkfso3zq85ByFdIVNH3n4wITj2IkkV43yNJGFCIZ1uLT+A/NDHgID9rphrHvW+Dxk
 mSYlEfOws0rNIqQWs5fekY2qsIjxiWee2YCgZRRg=
X-Mailman-Original-Authentication-Results: sas8-838e1e461505.qloud-c.yandex.net; dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.14
 "Sergey Kapitsa"
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

VGhpcyBpcyBzdGFibGUgYnVnZml4IHJlbGVhc2Ugb2YgbGlibWRieCwKaW4gbWVtb3J5IG9mIFNl
cmdleSBLYXBpdHNhIChSdXNzaWFuIHBoeXNpY2lzdCBhbmQgZGVtb2dyYXBoZXIpIG9uIGhpcyA5
NXRoIGJpcnRoZGF5LgoKSXQgaXMgcmVhc29uYWJsZSB0byBiYWNrcG9ydCB0aGlzIHBhdGNoIHRv
IGFsbCBhcHBsaWNhYmxlIHJlbGVhc2VzL2JyYW5jaGVzIG9mIEJ1aWxkcm9vdCwKYXQgbGVhc3Qg
dGhpcyByZWxlYXNlIGZpeGVzIGJ1aWxkIGZvciBzaDQgYXJjaC4KClJlbGVhc2Ugbm90ZXMgZm9y
IHYwLjExLjE0Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpGaXhlczoKCiAtIGJhY2twb3J0
OiBSZWZpbmVkIHRoZSBgX19jb2xkYC9gX19ob3RgIG1hY3JvcyB0byBhdm9pZCB0aGUKICAgYGVy
cm9yOiBpbmxpbmluZyBmYWlsZWQgaW4gY2FsbCB0byDigJhhbHdheXNfaW5saW5lIEZPTyguLi4p
4oCZOiB0YXJnZXQgc3BlY2lmaWMgb3B0aW9uIG1pc21hdGNoYAogICBpc3N1ZSBkdXJpbmcgYnVp
bGQgdXNpbmcgR0NDID4xMC54IGZvciBTSDQgYXJjaC4KICAgQWN0dWFsbHkgdGhpcyBpcyBHQ0Mn
IFNINC1iYWNrZW5kIGJ1ZyB3aGljaCB0cmlnZ2VyZWQgYnkgdGhlIGBfX2F0dHJpYnV0ZV9fKChf
X29wdGltaXplX18oIk9zIikpKWAKICAgdXNlZCBpbiBjb25qdW5jdGlvbiB3aXRoIHRoZSBgX19h
dHRyaWJ1dGVfXygoX19jb2xkX18pKWAuCgogLSBiYWNrcG9ydDogRml4ZWQgYFNJR1NFR1ZgIG9y
IGFuIGVycm9uZW91cyBjYWxsIHRvIGBmcmVlKClgIGluIGNhc2Ugd2hlcmUKICAgZXJyb3JzIG9j
Y3VyIHdoZW4gcmVvcGVuaW5nIGJ5IGBtZGJ4X2Vudl9vcGVuKClgIG9mIGEgcHJldmlvdXNseSB1
c2VkCiAgIGVudmlyb25tZW50LgoKIC0gYmFja3BvcnQ6IEZpeGVkIGBjdXJzb3JfcHV0X25vY2hl
Y2tsZW4oKWAgaW50ZXJuYWxzIGZvciBjYXNlIHdoZW4gZHVwc29ydCdlZCBuYW1lZCBzdWJEYgog
ICBjb250YWlucyBhIHNpbmdsZSBrZXkgd2l0aCBtdWx0aXBsZSB2YWx1ZXMgKGFrYSBkdXBsaWNh
dGVzKSwgd2hpY2ggYXJlIHJlcGxhY2VkCiAgIHdpdGggYSBzaW5nbGUgdmFsdWUgYnkgcHV0LW9w
ZXJhdGlvbiB3aXRoIHRoZSBgTURCWF9VUFNFUlQrTURCWF9BTExEVVBTYCBmbGFncy4KICAgSW4g
dGhpcyBjYXNlLCB0aGUgZGF0YWJhc2UgYmVjb21lcyBjb21wbGV0ZWx5IGVtcHR5LCB3aXRob3V0
IGFueSBwYWdlcy4KICAgSG93ZXZlciBleGFjdGx5IHRoaXMgY29uZGl0aW9uIHdhcyBub3QgY29u
c2lkZXJlZCBhbmQgdGh1cyB3YXNuJ3QgaGFuZGxlZCBjb3JyZWN0bHkuCiAgIFNlZSBbaXNzdWUj
OF0oaHR0cHM6Ly9naXRmbGljLnJ1L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4L2lzc3VlLzgpIGZv
ciBtb3JlIGluZm9ybWF0aW9uLgoKIC0gYmFja3BvcnQ6IEZpeGVkIGV4dHJhIGFzc2VydGlvbiBp
bnNpZGUgYG92ZXJyaWRlX21ldGEoKWAsIHdoaWNoIGNvdWxkCiAgIGxlYWQgdG8gZmFsc2UtcG9z
aXRpdmUgZmFpbGluZyBvZiB0aGUgYXNzZXJ0aW9uIGluIGEgZGVidWcgYnVpbGRzIGR1cmluZwog
ICBEQiByZWNvdmVyeSBhbmQvb3IgYXV0by1yb2xsYmFjay4KCk1pbm9yczoKCiAtIGJhY2twb3J0
OiBGaXhlZCB0eXBvcy4KIC0gYmFja3BvcnQ6IFJlZmluZWQgYGNvbnN0YCBhbmQgYG5vZXhjZXB0
YCBmb3IgZmV3IEMrKyBBUEkgbWV0aG9kcy4KIC0gYmFja3BvcnQ6IFJlc29sdmUgZmFsc2UtcG9z
aXJpdmUgYHVzZWQgdW5pbml0aWFsaXplZGAgd2FybmluZyBmcm9tIEdDQyA+MTAueAogICB3aGls
ZSBidWlsZCBmb3IgU0g0IGFyY2guCiAtIGJhY2twb3J0OiBGaXhlZCBpbnNpZ25pZmljYW50IHR5
cG8gb2YgYHx8YCBpbnNpZGUgYCNpZmAgYnl0ZS1vcmRlciBjb25kaXRpb24uCgpUaGUgY29tcGxl
dGUgQ2hhbmdlTG9nOiBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngv
YmxvYj9maWxlPUNoYW5nZUxvZy5tZAoKU2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu0YDR
jNC10LIgKExlb25pZCBZdXJpZXYpIDxsZW9AeXVyaWV2LnJ1PgotLS0KIHBhY2thZ2UvbGlibWRi
eC9saWJtZGJ4Lmhhc2ggfCAyICstCiBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5tayAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCBiL3BhY2thZ2UvbGlibWRieC9s
aWJtZGJ4Lmhhc2gKaW5kZXggZTNmYjMwOTQ2MS4uYjFhMjg5MWI5MSAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaAorKysgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5o
YXNoCkBAIC0xLDUgKzEsNSBAQAogIyBIYXNoZXMgZnJvbTogaHR0cHM6Ly9saWJtZGJ4LmRxZGtm
YS5ydS9yZWxlYXNlL1NIQTI1NlNVTVMKLXNoYTI1NiAgOTQ0OWZkMzU3MTE5ZTE5OTAyMzYzYWI5
MDEzNGQ4MmM5YTcxM2I3MDYzOTRjMmExMzg5YjViYjQ3ODdiNTE2NCAgbGlibWRieC1hbWFsZ2Ft
YXRlZC0wLjExLjEzLnRhci54egorc2hhMjU2ICA5N2IwMzk2NWI1YjYxNzI3ZGM0MjMyYzUwY2Ni
MTc0YzYzMjQ3MGEzZDI0NDM4YjNjNTIzMTViZWY2ZmI0MDMzICBsaWJtZGJ4LWFtYWxnYW1hdGVk
LTAuMTEuMTQudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYgIDMxMGZlMjVj
ODU4YTk1MTVmYzhjOGQ3ZDFmMjRhNjdjOTQ5NmY4NGE5MWUwYTBlNDFlYTk5NzViMTM3MWU1Njkg
IExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rIGIvcGFja2Fn
ZS9saWJtZGJ4L2xpYm1kYngubWsKaW5kZXggYTEzOWUwNjJmNi4uNWU3OTk1ZjhjOCAxMDA2NDQK
LS0tIGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsKKysrIGIvcGFja2FnZS9saWJtZGJ4L2xp
Ym1kYngubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1M
SUJNREJYX1ZFUlNJT04gPSAwLjExLjEzCitMSUJNREJYX1ZFUlNJT04gPSAwLjExLjE0CiBMSUJN
REJYX1NPVVJDRSA9IGxpYm1kYngtYW1hbGdhbWF0ZWQtJChMSUJNREJYX1ZFUlNJT04pLnRhci54
egogTElCTURCWF9TSVRFID0gaHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9yZWxlYXNlCiBMSUJN
REJYX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCi0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
