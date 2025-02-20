Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D692C021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 16:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE11C40DAD;
	Thu, 20 Feb 2025 16:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7287b6idlKG9; Thu, 20 Feb 2025 16:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69CA140DB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69CA140DB5;
	Thu, 20 Feb 2025 16:00:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE6A9194
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 16:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE8BD40DB5
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 16:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRdc0QjrHj9G for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 16:00:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0C9340DAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0C9340DAD
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0C9340DAD
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 16:00:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.127.224]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2f9b-1tlQtS1BWh-00BIfG; Thu, 20
 Feb 2025 17:00:33 +0100
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Julien Olivain <ju.o@free.fr>, "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Thu, 20 Feb 2025 17:00:14 +0100
Message-ID: <20250220160014.3376555-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y4y3qWZirPTDc8yVqd8ok+GWDNtcElZE8QATeAdp7xvU7HcYQku
 Ukqj/93Dy5TnGzlZF78ew+QEtCIiVmJQTIromeJKbxrlvV8lvt1yCG8tt11VPgQzfzzNq1k
 ghZyxX1m+yugmuptffHU8dKb+QPmWH2G91cFg5xDT6bGqpDnA2FOIQUh29BEzg1rK5Jq1A+
 6BEe6YwJ6L4Qwu9re/6zQ==
UI-OutboundReport: notjunk:1;M01:P0:DLtgMR1+t4s=;CVq0UoW7WD31iNV/u3zlBZgkJ6l
 +Im1DRrLolBluSaZrSMIyQQ7vxjLGeSE0aCR9HTI+elFVTM0+5ioHoLENeReQ9jGjV3xVBsED
 4udR3sDbg4f2Ae2DWkAK2jjtJ/TKJA6K+Rrtc7yQADKHcEHAieljF+VglyCICg/bDraXQ5Ww5
 TmYyN/DluNEkqTOUNE1vc3kLLuKsJ+89A3K/prOc7Nn2O2gY6Fs8bLPv2kKiqPXBd6hpASfQj
 Lp27qnXQe8iKkhhtgIZvICMNUe7nwnqPBjCjxnkYOfMamYRxI+bIWQErX5EXTqDS1SG2a4kM+
 XxT7b6ZeRSmmu/+6WLHjvLvJw/VH2/yBwgckMXJt5qX15gRZxIDZWJQB6tzUzZ0HgseNMeAHy
 19w5w97Mcfo9h9NP2nCNyCbmiHYmYCno5WXXVaS1omO8Ms55Tozton4Gjfox7jjwkif84HPBh
 Kx6vVglvqAfg7lFE0/nvkz28lO8QxIu+4pZUoIEbIyuB4nMGfBbzCQlzV6Hyz1miilX3vXFVi
 +ceg6p4LEqsw5q/3vkDUWzCgBvU/ldfBh7QG6IuR7h9Unb8JJi99xGJSHMgHo+ZkjSUH/5Acd
 dtikHTKMwKVJDfstsfQWebJDO5N7SV/LmY3PaLz8AsF+J8MwznnczzCbij1RuEcXwH0ef6AHw
 1tQkRxsydZFvavGW0QR4qScpSiZ3XdWJnLX/kKXlkFfXg9keCKmDFrRMJ1zmD++My/4kj/bYe
 x4MHqFV1WIG6U7OEIjBHcedmXwXvFAsUZCLIrj/7f8+QGvhdGQFvne4xFFRGniw98+8SPfl7Y
 Q1XgoAJ36D0N0HVg5U7w3kSg+3QLd/AIPfhzCvfZGs/mrhkwHzKjlQbVYzTnTMDZPfoRStOEi
 TKZg7PS1GGIMvrVVGeywbDwvsKSGRKgnazH1klKyfFEATvd5tykgzpTyjCwkWVWNh6wjHKdyM
 M/73sNIakp8fGhi02SIFSN3dpFEEaAv8RbgjeCd4ZCRNxQmX3B7LU1u4SRU9QBVJ23wWUC9Uy
 fR/cc+bkeflSN8kPY2JTN/nInsicpMt7fsEL2pvGcjZm3h6xl1mFP1RPW3lq665MWAAhPoeTk
 5A/BUb4wO5m3Kum2U2ykokuffvUm9neCh7SAGxoHn/g3qO6Rv+X8SKUsrkW1EHQ3IAMK7C0CR
 KI4BpQ5JOz1mzlj6/DttSFCRi8+eUMSaVisXNMkTWIMNa5bmevw1CjMNomT6bi0U+lSbyuZ5A
 6m6ZEmni/C583GwgM8CtKfBdyCder241OYOH/+x3kwVi9gjjs7syjZUXBdWxLV0s2RK4YsxO3
 cfbMaaw4qoI2ReqL3oCzyIJjiK17+ndwqpFzs90yq7+fnanIEP/jTx/KJlNft+0FfDbnNF5cM
 ZP/ttwYN4yrYZowXzqTnetnFmFQPt4FYh2yLuGdYm8y56kJXCklj1um5O8LVYbt1cQ0of1skf
 Gt5LdaQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1740067233; x=1740672033; i=fiona.klute@gmx.de;
 bh=NLAy9biw5fWR1pemLqXn0H310IrJ0pXofHTFv3lBQXs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pL+NHxfklwIgxekb0CcjFalNvKeP5LEggtEi8xuczNQ/MibrcMpHE07rmt7OPhKy
 UW3+mas6FBje578OsoK7NyFquqwqWc/00sfg38rfYjmYdO5W9wnyaGQBAZ4BHnQvD
 f/fb57YW19JMqKQLZZYlaO0BfvrwDkE9xuTYBvTm3cpJtin1HNtHYSx9S7/9Uj+4X
 3kxwuVhQTvDN6vf/azjOBX//SgL7hpV3XFPECP+cvsYKz+OU7RMUQwNEnEwjUGXch
 P8t9c0JT8IaUC0JpUoo7LfFTw09JGl4Wd4Q6Elto/o6+N9PU1YaL8+2U/5zgjvH+c
 zSlnsJJ6BbVlO2AJvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=pL+NHxfk
