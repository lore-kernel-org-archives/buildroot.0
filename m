Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F7AC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D26F1419DB;
	Wed,  5 Feb 2025 11:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7Mxyu2jpbTo; Wed,  5 Feb 2025 11:50:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F29417A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2F29417A2;
	Wed,  5 Feb 2025 11:50:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3FC3CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF6E16071D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrXFvMVDVypc for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:50:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.48.182;
 helo=7.mo560.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E243860680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E243860680
Received: from 7.mo560.mail-out.ovh.net (7.mo560.mail-out.ovh.net
 [188.165.48.182])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E243860680
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:49:59 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.140.215])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4Ynyx10tpHz1f0c
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:09 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7DCD61FEBC;
 Wed,  5 Feb 2025 11:41:08 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ:T12
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:41:08 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:41:01 +0100
MIME-Version: 1.0
Message-Id: <20250205-imx-packages-bump-v1-11-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
In-Reply-To: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5644417709069102048
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepiedufeeuheeugfekleehfeejjefgfedvuedutdffkeevhfdtlefgheehffehgefgnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=LHaB1bC8pEljrqoSbIC+vglQ145MynxU7NnbTAKC6yg=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755669; v=1;
 b=qN3XvNjQQIsWYl69SxtHVv1TqYJLi+O7s+Qs3CDkTW+BcE3N0W/9MKlOeLx6iPD0HfMLYCuE
 ksD56yzdv+Nuw4zNRRjzC94uUnfZVNV6WsKeJs8AkmB1L/egaothPU+Qz6XyZDyVpX729YcKg41
 D2L1yYm4KtpHdadOkgnnoRoS1CixeBarg7+gsT2tn88bieA4FW3CZjh66zfQAfMEkHSNJZ5glur
 tIYXbEMqpz9Zo3bdZ571b4FsRYiBcYdC26DgCFbG6BVt8rC2xrHdh2NC01c7IZAST/GH/IloJGg
 FCudz1XtRk6sWTNPC5G6ecytyW/1QsQ/Abwrfs93jvfCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=qN3XvNjQ
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007a135b805-04a4-44e4-9b9c-049032a12d66,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 11/11] package/freescale-imx/imx-gpu-viv: bump
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
QGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS12aXYvaW14
LWdwdS12aXYuaGFzaCB8IDkgKysrKystLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdw
dS12aXYvaW14LWdwdS12aXYubWsgICB8IDkgKysrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVl
c2NhbGUtaW14L2lteC1ncHUtdml2L2lteC1ncHUtdml2Lmhhc2ggYi9wYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvaW14LWdwdS12aXYvaW14LWdwdS12aXYuaGFzaAppbmRleCBjY2UwOGUyNzI3NTVlYjQw
ZGFiNDkwMzFjYTYzN2IxNjE4ZGY2ZjljLi44N2FjODZhYjdhYmMxMmExYTRhMjFlMGUxZDQxYmU5
ZTUxYzE4NDBkIDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS12aXYv
aW14LWdwdS12aXYuaGFzaAorKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS12aXYv
aW14LWdwdS12aXYuaGFzaApAQCAtMSw1ICsxLDYgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1z
aGEyNTYgIGNmNmU0MmM5YzlhOTAzY2Q5MzNiNzY3ZDQxMTEzMTM5MGQyMzdhNGI5MmVjYWQ1Nzlk
YjU3ZDU0NTM4NzA3ZjMgIGlteC1ncHUtdml2LTYuNC4xMS5wMi42LWFhcmNoMzItYmM3YjZhMi5i
aW4KLXNoYTI1NiAgNWZlODI4MTEzYjliMjgwMWIzZmQ2MGNkMTVlYWRmZDBhYzc0N2U1ODk3ZWY3
ZGI3ZmEyMmY4MGU3ZGQ4YThlMSAgaW14LWdwdS12aXYtNi40LjExLnAyLjYtYWFyY2g2NC1iYzdi
NmEyLmJpbgotc2hhMjU2ICBjOWVlNTE4NTEwZDcyZTI1NGQ2Mjc0M2Y1MDk4MTYzZWFjZGI2NDI4
YzZiYTRkODExOWFmZTJkMTJlZGJhMDY4ICBDT1BZSU5HCi1zaGEyNTYgIDE2NWY2YzBlYWNiNGQz
YTA1Mjg5ZGZiNzkzMzFjOWEyYzA1MjA3ZWI3YTY3ZWYyOGExMTdmMjQ2YTAxNDU0MjggIEVVTEEK
K3NoYTI1NiAgMjI0MmM3Y2JmMWEyYjA3ZDQwZWVmZTVkMTUwNzc0N2U0NzdjNTQ5MTJmMTc5ZWUw
NTg1YTVkNzk2NTA3NGNlMCAgaW14LWdwdS12aXYtNi40LjExLnAyLjEwLWFhcmNoMzItYWNjZGQ2
NC5iaW4KK3NoYTI1NiAgODEwOGZkMTQ2ZGU2OTg2NDg2ZjM0ODYwMjI3NTExYTUxMDFiMzEwNzJi
OTljZDc4YWUzOGFmYmE4OTM5ZmQ0ZSAgaW14LWdwdS12aXYtNi40LjExLnAyLjEwLWFhcmNoNjQt
YWNjZGQ2NC5iaW4KK3NoYTI1NiAgNjAxZmE3OTBjNWI0ZDAzNTc5YmQxODJmYjRkNjVhNmYzMjlh
MzJmYWY0OWRiMjJmOThlNDYwODIyMWU4NjFmNyAgQ09QWUlORworc2hhMjU2ICBjM2Q5YTdiMmE1
YTdkYjVkYTY5MGU5YzEwODFiOThiNjY1ODAyYzNlZmJiYmE3ZmIyMzczMzkzOTVhOTJmNjA3ICBF
VUxBCitzaGEyNTYgIGFiMjBmYTNmNTI3ZmNlOTkwODdkOGQzY2Q0ZTJjZjRiOWNmZGZhYWE5OGIz
ZDc2NmEyYjU5NTNhOTgxMzIzZDMgIFNDUi1pbXgtZ3B1LXZpdi50eHQKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5tayBiL3BhY2thZ2Uv
ZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5tawppbmRleCBhNTU5YmI3NDc4
NjUxMGRmNTIxMmFhMjVhYTE2OTcwZTdkNjdmNDY2Li44NTdhMTFiM2I5MGRkMTE2MDIzMzZkYmM1
YzM5ZjAzNDVlMDNhMWQwIDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdw
dS12aXYvaW14LWdwdS12aXYubWsKKysrIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUt
dml2L2lteC1ncHUtdml2Lm1rCkBAIC00LDE4ICs0LDE5IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwogCitJTVhfR1BVX1ZJVl9SRVZJU0lPTiA9IGFjY2RkNjQKIGlmZXEgKCQoQlIyX2Fh
cmNoNjQpLHkpCi1JTVhfR1BVX1ZJVl9WRVJTSU9OID0gNi40LjExLnAyLjYtYWFyY2g2NC1iYzdi
NmEyCitJTVhfR1BVX1ZJVl9WRVJTSU9OID0gNi40LjExLnAyLjEwLWFhcmNoNjQKIGVsc2UKLUlN
WF9HUFVfVklWX1ZFUlNJT04gPSA2LjQuMTEucDIuNi1hYXJjaDMyLWJjN2I2YTIKK0lNWF9HUFVf
VklWX1ZFUlNJT04gPSA2LjQuMTEucDIuMTAtYWFyY2gzMgogZW5kaWYKIElNWF9HUFVfVklWX1NJ
VEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkKLUlNWF9HUFVfVklWX1NPVVJDRSA9IGlteC1ncHUt
dml2LSQoSU1YX0dQVV9WSVZfVkVSU0lPTikuYmluCitJTVhfR1BVX1ZJVl9TT1VSQ0UgPSBpbXgt
Z3B1LXZpdi0kKElNWF9HUFVfVklWX1ZFUlNJT04pLSQoSU1YX0dQVV9WSVZfUkVWSVNJT04pLmJp
bgogCiBJTVhfR1BVX1ZJVl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIAogSU1YX0dQVV9WSVZfTElD
RU5TRSA9IE5YUCBTZW1pY29uZHVjdG9yIFNvZnR3YXJlIExpY2Vuc2UgQWdyZWVtZW50Ci1JTVhf
R1BVX1ZJVl9MSUNFTlNFX0ZJTEVTID0gRVVMQSBDT1BZSU5HCitJTVhfR1BVX1ZJVl9MSUNFTlNF
X0ZJTEVTID0gRVVMQSBDT1BZSU5HIFNDUi1pbXgtZ3B1LXZpdi50eHQKIElNWF9HUFVfVklWX1JF
RElTVFJJQlVURSA9IE5PCiAKIElNWF9HUFVfVklWX1BST1ZJREVTID0gbGliZWdsIGxpYmdsZXMg
bGlib3BlbmNsIGxpYm9wZW52ZwoKLS0gCjIuNDUuMwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
