Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5E3D13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 19:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA93480CC3;
	Sun, 27 Oct 2024 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wt8KYn6hYA4S; Sun, 27 Oct 2024 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D76CE80CC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D76CE80CC9;
	Sun, 27 Oct 2024 19:36:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE076112A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE25860635
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIWOiPivhHLu for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 19:36:15 +0000 (UTC)
X-Greylist: delayed 331 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 27 Oct 2024 19:36:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A1D58605DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1D58605DD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.154.239.92;
 helo=forward201a.mail.yandex.net; envelope-from=leo@yuriev.ru;
 receiver=<UNKNOWN> 
Received: from forward201a.mail.yandex.net (forward201a.mail.yandex.net
 [178.154.239.92])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1D58605DD
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:36:13 +0000 (UTC)
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net
 [IPv6:2a02:6b8:c0e:500:1:45:d181:d102])
 by forward201a.mail.yandex.net (Yandex) with ESMTPS id C42C36708A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:30:47 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c2b:1d5:0:640:773e:0])
 by forward102a.mail.yandex.net (Yandex) with ESMTPS id 994FD60AA7
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:30:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id aUds9CgoB4Y0-HLMcyV5P; 
 Sun, 27 Oct 2024 22:30:37 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Date: Sun, 27 Oct 2024 22:30:28 +0300
Message-ID: <20241027193029.298728-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1730057437; bh=02+UcU1mCdRxw8vZOCOVY7cc9UvRJY6Pc0cCjIjH2/A=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=tg7iYnZU9O1VDKcHh71o4Letad2fFGh72ok8iAQ/CHTMHgrOb0u2RWw3/edpvvH3R
 fHXhhloqmIuu39/80qhkh8XQM34lveh+PuiLZQVgtO4eO96BAD59dYg+dh9kqGVavK
 MJB8SHkdR5mmn7Fyhz3ewerljePCVWtxRb8CiCNI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBidWdmaXggcmVsZWFzZSBvZiBzdGFibGUgbGlibWRieCBicmFuY2guCgpUaGUgbW9z
