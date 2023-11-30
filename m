Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AD3C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 09:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B12FB6F580;
	Thu, 30 Nov 2023 09:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B12FB6F580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlSOyjH6DaLO; Thu, 30 Nov 2023 09:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EFC26F54D;
	Thu, 30 Nov 2023 09:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EFC26F54D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5672E1BF3C9
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 09:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27619802B0
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 09:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27619802B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5UoO4Lip-una for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 09:52:53 +0000 (UTC)
X-Greylist: delayed 4201 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 30 Nov 2023 09:52:53 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 999B2801ED
Received: from 4.mo582.mail-out.ovh.net (4.mo582.mail-out.ovh.net
 [87.98.184.159])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 999B2801ED
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 09:52:53 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.16.60])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 9917B29465
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:34:23 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-l5tkx (unknown [10.110.208.233])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3C08E1FE74;
 Thu, 30 Nov 2023 08:34:23 +0000 (UTC)
Received: from armadeus.com ([37.59.142.102])
 by ghost-submission-6684bf9d7b-l5tkx with ESMTPSA
 id XzZaCw9JaGU+MQAABSO5ag
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 30 Nov 2023 08:34:23 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:33:40 +0100
Message-ID: <20231130083340.16983-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5264426490779069419
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiiedguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepleefjeefgeeuuddugeduuddugfetgeffjeegueeujeeigeekhffgueehteeuvdehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004b36328e3-4e6a-493d-81eb-c70a0a6e3c24,
 3282869EE3D67C4C7D7CD6692688003ECA0907D0)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/libusb-compat: fix hash
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBzdHJlYW0gcmUtcmVsZWFzZWQgdGhlIHYwLjEuOCB0YXJiYWxscyB3aXRoIGF1dG90b29scyBy
ZWxhdGVkIHN0dWZmLiBbMV0KVGhhdCBtYWtlcyB0aGUgaGFzaCB0ZXN0IHRvIGZhaWw6CgpFUlJP
Ujogd2hpbGUgY2hlY2tpbmcgaGFzaGVzIGZyb20gcGFja2FnZS9saWJ1c2ItY29tcGF0Ly9saWJ1
c2ItY29tcGF0Lmhhc2gKRVJST1I6IGxpYnVzYi1jb21wYXQtMC4xLjgudGFyLmJ6MiBoYXMgd3Jv
bmcgc2hhMjU2IGhhc2g6CkVSUk9SOiBleHBlY3RlZDogNjk4Yzc2NDg0ZjNkZWMxZTAxNzUwNjdj
YmQxNTU2YzMwMjFlOTRlN2YyMzEzYWUzZWE2YTY2ZDkwMGUwMDgyNwpFUlJPUjogZ290ICAgICA6
IGI2OTJkY2Y2NzRjMDcwYzhjMGJlZTNjODIzMGNlNGVlNTkwM2Y5MjZkNzdkYzhiOTY4YTRkZDFi
NzBmOWIwNWMKRVJST1I6IEluY29tcGxldGUgZG93bmxvYWQsIG9yIG1hbi1pbi10aGUtbWlkZGxl
IChNSVRNKSBhdHRhY2sKClVwZGF0ZSB0aGUgaGFzaCBhbmQgZHJvcCBMSUJVU0JfQ09NUEFUX0FV
VE9SRUNPTkYuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xpYnVzYi9saWJ1c2ItY29tcGF0LTAu
MS9pc3N1ZXMvMjgjaXNzdWVjb21tZW50LTE3NTk0MDA1NDgKClNpZ25lZC1vZmYtYnk6IFPDqWJh
c3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCiBw
YWNrYWdlL2xpYnVzYi1jb21wYXQvbGlidXNiLWNvbXBhdC5oYXNoIHwgMiArLQogcGFja2FnZS9s
aWJ1c2ItY29tcGF0L2xpYnVzYi1jb21wYXQubWsgICB8IDMgLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGli
dXNiLWNvbXBhdC9saWJ1c2ItY29tcGF0Lmhhc2ggYi9wYWNrYWdlL2xpYnVzYi1jb21wYXQvbGli
dXNiLWNvbXBhdC5oYXNoCmluZGV4IGExOThlNzYwNThiOS4uNzhmMWRiZGNmODlkIDEwMDY0NAot
LS0gYS9wYWNrYWdlL2xpYnVzYi1jb21wYXQvbGlidXNiLWNvbXBhdC5oYXNoCisrKyBiL3BhY2th
Z2UvbGlidXNiLWNvbXBhdC9saWJ1c2ItY29tcGF0Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExv
Y2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYgIDY5OGM3NjQ4NGYzZGVjMWUwMTc1MDY3Y2JkMTU1NmMz
MDIxZTk0ZTdmMjMxM2FlM2VhNmE2NmQ5MDBlMDA4MjcgIGxpYnVzYi1jb21wYXQtMC4xLjgudGFy
LmJ6Mgorc2hhMjU2ICBiNjkyZGNmNjc0YzA3MGM4YzBiZWUzYzgyMzBjZTRlZTU5MDNmOTI2ZDc3
ZGM4Yjk2OGE0ZGQxYjcwZjliMDVjICBsaWJ1c2ItY29tcGF0LTAuMS44LnRhci5iejIKIHNoYTI1
NiAgNWRmMDcwMDcxOTg5ODljNjIyZjVkNDFkZThkNzAzZTdiZWYzZDBlNzlkNjJlMjQzMzJlZTcz
OWE0NTJhZjYyYSAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ1c2ItY29tcGF0L2xp
YnVzYi1jb21wYXQubWsgYi9wYWNrYWdlL2xpYnVzYi1jb21wYXQvbGlidXNiLWNvbXBhdC5tawpp
bmRleCBkNDliNzUzNjcwMzYuLmU5Zjg0NTE4MGU3YiAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJ1
c2ItY29tcGF0L2xpYnVzYi1jb21wYXQubWsKKysrIGIvcGFja2FnZS9saWJ1c2ItY29tcGF0L2xp
YnVzYi1jb21wYXQubWsKQEAgLTE0LDkgKzE0LDYgQEAgTElCVVNCX0NPTVBBVF9JTlNUQUxMX1NU
QUdJTkcgPSBZRVMKIExJQlVTQl9DT01QQVRfQ09ORklHX1NDUklQVFMgPSBsaWJ1c2ItY29uZmln
CiBMSUJVU0JfQ09NUEFUX0xJQ0VOU0UgPSBMR1BMLTIuMSsKIExJQlVTQl9DT01QQVRfTElDRU5T
RV9GSUxFUyA9IENPUFlJTkcKLSMgMC4xLjggdGFyYmFsbCB3YXMgcmVsZWFzZWQgd2l0aG91dCBj
b25maWd1cmUgc2NyaXB0IGJ5IHVwc3RyZWFtCi0jIGRpc2N1c3NlZCBoZXJlOiBodHRwczovL2dp
dGh1Yi5jb20vbGlidXNiL2xpYnVzYi1jb21wYXQtMC4xL2lzc3Vlcy8yOAotTElCVVNCX0NPTVBB
VF9BVVRPUkVDT05GID0gWUVTCiAKIGlmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSwpCiBMSUJVU0Jf
Q09NUEFUX0NPTkZfRU5WICs9IFwKLS0gCjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
