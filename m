Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D928C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B2880EAA;
	Wed,  5 Feb 2025 14:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmqPLL8Oh6AF; Wed,  5 Feb 2025 14:10:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E71B580E5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E71B580E5E;
	Wed,  5 Feb 2025 14:10:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ED5112F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72AAE41408
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsOAhBVlMAg7 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:10:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.40.176;
 helo=9.mo584.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10DCF4140E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10DCF4140E
Received: from 9.mo584.mail-out.ovh.net (9.mo584.mail-out.ovh.net
 [46.105.40.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10DCF4140E
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:07 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.139.154])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4Ynyx02Dd6z1Tr1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:08 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A8AE21FE0E;
 Wed,  5 Feb 2025 11:41:07 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ:T11
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:41:07 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:41:00 +0100
MIME-Version: 1.0
Message-Id: <20250205-imx-packages-bump-v1-10-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
In-Reply-To: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5644136233126652896
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepiedufeeuheeugfekleehfeejjefgfedvuedutdffkeevhfdtlefgheehffehgefgnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeegmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=4lPLARfVzoP2ILEbGM+nQglPt6kTZGDZnKXLTMZmCWg=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755668; v=1;
 b=gQrjtqoS818SnSKlT06fnLN7BWqND1flE65l+7+Yja/Bzs9P81ztT0jGYZKUS6+dY5FKlriu
 mw7t0WxaN3AND/NjkddYVUEpW9y3cBvJKpHoGtWUGuOga89G7M+e8S4N+uS4kvU3GOitSNcaH/s
 kAstEs/PvAtYAP90PyyWw/qGlA8gAX02Gl+MCG37wk7bRSpbyA0MQfLIvoddtLqdnRlAD69xylt
 n2ASS/ZB60hUUkpR+59S3pPbqHk4LiQo/MMNPIpY56QHOo1sutNOIA+QMt60lGcQKO1mMv7yEM5
 9EuxMsF6xxbLYQ0WI/IEuGvgSam/J5SPkwA3asAADbGbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=gQrjtqoS
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007a5cb81fd-9a4a-4135-9de8-802e94ed5431,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 10/11] package/freescale-imx/imx-gpu-g2d: bump
 version to 6.4.11.p2.10
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
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY1NiBBcHJpbCAyMDI0IiB0byAidjU3
IEp1bHkgMjAyNCIuCkFkZCBTQ1IudHh0IHRvIF9MSUNFTlNFX0ZJTEVTLgoKTm90ZTogaW4gdGhp
cyByZWxlYXNlLCB0aGUgcGFja2FnZSBzb3VyY2UgYXJjaGl2ZSBuYW1lIGNoYW5nZWQgdG8KaW5j
bHVkZSBhIHJldmlzaW9uLiBUaGlzIGNvbW1pdCBhZGRzIGEgbmV3IF9SRVZJU0lPTiB2YXJpYWJs
ZSB3aXRoIHRoZQp2YWx1ZSBwdWJsaXNoZWQgaW4gdGhlIGNvcnJlc3BvbmRpbmcgTlhQIEJTUC4K
ClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tp
QGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvaW14
LWdwdS1nMmQuaGFzaCB8IDkgKysrKystLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdw
dS1nMmQvaW14LWdwdS1nMmQubWsgICB8IDkgKysrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVl
c2NhbGUtaW14L2lteC1ncHUtZzJkL2lteC1ncHUtZzJkLmhhc2ggYi9wYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQuaGFzaAppbmRleCA5MjJmY2UyMjM2ZDI5MzFi
OGI0MDgxZDY4ZmI1OTFhMTQxNTY3YWIwLi5mMDQwZTAwZjY4MGZiYWEzZjA5MzY1MzZmZTVkOWE0
OWM5YmY1YmI2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQv
aW14LWdwdS1nMmQuaGFzaAorKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQv
aW14LWdwdS1nMmQuaGFzaApAQCAtMSw1ICsxLDYgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1z
aGEyNTYgIDQxMzYxMGNlNDczMGViOWFkYmRlMzBjOGFkNGE3MmRmM2VkZDY5ZDg0ZTExNTRhMGMy
OWVmYTdmMzNhMzA2NjMgIGlteC1ncHUtZzJkLTYuNC4xMS5wMi42LWFybS1iYzdiNmEyLmJpbgot
c2hhMjU2ICBiMmU0YzU4MGJmODg3MDQyZjQ3OWZkZTdjOGIwN2M2MjE1Nzk0ZDgxMjMyNjNkMTBm
ZjBjMTY3YWY3YmE1OTE4ICBpbXgtZ3B1LWcyZC02LjQuMTEucDIuNi1hYXJjaDY0LWJjN2I2YTIu
YmluCi1zaGEyNTYgIGM5ZWU1MTg1MTBkNzJlMjU0ZDYyNzQzZjUwOTgxNjNlYWNkYjY0MjhjNmJh
NGQ4MTE5YWZlMmQxMmVkYmEwNjggIENPUFlJTkcKLXNoYTI1NiAgMTY1ZjZjMGVhY2I0ZDNhMDUy
ODlkZmI3OTMzMWM5YTJjMDUyMDdlYjdhNjdlZjI4YTExN2YyNDZhMDE0NTQyOCAgRVVMQQorc2hh
MjU2ICA3ODA0NzlmMTkxNDIxMjZlZDU4ZTEyMjIyYjgwZjhmM2I4ODJhZDNkMjIzZmY2MWI3ZWEw
MjAwMWY1MTdmZjAzICBpbXgtZ3B1LWcyZC02LjQuMTEucDIuMTAtYWFyY2g2NC1hY2NkZDY0LmJp
bgorc2hhMjU2ICBjZDRmZDA1ZGQ2ZjY4ODBlZGMzMjU1Yzg1ZmUwODA5NGEwN2VhNGNkM2VlZTk0
N2RmMDA0ZGNiOGYzN2JjOGZhICBpbXgtZ3B1LWcyZC02LjQuMTEucDIuMTAtYXJtLWFjY2RkNjQu
YmluCitzaGEyNTYgIDYwMWZhNzkwYzViNGQwMzU3OWJkMTgyZmI0ZDY1YTZmMzI5YTMyZmFmNDlk
YjIyZjk4ZTQ2MDgyMjFlODYxZjcgIENPUFlJTkcKK3NoYTI1NiAgYzNkOWE3YjJhNWE3ZGI1ZGE2
OTBlOWMxMDgxYjk4YjY2NTgwMmMzZWZiYmJhN2ZiMjM3MzM5Mzk1YTkyZjYwNyAgRVVMQQorc2hh
MjU2ICAzZjNiODE3Y2E5NDkwZmJlODlhODMzOTVhMDk2MTEyMmFjYTEzOGJmNDNhY2Q4NjljNmNh
MDg2NTAyYTFlMTMxICBTQ1ItaW14LWdwdS1nMmQudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQubWsgYi9wYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQubWsKaW5kZXggMjEzZjIwYTdkOTQxZDUxNDk4
ZDFmNzcwNDZlODUxYjQzN2VhY2MzNy4uMTE1NDk0M2IzYWZjYTM1MmMzOTEyZDBkMWM1NzRiYjg2
Y2E4YzViYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtZzJkL2lt
eC1ncHUtZzJkLm1rCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9pbXgt
Z3B1LWcyZC5tawpAQCAtNCwxOCArNCwxOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
IAorSU1YX0dQVV9HMkRfUkVWSVNJT04gPSBhY2NkZDY0CiBpZmVxICgkKEJSMl9hYXJjaDY0KSx5
KQotSU1YX0dQVV9HMkRfVkVSU0lPTiA9IDYuNC4xMS5wMi42LWFhcmNoNjQtYmM3YjZhMgorSU1Y
X0dQVV9HMkRfVkVSU0lPTiA9IDYuNC4xMS5wMi4xMC1hYXJjaDY0CiBlbHNlCi1JTVhfR1BVX0cy
RF9WRVJTSU9OID0gNi40LjExLnAyLjYtYXJtLWJjN2I2YTIKK0lNWF9HUFVfRzJEX1ZFUlNJT04g
PSA2LjQuMTEucDIuMTAtYXJtCiBlbmRpZgogSU1YX0dQVV9HMkRfU0lURSA9ICQoRlJFRVNDQUxF
X0lNWF9TSVRFKQotSU1YX0dQVV9HMkRfU09VUkNFID0gaW14LWdwdS1nMmQtJChJTVhfR1BVX0cy
RF9WRVJTSU9OKS5iaW4KK0lNWF9HUFVfRzJEX1NPVVJDRSA9IGlteC1ncHUtZzJkLSQoSU1YX0dQ
VV9HMkRfVkVSU0lPTiktJChJTVhfR1BVX0cyRF9SRVZJU0lPTikuYmluCiBJTVhfR1BVX0cyRF9E
RVBFTkRFTkNJRVMgPSBpbXgtZ3B1LXZpdgogSU1YX0dQVV9HMkRfSU5TVEFMTF9TVEFHSU5HID0g
WUVTCiAKIElNWF9HUFVfRzJEX0xJQ0VOU0UgPSBOWFAgU2VtaWNvbmR1Y3RvciBTb2Z0d2FyZSBM
aWNlbnNlIEFncmVlbWVudAotSU1YX0dQVV9HMkRfTElDRU5TRV9GSUxFUyA9IEVVTEEgQ09QWUlO
RworSU1YX0dQVV9HMkRfTElDRU5TRV9GSUxFUyA9IEVVTEEgQ09QWUlORyBTQ1ItaW14LWdwdS1n
MmQudHh0CiBJTVhfR1BVX0cyRF9SRURJU1RSSUJVVEUgPSBOTwogCiBkZWZpbmUgSU1YX0dQVV9H
MkRfRVhUUkFDVF9DTURTCgotLSAKMi40NS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
