Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F75C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 13:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ADB2487EA;
	Thu,  8 Feb 2024 13:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8gcuc8LwxI6; Thu,  8 Feb 2024 13:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93087488B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93087488B0;
	Thu,  8 Feb 2024 13:34:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6E431BF403
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 13:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3C4941D25
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 13:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uo6IFoBco2CX for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 13:34:54 +0000 (UTC)
X-Greylist: delayed 2354 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 08 Feb 2024 13:34:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D80441AB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D80441AB6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.43.205;
 helo=6.mo550.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 6.mo550.mail-out.ovh.net (6.mo550.mail-out.ovh.net
 [46.105.43.205])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D80441AB6
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 13:34:53 +0000 (UTC)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.176.118])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id E3A3229EE5
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 12:55:36 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kdf48 (unknown [10.110.168.250])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 79F761FE0D;
 Thu,  8 Feb 2024 12:55:36 +0000 (UTC)
Received: from armadeus.com ([37.59.142.106])
 by ghost-submission-6684bf9d7b-kdf48 with ESMTPSA
 id 0KHlG0jPxGWDugAAre/mpQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 08 Feb 2024 12:55:36 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 13:54:22 +0100
Message-ID: <20240115-imx93-support-v5-2-c2c950104c58@armadeus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115-imx93-support-v5-0-c2c950104c58@armadeus.com>
References: <20240115-imx93-support-v5-0-c2c950104c58@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14936188167925656555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrtdeggdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnheptdehjefhgfdvgfetgeegjedvveelffejgedugeegvdefleelkeetleefhfeukeeknecuffhomhgrihhnpehngihprdgtohhmnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006686c9d86-560a-402d-8331-c22280cb7cc8,
 EE170601DD7FCE57948E905AF537FA7E68A97F37)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH v5 2/3] package/freescale-imx/firmware-ele-imx:
 new package
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYWNrYWdlIHByb3ZpZGVzIGZpcm13YXJlIGJsb2JzIGZvciB0aGUgRWRnZWxvY2sgU2Vj
dXJlCkVuY2xhdmUgKEVMRSkgWzFdIHByZXNlbnQgb24gaS5NWDhVTFAgYW5kIGkuTVg5IFNvY3Mu
ClRoaXMgdmVyc2lvbiBjb21lcyBmcm9tIHRoZSA2LjEuNTUtMi4yLjAgcmVsZWFzZS4KClsxXSBo
dHRwczovL3d3dy5ueHAuY29tL3Byb2R1Y3RzL254cC1wcm9kdWN0LWluZm9ybWF0aW9uL254cC1w
cm9kdWN0LXByb2dyYW1zL2VkZ2Vsb2NrLXNlY3VyZS1lbmNsYXZlOkVER0VMT0NLLVNFQ1VSRS1F
TkNMQVZFCgpSZXZpZXdlZC1ieTogR2FyeSBCaXNzb24gPGJpc3Nvbi5nYXJ5QGdtYWlsLmNvbT4K
U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgotLS0KQ2hhbmdlcyBmb3IgdjU6CiAtIG5vbmUKCkNoYW5nZXMgZm9yIHY0
OgogLSBtb3ZlIGkuTVggU2lsaWNvbiBSZXZpc2lvbiBjaGFuZ2VzIGludG8gZmlyc3QgcGF0Y2gg
KEdhcnkgQmlzc29uKQoKQ2hhbmdlcyBmb3IgdjM6CiAtIHJlbmFtZSBwYWNrYWdlIGZyb20gZmly
bXdhcmUtc2VudGluZWwgdG8gcGFja2FnZSBmaXJtd2FyZS1lbGUtaW14CgpDaGFuZ2VzIGZvciB2
MjoKIC0gbm9uZQotLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgv
Q29uZmlnLmluICAgfCAyMSArKysrKysrKysrKysrKysrKwogLi4uL2Zpcm13YXJlLWVsZS1pbXgv
ZmlybXdhcmUtZWxlLWlteC5oYXNoICAgICAgICAgfCAgNCArKysrCiAuLi4vZmlybXdhcmUtZWxl
LWlteC9maXJtd2FyZS1lbGUtaW14Lm1rICAgICAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysr
KysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZnJlZXNjYWxlLWlteC9Db25maWcuaW4gYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvQ29u
ZmlnLmluCmluZGV4IGJhMTY5ZWFkMThjYi4uZjEyYWNjM2JkMDI0IDEwMDY0NAotLS0gYS9wYWNr
YWdlL2ZyZWVzY2FsZS1pbXgvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9D
b25maWcuaW4KQEAgLTE1NCw2ICsxNTQsNyBAQCBzb3VyY2UgInBhY2thZ2UvZnJlZXNjYWxlLWlt
eC9pbXgtdXVjL0NvbmZpZy5pbiIKIHNvdXJjZSAicGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12
cHUvQ29uZmlnLmluIgogc291cmNlICJwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50
cm8vQ29uZmlnLmluIgogc291cmNlICJwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdXdyYXAv
Q29uZmlnLmluIgorc291cmNlICJwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlt
eC9Db25maWcuaW4iCiBzb3VyY2UgInBhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgv
Q29uZmlnLmluIgogc291cmNlICJwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJl
L0NvbmZpZy5pbiIKIHNvdXJjZSAicGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1zZWNvL0NvbmZp
Zy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14
L0NvbmZpZy5pbiBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L0NvbmZp
Zy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjc4NjdjMzcxMmM5
YwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUt
aW14L0NvbmZpZy5pbgpAQCAtMCwwICsxLDIxIEBACitjb25maWcgQlIyX1BBQ0tBR0VfRklSTVdB
UkVfRUxFX0lNWAorCWJvb2wgImZpcm13YXJlLWVsZS1pbXgiCisJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JNX0lNWDkxIHx8IFwKKwkJQlIyX1BBQ0tBR0VfRlJF
RVNDQUxFX0lNWF9QTEFURk9STV9JTVg5MworCWhlbHAKKwkgIEZpcm13YXJlIGJsb2JzIGZvciB0
aGUgRWRnZWxvY2sgU2VjdXJlIEVuY2xhdmUgKEVMRSkKKwkgIHByZXNlbnQgb24gaS5NWDhVTFAg
YW5kIGkuTVg5IFNvQ3MuCisKKwkgIFRoaXMgbGlicmFyeSBpcyBwcm92aWRlZCBieSBOWFAgYXMt
aXMgYW5kIGRvZXNuJ3QgaGF2ZSBhbgorCSAgdXBzdHJlYW0uCisKK2lmIEJSMl9QQUNLQUdFX0ZJ
Uk1XQVJFX0VMRV9JTVgKKworY29uZmlnIEJSMl9QQUNLQUdFX0ZJUk1XQVJFX0VMRV9JTVhfQUhB
Ql9DT05UQUlORVJfSU1BR0UKKwlzdHJpbmcKKwlkZWZhdWx0ICJteDkzYTAtYWhhYi1jb250YWlu
ZXIuaW1nIiBpZiBCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JNX0lNWDkzQTAKKwlk
ZWZhdWx0ICJteDkzYTEtYWhhYi1jb250YWluZXIuaW1nIiBpZiBcCisJCUJSMl9QQUNLQUdFX0ZS
RUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTFBMSB8fCBcCisJCUJSMl9QQUNLQUdFX0ZSRUVTQ0FM
RV9JTVhfUExBVEZPUk1fSU1YOTNBMQorCitlbmRpZiAjIEJSMl9QQUNLQUdFX0ZJUk1XQVJFX0VM
RV9JTVgKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14
L2Zpcm13YXJlLWVsZS1pbXguaGFzaCBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1l
bGUtaW14L2Zpcm13YXJlLWVsZS1pbXguaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLjU4NTY1Y2VmNDNlOQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZnJl
ZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXguaGFzaApAQCAtMCww
ICsxLDQgQEAKKyMgTG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIDRhMDQ0MDE2OGQ4ZGZiOTU5
ODlhMTdiZThmYWZiMTQ5NTg5ZTExMGU3ZDQ1MThlNWU4YTMzNDYzZGZiNWU1Y2EgIGZpcm13YXJl
LWVsZS1pbXgtMC4xLjAuYmluCitzaGEyNTYgIDI0ZDdjYjNhN2U1MTAxMTQ2NmExNDliZDk5YWNm
ODkzODdiODMyYmUyZDA4OTBjZTJlMTgzZGZiYzlkN2NiODQgIENPUFlJTkcKK3NoYTI1NiAgYzgw
MGFhY2EzYTdlOWY0NzBkOTlkN2NkZTBhNDhjOTU5ODJlZDYwMWQ0YzMwNmY3YjhmNDNmMzcxMDA1
NGYyOCAgU0NSLnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJl
LWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5tayBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJt
d2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi42MDBiNTBjNWI0NTYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9maXJtd2FyZS1lbGUtaW14Lm1rCkBAIC0w
LDAgKzEsMjcgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIGZpcm13YXJlLWVsZS1p
bXgKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK0ZJUk1XQVJFX0VMRV9JTVhfVkVSU0lP
TiA9IDAuMS4wCitGSVJNV0FSRV9FTEVfSU1YX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkK
K0ZJUk1XQVJFX0VMRV9JTVhfU09VUkNFID0gZmlybXdhcmUtZWxlLWlteC0kKEZJUk1XQVJFX0VM
RV9JTVhfVkVSU0lPTikuYmluCisKK0ZJUk1XQVJFX0VMRV9JTVhfTElDRU5TRSA9IE5YUCBTZW1p
Y29uZHVjdG9yIFNvZnR3YXJlIExpY2Vuc2UgQWdyZWVtZW50CitGSVJNV0FSRV9FTEVfSU1YX0xJ
Q0VOU0VfRklMRVMgPSBDT1BZSU5HIFNDUi50eHQKK0ZJUk1XQVJFX0VMRV9JTVhfUkVESVNUUklC
VVRFID0gTk8KKworRklSTVdBUkVfRUxFX0lNWF9JTlNUQUxMX0lNQUdFUyA9IFlFUworCitkZWZp
bmUgRklSTVdBUkVfRUxFX0lNWF9FWFRSQUNUX0NNRFMKKwkkKGNhbGwgTlhQX0VYVFJBQ1RfSEVM
UEVSLCQoRklSTVdBUkVfRUxFX0lNWF9ETF9ESVIpLyQoRklSTVdBUkVfRUxFX0lNWF9TT1VSQ0Up
KQorZW5kZWYKKworRklSTVdBUkVfRUxFX0lNWF9BSEFCX0NPTlRBSU5FUl9JTUFHRSA9ICQoY2Fs
bCBxc3RyaXAsJChCUjJfUEFDS0FHRV9GSVJNV0FSRV9FTEVfSU1YX0FIQUJfQ09OVEFJTkVSX0lN
QUdFKSkKKworZGVmaW5lIEZJUk1XQVJFX0VMRV9JTVhfSU5TVEFMTF9JTUFHRVNfQ01EUworCWNw
ICQoQEQpLyQoRklSTVdBUkVfRUxFX0lNWF9BSEFCX0NPTlRBSU5FUl9JTUFHRSkgJChCSU5BUklF
U19ESVIpL2FoYWItY29udGFpbmVyLmltZworZW5kZWYKKworJChldmFsICQoZ2VuZXJpYy1wYWNr
YWdlKSkKCi0tIAoyLjQzLjAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
