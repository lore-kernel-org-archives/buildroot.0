Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF35BC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 17:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7D578111B;
	Mon,  3 Feb 2025 17:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLJHGUQcelpn; Mon,  3 Feb 2025 17:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCD6B8111F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD6B8111F;
	Mon,  3 Feb 2025 17:16:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA3C212A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9A2C40443
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chd3KWcygBum for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 17:16:50 +0000 (UTC)
X-Greylist: delayed 987 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 03 Feb 2025 17:16:48 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2A8140177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2A8140177
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.173;
 helo=1.mo576.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net
 [178.33.251.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2A8140177
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:16:48 +0000 (UTC)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.17.59])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4Ymt6B2V5Yz1qPK
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:00:18 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-lvfkf (unknown [10.111.174.124])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 899CF1FEBE;
 Mon,  3 Feb 2025 17:00:16 +0000 (UTC)
Received: from armadeus.com ([37.59.142.99])
 by ghost-submission-5b5ff79f4f-lvfkf with ESMTPSA
 id +T/GESD2oGfHgQAA0bzKWw
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 03 Feb 2025 17:00:16 +0000
X-OVh-ClientIp: 194.78.211.220
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 03 Feb 2025 18:00:02 +0100
MIME-Version: 1.0
Message-Id: <20250203-ramsmp-fix-url-v2-1-0507c5ac253e@armadeus.com>
X-B4-Tracking: v=1; b=H4sIABH2oGcC/3WMQQ6CMBBFr0Jm7Zh2TAVdcQ/DopRRmlggU2k0p
 He3snf5/s97G0QWzxGu1QbCyUc/TwXoUIEb7fRg9ENhIEVGkTqh2BDDgnf/xlWeSEzMpqamdwR
 FWoTLtQdvXeHRx9csn72f9G/9m0oaNdLZmVr1pC62aa0EO/Aaj24O0OWcvwZKIHavAAAA
X-Change-ID: 20250203-ramsmp-fix-url-2e2ee5728bc2
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 17735738285125790705
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepgeetudffieejhfdugfevjeetvdehhefgfeejfeefieelheduffdtvdejudeiudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprghlrghsihhrrdgtohhmnecukfhppeduvdejrddtrddtrddupdduleegrdejkedrvdduuddrvddvtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeeimgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=iRerMIqcg705wvXkK03fPSow3rNWPe+rC3n7S1B/WCc=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738602018; v=1;
 b=cQOV8OZySmlb8b0PU5NdcRKEOmScbdQU1PkusjcLeiSSTTRxzYoWW/EPYmr/PIpwhUMscuUe
 9Aa9AYBxG1JkqNRsHnH1BnXXF3qjMvAbcxUdr/SGNO1R1vHeiEaGuG3mQ6bi3fFgaILEq3WGuff
 FlEXvKe+dIg1ZRyb36KLBgtEshyoWAV7dfUHc3lPKGY3JMrTC2JuU/sFmoPWDpceQtn455VKZIq
 gXVnNlqVR5uQge+mbIcTdViNKM00AIdNVoxV3ZMykIBUqIJNpUdyiMd95QXtFt/2OJaUNEyGYYI
 SMZBXt4QfPKjHsOmZ8WdOCw3N3nGV5c7xsLYh1CUYI+Xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=cQOV8OZy
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003e9ecda80-5839-45ae-9529-9176c94a591c,
 42D1D123F7650646679CF9F389D148596614922C)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH v2] package/ramsmp: switch to a Github repo
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

