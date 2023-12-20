Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465D7C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A13D2436EE;
	Wed, 20 Dec 2023 20:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A13D2436EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xa26y9W5Lcfz; Wed, 20 Dec 2023 20:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB932436E6;
	Wed, 20 Dec 2023 20:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB932436E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67DAD1BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40C4F81973
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C4F81973
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pCZPjX2wNjRF for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:38:51 +0000 (UTC)
X-Greylist: delayed 969 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 Dec 2023 20:38:51 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EFE7812EA
Received: from 6.mo582.mail-out.ovh.net (6.mo582.mail-out.ovh.net
 [87.98.177.69])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EFE7812EA
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:38:51 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.176.8])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 19C9E249C0
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:22:39 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-l94l2 (unknown [10.110.168.38])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 986271FDD4;
 Wed, 20 Dec 2023 20:22:38 +0000 (UTC)
Received: from armadeus.com ([37.59.142.102])
 by ghost-submission-6684bf9d7b-l94l2 with ESMTPSA
 id MiyICg5Ng2UU7wAAbegRMQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 20 Dec 2023 20:22:38 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:21:38 +0100
Message-ID: <20231220202141.11532-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5552656868272106475
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduvddgudefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepueejhfekteelueelfffhleevjeeuuedtieetleetvddvhedvjeeiveffgefhtedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004b809cd2e-083a-437b-b47c-133c8bb9c61b,
 CCF55E9A36CE62B71F09469834F038924BAB166A)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH v2 0/3] i.MX91 and i.MX93 support
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgYWRkcyBpLk1YOTEsIGkuTVg5MyBhbmQgaS5NWDkzIDExeDExIEVWSyB0byBC
dWlsZHJvb3QuCgotLS0KCkNoYW5nZXMgZm9yIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9i
dWlsZHJvb3QvMjAyMzEwMTExMTA5MzIuNDQyNS0xLXNlYmFzdGllbi5zenltYW5za2lAYXJtYWRl
dXMuY29tLwogLSBwYXRjaCAxIG9mIHYxIGhhcyBiZWVuIGFwcGxpZWQKIC0gbW92ZSBTb0MgYXNp
YyB2ZXJzaW9uIHNlbGVjdGlvbiB0byBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvQ29uZmlnLmluCiAt
IG1pbm9yIGZpeGVzIGluIGxhdGVzdCBwYXRjaAoKU8OpYmFzdGllbiBTenltYW5za2kgKDMpOgog
IHBhY2thZ2UvZnJlZXNjYWxlLWlteDogYWRkIGkuTVg5MSBhbmQgaS5NWDkzIFNvQyBzdXBwb3J0
CiAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLXNlbnRpbmVsOiBuZXcgcGFja2FnZQog
IGNvbmZpZ3MvZnJlZXNjYWxlX2lteDkzZXZrOiBuZXcgZGVmY29uZmlnCgogLi4uL2NvbW1vbi9p
bXgvZ2VuaW1hZ2UuY2ZnLnRlbXBsYXRlX2lteDkgICAgIHwgNDEgKysrKysrKysrKysKIC4uLi9j
b21tb24vaW14L2lteDktYm9vdGxvYWRlci1wcmVwYXJlLnNoICAgICB8IDM0ICsrKysrKysrKwog
Ym9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvcG9zdC1pbWFnZS5zaCAgICAgIHwgIDQgKwogYm9h
cmQvZnJlZXNjYWxlL2lteDkzZXZrL3JlYWRtZS50eHQgICAgICAgICAgIHwgNzMgKysrKysrKysr
KysrKysrKysrKwogY29uZmlncy9mcmVlc2NhbGVfaW14OTNldmtfZGVmY29uZmlnICAgICAgICAg
IHwgMzcgKysrKysrKysrKwogcGFja2FnZS9mcmVlc2NhbGUtaW14L0NvbmZpZy5pbiAgICAgICAg
ICAgICAgIHwgMzggKysrKysrKysrKwogcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlt
eC9Db25maWcuaW4gIHwgIDkgKysrCiAuLi4vZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5tayAg
ICAgICAgICAgICAgfCAyMyArKysrKysKIC4uLi9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLXNlbnRp
bmVsL0NvbmZpZy5pbiB8IDIxICsrKysrKwogLi4uL2Zpcm13YXJlLXNlbnRpbmVsL2Zpcm13YXJl
LXNlbnRpbmVsLmhhc2ggIHwgIDQgKwogLi4uL2Zpcm13YXJlLXNlbnRpbmVsL2Zpcm13YXJlLXNl
bnRpbmVsLm1rICAgIHwgMjcgKysrKysrKwogMTEgZmlsZXMgY2hhbmdlZCwgMzExIGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9mcmVlc2NhbGUvY29tbW9uL2lteC9nZW5p
bWFnZS5jZmcudGVtcGxhdGVfaW14OQogY3JlYXRlIG1vZGUgMTAwNzU1IGJvYXJkL2ZyZWVzY2Fs
ZS9jb21tb24vaW14L2lteDktYm9vdGxvYWRlci1wcmVwYXJlLnNoCiBjcmVhdGUgbW9kZSAxMDA2
NDQgYm9hcmQvZnJlZXNjYWxlL2lteDkzZXZrL3JlYWRtZS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBjb25maWdzL2ZyZWVzY2FsZV9pbXg5M2V2a19kZWZjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtc2VudGluZWwvQ29uZmlnLmluCiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLXNlbnRpbmVsL2Zp
cm13YXJlLXNlbnRpbmVsLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvZmlybXdhcmUtc2VudGluZWwvZmlybXdhcmUtc2VudGluZWwubWsKCi0tIAoyLjQxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
