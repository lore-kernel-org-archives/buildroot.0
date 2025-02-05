Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF942C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9397541423;
	Wed,  5 Feb 2025 11:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFWcouDCxRu9; Wed,  5 Feb 2025 11:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84CF4417CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84CF4417CB;
	Wed,  5 Feb 2025 11:49:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9700ACD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BA9181FEB
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iscRbWUL0yDZ for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:49:28 +0000 (UTC)
X-Greylist: delayed 172458 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 05 Feb 2025 11:49:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C63981FE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C63981FE5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.48.182;
 helo=7.mo560.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 7.mo560.mail-out.ovh.net (7.mo560.mail-out.ovh.net
 [188.165.48.182])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C63981FE5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:49:28 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.140.35])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4Ynyww4WQ4z1f1b
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:04 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EC8F61FD1B;
 Wed,  5 Feb 2025 11:41:03 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ:T7
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:41:03 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:40:56 +0100
MIME-Version: 1.0
Message-Id: <20250205-imx-packages-bump-v1-6-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
In-Reply-To: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5643010335196310496
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepiedufeeuheeugfekleehfeejjefgfedvuedutdffkeevhfdtlefgheehffehgefgnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=dRx3tMnmGvdBCFmEzIHF4GIfzsfB1DWGuZKU4jty1w0=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755664; v=1;
 b=jcBOjLSzf+FNO+5LtshF+mjtmC2rVbX75+4gRaMnUNK0BNtbWXSe5VceHJQ/SkkPXuog2zEH
 VJoawK8v//NEbBZ1G0ADRz0TRdvKV0zC/ZCzy4ClH8vQsxHcKJyRzopVOoNc1WWFlCqsHxiQFn1
 hKnnh5Nnv16Q7yakjTFltIeP/Dq6h8fpWUnXCTZBzGOVyJ8zacgeLz4E2BIK93N0/L7gTw8w9eT
 yE47JgXUXCv7wnmQmygwKbpyNtepxn1p7haxA3NbfaJZzyJpHEiX8+S18XS0NERv7MUylbS5BQD
 0gParWe7htMPPFy+ODaSXfxD4Z313SniJz8qFpjcUGFNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=jcBOjLSz
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S00700cc6dc8-916d-45cf-9ef2-0b4c96bee561,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 06/11] package/freescale-imx/imx-vpu-hantro-vc:
 bump version to 1.10.1
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB2ZXJzaW9uIGlzIGFsaWduZWQgd2l0aCBOWFAgTGludXggQlNQIHZlcnNpb24gImxmLTYu
Ni41NS0yLjAuMCIuCgpMaWNlbnNlIGhhc2hlcyBjaGFuZ2VkIGJlY2F1c2UgdGhlIExBX09QVF9O
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY0OCBKdWx5IDIwMjMiIHRvICJ2NTcg
SnVseSAyMDI0Ii4KQWRkIFNDUi1pbXgtdnB1LWhhbnRyby50eHQgdG8gX0xJQ0VOU0VfRklMRVMu
CgpOb3RlOiBpbiB0aGlzIHJlbGVhc2UsIHRoZSBwYWNrYWdlIHNvdXJjZSBhcmNoaXZlIG5hbWUg
Y2hhbmdlZCB0bwppbmNsdWRlIGEgcmV2aXNpb24uIFRoaXMgY29tbWl0IGFkZHMgYSBuZXcgX1JF
VklTSU9OIHZhcmlhYmxlIHdpdGggdGhlCnZhbHVlIHB1Ymxpc2hlZCBpbiB0aGUgY29ycmVzcG9u
ZGluZyBOWFAgQlNQLgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFz
dGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9p
bXgtdnB1LWhhbnRyby12Yy9pbXgtdnB1LWhhbnRyby12Yy5oYXNoIHwgNyArKysrLS0tCiBwYWNr
YWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8tdmMvaW14LXZwdS1oYW50cm8tdmMubWsg
ICB8IDcgKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJv
LXZjL2lteC12cHUtaGFudHJvLXZjLmhhc2ggYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZw
dS1oYW50cm8tdmMvaW14LXZwdS1oYW50cm8tdmMuaGFzaAppbmRleCA3ZjYxOTNlMzk3MDI3Zjc4
MjFhM2Q4NDkwOTA3NDA4YWQ0ZmVkMjhjLi4xYjE0NDdjMzRlZmI2ZWI3OTBiODMyMjM3MTVhZmVm
ZjIyNzllMzhlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50
cm8tdmMvaW14LXZwdS1oYW50cm8tdmMuaGFzaAorKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgv
aW14LXZwdS1oYW50cm8tdmMvaW14LXZwdS1oYW50cm8tdmMuaGFzaApAQCAtMSw0ICsxLDUgQEAK
ICMgTG9jYWxseSBjb21wdXRlZDoKLXNoYTI1NiAgODRmY2VmYTA2MTlkZWYyZjAwOWNhNjY1MWM1
Y2ZmY2RhNTdmZWQyOWNkNzA2MGVmNjhiZTQ4YzVkMGQ3ODE0YiAgaW14LXZwdS1oYW50cm8tdmMt
MS45LjEuYmluCi1zaGEyNTYgIGRlMzdhMGJjYmYxNzE3YjkxMGMxYTUzZWE2ZWFiODUzYzQwNGU2
MWU4MTQzYmI2YzA4MWQzOWY1MzI1NzFlNTQgIENPUFlJTkcKLXNoYTI1NiAgYjE1OGFkYWFjNWUy
ZDFjN2ZhNmU3MzlmZjE2OGFiNDk4OTU3ZTMzMDMwNzBmMWMwYjBlNjZkOWE4ZjAyYTM1NCAgRVVM
QQorc2hhMjU2ICA3MTNiYTM3NWYyNTQ5MDcyN2ZjYzYyYmFiNWQ1NTA4Zjc0ZGUwMzIwNGI0YzE1
MzQ2NGI2OTZiNjUyYzVjN2RmICBpbXgtdnB1LWhhbnRyby12Yy0xLjEwLjEtYzAyNDRhMS5iaW4K
K3NoYTI1NiAgNjAxZmE3OTBjNWI0ZDAzNTc5YmQxODJmYjRkNjVhNmYzMjlhMzJmYWY0OWRiMjJm
OThlNDYwODIyMWU4NjFmNyAgQ09QWUlORworc2hhMjU2ICBjM2Q5YTdiMmE1YTdkYjVkYTY5MGU5
YzEwODFiOThiNjY1ODAyYzNlZmJiYmE3ZmIyMzczMzkzOTVhOTJmNjA3ICBFVUxBCitzaGEyNTYg
IGE2ZjAyOTdhZDhhYjQ5MDYyMjk5NTdjMmM3YzRiZjgyNWQ1NDNkOTlmZmI1YmRhZmMyZGU1YThk
ODg0ZWI4OGIgIFNDUi50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgt
dnB1LWhhbnRyby12Yy9pbXgtdnB1LWhhbnRyby12Yy5tayBiL3BhY2thZ2UvZnJlZXNjYWxlLWlt
eC9pbXgtdnB1LWhhbnRyby12Yy9pbXgtdnB1LWhhbnRyby12Yy5tawppbmRleCBkZTg4ZWJmMzJj
NDE5YjQzNTg4MGJlNTk4OTM3MzZiMjM1ZTY4Nzc1Li5iMjhlNjFiZDhhNzdjYzc5NjJjNWZmOTNk
NTg5ZmM1ODAxNWFhMTc4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZw
dS1oYW50cm8tdmMvaW14LXZwdS1oYW50cm8tdmMubWsKKysrIGIvcGFja2FnZS9mcmVlc2NhbGUt
aW14L2lteC12cHUtaGFudHJvLXZjL2lteC12cHUtaGFudHJvLXZjLm1rCkBAIC00LDE0ICs0LDE1
IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1JTVhfVlBVX0hBTlRST19WQ19WRVJT
SU9OID0gMS45LjEKK0lNWF9WUFVfSEFOVFJPX1ZDX1ZFUlNJT04gPSAxLjEwLjEKK0lNWF9WUFVf
SEFOVFJPX1ZDX1JFVklTSU9OID0gYzAyNDRhMQogSU1YX1ZQVV9IQU5UUk9fVkNfU0lURSA9ICQo
RlJFRVNDQUxFX0lNWF9TSVRFKQotSU1YX1ZQVV9IQU5UUk9fVkNfU09VUkNFID0gaW14LXZwdS1o
YW50cm8tdmMtJChJTVhfVlBVX0hBTlRST19WQ19WRVJTSU9OKS5iaW4KK0lNWF9WUFVfSEFOVFJP
X1ZDX1NPVVJDRSA9IGlteC12cHUtaGFudHJvLXZjLSQoSU1YX1ZQVV9IQU5UUk9fVkNfVkVSU0lP
TiktJChJTVhfVlBVX0hBTlRST19WQ19SRVZJU0lPTikuYmluCiBJTVhfVlBVX0hBTlRST19WQ19E
RVBFTkRFTkNJRVMgPSBsaW51eAogSU1YX1ZQVV9IQU5UUk9fVkNfSU5TVEFMTF9TVEFHSU5HID0g
WUVTCiAKIElNWF9WUFVfSEFOVFJPX1ZDX0xJQ0VOU0UgPSBOWFAgU2VtaWNvbmR1Y3RvciBTb2Z0
d2FyZSBMaWNlbnNlIEFncmVlbWVudAotSU1YX1ZQVV9IQU5UUk9fVkNfTElDRU5TRV9GSUxFUyA9
IEVVTEEgQ09QWUlORworSU1YX1ZQVV9IQU5UUk9fVkNfTElDRU5TRV9GSUxFUyA9IEVVTEEgQ09Q
WUlORyBTQ1IudHh0CiBJTVhfVlBVX0hBTlRST19WQ19SRURJU1RSSUJVVEUgPSBOTwogCiBkZWZp
bmUgSU1YX1ZQVV9IQU5UUk9fVkNfRVhUUkFDVF9DTURTCgotLSAKMi40NS4zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
