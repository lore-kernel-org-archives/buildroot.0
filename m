Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DFDECDFA1
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 08:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D854580C26;
	Mon, 24 Oct 2022 08:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D854580C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eiKthQy9T0zg; Mon, 24 Oct 2022 08:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D80380BF6;
	Mon, 24 Oct 2022 08:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D80380BF6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DC011BF40F
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 08:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC0744035E
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 08:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC0744035E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r4HzW7b4vuIX for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 08:48:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C1F40257
Received: from 3.mo576.mail-out.ovh.net (3.mo576.mail-out.ovh.net
 [188.165.52.203])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4C1F40257
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 08:48:43 +0000 (UTC)
Received: from player687.ha.ovh.net (unknown [10.111.208.67])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 8F4E22456E
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 08:30:21 +0000 (UTC)
Received: from armadeus.com (lfbn-str-1-84-188.w92-140.abo.wanadoo.fr
 [92.140.211.188])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id 8DCDA2FFE2986;
 Mon, 24 Oct 2022 08:30:17 +0000 (UTC)
X-OVh-ClientIp: 92.140.211.188
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 10:27:19 +0200
Message-Id: <20221024082719.6213-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5556316043123354603
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepueegvefhgfdvjeejkedvheeltdehvdeuudfgjedtkeeffeekhfekveeihfdujedvnecuffhomhgrihhnpehphihpihdrohhrghdpphihthhhohhnhhhoshhtvggurdhorhhgnecukfhppeduvdejrddtrddtrddupdelvddrudegtddrvdduuddrudekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0010a25e2ca-6681-4407-adbe-3d073e911ff3,
 460BB7483B69069C9E457E5F6B9B596E9699785A)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/python-flask-jsonrpc: bump to
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvcHl0aG9uLWZsYXNrLWpzb25ycGMvcHl0aG9uLWZs
YXNrLWpzb25ycGMuaGFzaCB8IDQgKystLQogcGFja2FnZS9weXRob24tZmxhc2stanNvbnJwYy9w
eXRob24tZmxhc2stanNvbnJwYy5tayAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1m
bGFzay1qc29ucnBjL3B5dGhvbi1mbGFzay1qc29ucnBjLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1m
bGFzay1qc29ucnBjL3B5dGhvbi1mbGFzay1qc29ucnBjLmhhc2gKaW5kZXggZWU0MDdkYmQ3YS4u
ZDVjMGU0NjU5NSAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tZmxhc2stanNvbnJwYy9weXRo
b24tZmxhc2stanNvbnJwYy5oYXNoCisrKyBiL3BhY2thZ2UvcHl0aG9uLWZsYXNrLWpzb25ycGMv
cHl0aG9uLWZsYXNrLWpzb25ycGMuaGFzaApAQCAtMSw2ICsxLDYgQEAKICMgbWQ1LCBzaGEyNTYg
ZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvZmxhc2stanNvbnJwYy9qc29uCi1tZDUgIGYyYjdi
ZjUyMjJmM2FhZjA1MGYzOTY1MjJkN2Y2OTJkICBGbGFzay1KU09OUlBDLTIuMi4xLnRhci5negot
c2hhMjU2ICBmOTk0ZjhkZDgwYmYzMWNmNzI3MmViMWEzMDMwYzZjYWYzMGZlZjNjZWQ1ODY2ZTY2
YjU2ODcxZDQwNDdiZTY4ICBGbGFzay1KU09OUlBDLTIuMi4xLnRhci5negorbWQ1ICBmYjYyMDVl
NmU3NzY4MDJjNjAwMGVhNzExOTIyOTA2NiAgRmxhc2stSlNPTlJQQy0yLjIuMi50YXIuZ3oKK3No
YTI1NiAgMGNiNmFjMjgwNDk4MGRjOGFjN2NiYmMzMTQ5MDI1ZjRlYzkzMjMyMjc5NzhhNGE3Y2U3
YjU1YTlmODI2M2ExMSAgRmxhc2stSlNPTlJQQy0yLjIuMi50YXIuZ3oKICMgTG9jYWxseSBjb21w
dXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBzaGEyNTYgIDVlNjE3NTkyNmJhN2RkZTI4YzdkMjkyYThi
MDM1MGFhODJjNDBhOGM1NjkxYTg3OGZlMDJiMGM5YzZiNDNiMzkgIExJQ0VOU0UKIHNoYTI1NiAg
NWU2MTc1OTI2YmE3ZGRlMjhjN2QyOTJhOGIwMzUwYWE4MmM0MGE4YzU2OTFhODc4ZmUwMmIwYzlj
NmI0M2IzOSAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmxhc2stanNvbnJw
Yy9weXRob24tZmxhc2stanNvbnJwYy5tayBiL3BhY2thZ2UvcHl0aG9uLWZsYXNrLWpzb25ycGMv
cHl0aG9uLWZsYXNrLWpzb25ycGMubWsKaW5kZXggNTQyYjllNzNmNS4uYzgxNjc0OTA4NSAxMDA2
NDQKLS0tIGEvcGFja2FnZS9weXRob24tZmxhc2stanNvbnJwYy9weXRob24tZmxhc2stanNvbnJw
Yy5taworKysgYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1qc29ucnBjL3B5dGhvbi1mbGFzay1qc29u
cnBjLm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlU
SE9OX0ZMQVNLX0pTT05SUENfVkVSU0lPTiA9IDIuMi4xCitQWVRIT05fRkxBU0tfSlNPTlJQQ19W
RVJTSU9OID0gMi4yLjIKIFBZVEhPTl9GTEFTS19KU09OUlBDX1NPVVJDRSA9IEZsYXNrLUpTT05S
UEMtJChQWVRIT05fRkxBU0tfSlNPTlJQQ19WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9GTEFTS19K
U09OUlBDX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvY2Ev
MmEvM2YyYmQ3OTg0MGQ5NjQzZmM5MDljZjI3ZjczMGIyYzUwMDYzNTE3NDZiYTA5YzRkYWIxYjg5
OGRkZWU5CitQWVRIT05fRkxBU0tfSlNPTlJQQ19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzL2E1LzdiLzhjYmQ1MzA4NGExZWZiNThhMTEwNTkwNWEzOGIwY2Jl
ZmNkM2FlMTNlZjJjOTBjMDdlZWRmMGZkYjZkYwogUFlUSE9OX0ZMQVNLX0pTT05SUENfTElDRU5T
RSA9IEJTRC0zLUNsYXVzZQogUFlUSE9OX0ZMQVNLX0pTT05SUENfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UgQ09QWUlORwogUFlUSE9OX0ZMQVNLX0pTT05SUENfU0VUVVBfVFlQRSA9IHNldHVwdG9v
bHMKLS0gCjIuMzcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