VGhlIHBhY2thZ2UgaXMgbm8gbW9yZSBhdmFpbGFibGUgYXQgYWxhc2lyLmNvbS4KU29tZW9uZSBw
dXRzIHRoZSBwYWNrYWdlIG9uIGEgZ2l0aHViIHJlcG9zaXRvcnkgc28gdXNlIHRoYXQgcmVwb3Np
dG9yeS4KClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gUmVtb3ZlIGhhc2ggZm9y
IHJhbXNtcC0zLjUuMC50YXIuZ3oKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjUwMjAzLXJhbXNtcC1maXgtdXJsLXYxLTEtMjZjNTcwYjIwOWE4QGFybWFkZXVzLmNv
bQotLS0KCkkgaGF2ZSBjaGVja2VkIHRoYXQgdGhlIGNvbnRlbnQgYXJlIHRoZSBzYW1lOgoKJCBk
aWZmIC1yIHJhbXNtcC0zLjUuMC8gcmFtc3BlZWQtc21wLTZhZjMzMzBhYTNiMTVmNmU3OWVkYTQ1
ZDBhODhmZTUyNTRkNDYzNzcvCk9ubHkgaW4gcmFtc21wLTMuNS4wLzogdGVtcAoKdGVtcCBkaXIg
aXMgZW1wdHkuCi0tLQogcGFja2FnZS9yYW1zbXAvcmFtc21wLmhhc2ggfCAyICstCiBwYWNrYWdl
L3JhbXNtcC9yYW1zbXAubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9yYW1zbXAvcmFtc21w
Lmhhc2ggYi9wYWNrYWdlL3JhbXNtcC9yYW1zbXAuaGFzaAppbmRleCBjNWUyOWEzOTAwYjFmZmM1
M2I5OWU5MGNjZGYzNmRkN2NiYjA3NWZmLi4zYTdlMDlmMDQ5MTBjZTI2ZjRmMzJiZDM0OWY1Y2Uy
MjY0ZjAzMzViIDEwMDY0NAotLS0gYS9wYWNrYWdlL3JhbXNtcC9yYW1zbXAuaGFzaAorKysgYi9w
YWNrYWdlL3JhbXNtcC9yYW1zbXAuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBjb21w
dXRlZAotc2hhMjU2ICAzOWZiMTU0OTNmYjNjMjkzNTc1NzQ2ZDU2ZjZhYjlmYWFhMWQ4NzZkOGIx
ZjBkOGU1YTQwNDJkMmFjZTk1ODM5ICByYW1zbXAtMy41LjAudGFyLmd6CitzaGEyNTYgIDIyMGYw
NTYwMTlmMWRiZjg5Y2JjMDJkNTkwMmVhNjZjYzMxYzFjYTU5ZDk3NTVmMTlhMDEzODU2MjRlNWQy
M2IgIHJhbXNtcC02YWYzMzMwYWEzYjE1ZjZlNzllZGE0NWQwYTg4ZmU1MjU0ZDQ2Mzc3LnRhci5n
egogc2hhMjU2ICAyYzMwOGNmZmJhYjAxNzYyZjhmNmIxMTcyNTcyNWEyMjcwODA3NDZlZjg2NWYy
NzU2YzljOWUxNTkxZGRkYWFkICBMSUNFTkNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JhbXNtcC9y
YW1zbXAubWsgYi9wYWNrYWdlL3JhbXNtcC9yYW1zbXAubWsKaW5kZXggNjA5ODM3NmRhNTk2NzI1
OTY5YmM0MjM0MWI2OWIwOTM4NWEwMDc5Yy4uZjhkZTZjOTM2Y2UyMmU4ZTA1ZDZmMDQxYWM2YzRm
YjU1MjE2NDdlNSAxMDA2NDQKLS0tIGEvcGFja2FnZS9yYW1zbXAvcmFtc21wLm1rCisrKyBiL3Bh
Y2thZ2UvcmFtc21wL3JhbXNtcC5tawpAQCAtNCw4ICs0LDggQEAKICMKICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCiAKLVJBTVNNUF9WRVJTSU9OID0gMy41LjAKLVJBTVNNUF9TSVRFID0gaHR0cDov
L3d3dy5hbGFzaXIuY29tL3NvZnR3YXJlL3JhbXNwZWVkCitSQU1TTVBfVkVSU0lPTiA9IDZhZjMz
MzBhYTNiMTVmNmU3OWVkYTQ1ZDBhODhmZTUyNTRkNDYzNzcKK1JBTVNNUF9TSVRFID0gJChjYWxs
IGdpdGh1YixjcnV2b2xvLHJhbXNwZWVkLXNtcCwkKFJBTVNNUF9WRVJTSU9OKSkKIFJBTVNNUF9B
UkNIID0gJChpZiAkKEJSMl9pMzg2KSxpMzg2KSQoaWYgJChCUjJfeDg2XzY0KSx4ODZfNjQpCiBS
QU1TTVBfTElDRU5TRSA9IEFsYXNpciBMaWNlbnNlCiBSQU1TTVBfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOQ0UKCi0tLQpiYXNlLWNvbW1pdDogODUzNzZhNzE4MTRlZWZiMDAyMTJjYWE2YjJkNTI2ZmNk
ZGZiYjA4NApjaGFuZ2UtaWQ6IDIwMjUwMjAzLXJhbXNtcC1maXgtdXJsLTJlMmVlNTcyOGJjMgoK
QmVzdCByZWdhcmRzLAotLSAKU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5z
a2lAYXJtYWRldXMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