Subject: [Buildroot] [PATCH v3 1/1] package/wlr-randr: new package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMu
Y29tPgoKVXRpbGl0eSB0byBtYW5hZ2Ugb3V0cHV0cyBvZiBhIFdheWxhbmQgY29tcG9zaXRvci4K
ClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tp
QGFybWFkZXVzLmNvbT4KW0Zpb25hOiBkZWZpbmUgX0dOVV9TT1VSQ0Ugd2hlbiBidWlsZGluZyB3
aXRoIHVDbGliYyB0byBwcm92aWRlIHN0cmR1cCgpXQpTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0
ZSAoV0lXQSkgPGZpb25hLmtsdXRlQGdteC5kZT4KLS0tCkkndmUgYWRkZWQgdGhlIGlmZXEgKCQo
QlIyX1RPT0xDSEFJTl9VU0VTX1VDTElCQykseSkgYmxvY2sgdG8gZml4CmJ1aWxkIGVycm9ycyB3
aXRoIHVDbGliYy4gU2VlIFPDqWJhc3RpZW4ncyBvcmlnaW5hbCBwYXRjaDoKaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDEzMS1hZGQtd2xy
LXJhbmRyLXBhY2thZ2UtdjItMS03ZWExYTQ0YjViN2VAYXJtYWRldXMuY29tLwoKIERFVkVMT1BF
UlMgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9Db25maWcuaW4gICAgICAg
ICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3dsci1yYW5kci9Db25maWcuaW4gICAgICB8ICA3ICsr
KysrKysKIHBhY2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5kci5oYXNoIHwgIDUgKysrKysKIHBhY2th
Z2Uvd2xyLXJhbmRyL3dsci1yYW5kci5tayAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwogNSBm
aWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS93bHItcmFuZHIvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS93bHItcmFu
ZHIvd2xyLXJhbmRyLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3dsci1yYW5kci93
bHItcmFuZHIubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBi
ZTU1YzM5OTE4Li5mOTE3MzkyNDA2IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVM
T1BFUlMKQEAgLTI5NjEsNiArMjk2MSw3IEBAIEY6CXBhY2thZ2UvbnhwLW13aWZpZXgvCiBGOglw
YWNrYWdlL21tYy11dGlscy8KIEY6CXBhY2thZ2UvcHl0aG9uLWZsYXNrLWpzb25ycGMvCiBGOglw
YWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi8KK0Y6CXBhY2thZ2Uvd2xyLXJhbmRyLwogRjoJcGFj
a2FnZS9xdDUvcXQ1Y2hhcnRzLwogCiBOOglTZW15b24gS29sZ2Fub3YgPHNlbWVuYWs5NEBtYWls
LnJ1PgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgpp
bmRleCAwNjYzY2MxYjI1Li5lMTAwYzk1MjQzIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5p
bgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMjc5Myw2ICsyNzkzLDcgQEAgY29tbWVudCAi
VXRpbGl0aWVzIgogCXNvdXJjZSAicGFja2FnZS90bXV4L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2UvdHR5ZC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3doaWNoL0NvbmZpZy5pbiIK
Kwlzb3VyY2UgInBhY2thZ2Uvd2xyLXJhbmRyL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uv
d3RmdXRpbC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3htbHN0YXJsZXQvQ29uZmlnLmlu
IgogCXNvdXJjZSAicGFja2FnZS94eGhhc2gvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS93bHItcmFuZHIvQ29uZmlnLmluIGIvcGFja2FnZS93bHItcmFuZHIvQ29uZmlnLmluCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjQ1NmM4NDU0OWIKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL3dsci1yYW5kci9Db25maWcuaW4KQEAgLTAsMCArMSw3IEBACitjb25m
aWcgQlIyX1BBQ0tBR0VfV0xSX1JBTkRSCisJYm9vbCAid2xyLXJhbmRyIgorCWRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfV0FZTEFORCAjIHdheWxhbmQtY2xpZW50CisJaGVscAorCSAgVXRpbGl0eSB0
byBtYW5hZ2Ugb3V0cHV0cyBvZiBhIFdheWxhbmQgY29tcG9zaXRvci4KKworCSAgaHR0cHM6Ly9n
aXQuc3IuaHQvfmVtZXJzaW9uL3dsci1yYW5kcgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93bHItcmFu
ZHIvd2xyLXJhbmRyLmhhc2ggYi9wYWNrYWdlL3dsci1yYW5kci93bHItcmFuZHIuaGFzaApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44MGNmZGUwNjMzCi0tLSAvZGV2L251
bGwKKysrIGIvcGFja2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLmhhc2gKQEAgLTAsMCArMSw1IEBA
CisjIEhhc2ggZnJvbSBodHRwczovL2dpdC5zci5odC9+ZW1lcnNpb24vd2xyLXJhbmRyL3JlZnMv
djAuNC4xCitzaGEyNTYgIGZkNTc4MzAwMmMxM2QzNzI2Nzg5OGU1NzFmMDNiNjE4MzYzZDEzOTUy
YTI2NGNmM2Q2MWEzNTM4Mzg2OWQ2MzEgIHdsci1yYW5kci0wLjQuMS50YXIuZ3oKKworIyBIYXNo
IGZvciBsaWNlbnNlIGZpbGVzOgorc2hhMjU2ICA3ZjNlODQ0YTU1MGRhNzRkNWYwYTYzNWFlMTI2
M2NiN2RhZmRhN2JkMTVhYzM3MzY0ZGRkZTg1ZGU4M2E3OGM3ICBMSUNFTlNFCmRpZmYgLS1naXQg
YS9wYWNrYWdlL3dsci1yYW5kci93bHItcmFuZHIubWsgYi9wYWNrYWdlL3dsci1yYW5kci93bHIt
cmFuZHIubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMTc4Y2E2YjUw
NwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5kci5tawpAQCAt
MCwwICsxLDE5IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyB3bHItcmFuZHIKKyMK
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1dMUl9SQU5EUl9WRVJTSU9OID0gMC40LjEKK1dM
Ul9SQU5EUl9TSVRFID0gaHR0cHM6Ly9naXQuc3IuaHQvfmVtZXJzaW9uL3dsci1yYW5kci9yZWZz
L2Rvd25sb2FkL3YkKFdMUl9SQU5EUl9WRVJTSU9OKQorV0xSX1JBTkRSX0xJQ0VOU0UgPSBNSVQK
K1dMUl9SQU5EUl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQorIyBob3N0LXdheWxhbmQgaXMgZm9y
IHdheWxhbmQtc2Nhbm5lcgorV0xSX1JBTkRSX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBo
b3N0LXdheWxhbmQgd2F5bGFuZAorCitpZmVxICgkKEJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJQkMp
LHkpCisjIHVDbGliYyBwcm92aWRlcyBzdHJkdXAoKSBvbmx5IGlmIF9HTlVfU09VUkNFIGlzIGRl
ZmluZWQKK1dMUl9SQU5EUl9DT05GX09QVFMgKz0gLURjX2FyZ3M9LURfR05VX1NPVVJDRQorZW5k
aWYKKworJChldmFsICQobWVzb24tcGFja2FnZSkpCi0tIAoyLjQ3LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
