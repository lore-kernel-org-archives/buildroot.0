Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFACC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 07:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF8B0417A9;
	Wed, 29 Nov 2023 07:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF8B0417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bV-p2W6qifgf; Wed, 29 Nov 2023 07:42:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D56E41803;
	Wed, 29 Nov 2023 07:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D56E41803
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2435C1BF32D
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 07:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F187B81E0A
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 07:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F187B81E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0EhRDQ_rlh4 for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 07:42:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC86281DF8
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 07:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC86281DF8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72A93FF805;
 Wed, 29 Nov 2023 07:41:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8FCl-0011AR-1X;
 Wed, 29 Nov 2023 08:41:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <5e5da455b1f21f427b740a6cc9206c3b58316a9c.1701078039.git.yann.morin@orange.com>
Date: Wed, 29 Nov 2023 08:41:55 +0100
In-Reply-To: <5e5da455b1f21f427b740a6cc9206c3b58316a9c.1701078039.git.yann.morin@orange.com>
 (yann morin's message of "Mon, 27 Nov 2023 10:40:44 +0100")
Message-ID: <875y1latvg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/erlang: disable for uclibc,
 fix glibc-build
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gICA8eWFubi5tb3JpbkBvcmFuZ2UuY29tPiB3cml0ZXM6CgogPiBGcm9tOiAiWWFubiBF
LiBNT1JJTiIgPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4KID4gQ29tbWl0IDJjZmE4NmE1NDg4Mihw
YWNrYWdlL2VybGFuZzogYnVtcCB2ZXJzaW9uIHRvIDI2LjAuMikgYWRkZWQgYQogPiBwYXRjaCB0
byByZXN0b3JlIGJ1aWxkaW5nIG9uIHVDbGliYy4KCiA+IEhvd2V2ZXIsIHRoYXQgcGF0Y2ggaXMg
bm90IHVwc3RyZWFtLCBhbmQgaGFzIGJlZW4gcmVqZWN0ZWQ6CgogPiAgICAgaHR0cHM6Ly9naXRo
dWIuY29tL2VybGFuZy9vdHAvcHVsbC83NTAwCgogPiAgICAgUGxlYXNlIG9wZW4gYSBQUiB0byBo
dHRwczovL2dpdGh1Yi5jb20vYXNtaml0L2FzbWppdCBpbnN0ZWFkIGFuZCB3ZQogPiAgICAgd2ls
bCBnZXQgdGhlIGZpeCBuZXh0IHRpbWUgd2Ugc3luYyB3aXRoIHVwc3RyZWFtLiBXZSBkbyBub3Qg
d2FudAogPiAgICAgdGhlaXJzIGFuZCBvdXIgaW1wbGVtZW50YXRpb24gdG8gZGl2ZXJnZS4KCiA+
IEZ1cnRoZXJtb3JlLCBpdCBoYXBwZW5zIHRvIHdvcmsgb24gdUNsaWJjLCBiZWNhdXNlIHVDbGli
YyBkb2VzIG5vdAogPiBleHBvc2Ugc3lzL2F1eHYuaCwgYnV0IGl0IGZhaWxzIHRvIHdvcmsgb24g
Z2xpYmMsIGJlY2F1c2UgdGhlIGRlZmluZSBpcwogPiBub3QgcHJvcGFnYXRlZCB0byAic3ViLXRy
ZWVzIiwgYW5kIHRodXMgaXMgbmV2ZXIgZGVmaW5lZCB3aGVyZSBpdCBpcwogPiBjaGVja2VkIGZv
ciwgZXZlbiB3aGVuIHN5cy9hdXh2LmggaXMgYXZhaWxhYmxlLiBUaGlzIGNhdXNlcyBidWlsZAog
PiBmYWlsdXJlcyBzdWNoIGFzOgoKID4gICAgIGFzbWppdC9jb3JlL2NwdWluZm8uY3BwOiBJbiBm
dW5jdGlvbiDigJh2b2lkIGFzbWppdDo6X2FiaV8xXzEwOjpkZXRlY3RIV0NhcHMoQ3B1SW5mbyYs
IGxvbmcgdW5zaWduZWQgaW50LCBjb25zdCBMaW51eEhXQ2FwTWFwcGluZyosIHNpemVfdCnigJk6
CiA+ICAgICBhc21qaXQvY29yZS9jcHVpbmZvLmNwcDo4NDA6MjQ6IGVycm9yOiDigJhnZXRhdXh2
YWzigJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlCiA+ICAgICAgIDg0MCB8ICAgdW5z
aWduZWQgbG9uZyBtYXNrID0gZ2V0YXV4dmFsKHR5cGUpOwogPiAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fgogPiAgICAgYXNtaml0L2NvcmUvY3B1aW5mby5jcHA6
IEluIGZ1bmN0aW9uIOKAmHZvaWQgYXNtaml0OjpfYWJpXzFfMTA6OmRldGVjdEFSTUNwdShDcHVJ
bmZvJinigJk6CiA+ICAgICBhc21qaXQvY29yZS9jcHVpbmZvLmNwcDo5NzI6MjE6IGVycm9yOiDi
gJhBVF9IV0NBUOKAmSB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMgc2NvcGUKID4gICAgICAgOTcy
IHwgICBkZXRlY3RIV0NhcHMoY3B1LCBBVF9IV0NBUCwgaHdDYXBNYXBwaW5nLCBBU01KSVRfQVJS
QVlfU0laRShod0NhcE1hcHBpbmcpKTsKID4gICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fgogPiAgICAgYXNtaml0L2NvcmUvY3B1aW5mby5jcHA6OTczOjIxOiBlcnJvcjog
4oCYQVRfSFdDQVAy4oCZIHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBzY29wZQogPiAgICAgICA5
NzMgfCAgIGRldGVjdEhXQ2FwcyhjcHUsIEFUX0hXQ0FQMiwgaHdDYXBNYXBwaW5nMiwgQVNNSklU
X0FSUkFZX1NJWkUoaHdDYXBNYXBwaW5nMikpOwogPiAgICAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fgoKID4gWWV0LCBzeXMvYXV4di5oIHdhcyBkZXRlY3RlZCBhdCBjb25m
aWd1cmUgdGltZToKCiA+ICAgICBjaGVja2luZyBmb3Igc3lzL2F1eHYuaC4uLiB5ZXMKCiA+IFRo
aXMgZGVmY29uZmlnIGlzIGVub3VnaCB0byByZXByb2R1Y2UgdGhlIGVycm9yOgoKID4gICAgIEJS
Ml9hYXJjaDY0PXkKID4gICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQogPiAgICAgQlIyX1RP
T0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKID4gICAgIEJSMl9QQUNLQUdFX0VSTEFORz15Cgog
PiBTaW5jZSB1cHN0cmVhbSByZWZ1c2VkIHRoZSBwYXRjaCwgYW5kIHRoZXJlIGlzIG5vIGZpeCB0
aGF0IHdhcyBzdWJtaXR0ZWQKID4gdG8gdGhlIGFjdHVhbCB1cHN0cmVhbSAoYXNtaml0KSwgZHJv
cCB0aGUgcmVqZWN0cmVkIHBhdGNoLCBhbmQgZGlzYWJsZQogPiBmb3IgdUNsaWJjOiB0aGUgcGF0
Y2ggaXMgaW5jb3JyZWN0LCBhbmQgd2UgY2FuJ3QgZml4IGEgYnVpbGQgaXNzdWUgb24KID4gdUNs
aWJjIGJ5IGludHJvZHVjaW5nIGFub3RoZXIgb24gZ2xpYmMuCgogPiBGaXhlczoKID4gICAgIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2ZjMS9mYzE5YmFkMjI2M2JkZmFj
ZWE1OTQyMTdkNWRkZmRlMGUyNzg5NWIxLwogPiAgICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJv
b3Qub3JnL3Jlc3VsdHMvMTE0LzExNDE2ZDgxZDViMjdmYzA2MjdiMzM1YTk3MTE1NGMwODhkNTc1
NGEvCgogPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5nZS5j
b20+CiA+IENjOiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgogPiBDYzogTWF4aW0gS29j
aGV0a292IDxmaWRvX21heEBpbmJveC5ydT4KCiA+IENoYW5nZXMgdjEgLT4gdjI6CiA+ICAgLSB1
cGRhdGUgY29tbWVudCB3aGVuIHVuYXZhaWxhYmxlCgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApC
eWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
