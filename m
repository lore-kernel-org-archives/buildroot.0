Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ACCC433F5
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 10:43:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A771A611AF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 10:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A771A611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BBCF61BDA;
	Fri, 19 Nov 2021 10:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jp3YwdFPgkDe; Fri, 19 Nov 2021 10:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EC5460617;
	Fri, 19 Nov 2021 10:43:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13CD01BF57C
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 10:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0059B80B96
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 10:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mXWAVOf-kdFw for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 10:43:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from 3.mo576.mail-out.ovh.net (3.mo576.mail-out.ovh.net
 [188.165.52.203])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9041D80B93
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 10:43:46 +0000 (UTC)
Received: from player688.ha.ovh.net (unknown [10.110.103.129])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id A3ED5240F5
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 10:37:46 +0000 (UTC)
Received: from armadeus.com (areims-654-1-107-29.w92-131.abo.wanadoo.fr
 [92.131.114.29])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id B89CA245BE63D;
 Fri, 19 Nov 2021 10:37:44 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006740d4966-1725-41b5-b13e-453a3a5d4ac6,
 CDD263498765534C212E1D53D85F77474BF15E05)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.131.114.29
Message-ID: <47a68b89-d935-59f3-b051-c60c3e2d33d1@armadeus.com>
Date: Fri, 19 Nov 2021 11:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211119085902.14877-1-sebastien.szymanski@armadeus.com>
 <20211119101140.GN247986@scaer>
From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
In-Reply-To: <20211119101140.GN247986@scaer>
X-Ovh-Tracer-Id: 9113596796612176757
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeekgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfvfhfhufgjtgfgsehtkeertddtfeejnecuhfhrohhmpefurogsrghsthhivghnpgfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpedvkeeutdfgkeffgfdtffehgeffffdtueekvedvuddvfeetuedtueehudfgjeffvdenucffohhmrghinhepphgtrhgvrdhorhhgpdhgihhthhhusgdrtghomhdpshhouhhrtggvfhhorhhgvgdrnhgvthdpsghuihhlughrohhothdrohhrghenucfkpheptddrtddrtddrtddpledvrddufedurdduudegrddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrieekkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre: fix broken URL
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIDExLzE5LzIxIDExOjExLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IFPDqWJh
c3RpZW4sIEFsbCwKPiAKPiBPbiAyMDIxLTExLTE5IDA5OjU5ICswMTAwLCBTw6liYXN0aWVuIFN6
eW1hbnNraSBzcGFrZSB0aHVzbHk6Cj4+IEFzIHN0YXRlZCBvbiB3d3cucGNyZS5vcmc6Cj4+ICJO
b3RlIHRoYXQgdGhlIGZvcm1lciBmdHAucGNyZS5vcmcgRlRQIHNpdGUgaXMgbm8gbG9uZ2VyIGF2
YWlsYWJsZS4iCj4+Cj4+IFVwZGF0ZSBfU0lURSBVUkwgdG8gU291cmNlZm9yZ2UuCj4gCj4gVGhl
IGhvbWVwYWdlIHN0YXRlcyB0aGF0IHRoZSBvZmZpY2lhbCByZWxlYXNlIGNoYW5uZWwgaXMgZ2l0
aHViLCBhbmQKPiB0aGF0IHNvdXJjZWZvcmdlIGlzIHVub2ZpY2lhbDoKPiAKPiAgICAgIGh0dHA6
Ly93d3cucGNyZS5vcmcvCj4gCj4gICAgICBZb3UgY2FuIGRvd25sb2FkIHRoZSBjdXJyZW50IHJl
bGVhc2Ugb2YgdGhlIFBDUkUyIGxpYnJhcnkgZnJvbSBpdHMKPiAgICAgIG9mZmljaWFsIGhvbWUg
b24gR2l0SHViOgo+IAo+ICAgICAgaHR0cHM6Ly9naXRodWIuY29tL1BoaWxpcEhhemVsL3BjcmUy
L3JlbGVhc2VzCj4gCj4gICAgICBZb3UgY2FuIGFsc28gZG93bmxvYWQgUENSRTIgb3IgdGhlIG9s
ZGVyLCB1bm1haW50YWluZWQgUENSRSBsaWJyYXJ5Cj4gICAgICBmcm9tIGFuIHVub2ZmaWNpYWwg
bWlycm9yIGF0IFNvdXJjZUZvcmdlOgo+IAo+ICAgICAgaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQv
cHJvamVjdHMvcGNyZS9maWxlcy8KPiAKPiBTbyBjb3VsZCB5b3UgcmVzcGluIHVzaW5nIHRoZSBy
ZWxlYXNlIGZyb20gZ2l0aHViLCBwbGVhc0U/CgpObywgSSBjYW4ndCBiZWNhdXNlIHRoZXJlIGFy
ZSBwY3JlMiAodHdvKSByZWxlYXNlcyBvbmx5IG9uIGdpdGh1Yi4uLgpBcyBleHBsYWluZWQgaW4g
d2hhdCB5b3UgY29waWVkIC8gcGFzdGVkLCBvbGRlciByZWxlYXNlcyBhcmUgb24gU291cmNlRm9y
Z2UuCgpSZWdhcmRzLAoKPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCj4+IFNpZ25l
ZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFk
ZXVzLmNvbT4KPj4gLS0tCj4+ICAgcGFja2FnZS9wY3JlL3BjcmUubWsgfCAyICstCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3BjcmUvcGNyZS5tayBiL3BhY2thZ2UvcGNyZS9wY3JlLm1rCj4+IGluZGV4
IDI2NGVhYTEwYzcuLmM4NWY2NzE3ZGIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcGNyZS9wY3Jl
Lm1rCj4+ICsrKyBiL3BhY2thZ2UvcGNyZS9wY3JlLm1rCj4+IEBAIC01LDcgKzUsNyBAQAo+PiAg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+ICAgCj4+ICAgUENSRV9WRVJTSU9OID0gOC40NQo+
PiAtUENSRV9TSVRFID0gaHR0cHM6Ly9mdHAucGNyZS5vcmcvcHViL3BjcmUKPj4gK1BDUkVfU0lU
RSA9IGh0dHA6Ly9kb3dubG9hZHMuc291cmNlZm9yZ2UubmV0L3Byb2plY3QvcGNyZS9wY3JlLyQo
UENSRV9WRVJTSU9OKQo+PiAgIFBDUkVfU09VUkNFID0gcGNyZS0kKFBDUkVfVkVSU0lPTikudGFy
LmJ6Mgo+PiAgIFBDUkVfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+PiAgIFBDUkVfTElDRU5TRV9G
SUxFUyA9IExJQ0VOQ0UKPj4gLS0gCj4+IDIuMzIuMAo+Pgo+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKCi0tIApTw6liYXN0aWVuIFN6eW1hbnNraSwg
QXJtYWRldXMgU3lzdGVtcwpTb2Z0d2FyZSBlbmdpbmVlcgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
