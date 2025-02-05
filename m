Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEED7C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5356741802;
	Wed,  5 Feb 2025 11:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQ9qk4YgcXZB; Wed,  5 Feb 2025 11:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3112F4178D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3112F4178D;
	Wed,  5 Feb 2025 11:41:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C2EACD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E464C811B5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icWCCbdrfjq7 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:41:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.63.100;
 helo=6.mo575.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 007C6821C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 007C6821C1
Received: from 6.mo575.mail-out.ovh.net (6.mo575.mail-out.ovh.net
 [46.105.63.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 007C6821C1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:05 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.148.175])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4Ynywv5pF2z1pMk
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:03 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 38FA11FED8;
 Wed,  5 Feb 2025 11:41:03 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ:T6
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:41:03 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:40:55 +0100
MIME-Version: 1.0
Message-Id: <20250205-imx-packages-bump-v1-5-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
In-Reply-To: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5642728858373385184
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepiedufeeuheeugfekleehfeejjefgfedvuedutdffkeevhfdtlefgheehffehgefgnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=WY59duKVmFVzzfcV2DKMvdzpVA52gyhRD5uIwNaUWyI=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755663; v=1;
 b=sgfYvRtDAZLM/4PbRRM+q0n2w6mIBbyc0nYBMmZvPtgQSboYTcXfDMobSl+Z9tKUx7NwNkSn
 SPgyFm7AVkPuJMZm6JsWhycb2MiVj0e7HnBhw44lpyxtXZDTqnomBJlw0ASj8daw+JdByiXatns
 wCThhexEekdektrD8K25gPhhzBvA2X9wjL1yU8n1q+CTUV72PykXmQrLNCQVAvzGi32C1YRpSos
 fSLz8zYfWp8I8mnmOMwKPBQUxndhMUgbiIQ9fq025RW4vddvF4zNb8jsmjSYh5jcBd4GmAYK4h8
 0ZnM59ovR4ZIvrlkHsHXcQ5rCYRYjqmLmmE8NODsdFj6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=sgfYvRtD
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S0072b1d4108-8721-4a2e-9d09-921ad27e0b9b,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 05/11] package/freescale-imx/imx-vpu-hantro:
 bump version to 1.35.0
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
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY0OSBTZXB0ZW1iZXIgMjAyMyIgdG8g
InY1NyBKdWx5IDIwMjQiLgpBZGQgU0NSLWlteC12cHUtaGFudHJvLnR4dCB0byBfTElDRU5TRV9G
SUxFUy4KCk5vdGU6IGluIHRoaXMgcmVsZWFzZSwgdGhlIHBhY2thZ2Ugc291cmNlIGFyY2hpdmUg
bmFtZSBjaGFuZ2VkIHRvCmluY2x1ZGUgYSByZXZpc2lvbi4gVGhpcyBjb21taXQgYWRkcyBhIG5l
dyBfUkVWSVNJT04gdmFyaWFibGUgd2l0aCB0aGUKdmFsdWUgcHVibGlzaGVkIGluIHRoZSBjb3Jy
ZXNwb25kaW5nIE5YUCBCU1AuCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8
c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20KLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1p
bXgvaW14LXZwdS1oYW50cm8vaW14LXZwdS1oYW50cm8uaGFzaCB8IDcgKysrKy0tLQogcGFja2Fn
ZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFudHJvLm1rICAgfCA3ICsr
KystLS0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby9pbXgtdnB1
LWhhbnRyby5oYXNoIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12
cHUtaGFudHJvLmhhc2gKaW5kZXggMDY5NzAwZmM1ZjAwM2I3ZmYwZWVmOTY4MWU1Mjg1MTU1NTI0
ZmIyNi4uZjEwMzk3MDg5MzQ2YjgzMGVhYTQ2YWU5YTU0NGM2MjExOGZiNzVhMCAxMDA2NDQKLS0t
IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFudHJvLmhh
c2gKKysrIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFu
dHJvLmhhc2gKQEAgLTEsNCArMSw1IEBACiAjIExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYgIDIx
ZmIzMjg4ZjZmNDQ2MzFlYmY2NDc5Mjg0YzVjMDgxZmY4MjlhMzA2ODgxMWVlYmJhY2M1MTBmMTQz
MDBhYjQgIGlteC12cHUtaGFudHJvLTEuMzEuMC5iaW4KLXNoYTI1NiAgMjRkN2NiM2E3ZTUxMDEx
NDY2YTE0OWJkOTlhY2Y4OTM4N2I4MzJiZTJkMDg5MGNlMmUxODNkZmJjOWQ3Y2I4NCAgQ09QWUlO
Rwotc2hhMjU2ICAzMjgyZDg4ZmFkNzY2ODk3ZjkzYjA4MjcyOTdhNzBjMjcwN2Q5MzU4ZGIyNGNj
Y2Q1Nzc3YWJmN2M5OTdkYTc3ICBFVUxBCitzaGEyNTYgIGM0NzMwY2I5OTZhM2VhZmJjMDZlZDA3
NjVjZDUwOWNhYTYzY2RlZWNkYzBjNDk1OGVmYmM5MTM4M2UwNTAxZmQgIGlteC12cHUtaGFudHJv
LTEuMzUuMC05OGZmMTgzLmJpbgorc2hhMjU2ICA2MDFmYTc5MGM1YjRkMDM1NzliZDE4MmZiNGQ2
NWE2ZjMyOWEzMmZhZjQ5ZGIyMmY5OGU0NjA4MjIxZTg2MWY3ICBDT1BZSU5HCitzaGEyNTYgIGMz
ZDlhN2IyYTVhN2RiNWRhNjkwZTljMTA4MWI5OGI2NjU4MDJjM2VmYmJiYTdmYjIzNzMzOTM5NWE5
MmY2MDcgIEVVTEEKK3NoYTI1NiAgNWQwNmZmOWRlNTZmMDc4OGY2YjA5MGM5MzIyNmRkOTUxNzY0
MTI0NjM1YzY4N2NlZjY0ZjI5Nzc2YzJlOGNmOCAgU0NSLWlteC12cHUtaGFudHJvLnR4dApkaWZm
IC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFu
dHJvLm1rIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFu
dHJvLm1rCmluZGV4IDY0ZGYxNmUyMWI4MTRlOGY2N2U4ZTcxY2VmM2U2MDI5MDQ3YjEzNWYuLjI1
NjE1Mzg5MmJkYzQwNWUxNDhhNGVlZTIwYjMzODhiYWVhYmQzZjggMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby9pbXgtdnB1LWhhbnRyby5taworKysgYi9w
YWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8vaW14LXZwdS1oYW50cm8ubWsKQEAg
LTQsOSArNCwxMCBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotSU1YX1ZQVV9IQU5U
Uk9fVkVSU0lPTiA9IDEuMzEuMAorSU1YX1ZQVV9IQU5UUk9fVkVSU0lPTiA9IDEuMzUuMAorSU1Y
X1ZQVV9IQU5UUk9fUkVWSVNJT04gPSA5OGZmMTgzCiBJTVhfVlBVX0hBTlRST19TSVRFID0gJChG
UkVFU0NBTEVfSU1YX1NJVEUpCi1JTVhfVlBVX0hBTlRST19TT1VSQ0UgPSBpbXgtdnB1LWhhbnRy
by0kKElNWF9WUFVfSEFOVFJPX1ZFUlNJT04pLmJpbgorSU1YX1ZQVV9IQU5UUk9fU09VUkNFID0g
aW14LXZwdS1oYW50cm8tJChJTVhfVlBVX0hBTlRST19WRVJTSU9OKS0kKElNWF9WUFVfSEFOVFJP
X1JFVklTSU9OKS5iaW4KIElNWF9WUFVfSEFOVFJPX0RFUEVOREVOQ0lFUyA9IGxpbnV4CiBJTVhf
VlBVX0hBTlRST19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIApAQCAtMTksNyArMjAsNyBAQCBJTVhf
VlBVX0hBTlRST19NQUtFX0VOViA9IFwKIAlQTEFURk9STT0kKEJSMl9QQUNLQUdFX0ZSRUVTQ0FM
RV9JTVhfUExBVEZPUk0pCiAKIElNWF9WUFVfSEFOVFJPX0xJQ0VOU0UgPSBOWFAgU2VtaWNvbmR1
Y3RvciBTb2Z0d2FyZSBMaWNlbnNlIEFncmVlbWVudAotSU1YX1ZQVV9IQU5UUk9fTElDRU5TRV9G
SUxFUyA9IEVVTEEgQ09QWUlORworSU1YX1ZQVV9IQU5UUk9fTElDRU5TRV9GSUxFUyA9IEVVTEEg
Q09QWUlORyBTQ1ItaW14LXZwdS1oYW50cm8udHh0CiBJTVhfVlBVX0hBTlRST19SRURJU1RSSUJV
VEUgPSBOTwogCiBkZWZpbmUgSU1YX1ZQVV9IQU5UUk9fRVhUUkFDVF9DTURTCgotLSAKMi40NS4z
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
