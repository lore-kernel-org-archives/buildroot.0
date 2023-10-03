Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CF0E75457
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 12:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7813F42113;
	Tue,  3 Oct 2023 12:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7813F42113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2RqFadDjVcEt; Tue,  3 Oct 2023 12:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A3D42101;
	Tue,  3 Oct 2023 12:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A3D42101
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1AD51BF352
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AE1261139
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AE1261139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0271dj-QLm3g for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 12:41:02 +0000 (UTC)
X-Greylist: delayed 924 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Oct 2023 12:41:01 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7F3C60E02
Received: from 18.mo583.mail-out.ovh.net (18.mo583.mail-out.ovh.net
 [178.33.45.10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7F3C60E02
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 12:41:01 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.16.164])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 5109E28AA4
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 12:25:34 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-f9pb6 (unknown [10.110.208.79])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BADE01FF04;
 Tue,  3 Oct 2023 12:25:32 +0000 (UTC)
Received: from armadeus.com ([37.59.142.101])
 by ghost-submission-6684bf9d7b-f9pb6 with ESMTPSA
 id n8dJNTwIHGXoDwAAcmV8Jg
 (envelope-from <julien.boibessot@armadeus.com>);
 Tue, 03 Oct 2023 12:25:32 +0000
X-OVh-ClientIp: 82.65.105.106
From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 14:25:17 +0200
Message-Id: <20231003122517.2725616-1-julien.boibessot@armadeus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 593912201086423505
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfeeigdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhulhhivghnuceuqffkuefguffuqffvuceojhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepgeejueeiteffgeelvdevvdfgvddtfffgteehvdevieevteethfelgfdvkefhfeevnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdhsohhurhgtvghfohhrghgvrdhnvghtnecukfhppeduvdejrddtrddtrddupdekvddrieehrddutdehrddutdeipdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004dd961b2e-b7c7-4c93-9756-f222523e342e,
 FD09684076E55393BE38BA5300CC9367568EDEAE)
 smtp.auth=julien.boibessot@armadeus.com