dCBzaWduaWZpY2FudCBmaXhlcyBzaW5jZSB2MC4xMi4xMCAodGhlIHByZXZpb3VzIHZlcnNpb24g
cGlubmVkIHRvCmJ1aWxkcm9vdCk6CgogLSBGaXhlZCB0aGUgcG9zc2liaWxpdHkgb2YgYFNJR1NF
R1ZgIGluc2lkZSB0aGUgYGNvaGVyZW5jZV9jaGVjaygpYCBhZnRlcgogICBjaGFuZ2luZyB0aGUg
Z2VvbWV0cnkgYnkgYW5vdGhlciBwcm9jZXNzIHdpdGggYW4gaW5jcmVhc2UgaW4gdGhlIHVwcGVy
CiAgIERCIHNpemUgYWJvdmUgdGhlIHByZXZpb3VzIGluLXByb2Nlc3MgbGltaXQuCgogLSBGaXhl
ZCBjdXJzb3IocykgaGFuZGxpbmcgb3BlbmVkIGluIHBhcmVudCB0cmFuc2FjdGlvbnMgYW5kIGNs
b3NlZCBiZWZvcmUKICAgdGhlIGNvbXBsZXRpb24gb2YgbmVzdGVkL2NoaWxkIHRyYW5zYWN0aW9u
cy4gSW4gc3VjaCBjYXNlLCBjbG9zZWQKICAgY3Vyc29ycyB3ZXJlICJyZXN1cnJlY3RlZCIsIHdo
aWNoIGxlZCB0byBhIGxlYWsgb2YgbWVtb3J5IGFsbG9jYXRlZCBmb3IKICAgc3VjaCBjdXJzb3Jz
LgoKIC0gRml4ZWQgYSBwb3NzaWJpbGl0eSBvZiBgU0lHU0VHVmAgd2hlbiBlbmFibGluZyBsb2dn
aW5nIG9mIHRoZQogICBgTURCWF9MT0dfVFJBQ0VgIGxldmVsIGluIGRlYnVnIGJ1aWxkcy4KCiAt
IENvcnJlY3Rpb24gb2YgdGhlIG1pc3NpbmcgYFRYTl9FTkRfRU9URE9ORWAgaW4gdGhlIGNhc2Ug
dGhlIHN0YXJ0IG9mCiAgIGEgcmVhZGluZyB0cmFuc2FjdGlvbiBmYWlscy4gVGhlIG1lbnRpb25l
ZCBiaXQtZmxhZyB3YXMgbWlzc2luZyBpbiB0aGUKICAgdHJhbnNhY3Rpb24gZGVzdHJ1Y3Rpb24v
c2h1dGRvd24gcGF0aCBvbiBlcnJvciBpdHMgbGF1bmNoLiBCZWNhdXNlIG9mCiAgIHRoaXMsIGFu
IGF0dGVtcHQgd2FzIG1hZGUgdG8gZGVzdHJveSB0aGUgY3Vyc29ycywgd2hpY2ggbGVkIHRvIGNy
YXNoCiAgIGRlYnVnIGJ1aWxkcywgc2luY2UgdGhlIGNvcnJlc3BvbmRpbmcgYXJyYXkgaXMgaW50
ZW50aW9uYWxseSBmaWxsZWQKICAgd2l0aCBwb2lzb24gcG9pbnRlcnMuCgogLSBNb2RpZmljYXRp
b24gb2YgYG1kYnhfY2xvc2VfYnkoKWAgdG8gcmV0dXJuIGFuIGVycm9yIHdoZW4gdHJ5aW5nIHRv
CiAgIGNsb3NlIHRoZSBkYmkgZGVzY3JpcHRvciBvZiBhIHRhYmxlIGNyZWF0ZWQgYW5kL29yIG1v
ZGlmaWVkIGluIGEKICAgc3RpbGwtcnVubmluZyB0cmFuc2FjdGlvbi4gU3VjaCBwcmVtYXR1cmUg
Y2xvc3VyZSBvZiB0aGUgZGVzY3JpcHRvciBpcwogICBhbiBpbmNvcnJlY3QgdXNlIG9mIHRoZSBB
UEkgYW5kIGEgdmlvbGF0aW9uIG9mIHRoZSBjb250cmFjdC9wcmVjb25kaXRpb25zCiAgIGZvcm11
bGF0ZWQgaW4gdGhlIGRlc2NyaXB0aW9uIG9mIGBtZGJ4X2Nsb3NlX2RiaSgpYC4KCiAgIEhvd2V2
ZXIsIGluc3RlYWQgb2YgcmV0dXJuaW5nIGFuIGVycm9yLCBhbiBpbmNvcnJlY3QgY2xvc3VyZSBv
ZiB0aGUKICAgZGVzY3JpcHRvciB3YXMgcGVyZm9ybWVkLCB3aGljaCBjb3VsZCBsZWFkIHRvIHRo
ZSBjcmVhdGlvbiBvZiBhIHRhYmxlCiAgIHdpdGggYW4gZW1wdHkgbmFtZSwgbGVha2FnZSBvZiBk
YXRhYmFzZSBwYWdlcyBhbmQvb3IgY29ycnVwdGlvbiBvZiBhCiAgIGItdHJlZSBzdHJ1Y3R1cmUg
KHdyb25nIHJlZmVyZW5jZSB0byB0aGUgcm9vdCBvZiBhIHRhYmxlKS4KClRoZSBjb21wbGV0ZSBD
aGFuZ2VMb2c6CiAgICBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngv
YmxvYj9maWxlPUNoYW5nZUxvZy5tZAoKU2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu0YDR
jNC10LIgKExlb25pZCBZdXJpZXYpIDxsZW9AeXVyaWV2LnJ1PgotLS0KIHBhY2thZ2UvbGlibWRi
eC9saWJtZGJ4Lmhhc2ggfCAyICstCiBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5tayAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCBiL3BhY2thZ2UvbGlibWRieC9s
aWJtZGJ4Lmhhc2gKaW5kZXggMWRiZGVmN2M2OS4uMjIyZTdjYWY1YyAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaAorKysgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5o
YXNoCkBAIC0xLDUgKzEsNSBAQAogIyBIYXNoZXMgZnJvbTogaHR0cHM6Ly9saWJtZGJ4LmRxZGtm
YS5ydS9yZWxlYXNlL1NIQTI1NlNVTVMKLXNoYTI1NiAgNDYzN2UwNjc2OGE5YThmYzc1NzdlNmU0
NThlMDQ1YWQxZjlhOGJhZWU3NDk5NmEzYzg4YmMwYWQ2NGNiY2Y2NyAgbGlibWRieC1hbWFsZ2Ft
YXRlZC0wLjEyLjEwLnRhci54egorc2hhMjU2ICAxOWMwZWIzM2UxZWQ0M2NhMmE5NGRjZWIwNmRk
MzE5NDY0MzJkMTZmMzBhOTc1MWQzNzAxYzY3ZWZhMjJlYjFhICBsaWJtZGJ4LWFtYWxnYW1hdGVk
LTAuMTIuMTIudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYgIDMxMGZlMjVj
ODU4YTk1MTVmYzhjOGQ3ZDFmMjRhNjdjOTQ5NmY4NGE5MWUwYTBlNDFlYTk5NzViMTM3MWU1Njkg
IExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rIGIvcGFja2Fn
ZS9saWJtZGJ4L2xpYm1kYngubWsKaW5kZXggNmUwNTcxZmYyNC4uYzczNjk0NWU5MiAxMDA2NDQK
LS0tIGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsKKysrIGIvcGFja2FnZS9saWJtZGJ4L2xp
Ym1kYngubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1M
SUJNREJYX1ZFUlNJT04gPSAwLjEyLjEwCitMSUJNREJYX1ZFUlNJT04gPSAwLjEyLjEyCiBMSUJN
REJYX1NPVVJDRSA9IGxpYm1kYngtYW1hbGdhbWF0ZWQtJChMSUJNREJYX1ZFUlNJT04pLnRhci54
egogTElCTURCWF9TSVRFID0gaHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9yZWxlYXNlCiBMSUJN
REJYX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCi0tIAoyLjQ3LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
