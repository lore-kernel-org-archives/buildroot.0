Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE76CDB482
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 17:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBF568219C;
	Tue, 17 Oct 2023 17:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBF568219C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PStTQqc49Y9v; Tue, 17 Oct 2023 17:26:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7FC382188;
	Tue, 17 Oct 2023 17:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7FC382188
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 432671BF4DB
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 17:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C06A613DE
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 17:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C06A613DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYBbgPqMN9nF for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 17:26:50 +0000 (UTC)
X-Greylist: delayed 322 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Oct 2023 17:26:49 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC826613DD
Received: from forward202a.mail.yandex.net (forward202a.mail.yandex.net
 [IPv6:2a02:6b8:c0e:500:1:45:d181:d202])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC826613DD
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 17:26:49 +0000 (UTC)
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net
 [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
 by forward202a.mail.yandex.net (Yandex) with ESMTP id C945163765
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 20:21:32 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c18:4601:0:640:7543:0])
 by forward101a.mail.yandex.net (Yandex) with ESMTP id 26AF560038
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 20:21:22 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id KLo7AN5Ws0U0-OEE2cZV6; 
 Tue, 17 Oct 2023 20:21:21 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 20:21:07 +0300
Message-ID: <20231017172108.142456-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1697563281; bh=tj2Y+X+76h2X2l/+s5Lk1L2FYkM1Woatr220gZURKLU=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=TWNQzixmaJJLPGAvViKV+4BNWCxp1oVUbAG3PLw+XsqnEoDHokQ0pMAcewiWBDe00
 3lOBQMO4gw5jFZfNwcN1q4nS2qOUNlTT2lpnLhhEKKqob3H4Me2NHeRn/d0SvIfpT1
 X8gKKfp9v22Y+LEV6TewSAJV2lBBDEmYNoBJ4kSY=
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.8
 "Vladimir Utkin"
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

VGhpcyBpcyBidWdmaXggcmVsZWFzZSBvZiBzdGFibGUgbGlibWRieCBicmFuY2gsIG9uIHRoZSBk
YXkgb2YgdGhlIDEwMHRoCmFubml2ZXJzYXJ5IG9mIHRoZSBiaXJ0aCBvZiB0aGUgb3V0c3RhbmRp
bmcgU292aWV0IGFuZCBSdXNzaWFuIHNjaWVudGlzdAphbmQgZW5naW5lZXIgVmxhZGltaXIgRmVk
b3JvdmljaCBVdGtpbi4KCkl0IGlzIHJlYXNvbmFibGUgdG8gYmFja3BvcnQgdGhpcyBwYXRjaCB0
byBhbGwgYXBwbGljYWJsZSByZWxlYXNlcy9icmFuY2hlcyBvZiBCdWlsZHJvb3QuCgpUaGUgbW9z
dCBzaWduaWZpY2FudCBmaXhlcyBvZiB2MC4xMi44OgogLSBGaXhlZCByZWdyZXNzaW9uIG9mIG1k
YnhfcHV0KE1EQlhfTVVMVElQTEUpIGR1cmluZyBiYXRjaC9idWxrCiAgIGluc2VydGlvbiBvZiBt
dWx0aS12YWx1ZXMgKGFrYSAiZHVwc29ydCIpLgogLSBJbXBsZW1lbnRlZCBvdmVyd3JpdGluZyBp
biBtZGJ4X3B1dChNREJYX0NVUlJFTlQpIG9mIGFsbCBjdXJyZW50CiAgIG11bHRpLWtleSB2YWx1
ZXMgaW4gdGhlIGFic2VuY2Ugb2YgdGhlIGZsYWcgTURCWF9OT09WRVJXUklURS4KIC0gQWRkZWQg
dGhlIGFiaWxpdHkgdG8gdXNlIG1kYnhfY3Vyc29yX2dldChNREJYX0dFVF9NVUxUSVBMRSkgd2l0
aG91dAogICBmaXJzdCBzZXR0aW5nIHRoZSBjdXJzb3IsIGNvbWJpbmluZyB0aGUgYmF0Y2ggZGF0
YSBnZXR0aW5nIG9wZXJhdGlvbgogICB3aXRoIHBvc2l0aW9uaW5nIHRoZSBjdXJzb3IuCiAtIE1p
Y3JvLW9wdGltaXphdGlvbiBhbmQgcmVmYWN0b3JpbmcgY3Vyc29yX3B1dF9ub2NoZWNrbGVuKCku
CiAtIENsYXJpZnlpbmcgdGhlIHdvcmRpbmcgaW4gdGhlIEFQSSBkZXNjcmlwdGlvbiwgaW5jbHVk
aW5nIGV4cGxhbmF0aW9uCiAgIGFib3V0IFNJR1NFR1YgYW5kIG5vdCBhbGxvd2luZyBkaXJlY3Qg
ZGF0YSBjaGFuZ2VzLgoKVGhlIGNvbXBsZXRlIENoYW5nZUxvZzogaHR0cHM6Ly9naXRmbGljLnJ1
L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4L2Jsb2I/ZmlsZT1DaGFuZ2VMb2cubWQKClNpZ25lZC1v
ZmYtYnk6INCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2KSA8bGVvQHl1cmll
di5ydT4KLS0tCiBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoIHwgMiArLQogcGFja2FnZS9s
aWJtZGJ4L2xpYm1kYngubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4
Lmhhc2ggYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoCmluZGV4IDBmNTkwOGNmMzguLjgy
Y2YyOGQ2YTkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKKysrIGIv
cGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgSGFzaGVzIGZy
b206IGh0dHBzOi8vbGlibWRieC5kcWRrZmEucnUvcmVsZWFzZS9TSEEyNTZTVU1TCi1zaGEyNTYg
IGUxNTA1NDFjMmIwNzU1OGI5NjFlNzU0ZThlOTE3MWJmMWFhOTc0YzhlOTM2ZjYyYmQzNzU2MDZm
N2Q1NTA2NjcgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMi43LnRhci54egorc2hhMjU2ICBjNzhj
NTZjNTM3MDhiYmZjNTE5YmY1M2ViZjUyMGQxZjA5ZDMwZWU2NDI3YTRiZWRmNzEzMzE2Njk2ZTY3
MWQwICBsaWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTIuOC50YXIueHoKIAogIyBMb2NhbGx5IGNhbGN1
bGF0ZWQKIHNoYTI1NiAgMzEwZmUyNWM4NThhOTUxNWZjOGM4ZDdkMWYyNGE2N2M5NDk2Zjg0YTkx
ZTBhMGU0MWVhOTk3NWIxMzcxZTU2OSAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJt
ZGJ4L2xpYm1kYngubWsgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawppbmRleCA4NGI1ODYz
MmI2Li40Y2M2Y2JkMDhlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawor
KysgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJQk1EQlhfVkVSU0lPTiA9IDAuMTIuNworTElCTURCWF9W
RVJTSU9OID0gMC4xMi44CiBMSUJNREJYX1NPVVJDRSA9IGxpYm1kYngtYW1hbGdhbWF0ZWQtJChM
SUJNREJYX1ZFUlNJT04pLnRhci54egogTElCTURCWF9TSVRFID0gaHR0cHM6Ly9saWJtZGJ4LmRx
ZGtmYS5ydS9yZWxlYXNlCiBMSUJNREJYX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCi0t
IAoyLjQyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