Subject: [Buildroot] [PATCH v2] package/ltris: bump to version 1.2.7
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
Ym9pYmVzc290QGFybWFkZXVzLmNvbT4KCi0tLQpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gdXBkYXRl
ZCAuY2hlY2twYWNrYWdlaWdub3JlIGFzIHJlcXVlc3RlZCBieSBGYWJyaWNlIEZvbnRhaW5lCgot
LS0KIC5jaGVja3BhY2thZ2VpZ25vcmUgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0K
IC4uLi9sdHJpcy8wMDAxLWZpeC1idWlsZC13aXRoLWdjYy00LjgucGF0Y2ggICB8IDIwIC0tLS0t
LS0tLS0tLS0tLS0tLS0KIHBhY2thZ2UvbHRyaXMvbHRyaXMuaGFzaCAgICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCiBwYWNrYWdlL2x0cmlzL2x0cmlzLm1rICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbHRyaXMvMDAwMS1maXgtYnVpbGQtd2l0
aC1nY2MtNC44LnBhdGNoCgpkaWZmIC0tZ2l0IGEvLmNoZWNrcGFja2FnZWlnbm9yZSBiLy5jaGVj
a3BhY2thZ2VpZ25vcmUKaW5kZXggMjhkZTE3NDVlNC4uMzkzZmFjMDYzOCAxMDA2NDQKLS0tIGEv
LmNoZWNrcGFja2FnZWlnbm9yZQorKysgYi8uY2hlY2twYWNrYWdlaWdub3JlCkBAIC04MjQsNyAr
ODI0LDYgQEAgcGFja2FnZS9sc2h3LzAwMDEtc29sdmUtQ29tcGlsZS1lcnJvci13aGVuLWctdmVy
c2lvbi1pcy1sZXNzLXRoYW4tNS5wYXRjaCBVcHN0cmUKIHBhY2thZ2UvbHRyYWNlLzAwMDEtYXJt
LXBsdC5wYXRjaCBVcHN0cmVhbQogcGFja2FnZS9sdHJhY2UvMDAwMi1zcGFyYy1hZGQtbWlzc2lu
Zy1saWJyYXJ5LmgtaW5jbHVkZS5wYXRjaCBVcHN0cmVhbQogcGFja2FnZS9sdHJhY2UvMDAwMy1j
b25maWd1cmUuYWMtZml4LWF1dG9yZWNvbmYtd2l0aC1hdXRvY29uZi0yLjcwLnBhdGNoIFVwc3Ry
ZWFtCi1wYWNrYWdlL2x0cmlzLzAwMDEtZml4LWJ1aWxkLXdpdGgtZ2NjLTQuOC5wYXRjaCBVcHN0
cmVhbQogcGFja2FnZS9sdHRuZy1iYWJlbHRyYWNlLzAwMDEtdGVzdHMtbGliLU1ha2VmaWxlLmFt
LXJlbW92ZS11bm5lZWRlZC1zdGF0aWMtZmxhZy5wYXRjaCBVcHN0cmVhbQogcGFja2FnZS9sdHRu
Zy1iYWJlbHRyYWNlLzAwMDItY29uZmlndXJlLmFjLWZpeC1wb3B0LXN0YXRpYy1idWlsZC5wYXRj
aCBVcHN0cmVhbQogcGFja2FnZS9sdHRuZy1saWJ1c3QvMDAwMS1jb25maWd1cmUuYWMtYWRkLWRp
c2FibGUtdGVzdHMucGF0Y2ggVXBzdHJlYW0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHRyaXMvMDAw
MS1maXgtYnVpbGQtd2l0aC1nY2MtNC44LnBhdGNoIGIvcGFja2FnZS9sdHJpcy8wMDAxLWZpeC1i
dWlsZC13aXRoLWdjYy00LjgucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGQ2
YmJmNmE5NDYuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9sdHJpcy8wMDAxLWZpeC1idWlsZC13
aXRoLWdjYy00LjgucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyMCArMCwwIEBACi1GaXggYnVp
bGQgd2l0aCBnY2MgNC44Ci0KLVNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRh
aW5lLmZhYnJpY2VAZ21haWwuY29tPgotW1Vwc3RyZWFtIHN0YXR1czogaHR0cHM6Ly9zb3VyY2Vm
b3JnZS5uZXQvcC9sZ2FtZXMvcGF0Y2hlcy8yOF0KLUluZGV4OiBsdHJpcy9zcmMvYm93bC5jCi09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09Ci0tLS0gbHRyaXMvc3JjL2Jvd2wuYwkocsOpdmlzaW9uIDQyMSkKLSsrKyBsdHJp
cy9zcmMvYm93bC5jCShjb3BpZSBkZSB0cmF2YWlsKQotQEAgLTgyOCw5ICs4MjgsMTAgQEAKLSAq
LwotIHZvaWQgYm93bF9pbml0X2Jsb2NrX21hc2tzKCkgCi0gewotKwlpbnQgaTsKLSAJaW50IG1h
c2tzaXplID0gc2l6ZW9mKGJsb2NrX21hc2tzWzBdLm1hc2spOyAvLyBzYW1lIGZvciBhbGwKLSAK
LS0JZm9yIChpbnQgaSA9IDA7IGkgPCA3OyBpKyspIHsKLSsJZm9yIChpID0gMDsgaSA8IDc7IGkr
KykgewotIAkJYmxvY2tfbWFza3NbaV0ucnggPSAyOwotIAkJYmxvY2tfbWFza3NbaV0ucnkgPSAy
OwotIAkJbWVtc2V0KGJsb2NrX21hc2tzW2ldLm1hc2ssIDAsIG1hc2tzaXplICk7CmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2x0cmlzL2x0cmlzLmhhc2ggYi9wYWNrYWdlL2x0cmlzL2x0cmlzLmhhc2gK
aW5kZXggZjY5NmUzYWYxNy4uYWJlNjg1M2Q5YiAxMDA2NDQKLS0tIGEvcGFja2FnZS9sdHJpcy9s
dHJpcy5oYXNoCisrKyBiL3BhY2thZ2UvbHRyaXMvbHRyaXMuaGFzaApAQCAtMSwzICsxLDMgQEAK
ICMgTG9jYWxseSBjb21wdXRlZDoKLXNoYTI1NiAgYTdiYzZjNWZjNjUzOWI4ODUwNTA3N2ExYjQ1
ODBlZGM5YjE3OWNlMGE2YjgyOWM1OGZiZDk0MTZjZjQ1NjE5NSAgbHRyaXMtMS4yLnRhci5negor
c2hhMjU2ICAxMjkxYzZhNjQyZDA2YjllZTE1M2FjMGEyZTc4NTVhMmM5ODNlODM5YzYxOGYxYTI5
NGRmMDRkODI5NTI1Y2IwICBsdHJpcy0xLjIuNy50YXIuZ3oKIHNoYTI1NiAgNjdmODJlMDQ1Y2Y3
YWNmZWY4NTNlYTBmNDI2NTc1YTgzNTkxNjFhMGEzMjVlMTlmMDJiNTI5YTg3YzRiNmMzNCAgQ09Q
WUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdHJpcy9sdHJpcy5tayBiL3BhY2thZ2UvbHRyaXMv
bHRyaXMubWsKaW5kZXggOWI1OTYxMzQxNy4uOTg5MDJkZTQ0YyAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9sdHJpcy9sdHJpcy5taworKysgYi9wYWNrYWdlL2x0cmlzL2x0cmlzLm1rCkBAIC01LDcgKzUs
NyBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAogTFRSSVNfU0lURSA9IGh0dHA6Ly9kb3du
bG9hZHMuc291cmNlZm9yZ2UubmV0L2xnYW1lcy9sdHJpcwotTFRSSVNfVkVSU0lPTiA9IDEuMgor
TFRSSVNfVkVSU0lPTiA9IDEuMi43CiBMVFJJU19MSUNFTlNFID0gR1BMLTIuMCsKIExUUklTX0xJ
Q0VOU0VfRklMRVMgPSBDT1BZSU5HCiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
