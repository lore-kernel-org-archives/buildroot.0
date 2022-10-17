Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF8EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 09:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 633E640A04;
	Mon, 17 Oct 2022 09:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 633E640A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKgTKzv_29ls; Mon, 17 Oct 2022 09:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74A4340169;
	Mon, 17 Oct 2022 09:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74A4340169
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0231BF3D0
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 09:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E76CD81D3D
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 09:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E76CD81D3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f10pEw43dh_f for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 09:17:55 +0000 (UTC)
X-Greylist: delayed 00:09:53 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E735781A46
Received: from 15.mo583.mail-out.ovh.net (15.mo583.mail-out.ovh.net
 [178.33.107.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E735781A46
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:17:54 +0000 (UTC)
Received: from player779.ha.ovh.net (unknown [10.108.4.105])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 37DAD20FDB
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:07:59 +0000 (UTC)
Received: from armadeus.com (lfbn-str-1-84-188.w92-140.abo.wanadoo.fr
 [92.140.211.188])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id 2B0742FA513C4;
 Mon, 17 Oct 2022 09:07:55 +0000 (UTC)
X-OVh-ClientIp: 92.140.211.188
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 11:05:04 +0200
Message-Id: <20221017090504.22960-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1976517288154622785
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekledgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeugeevhffgvdejjeekvdehledthedvuedugfejtdekfeefkefhkeeviefhudejvdenucffohhmrghinhepphihphhirdhorhhgpdhphihthhhonhhhohhsthgvugdrohhrghenucfkphepuddvjedrtddrtddruddpledvrddugedtrddvuddurddukeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0015dd4e4d5-a825-48f9-abc6-e86f87d1a7c9,
 31212515FC091564AE8DB88E6B07269217F7480F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/python-flask-login: bump to version
 0.6.2
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
YXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvcHl0aG9uLWZsYXNrLWxvZ2luL3B5dGhvbi1mbGFz
ay1sb2dpbi5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi9weXRob24t
Zmxhc2stbG9naW4ubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmxhc2stbG9n
aW4vcHl0aG9uLWZsYXNrLWxvZ2luLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi9w
eXRob24tZmxhc2stbG9naW4uaGFzaAppbmRleCBkMTFlMzdjY2U4Li5jODhiNzBmMmQ1IDEwMDY0
NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi9weXRob24tZmxhc2stbG9naW4uaGFz
aAorKysgYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi9weXRob24tZmxhc2stbG9naW4uaGFz
aApAQCAtMSw1ICsxLDUgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5
cGkvZmxhc2stbG9naW4vanNvbgotbWQ1ICAwYTE1NzZlYWI0NzNjMmE4YmI1NzYzNDgzMzNkNWVm
NSAgRmxhc2stTG9naW4tMC42LjEudGFyLmd6Ci1zaGEyNTYgIDEzMDZkNDc0YTI3MGEwMzZkNmZk
MTRmNDU2NDBjNGQ3NzM1NWU0ZjFjNjdjYTQzMzFiMzcyZDM0NDg5OTdiOGMgIEZsYXNrLUxvZ2lu
LTAuNi4xLnRhci5negorbWQ1ICA4MDIwYjIyYWQ3ZWM2ZjE3MDM0ZjkwMTE3YTUyMDYzMyAgRmxh
c2stTG9naW4tMC42LjIudGFyLmd6CitzaGEyNTYgIGMwYTdiYWE5ZmRjNDQ4Y2RkM2RkNmYwOTM5
ZGY3MmVlYzUxNzdiMmY3YWJlNmNiODJmYzkzNGQyOWNhYWM5YzMgIEZsYXNrLUxvZ2luLTAuNi4y
LnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgN2E5
ZGZiOWM1ZGEyMDRlZDEzNzBmM2I2MmMxM2UyOTkyYTEyZGExZGE3MDdmNDdlMTU2ODk3ZWViNDM0
NGU1YiAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmxhc2stbG9naW4vcHl0
aG9uLWZsYXNrLWxvZ2luLm1rIGIvcGFja2FnZS9weXRob24tZmxhc2stbG9naW4vcHl0aG9uLWZs
YXNrLWxvZ2luLm1rCmluZGV4IDlhMTFmZGU1NDIuLjM5NGZlMTk3ZTMgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvcHl0aG9uLWZsYXNrLWxvZ2luL3B5dGhvbi1mbGFzay1sb2dpbi5taworKysgYi9wYWNr
YWdlL3B5dGhvbi1mbGFzay1sb2dpbi9weXRob24tZmxhc2stbG9naW4ubWsKQEAgLTQsOSArNCw5
IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1QWVRIT05fRkxBU0tfTE9HSU5fVkVS
U0lPTiA9IDAuNi4xCitQWVRIT05fRkxBU0tfTE9HSU5fVkVSU0lPTiA9IDAuNi4yCiBQWVRIT05f
RkxBU0tfTE9HSU5fU09VUkNFID0gRmxhc2stTG9naW4tJChQWVRIT05fRkxBU0tfTE9HSU5fVkVS
U0lPTikudGFyLmd6Ci1QWVRIT05fRkxBU0tfTE9HSU5fU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0
aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8zYy8wYS9lMzc2ZDU5OWViNmE4OTk5YjgwM2E4ZDM5MGUz
MjQ1MWU0M2EzNDZkYmU1NDAzNTBkYWQ0OGJlMDA2OWMKK1BZVEhPTl9GTEFTS19MT0dJTl9TSVRF
ID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2NjL2RhL2VhZTQ1YmE5
ZWM1OGFmNDViNDZlZjk0YzZjYTA0ZmIyMTFlZTU3YzA2NDIxYjY5NmU4OTRlYjExYjA2NAogUFlU
SE9OX0ZMQVNLX0xPR0lOX0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9GTEFTS19MT0dJTl9MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRQogUFlUSE9OX0ZMQVNLX0xPR0lOX1NFVFVQX1RZUEUgPSBzZXR1cHRv
b2xzCi0tIAoyLjM3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
