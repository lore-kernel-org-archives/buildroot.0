Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B96E784BD
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 15:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC3E781462;
	Mon,  2 Oct 2023 15:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC3E781462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1beZCfyVkm-K; Mon,  2 Oct 2023 15:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BBAF81456;
	Mon,  2 Oct 2023 15:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BBAF81456
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 583261BF94D
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 15:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DC59610C7
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 15:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC59610C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cfF11FrjsyRw for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 15:17:15 +0000 (UTC)
X-Greylist: delayed 3907 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 02 Oct 2023 15:17:14 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAC6B6105F
Received: from 1.mo560.mail-out.ovh.net (1.mo560.mail-out.ovh.net
 [46.105.63.121])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAC6B6105F
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 15:17:14 +0000 (UTC)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.146.5])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 271CF2353A
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 13:52:30 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-rgtsv (unknown [10.110.171.111])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A37B91FE04;
 Mon,  2 Oct 2023 13:52:29 +0000 (UTC)
Received: from armadeus.com ([37.59.142.102])
 by ghost-submission-6684bf9d7b-rgtsv with ESMTPSA
 id VsgTIx3LGmW7LwAA50HbsQ
 (envelope-from <julien.boibessot@armadeus.com>);
 Mon, 02 Oct 2023 13:52:29 +0000
X-OVh-ClientIp: 91.172.110.41
From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 15:51:47 +0200
Message-Id: <20231002135147.2707988-1-julien.boibessot@armadeus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14636135840721457617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdelgdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhulhhivghnuceuqffkuefguffuqffvuceojhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepgeejueeiteffgeelvdevvdfgvddtfffgteehvdevieevteethfelgfdvkefhfeevnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdhsohhurhgtvghfohhrghgvrdhnvghtnecukfhppeduvdejrddtrddtrddupdeluddrudejvddruddutddrgedupdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00479e8f850-e387-4a12-ab7c-d3797ca994e9,
 A095AE4F9E4A6C3220D9491C1B8DABDEF55DFC56)
 smtp.auth=julien.boibessot@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/ltris: bump to version 1.2.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien BOIBESSOT <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGF0ZXN0IHJlbGVhc2UuIEFza2VkIGJ5IGF1dG9idWlsZC5idWlsZHJvb3QubmV0LgpSZW1vdmUg
aW50ZWdyYXRlZCBmaXguCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gQk9JQkVTU09UIDxqdWxpZW4u
Ym9pYmVzc290QGFybWFkZXVzLmNvbT4KLS0tCiAuLi4vbHRyaXMvMDAwMS1maXgtYnVpbGQtd2l0
aC1nY2MtNC44LnBhdGNoICAgfCAyMCAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNrYWdlL2x0cmlz
L2x0cmlzLmhhc2ggICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9sdHJpcy9s
dHJpcy5tayAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2x0cmlzLzAwMDEtZml4LWJ1aWxkLXdpdGgtZ2NjLTQuOC5wYXRjaAoKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbHRyaXMvMDAwMS1maXgtYnVpbGQtd2l0aC1nY2MtNC44LnBhdGNoIGIvcGFja2Fn
ZS9sdHJpcy8wMDAxLWZpeC1idWlsZC13aXRoLWdjYy00LjgucGF0Y2gKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IGQ2YmJmNmE5NDYuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9sdHJp
cy8wMDAxLWZpeC1idWlsZC13aXRoLWdjYy00LjgucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwy
MCArMCwwIEBACi1GaXggYnVpbGQgd2l0aCBnY2MgNC44Ci0KLVNpZ25lZC1vZmYtYnk6IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgotW1Vwc3RyZWFtIHN0YXR1
czogaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcC9sZ2FtZXMvcGF0Y2hlcy8yOF0KLUluZGV4OiBs
dHJpcy9zcmMvYm93bC5jCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gbHRyaXMvc3JjL2Jvd2wuYwkocsOpdmlz
aW9uIDQyMSkKLSsrKyBsdHJpcy9zcmMvYm93bC5jCShjb3BpZSBkZSB0cmF2YWlsKQotQEAgLTgy
OCw5ICs4MjgsMTAgQEAKLSAqLwotIHZvaWQgYm93bF9pbml0X2Jsb2NrX21hc2tzKCkgCi0gewot
KwlpbnQgaTsKLSAJaW50IG1hc2tzaXplID0gc2l6ZW9mKGJsb2NrX21hc2tzWzBdLm1hc2spOyAv
LyBzYW1lIGZvciBhbGwKLSAKLS0JZm9yIChpbnQgaSA9IDA7IGkgPCA3OyBpKyspIHsKLSsJZm9y
IChpID0gMDsgaSA8IDc7IGkrKykgewotIAkJYmxvY2tfbWFza3NbaV0ucnggPSAyOwotIAkJYmxv
Y2tfbWFza3NbaV0ucnkgPSAyOwotIAkJbWVtc2V0KGJsb2NrX21hc2tzW2ldLm1hc2ssIDAsIG1h
c2tzaXplICk7CmRpZmYgLS1naXQgYS9wYWNrYWdlL2x0cmlzL2x0cmlzLmhhc2ggYi9wYWNrYWdl
L2x0cmlzL2x0cmlzLmhhc2gKaW5kZXggZjY5NmUzYWYxNy4uYWJlNjg1M2Q5YiAxMDA2NDQKLS0t
IGEvcGFja2FnZS9sdHJpcy9sdHJpcy5oYXNoCisrKyBiL3BhY2thZ2UvbHRyaXMvbHRyaXMuaGFz
aApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBjb21wdXRlZDoKLXNoYTI1NiAgYTdiYzZjNWZj
NjUzOWI4ODUwNTA3N2ExYjQ1ODBlZGM5YjE3OWNlMGE2YjgyOWM1OGZiZDk0MTZjZjQ1NjE5NSAg
bHRyaXMtMS4yLnRhci5negorc2hhMjU2ICAxMjkxYzZhNjQyZDA2YjllZTE1M2FjMGEyZTc4NTVh
MmM5ODNlODM5YzYxOGYxYTI5NGRmMDRkODI5NTI1Y2IwICBsdHJpcy0xLjIuNy50YXIuZ3oKIHNo
YTI1NiAgNjdmODJlMDQ1Y2Y3YWNmZWY4NTNlYTBmNDI2NTc1YTgzNTkxNjFhMGEzMjVlMTlmMDJi
NTI5YTg3YzRiNmMzNCAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdHJpcy9sdHJpcy5t
ayBiL3BhY2thZ2UvbHRyaXMvbHRyaXMubWsKaW5kZXggOWI1OTYxMzQxNy4uOTg5MDJkZTQ0YyAx
MDA2NDQKLS0tIGEvcGFja2FnZS9sdHJpcy9sdHJpcy5taworKysgYi9wYWNrYWdlL2x0cmlzL2x0
cmlzLm1rCkBAIC01LDcgKzUsNyBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAogTFRSSVNf
U0lURSA9IGh0dHA6Ly9kb3dubG9hZHMuc291cmNlZm9yZ2UubmV0L2xnYW1lcy9sdHJpcwotTFRS
SVNfVkVSU0lPTiA9IDEuMgorTFRSSVNfVkVSU0lPTiA9IDEuMi43CiBMVFJJU19MSUNFTlNFID0g
R1BMLTIuMCsKIExUUklTX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCiAKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
