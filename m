Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8857C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 00:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51C4C41B4A;
	Wed, 30 Mar 2022 00:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmmXXyaIcHu7; Wed, 30 Mar 2022 00:28:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E82AE4189B;
	Wed, 30 Mar 2022 00:28:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8761BF9C6
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 00:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE79640245
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 00:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wLfXdOlNbLjr for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 00:28:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-outgoing-2001.laposte.net (smtp-outgoing-2001.laposte.net
 [160.92.124.108])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF1AF40227
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 00:28:27 +0000 (UTC)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KSnN702p8zSgpM",
 "contextId":"c25a635f-e18b-401b-a7a3-73860890e3f7"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0112.laposte.net (SMTP Server) with ESMTP id 4KSnN702p8zSgpM;
 Wed, 30 Mar 2022 02:28:23 +0200 (CEST)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KSnN61vzhzSgpL",
 "contextId":"a5f414ba-0d5a-404e-91a1-5cef24fd0669"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 46
X-lpn-spamlevel: not-spam
X-lpn-spamcause: OK,
 (-100)(0000)gggruggvucftvghtrhhoucdtuddrgedvvddrudeiuddgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecunfetrffquffvgfdpggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepgghinhgtvghnthcuufhtvghhlhoruceovhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtqeenucggtffrrghtthgvrhhnpeetheejlefhfeefudeuvddtgeffkeekhfegtdekffetfeehvdefheevkeeiveevffenucffohhmrghinhepfhhrihhpphgvrhihrdhorhhgnecukfhppeekkedrudeiledruddvledrvddvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeiledruddvledrvddvhedphhgvlhhopehrohhmuhgrlhgurdgsvghrghgvrhhivgdpmhgrihhlfhhrohhmpehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvthdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepvhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtpdhmohguvgepshhmthhpo
 hhuth
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0112.laposte.net (SMTP Server) with ESMTPSA id 4KSnN61vzhzSgpL;
 Wed, 30 Mar 2022 02:28:22 +0200 (CEST)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTP id DEAE0489DF85;
 Wed, 30 Mar 2022 02:28:21 +0200 (CEST)
Received: from vincent by radicelle.bergerie with local (Exim 4.95)
 (envelope-from <vincent@radicelle.bergerie>) id 1nZMCD-0005Vi-R4;
 Wed, 30 Mar 2022 02:28:21 +0200
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 02:28:13 +0200
Message-Id: <20220330002813.19070-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=lpn-wlmd;
 t=1648600105; bh=RtPndjSYECVT0apRaT2BPK8otpL8/BGfMbVgHiOsYv0=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=M7DBUa4avWVdnt5zHaDzQoy4o4jbDeRxwP4eK+V0q1CQIVBcMj86RHRe8RN1wnn0oP4rzKuWexE8HIqY3HZWWbHWgQ2igFY7jG/jTz6pNucBJMHAusQHqTPI24ThjpXENk1spagiatpAt0x4dPc0X0MVSBNjzAgQZYxFknY6u/iMX1rxVBzRtsdqAvSfOuEq7oJNiBZ3nxQeQbVna2HBL4eP8bvVj5TZMgA5jY923ggwDSY29i1mnEMXiFf20+39/b78ackAIOa7HS9YxVeR4WkuUGD8cF4ZNKQCz5uS4mo9dps8In+woZnU7v7BvOYcpX8kN46HDWzrFnBHfEiw2A==;
Subject: [Buildroot] [PATCH] package/zerofree: new package
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

