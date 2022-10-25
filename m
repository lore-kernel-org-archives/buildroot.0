Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A9DC04A95
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 07:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7C904019B;
	Tue, 25 Oct 2022 07:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C904019B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSKGs0R4b3Cy; Tue, 25 Oct 2022 07:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E74B9401A3;
	Tue, 25 Oct 2022 07:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E74B9401A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F345D1BF30B
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 07:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF3A4401A3
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 07:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF3A4401A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id foWtAkKvV_xO for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 07:19:39 +0000 (UTC)
X-Greylist: delayed 22:49:15 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 043F4400C4
Received: from 7.mo576.mail-out.ovh.net (7.mo576.mail-out.ovh.net
 [46.105.50.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 043F4400C4
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 07:19:38 +0000 (UTC)
Received: from player692.ha.ovh.net (unknown [10.111.172.36])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 580042416D
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 07:19:36 +0000 (UTC)
Received: from armadeus.com (atoulouse-656-1-53-167.w90-11.abo.wanadoo.fr
 [90.11.232.167])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id EBF402FECF799;
 Tue, 25 Oct 2022 07:19:31 +0000 (UTC)
X-OVh-ClientIp: 90.11.232.167
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 09:16:34 +0200
Message-Id: <20221025071634.8563-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10234430156588641264
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgedthedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepudehgfeltdehueehhfdtkedujeejffevieektdegieeuledtueejieffudfhhfetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpphihphhirdhorhhgpdhphihthhhonhhhohhsthgvugdrohhrghenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdefvddrudeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004d5fbe181-c523-4bf1-a872-34a6d8d6ebdc,
 7F4D1C011DFA1CD5A9BA5BC8FCB98F08BFA88FB4)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH v2 1/1] package/python-flask-jsonrpc: bump to
 version 2.2.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RHJvcCBwYXRjaCAwMDAxIGFzIGl0IGlzIG5vdCBuZWVkZWQgYW55bW9yZToKaHR0cHM6Ly9naXRo
