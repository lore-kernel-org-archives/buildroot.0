Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4573DCA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 13:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDCC5411DC;
	Thu, 14 Aug 2025 13:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYQ21XvdjPht; Thu, 14 Aug 2025 13:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E9D541194
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E9D541194;
	Thu, 14 Aug 2025 13:33:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41D0E1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36D73409A9
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vk_sCMlBw6W9 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 13:33:16 +0000 (UTC)
X-Greylist: delayed 3600 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 14 Aug 2025 13:33:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D33941183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D33941183
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=87.98.178.36;
 helo=5.mo561.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 5.mo561.mail-out.ovh.net (5.mo561.mail-out.ovh.net
 [87.98.178.36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D33941183
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:33:13 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.54.124])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4c2kkZ46V6z5wv6
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 12:16:54 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-52j4q (unknown [10.111.182.240])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id F228BC029F;
 Thu, 14 Aug 2025 12:16:53 +0000 (UTC)
Received: from armadeus.com ([37.59.142.103])
 by ghost-submission-5b5ff79f4f-52j4q with ESMTPSA
 id icnJLbXTnWh/dwAAczhdYg
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 14 Aug 2025 12:16:53 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu, 14 Aug 2025 14:16:50 +0200
MIME-Version: 1.0
Message-Id: <20250814-python-numpy-fix-build-cyhton-v1-1-849f0bb9524d@armadeus.com>
X-B4-Tracking: v=1; b=H4sIALHTnWgC/x2MQQqDMBAAvyJ77kKiFkK/UnrQ7NostDEkKgbx7
 y4eZxjmgMJZuMCrOSDzJkXmqGAfDfgwxC+jkDK0pn0aZ3tMdQlzxLj+U8VJdhxX+RH6GhbV5G1
 HnvqhYwf6SJm1uf/vz3leZ9gRo28AAAA=
X-Change-ID: 20250814-python-numpy-fix-build-cyhton-dc13dcd4a3e8
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 15255380788354608107
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeegteduudehtddukeejjeeigfffhfejudffuedugefgtdetvdefheetkeeigfehieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdeltddruddurddvgeekrddvfeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=8ubzYt7wLlxfEHU6MTZaSlZZppHppF5RcNPkRmuOjf4=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1755173814; v=1;
 b=qfvMwamCwcvzc5g+r6WwHfEssxcT1eFWZyOXyrXxuzY1jTjKf1Q1io/1/ULoGaRPdNo0FjYR
 fVibyEL7cLK6z/T7IITTUuFU1wU9vPaH+GZ2ecmRYQV5YwqxJcGfApKdKjcDx39xtAA+QpmcE2C
 ZuABuD0BFTPlw0+uoXlWVjf5AAjvepUJmI2zLWbGYUYEDnFQLuw/qjy4QlasJbS7dy7BVSTsZ41
 LWHT9QpkF0w3cZd4t9r7xgQf7lj5m8kxIaLllNddOZ7TDPSF9lH+5cV0CvhTJLyq8zj4enQhQ0C
 PZPt2gSEJEQdZJ4yq3M9qFnC96qUBGfqxXVx9YV6n7Mxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=qfvMwamC
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0056152d11e-eecd-43a5-b347-bfd3cfe0b4dc,
 1521A4EC9CC9F18FC898129C139AFCD17848FD13)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH] package/python-numpy: fix build with
 python-cython >= 3.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgY29tbWl0IGI1MzZjYWFlYzBkOCAoInBhY2thZ2UvcHl0aG9uLWN5dGhvbjogYnVtcCB0