emVyb2ZyZWUgaXMgYSB1dGlsaXR5IHdoaWNoIHNjYW5zIHRoZSBmcmVlIGJsb2NrcyBpbiBhbiBl
eHQyIGZpbGVzeXN0ZW0gYW5kCmZpbGxzIGFueSBub24temVybyBibG9ja3Mgd2l0aCB6ZXJvZXMu
CgpodHRwczovL2ZyaXBwZXJ5Lm9yZy91bWwvCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhs
w6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgpDYzogVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAg
ICAgICAgfCAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgfCAgMSArCiBwYWNr
YWdlL3plcm9mcmVlL0NvbmZpZy5pbiAgICAgfCAxNCArKysrKysrKysrKysrKwogcGFja2FnZS96
ZXJvZnJlZS96ZXJvZnJlZS5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL3plcm9mcmVlL3plcm9mcmVl
Lm1rICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDQxIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3plcm9mcmVlL0NvbmZpZy5p
bgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvemVyb2ZyZWUvemVyb2ZyZWUuaGFzaAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvemVyb2ZyZWUvemVyb2ZyZWUubWsKCmRpZmYgLS1naXQg
YS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBhNjZiOWQ3ZWVlLi4wNGUyYmFkNWEyIDEw
MDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTI4OTcsNiArMjg5Nyw3
IEBAIEY6CWNvbmZpZ3MvdWV2bTU0MzJfZGVmY29uZmlnCiBGOglwYWNrYWdlL2k3ei8KIEY6CXBh
Y2thZ2UvbXNyLXRvb2xzLwogRjoJcGFja2FnZS9waXh6LworRjoJcGFja2FnZS96ZXJvZnJlZS8K
IAogTjoJVmluaWNpdXMgVGludGkgPHZpbmljaXVzdGludGlAZ21haWwuY29tPgogRjoJcGFja2Fn
ZS9weXRob24tdGhyaWZ0LwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdl
L0NvbmZpZy5pbgppbmRleCAwZDVkNzYzMTgwLi4wZTU4Y2JjODMyIDEwMDY0NAotLS0gYS9wYWNr
YWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMjM4LDYgKzIzOCw3IEBA
IG1lbnUgIkZpbGVzeXN0ZW0gYW5kIGZsYXNoIHV0aWxpdGllcyIKIAlzb3VyY2UgInBhY2thZ2Uv
dWRmdG9vbHMvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS91bmlvbmZzL0NvbmZpZy5pbiIK
IAlzb3VyY2UgInBhY2thZ2UveGZzcHJvZ3MvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS96
ZXJvZnJlZS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3pmcy9Db25maWcuaW4iCiBlbmRt
ZW51CiAKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemVyb2ZyZWUvQ29uZmlnLmluIGIvcGFja2FnZS96
ZXJvZnJlZS9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
YzkwYWRkNDQyZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvemVyb2ZyZWUvQ29uZmlnLmlu
CkBAIC0wLDAgKzEsMTQgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9aRVJPRlJFRQorCWJvb2wgInpl
cm9mcmVlIgorCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBlMmZzcHJvZ3MKKwlkZXBlbmRzIG9u
ICFCUjJfU1RBVElDX0xJQlMKKwlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfTVVTTAor
CXNlbGVjdCBCUjJfUEFDS0FHRV9FMkZTUFJPR1MKKwloZWxwCisJICB6ZXJvZnJlZSBpcyBhIHV0
aWxpdHkgd2hpY2ggc2NhbnMgdGhlIGZyZWUgYmxvY2tzIGluIGFuIGV4dDIKKwkgIGZpbGVzeXN0
ZW0gYW5kIGZpbGxzIGFueSBub24temVybyBibG9ja3Mgd2l0aCB6ZXJvZXMuCisKKwkgIGh0dHBz
Oi8vZnJpcHBlcnkub3JnL3VtbC8KKworY29tbWVudCAiemVyb2ZyZWUgbmVlZHMgTU1VLCBkeW5h
bWljIGxpYnJhcnkgYW5kIGRvZXMgbm90IGJ1aWxkIHdpdGggbXVzbCIKKwlkZXBlbmRzIG9uICFC
UjJfVVNFX01NVSB8fCBCUjJfU1RBVElDX0xJQlMgfHwgQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvemVyb2ZyZWUvemVyb2ZyZWUuaGFzaCBiL3BhY2thZ2UvemVy
b2ZyZWUvemVyb2ZyZWUuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li4zMzk5NjExNzg3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS96ZXJvZnJlZS96ZXJvZnJl
ZS5oYXNoCkBAIC0wLDAgKzEsMyBAQAorIyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgOTU2
YmM4NjFiNTViYTBhMmI3NTkzYzU4ZDMyMzM5ZGFiMWEwZTdkYTZlYTJiODEzZDI3YzgwZjA4Yjcy
Mzg2NyAgemVyb2ZyZWUtMS4xLjEudGd6CitzaGEyNTYgIDkwZGFhZTAwNDc1YTk5MmEzNjdkYTVi
MDY1ODQ2OWE1ZDFjNDQ0OWRiYmU5NjRjNWI3MjQ2ZTFhZWM5MmY0OTEgIENPUFlJTkcKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvemVyb2ZyZWUvemVyb2ZyZWUubWsgYi9wYWNrYWdlL3plcm9mcmVlL3pl
cm9mcmVlLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjYzYzlmZDU3
ZDgKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3plcm9mcmVlL3plcm9mcmVlLm1rCkBAIC0w
LDAgKzEsMjIgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHplcm9mcmVlCisjCisj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitaRVJPRlJFRV9WRVJTSU9OID0gMS4xLjEKK1pFUk9G
UkVFX1NPVVJDRSA9IHplcm9mcmVlLSQoWkVST0ZSRUVfVkVSU0lPTikudGd6CitaRVJPRlJFRV9T
SVRFID0gaHR0cHM6Ly9mcmlwcGVyeS5vcmcvdW1sCitaRVJPRlJFRV9MSUNFTlNFID0gR1BMLTIu
MAorWkVST0ZSRUVfTElDRU5TRV9GSUxFID0gQ09QWUlORworWkVST0ZSRUVfREVQRU5ERU5DSUVT
ID0gZTJmc3Byb2dzCisKK2RlZmluZSBaRVJPRlJFRV9CVUlMRF9DTURTCisJJChNQUtFKSAkKFRB
UkdFVF9DT05GSUdVUkVfT1BUUykgLUMgJChARCkgYWxsCitlbmRlZgorCitkZWZpbmUgWkVST0ZS
RUVfSU5TVEFMTF9UQVJHRVRfQ01EUworCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKEBEKS96ZXJv
ZnJlZSAkKFRBUkdFVF9ESVIpL3Vzci9iaW4KK2VuZGVmCisKKyQoZXZhbCAkKGdlbmVyaWMtcGFj
a2FnZSkpCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