dWIuY29tL2Nlbm9iaXRlcy9mbGFzay1qc29ucnBjL2NvbW1pdC8yNDI2YjdmNmZhYmVlZjllYjNh
OGRjNjU3MGUyZmNlMzNhMzBmOThlCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNr
aSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogLi4uLU1vdmUtcHl0ZXN0
LXJ1bm5lci10by10ZXN0c19yZXF1aXJlLnBhdGNoIHwgMzIgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uL3B5dGhvbi1mbGFzay1qc29ucnBjLmhhc2ggICAgICAgICAgICAgICAgIHwgIDQgKy0tCiAu
Li4vcHl0aG9uLWZsYXNrLWpzb25ycGMubWsgICAgICAgICAgICAgICAgICAgfCAgNCArLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1mbGFzay1qc29ucnBjLzAwMDEtTW92ZS1weXRlc3Qt
cnVubmVyLXRvLXRlc3RzX3JlcXVpcmUucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhv
bi1mbGFzay1qc29ucnBjLzAwMDEtTW92ZS1weXRlc3QtcnVubmVyLXRvLXRlc3RzX3JlcXVpcmUu
cGF0Y2ggYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1qc29ucnBjLzAwMDEtTW92ZS1weXRlc3QtcnVu
bmVyLXRvLXRlc3RzX3JlcXVpcmUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDhiNjcxMmU2MDEuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9weXRob24tZmxhc2stanNvbnJw
Yy8wMDAxLU1vdmUtcHl0ZXN0LXJ1bm5lci10by10ZXN0c19yZXF1aXJlLnBhdGNoCisrKyAvZGV2
L251bGwKQEAgLTEsMzIgKzAsMCBAQAotRnJvbSA4ZjA3NzY4MDg1ZmE0YzhkMjFkYmUyNzgwNWI3
MjM4ZTY3ZDNhZWE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogSmFtZXMgSGlsbGlh
cmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Ci1EYXRlOiBUdWUsIDE3IE1heSAyMDIyIDE1
OjUyOjU4IC0wNjAwCi1TdWJqZWN0OiBbUEFUQ0hdIE1vdmUgcHl0ZXN0LXJ1bm5lciB0byB0ZXN0
c19yZXF1aXJlCi0KLVRoaXMgaXNuJ3QgYSBidWlsZCByZXF1aXJlbWVudCBzbyBpdCBzaG91bGRu
J3QgYmUgdW5kZXIKLXNldHVwX3JlcXVpcmVzLgotCi1TaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxs
aWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KLVtVcHN0cmVhbSBzdGF0dXM6Ci1odHRw
czovL2dpdGh1Yi5jb20vY2Vub2JpdGVzL2ZsYXNrLWpzb25ycGMvcHVsbC8yMjddCi0tLS0KLSBz
ZXR1cC5weSB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKLQotZGlmZiAtLWdpdCBhL3NldHVwLnB5IGIvc2V0dXAucHkKLWluZGV4IDE5N2Q2Yzku
LmYyM2M0NzIgMTAwNzU1Ci0tLS0gYS9zZXR1cC5weQotKysrIGIvc2V0dXAucHkKLUBAIC00Miw4
ICs0Miw4IEBAIHNldHVwdG9vbHMuc2V0dXAoCi0gICAgICAgICAnYXN5bmMnOiBbJ0ZsYXNrW2Fz
eW5jXT49MS4wLjAsPDMuMCddLAotICAgICAgICAgJ2RvdGVudic6IFsnRmxhc2tbZG90ZW52XT49
MS4wLjAsPDMuMCddLAotICAgICB9LAotLSAgICBzZXR1cF9yZXF1aXJlcz1bJ3B5dGVzdC1ydW5u
ZXInXSwKLSAgICAgdGVzdHNfcmVxdWlyZT1bCi0rICAgICAgICAncHl0ZXN0LXJ1bm5lcicsCi0g
ICAgICAgICAnbW9jaz09NC4wLjMnLAotICAgICAgICAgJ2NvdmVyYWdlPT02LjMuMjtweXRob25f
dmVyc2lvbj4iMy42IicsCi0gICAgICAgICAnY292ZXJhZ2U8Ni4yO3B5dGhvbl92ZXJzaW9uPD0i
My42IicsCi0tLSAKLTIuMzYuMAotCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1mbGFzay1q
c29ucnBjL3B5dGhvbi1mbGFzay1qc29ucnBjLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1q
c29ucnBjL3B5dGhvbi1mbGFzay1qc29ucnBjLmhhc2gKaW5kZXggZWU0MDdkYmQ3YS4uZDVjMGU0
NjU5NSAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tZmxhc2stanNvbnJwYy9weXRob24tZmxh
c2stanNvbnJwYy5oYXNoCisrKyBiL3BhY2thZ2UvcHl0aG9uLWZsYXNrLWpzb25ycGMvcHl0aG9u
LWZsYXNrLWpzb25ycGMuaGFzaApAQCAtMSw2ICsxLDYgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBo
dHRwczovL3B5cGkub3JnL3B5cGkvZmxhc2stanNvbnJwYy9qc29uCi1tZDUgIGYyYjdiZjUyMjJm
M2FhZjA1MGYzOTY1MjJkN2Y2OTJkICBGbGFzay1KU09OUlBDLTIuMi4xLnRhci5negotc2hhMjU2
ICBmOTk0ZjhkZDgwYmYzMWNmNzI3MmViMWEzMDMwYzZjYWYzMGZlZjNjZWQ1ODY2ZTY2YjU2ODcx
ZDQwNDdiZTY4ICBGbGFzay1KU09OUlBDLTIuMi4xLnRhci5negorbWQ1ICBmYjYyMDVlNmU3NzY4
MDJjNjAwMGVhNzExOTIyOTA2NiAgRmxhc2stSlNPTlJQQy0yLjIuMi50YXIuZ3oKK3NoYTI1NiAg
MGNiNmFjMjgwNDk4MGRjOGFjN2NiYmMzMTQ5MDI1ZjRlYzkzMjMyMjc5NzhhNGE3Y2U3YjU1YTlm
ODI2M2ExMSAgRmxhc2stSlNPTlJQQy0yLjIuMi50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZCBz
aGEyNTYgY2hlY2tzdW1zCiBzaGEyNTYgIDVlNjE3NTkyNmJhN2RkZTI4YzdkMjkyYThiMDM1MGFh
ODJjNDBhOGM1NjkxYTg3OGZlMDJiMGM5YzZiNDNiMzkgIExJQ0VOU0UKIHNoYTI1NiAgNWU2MTc1
OTI2YmE3ZGRlMjhjN2QyOTJhOGIwMzUwYWE4MmM0MGE4YzU2OTFhODc4ZmUwMmIwYzljNmI0M2Iz
OSAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmxhc2stanNvbnJwYy9weXRo
b24tZmxhc2stanNvbnJwYy5tayBiL3BhY2thZ2UvcHl0aG9uLWZsYXNrLWpzb25ycGMvcHl0aG9u
LWZsYXNrLWpzb25ycGMubWsKaW5kZXggNTQyYjllNzNmNS4uYzgxNjc0OTA4NSAxMDA2NDQKLS0t
IGEvcGFja2FnZS9weXRob24tZmxhc2stanNvbnJwYy9weXRob24tZmxhc2stanNvbnJwYy5tawor
KysgYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1qc29ucnBjL3B5dGhvbi1mbGFzay1qc29ucnBjLm1r
CkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX0ZM
QVNLX0pTT05SUENfVkVSU0lPTiA9IDIuMi4xCitQWVRIT05fRkxBU0tfSlNPTlJQQ19WRVJTSU9O
ID0gMi4yLjIKIFBZVEhPTl9GTEFTS19KU09OUlBDX1NPVVJDRSA9IEZsYXNrLUpTT05SUEMtJChQ
WVRIT05fRkxBU0tfSlNPTlJQQ19WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9GTEFTS19KU09OUlBD
X1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvY2EvMmEvM2Yy
YmQ3OTg0MGQ5NjQzZmM5MDljZjI3ZjczMGIyYzUwMDYzNTE3NDZiYTA5YzRkYWIxYjg5OGRkZWU5
CitQWVRIT05fRkxBU0tfSlNPTlJQQ19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQu
b3JnL3BhY2thZ2VzL2E1LzdiLzhjYmQ1MzA4NGExZWZiNThhMTEwNTkwNWEzOGIwY2JlZmNkM2Fl
MTNlZjJjOTBjMDdlZWRmMGZkYjZkYwogUFlUSE9OX0ZMQVNLX0pTT05SUENfTElDRU5TRSA9IEJT
RC0zLUNsYXVzZQogUFlUSE9OX0ZMQVNLX0pTT05SUENfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0Ug
Q09QWUlORwogUFlUSE9OX0ZMQVNLX0pTT05SUENfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKLS0g
CjIuMzcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