byB2ZXJzaW9uCjMuMS4yIiksIHB5dGhvbi1udW1weSBmYWlscyB0byBidWlsZDoKCkVycm9yIGNv
bXBpbGluZyBDeXRob24gZmlsZToKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi4uLgogICAgICAgICAgICAgICAgbnAuaXNzdWJkdHlw
ZShjb3YuZHR5cGUsIG5wLmNvbXBsZXhmbG9hdGluZykpOgogICAgICAgICAgICByYWlzZSBUeXBl
RXJyb3IoIm1lYW4gYW5kIGNvdiBtdXN0IG5vdCBiZSBjb21wbGV4IikKICAgICAgICBpZiBzaXpl
IGlzIE5vbmU6CiAgICAgICAgICAgIHNoYXBlID0gW10KICAgICAgICBlbGlmIGlzaW5zdGFuY2Uo
c2l6ZSwgKGludCwgbG9uZywgbnAuaW50ZWdlcikpOgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpudW1weS9yYW5kb20vX2dlbmVyYXRvci5weXg6Mzc2MDozNjogdW5k
ZWNsYXJlZCBuYW1lIG5vdCBidWlsdGluOiBsb25nCgpCYWNrcG9ydCB1cHN0cmVhbSBwYXRjaCB0
byBmaXggdGhhdCBidWlsZCBmYWlsdXJlLgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenlt
YW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0KQmFja3BvcnQgdG86
IDIwMjUuMDUueCwgMjAyNS4wMi54Ci0tLQogLi4uLzAwMDEtTU5ULWRvLW5vdC11c2UtbG9uZy10
eXBlLnBhdGNoICAgICAgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLW51
bXB5LzAwMDEtTU5ULWRvLW5vdC11c2UtbG9uZy10eXBlLnBhdGNoIGIvcGFja2FnZS9weXRob24t
bnVtcHkvMDAwMS1NTlQtZG8tbm90LXVzZS1sb25nLXR5cGUucGF0Y2gKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uZDgx
M2E0ZDUxYjI2OTBkNTc0NTRmYzBkNDcwOTBmNmJiNDc1MTg4MQotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvcHl0aG9uLW51bXB5LzAwMDEtTU5ULWRvLW5vdC11c2UtbG9uZy10eXBlLnBhdGNo
CkBAIC0wLDAgKzEsMzQgQEAKK0Zyb20gNmRjMmZkMzFmOGE1YTRlZjUwMmNiNzczNGYwMDRmNWJj
ZTk0ZTY3MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFRob21hcyBBIENhc3dlbGwg
PHRjYXN3ZWxsQGdtYWlsLmNvbT4KK0RhdGU6IFNhdCwgMTggTm92IDIwMjMgMTY6NDY6NTIgLTA1
MDAKK1N1YmplY3Q6IFtQQVRDSF0gTU5UOiBkbyBub3QgdXNlIGBsb25nYCB0eXBlCitNSU1FLVZl
cnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250
ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1JlbW92ZWQgYXMgdHlwZSBhdCBsYW5ndWFn
ZSBsZXZlbCAzIGluIGVkN2U5NTkxMmI2ZWQ3ZDIwZTE5MGZiZjFhZWNiOWYyYTk5N2Q0NzkKK2lu
IGN5dGhvbgorCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L2NvbW1p
dC82ZGMyZmQzMWY4YTVhNGVmNTAyY2I3NzM0ZjAwNGY1YmNlOTRlNjcxCisKK1NpZ25lZC1vZmYt
Ynk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNv
bT4KKy0tLQorIG51bXB5L3JhbmRvbS9fZ2VuZXJhdG9yLnB5eCB8IDIgKy0KKyAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL251bXB5
L3JhbmRvbS9fZ2VuZXJhdG9yLnB5eCBiL251bXB5L3JhbmRvbS9fZ2VuZXJhdG9yLnB5eAoraW5k
ZXggZDA2N2U3OTVlYjVjLi5hZTQ4MWQ2OWQ2OTYgMTAwNjQ0CistLS0gYS9udW1weS9yYW5kb20v
X2dlbmVyYXRvci5weXgKKysrKyBiL251bXB5L3JhbmRvbS9fZ2VuZXJhdG9yLnB5eAorQEAgLTM3
NTcsNyArMzc1Nyw3IEBAIGRlZiBtdWx0aXZhcmlhdGVfbm9ybWFsKHNlbGYsIG1lYW4sIGNvdiwg
c2l6ZT1Ob25lLCBjaGVja192YWxpZD0nd2FybicsCisgCisgICAgICAgICBpZiBzaXplIGlzIE5v
bmU6CisgICAgICAgICAgICAgc2hhcGUgPSBbXQorLSAgICAgICAgZWxpZiBpc2luc3RhbmNlKHNp
emUsIChpbnQsIGxvbmcsIG5wLmludGVnZXIpKToKKysgICAgICAgIGVsaWYgaXNpbnN0YW5jZShz
aXplLCAoaW50LCBucC5pbnRlZ2VyKSk6CisgICAgICAgICAgICAgc2hhcGUgPSBbc2l6ZV0KKyAg
ICAgICAgIGVsc2U6CisgICAgICAgICAgICAgc2hhcGUgPSBzaXplCistLSAKKzIuNDkuMQorCgot
LS0KYmFzZS1jb21taXQ6IGE2MmVkNjNkY2U5YTg5MmI1YzQ5NDJlMGMyZmMyYzMxMGM2MmNjZjYK
Y2hhbmdlLWlkOiAyMDI1MDgxNC1weXRob24tbnVtcHktZml4LWJ1aWxkLWN5aHRvbi1kYzEzZGNk
NGEzZTgKCkJlc3QgcmVnYXJkcywKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4u
c3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
