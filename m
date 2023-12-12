Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C395AC4167B
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 16:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68B7A41B58;
	Tue, 12 Dec 2023 16:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B7A41B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8TuqY84bq6g; Tue, 12 Dec 2023 16:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B208C41B52;
	Tue, 12 Dec 2023 16:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B208C41B52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 676B01BF429
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 16:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40A55829BB
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 16:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40A55829BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPe5ikyCTr2B for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 16:17:39 +0000 (UTC)
X-Greylist: delayed 8815 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 12 Dec 2023 16:17:39 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E6A3829B6
Received: from 6.mo576.mail-out.ovh.net (6.mo576.mail-out.ovh.net
 [46.105.50.107])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E6A3829B6
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 16:17:39 +0000 (UTC)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.139.154])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 04B02278E7
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 13:50:41 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-tx6zr (unknown [10.110.178.147])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 948E91FDF3;
 Tue, 12 Dec 2023 13:50:41 +0000 (UTC)
Received: from armadeus.com ([37.59.142.110])
 by ghost-submission-6684bf9d7b-tx6zr with ESMTPSA
 id 06t9IDFleGU21AAA4en/0w
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 12 Dec 2023 13:50:41 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 14:49:55 +0100
Message-ID: <20231212134955.32728-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7291609275558325227
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudelgedgheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeetgeejhefgieeggedtheejueeitdelteetvdfhveffjeffgfekfeekveehuddvteenucffohhmrghinhepohhlughmrghnphhrohhgrhgrmhhmvghrrdhnvghtpdhgihhtlhgrsgdrtghomhdpghhithhhuhgsrdgtohhmpdhinhgushhtrghtvgdrvgguuhenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004b129688d-0c59-4a41-a599-6bd9de514da6,
 0B065E34F8656297E0C5CD2D328CDA07FBEFC2F4)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/tree: update _SITE URL
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGN1cnJlbnQgVFJFRV9TSVRFIFVSTCBkb2Vzbid0IHdvcmsgYW55bW9yZS4KTW9yZW92ZXIg
dGhlIFJFQURNRSBzdGF0ZXM6CiIKVGhlIG1haW4gZGlzdHJpYnV0aW9uIHNpdGUgZm9yIHRyZWUg
aXMgaGVyZToKaHR0cDovL29sZG1hbnByb2dyYW1tZXIubmV0L3NvdXJjZS5waHA/ZGlyPXByb2pl
Y3RzL3RyZWUKCkJhY2t1cCBHSVQgc2l0ZXMgYXJlOgpodHRwczovL2dpdGxhYi5jb20vT2xkTWFu
UHJvZ3JhbW1lci91bml4LXRyZWUKaHR0cHM6Ly9naXRodWIuY29tL09sZC1NYW4tUHJvZ3JhbW1l
ci90cmVlCgpPbGQgc2l0ZSBmb3IgYXMgbG9uZyBhcyBpdCBsYXN0czoKaHR0cDovL21hbWEuaW5k
c3RhdGUuZWR1L3VzZXJzL2ljZS90cmVlLwpmdHA6Ly9tYW1hLmluZHN0YXRlLmVkdS9saW51eC90
cmVlLwoiCgpVc2UgaHR0cDovL29sZG1hbnByb2dyYW1tZXIubmV0L3Rhci90cmVlLyBmb3IgVFJF
RV9TSVRFCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6
eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogcGFja2FnZS90cmVlL0NvbmZpZy5pbiB8IDIgKy0K
IHBhY2thZ2UvdHJlZS90cmVlLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3RyZWUvQ29uZmln
LmluIGIvcGFja2FnZS90cmVlL0NvbmZpZy5pbgppbmRleCAyMzQ5OTVmMTA5ZjQuLjQ4MjFiNTg5
NjA5NSAxMDA2NDQKLS0tIGEvcGFja2FnZS90cmVlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3Ry
ZWUvQ29uZmlnLmluCkBAIC03LDcgKzcsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfVFJFRQogCSAg
ZGlyY29sb3JzIGlmIHRoZSBMU19DT0xPUlMgZW52aXJvbm1lbnQgdmFyaWFibGUgaXMgc2V0IGFu
ZAogCSAgb3V0cHV0IGlzIHRvIHR0eS4KIAotCSAgaHR0cDovL21hbWEuaW5kc3RhdGUuZWR1L3Vz
ZXJzL2ljZS90cmVlLworCSAgaHR0cDovL29sZG1hbnByb2dyYW1tZXIubmV0L3NvdXJjZS5waHA/
ZGlyPXByb2plY3RzL3RyZWUKIAogY29tbWVudCAidHJlZSBuZWVkcyBhIHRvb2xjaGFpbiB3LyB3
Y2hhciIKIAlkZXBlbmRzIG9uICFCUjJfVVNFX1dDSEFSCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Ry
ZWUvdHJlZS5tayBiL3BhY2thZ2UvdHJlZS90cmVlLm1rCmluZGV4IDgzYTQyN2I3NGQzNy4uNDc5
YTE3MmE3MmI4IDEwMDY0NAotLS0gYS9wYWNrYWdlL3RyZWUvdHJlZS5taworKysgYi9wYWNrYWdl
L3RyZWUvdHJlZS5tawpAQCAtNiw3ICs2LDcgQEAKIAogVFJFRV9WRVJTSU9OID0gMi4xLjEKIFRS
RUVfU09VUkNFID0gdHJlZS0kKFRSRUVfVkVSU0lPTikudGd6Ci1UUkVFX1NJVEUgPSBodHRwOi8v
bWFtYS5pbmRzdGF0ZS5lZHUvdXNlcnMvaWNlL3RyZWUvc3JjCitUUkVFX1NJVEUgPSBodHRwOi8v
b2xkbWFucHJvZ3JhbW1lci5uZXQvdGFyL3RyZWUKIFRSRUVfTElDRU5TRSA9IEdQTC0yLjArCiBU
UkVFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCiAKLS0gCjIuNDEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
