Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF8606A336
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rltFKQDf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256 header.s=ovhmo103079-selector1 header.b=LcoGuHE3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 931748125A;
	Wed, 18 Nov 2026 14:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o0btBKLFZTKW; Wed, 18 Nov 2026 14:15:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 501778121A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795011345;
	b=W9P6PzPj/rfaeI9vpjhBnh6Lp1Gt6sVQouhOy0sfXkSRCVuqWSMq+DCj14Ysb+jNEfv0
	 vf9G66uvSfT/04AaqcKIyj1fyVArRoePbpA6zOO483NBOAjsHMjdCHxV9cj210rhxAgkQ
	 Ms/BbSktupE9N8Zm9aqXGGuEPIvhm+yIsSQmXtnGETJry5m9CbfFonR4kWROm4CYvKA3w
	 /4f5gBo+V3czC10KxZ2oFmBNItzlOOKyPExbpU0XB5LVi3z0xyOVYDQp2fzwxzUm53qwL
	 oa+VevNyLwjcCmEVzf5k4uOb+kH8rcAL696sq6UhaB5zg6DlQaAmUja45j9ULeneAYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795011345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:From:Date:MIME-Version:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:X-Mailer:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ut29XRVb7LCN59teQEOnyMiYYuzJzj3OUh/poYFXZUw=;
	b=I9rokN84YhLq2HROtJ7q61kEmjeYjUyLjzyHKzuiHkxwzJ2xmIz1Gt53tADWLSjIaFBb
	 S335cJRD1wqyl63NhzRCiIEktF7LTrJRjleAVWnesp6vMJDqobJ98IVRBsrc0osdjgR71
	 xqJmfWwxTUAFAzYVFmqeP1RMPL0OAGeu1xQiWGOhxwAznT0u0gk9125FNmhkcfTupxNWD
	 EaFCkdj/QNxn3Kd0IBaLRLtVulYVIqCEZDQw7CB5aCbZfwcqsAp3iAe7nRGCCZktmL3q1
	 64XGw7nDH+f7k5Yokpf/7fgQtIY6XUttUGW9XMPE/dokzlaqiXabt4mtLmChSWTB1bw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795011345;
	bh=ut29XRVb7LCN59teQEOnyMiYYuzJzj3OUh/poYFXZUw=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rltFKQDfuHpJVobVMvVM1wH0VeZSMdgtuL4yB6QeKka/eoEJ2eJhLVCqrLUounPFL
	 DJ2bKnKQtKCNPF7n9lWvUz7bgIVeIUQ8bJLAqjhgQ3Gkyaeh30B221UwLv/xxeEy8J
	 H6P4JR1/Rzmwqs2BYT74Pjxkh+XgThwt/cfRGctXL1i38uKB9er6aBx1MObse8ulNX
	 0LikWu25snQpLkRep/zqvz5DuuNoQPVPkhUxZmsIW/LzGOxDR2GxgPv4ORRJXMNPQ1
	 TFxK9NpfS3Zbs+lq6TGKwdqxtXRh1hWN8DGSmi+o538xplJtIL7B+7qCflBKyegum2
	 QMBL6y/ZmYidg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 501778121A;
	Wed, 18 Nov 2026 14:15:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A25B49B
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 14:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BAEE40790
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 14:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ei00cK8c9kOx for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 14:15:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4C7F9407C7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=46.105.63.121
X-Greylist: delayed 4199 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 18 Nov 2026 14:15:39 UTC
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=LcoGuHE3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.63.121;
 helo=1.mo560.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 1.mo560.mail-out.ovh.net (1.mo560.mail-out.ovh.net
 [46.105.63.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C7F9407C7
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 14:15:39 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.231.178])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4jV0H06g1XzBMdf
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 11:48:28 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-zj478 (unknown [10.110.0.104])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4B50CC1DEF;
 Wed, 18 Nov 2026 11:48:28 +0000 (UTC)
Received: from armadeus.com ([37.59.142.97])
 by ghost-submission-7ccd8bbbb6-zj478 with ESMTPSA
 id t4KFDIyQ/WplmAIA+gd+jg
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 18 Nov 2026 11:48:28 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002650d3cf8-74a1-47b5-a1c3-25b4f303a7e1,
 64D42CB7EFC033CF8D5413D6E20009A5E398D799)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.148.202.169
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 18 Nov 2026 12:48:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-add-mali-imx-package-v1-1-49e2a3c645dd@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWTvgiNTiq4iLaTLRqVeStgTEd
 2/U5Qfn/DsE8SoBmmwHLz8Nui4JlGdgBl56QbXJUBblg4hqZGtx5klR54gbm5HTphZXFZaqpzM
 C6bp5cRqvbNvdDt/XW8znbMFx/AEvej+seAAAAA==
X-Change-ID: 20261117-add-mali-imx-package-7ef40d148fce
To: buildroot@buildroot.org
X-Mailer: b4 0.16.0
x-ovh-tracer-id: 10415700041164052099
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGpWDQRK6p3dL88Nsx4/RofjWZyBF7cyu5Kl+XoEz+4MzMWqBRLUAagturqv309cKw1OL94RR0oo9i1jM4Cqr+dNJ290VJREQePmZouhe0DJ1TjK261M3XbO08NDrwmGZ7taejGVuIKkfw/6Ggi12Bo59+eml+dL3Jntx3DsbP0TUANnB6bN1RBCoDa5cEGmqCX4n4+LSsMLQNdaGLaIGocQSQ/Gh1qhU6jSgPOJswKWQQZw/pHLCI33AHDxHH7zShzZ2cb9iRUoMP7zMFOhq+z0ag+eU1mHUhd8BqQ3sQ3AN/kAjjuTEriemI5Z9orSJkbpxc2pRq+bzCrelAuwWEjKGXig2aS7nsLzKU5GKZ2GTpNUYSUPFiwZLk95jr69q0T3bcfdLjUP+k1FVSm+j/AJoEkXfQeRdQJRnFVn0gTVA7Aq9TGfKpfv4R8JUIpw/g7670AdD6oR8+8iF2cXFHwKGJKizKscFHP9S16WktyTh1QRSJNp6xYDqc6z5m/g4pvojwZXAVT+mVN9PtUVkIjY76Yfd3NDjR87ACClORjsnE3ZTZamJXe2kpxwwIE39mQuWhI7UF+ql5+/LUwqqeLOLE/Lbh5k1DYnBR1ZECRtaHgcEmYqGhS7Rmxk2hBhiW088wB7F9XZYcIjYc0Q8N5YyOIiIiI8ky3Ts4RnW3H+w
DKIM-Signature: a=rsa-sha256; bh=Zmt93BvA2IwSiZqeonv+Pqvt0TupSMSM6b929jS1ZJA=; 
 c=relaxed/relaxed; d=armadeus.com; h=From;
 s=ovhmo103079-selector1; t=1795002509; v=1;
 b=LcoGuHE3VbcZ0A1/nFXN4BUi11Gv+6EF0oVhFWDnYcChMvYUIHd4J4U8b59/+sTbDJsU534P
 7+bd8SAUE1viZt1ci1uzvhoCnn8h49McLqlcnMrY2piSnegvuePO57Eqh0r3ScdVsZMQEsxMBVX
 Ig8SBc8gWsGB8JdmCv3XikCVDCOKzMtgC1uVpsKSlGlL5G5vu9dqTWlKkFvIG8iTYEevLlLAxVM
 4aPmV+yDjaq2usQO/uJ/hgYkhzW5MCQpmshz9tHUx+HyNGAHtQ46FbjxCi6xpvGZKZuuhn2RMPU
 Sc4GTeHd8n1heqjrbz7w72AdnAbB6nmNv6W4nMXnGW+jQ==
Subject: [Buildroot] [PATCH] package/freescale-imx/mali-imx: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyBwYWNrYWdlIHByb3ZpZGVzIHRoZSB1c2Vyc3BhY2UgbGlicmFyaWVzIGFuZCBmaXJtd2Fy
ZSBuZWVkZWQgdG8gdXNlCnRoZSBNYWxpIEdQVSBwcmVzZW50IG9uIHRoZSBpLk1YOTUgU29DLgoK
U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwogcGFja2FnZS9mcmVlc2NhbGUtaW14L0NvbmZpZy5pbiAgICAgICAgICAg
ICAgfCAgNSArKysKIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9tYWxpLWlteC9Db25maWcuaW4gICAg
IHwgNTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9mcmVlc2NhbGUtaW14
L21hbGktaW14L21hbGktaW14Lmhhc2ggfCAgNSArKysKIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9t
YWxpLWlteC9tYWxpLWlteC5tayAgIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDUg
ZmlsZXMgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJT
IGIvREVWRUxPUEVSUwppbmRleCAxZDI5NjBmOWIzNjkuLjMxNDJiNmZlODlkYiAxMDA2NDQKLS0t
IGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0zMDU3LDYgKzMwNTcsNyBAQCBGOglz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zZXJ2ZXN0YXRpYy5weQog
TjoJU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29t
PgogRjoJYm9hcmQvYXJtYWRldXMvCiBGOgljb25maWdzL2FybWFkZXVzKgorRjoJcGFja2FnZS9m
cmVlc2NhbGUtaW14L21hbGktaW14LwogRjoJcGFja2FnZS9ueHAtYnQtd2lmaS1maXJtd2FyZS8K
IEY6CXBhY2thZ2UvbnhwLW13aWZpZXgvCiBGOglwYWNrYWdlL21tYy11dGlscy8KZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9Db25maWcuaW4gYi9wYWNrYWdlL2ZyZWVzY2FsZS1p
bXgvQ29uZmlnLmluCmluZGV4IGRlYzYwNDJmNDI3YS4uYjJmM2M2NWJkMzU1IDEwMDY0NAotLS0g
YS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxl
LWlteC9Db25maWcuaW4KQEAgLTE5Miw2ICsxOTIsMTAgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0ZS
RUVTQ0FMRV9JTVhfSEFTX1ZJVl9HUFUKIAkJQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFU
Rk9STV9JTVg4WCB8fCBcCiAJCUJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1Y
OERYTAogCitjb25maWcgQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9IQVNfTUFMSV9HUFUKKwli
b29sCisJZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1Y
OTUKKwogY29uZmlnIEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfSEFTX0VMRQogCWJvb2wKIAlk
ZWZhdWx0IHkgaWYgQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg4VUxQIHx8
IFwKQEAgLTIzMSw1ICsyMzUsNiBAQCBzb3VyY2UgInBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgt
Z3B1LWcyZC9Db25maWcuaW4iCiBzb3VyY2UgInBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1
LXZpdi9Db25maWcuaW4iCiBzb3VyY2UgInBhY2thZ2UvZnJlZXNjYWxlLWlteC9rZXJuZWwtbW9k
dWxlLWlteC1ncHUtdml2L0NvbmZpZy5pbiIKIGVuZGlmCitzb3VyY2UgInBhY2thZ2UvZnJlZXNj
YWxlLWlteC9tYWxpLWlteC9Db25maWcuaW4iCiAKIGVuZGlmCmRpZmYgLS1naXQgYS9wYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvbWFsaS1pbXgvQ29uZmlnLmluIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14
L21hbGktaW14L0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAuLmMyNzZmMWMzN2RiNgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlt
eC9tYWxpLWlteC9Db25maWcuaW4KQEAgLTAsMCArMSw1NSBAQAorY29tbWVudCAibWFsaS1pbXgg
bmVlZHMgYW4gaS5NWCBwbGF0Zm9ybSB3aXRoIGEgTWFsaSBHUFUiCisJZGVwZW5kcyBvbiAhQlIy
X1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9IQVNfTUFMSV9HUFUKKworY29tbWVudCAibWFsaS1pbXgg
bmVlZHMgYSBnbGliYyB0b29sY2hhaW4gd2l0aCBDKysiCisJZGVwZW5kcyBvbiBCUjJfYWFyY2g2
NAorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9IQVNfTUFMSV9HUFUKKwlk
ZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMgfHwgIUJSMl9JTlNUQUxMX0xJQlNU
RENQUAorCitjb25maWcgQlIyX1BBQ0tBR0VfTUFMSV9JTVgKKwlib29sICJtYWxpLWlteCIKKwlk
ZXBlbmRzIG9uIEJSMl9hYXJjaDY0CisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9GUkVFU0NBTEVf
SU1YX0hBU19NQUxJX0dQVQorCSMgTGlicmFyeSBiaW5hcmllcyBhcmUgbGlua2VkIGFnYWluc3Qg
bGliYy5zby42CisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMKKwkjIExpYnJh
cnkgYmluYXJpZXMgYXJlIGxpbmtlZCBhZ2FpbnN0IGxpYnN0ZGMrKy5zby42CisJZGVwZW5kcyBv
biBCUjJfSU5TVEFMTF9MSUJTVERDUFAKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSEFTX0xJQkVHTAor
CXNlbGVjdCBCUjJfUEFDS0FHRV9IQVNfTElCR0xFUworCXNlbGVjdCBCUjJfUEFDS0FHRV9IQVNf
TElCT1BFTkNMCisJc2VsZWN0IEJSMl9QQUNLQUdFX0hBU19MSUJHQk0KKwlzZWxlY3QgQlIyX1BB
Q0tBR0VfTElCR0JNX0hBU19GRUFUVVJFX0RNQV9CVUYKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElC
R0JNX0hBU19GRUFUVVJFX0ZPUk1BVF9NT0RJRklFUl9QTEFORV9DT1VOVAorCXNlbGVjdCBCUjJf
UEFDS0FHRV9MSUJEUk0KKwlzZWxlY3QgQlIyX1BBQ0tBR0VfV0FZTEFORAorCWhlbHAKKwkgIFVz
ZXJzcGFjZSBsaWJyYXJpZXMgYW5kIGZpcm13YXJlIGZvciBNYWxpIEdQVSBvbgorCSAgaS5NWDk1
IHBsYXRmb3Jtcy4KKworCSAgVGhpcyBsaWJyYXJ5IGlzIHByb3ZpZGVkIGJ5IEZyZWVzY2FsZSBh
cy1pcyBhbmQKKwkgIGRvZXNuJ3QgaGF2ZSBhbiB1cHN0cmVhbS4KKworaWYgQlIyX1BBQ0tBR0Vf
TUFMSV9JTVgKKworY29uZmlnIEJSMl9QQUNLQUdFX1BST1ZJREVTX0xJQkdCTQorCWRlZmF1bHQg
Im1hbGktaW14IgorCitjb25maWcgQlIyX1BBQ0tBR0VfUFJPVklERVNfTElCRUdMCisJZGVmYXVs
dCAibWFsaS1pbXgiCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9QUk9WSURFU19MSUJHTEVTCisJZGVm
YXVsdCAibWFsaS1pbXgiCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9QUk9WSURFU19MSUJPUEVOQ0wK
KwlkZWZhdWx0ICJtYWxpLWlteCIKKworY29uZmlnIEJSMl9QQUNLQUdFX01BTElfSU1YX0NPTVBJ
TEVSUworCWJvb2wgImluc3RhbGwgTWFsaSBvZmZsaW5lIGNvbXBpbGVycyIKKwloZWxwCisJICBD
b3B5IHRoZSBNYWxpIFNoYWRlciBvZmZsaW5lIGNvbXBpbGVyIGFuZCB0aGUKKwkgIE1hbGkgT3Bl
bkNMIG9mZmxpbmUgY29tcGlsZXIgdG8gdGhlIHRhcmdldC4KKworCSAgV2FybmluZzogY29tcGls
ZXJzIHRha2UgYXBwcm94aW1hdGVseSAxMDAgTUIgb2YKKwkgIGRpc2sgc3BhY2UuCisKK2VuZGlm
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvbWFsaS1pbXgvbWFsaS1pbXguaGFz
aCBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9tYWxpLWlteC9tYWxpLWlteC5oYXNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNzk2ZWY2YTNiNWJlCi0tLSAvZGV2L251
bGwKKysrIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L21hbGktaW14L21hbGktaW14Lmhhc2gKQEAg
LTAsMCArMSw1IEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICAxMTJkMzBmZjEwZDg2
NjhjNWU3MjFmOWY0ZGNhZDZlNjIxYWY2MmFlZTc0MzIyMDcyYWEzOTIzMDg5YWQxZjFjICBtYWxp
LWlteC1yNTZwMC4wLTE4Y2I0MjkuYmluCitzaGEyNTYgIDA5ZmM3Y2JhZmZkNGI5MWNiM2I0NjRi
ZTBhNzFmNDIwYmM4NGMyYjY3NGRlOWMxODk1YTI5MmRiYjMyNmIzYzYgIENPUFlJTkcKK3NoYTI1
NiAgNDAyMjQ0ZmEzMmJiZDNkMDYxNjg4MDk2MDQ5MjI5YzIyNGIyOTZhMjk0YzE0Nzk4NGJmZDJk
ZTMwNjc1NTM0MCAgRVVMQQorc2hhMjU2ICA0Yjg5NWJmNTQ1ZGIyY2I0ZjVlZWVmYjU0MzkyZWQ1
MTdkNjlhMjdmOGI5MzI4OTRiZWI0ZmZhNGMyM2EzYzRmICBTQ1IudHh0CmRpZmYgLS1naXQgYS9w
YWNrYWdlL2ZyZWVzY2FsZS1pbXgvbWFsaS1pbXgvbWFsaS1pbXgubWsgYi9wYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvbWFsaS1pbXgvbWFsaS1pbXgubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAwLi4yYmRmN2Q5ODVjYzAKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvbWFsaS1pbXgvbWFsaS1pbXgubWsKQEAgLTAsMCArMSw1MSBAQAorIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgbWFsaS1pbXgKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCisKK01BTElfSU1YX1JFVklTSU9OID0gMThjYjQyOQorTUFMSV9JTVhfVkVSU0lPTiA9IHI1
NnAwLjAKK01BTElfSU1YX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkKK01BTElfSU1YX1NP
VVJDRSA9IG1hbGktaW14LSQoTUFMSV9JTVhfVkVSU0lPTiktJChNQUxJX0lNWF9SRVZJU0lPTiku
YmluCisKK01BTElfSU1YX0lOU1RBTExfU1RBR0lORyA9IFlFUworCitNQUxJX0lNWF9MSUNFTlNF
ID0gTlhQIFNlbWljb25kdWN0b3IgU29mdHdhcmUgTGljZW5zZSBBZ3JlZW1lbnQKK01BTElfSU1Y
X0xJQ0VOU0VfRklMRVMgPSBFVUxBIENPUFlJTkcgU0NSLnR4dAorTUFMSV9JTVhfUkVESVNUUklC
VVRFID0gTk8KKworTUFMSV9JTVhfUFJPVklERVMgPSBsaWJnYm0gbGliZWdsIGxpYmdsZXMgbGli
b3BlbmNsCisKK01BTElfSU1YX0RFUEVOREVOQ0lFUyArPSBsaWJkcm0gd2F5bGFuZAorCitkZWZp
bmUgTUFMSV9JTVhfRVhUUkFDVF9DTURTCisJJChjYWxsIE5YUF9FWFRSQUNUX0hFTFBFUiwkKE1B
TElfSU1YX0RMX0RJUikvJChNQUxJX0lNWF9TT1VSQ0UpKQorZW5kZWYKKworZGVmaW5lIE1BTElf
SU1YX0lOU1RBTExfU1RBR0lOR19DTURTCisJY3AgLWEgJChARCkvdXNyL2xpYi9saWIqICQoU1RB
R0lOR19ESVIpL3Vzci9saWIvCisJY3AgLWEgJChARCkvdXNyL2xpYi9wa2djb25maWcvKiAkKFNU
QUdJTkdfRElSKS91c3IvbGliL3BrZ2NvbmZpZy8KKwljcCAtYSAkKEBEKS91c3IvaW5jbHVkZS8q
ICQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlLworZW5kZWYKKworaWZlcSAoJChCUjJfUEFDS0FH
RV9NQUxJX0lNWF9DT01QSUxFUlMpLHkpCitNQUxJX0lNWF9ERVBFTkRFTkNJRVMgKz0gaG9zdC1w
YXRjaGVsZgorCitkZWZpbmUgTUFMSV9JTVhfSU5TVEFMTF9DT01QSUxFUlMKKwljcCAtYSAkKEBE
KS91c3IvYmluLyogJChUQVJHRVRfRElSKS91c3IvYmluLworCSQoSE9TVF9ESVIpL2Jpbi9wYXRj
aGVsZiAtLXNldC1pbnRlcnByZXRlciAvbGliL2xkLWxpbnV4LWFhcmNoNjQuc28uMSBcCisJCSQo
VEFSR0VUX0RJUikvdXNyL2Jpbi9tYWxpKgorZW5kZWYKK2VuZGlmCisKK2RlZmluZSBNQUxJX0lN
WF9JTlNUQUxMX1RBUkdFVF9DTURTCisJY3AgLWEgJChARCkvdXNyL2xpYi9saWIqICQoVEFSR0VU
X0RJUikvdXNyL2xpYi8KKwljcCAtYSAkKEBEKS9ldGMvKiAkKFRBUkdFVF9ESVIpL2V0Yy8KKwlt
a2RpciAtcCAkKFRBUkdFVF9ESVIpL2xpYi9maXJtd2FyZS8KKwljcCAtYSAkKEBEKS91c3IvbGli
L2Zpcm13YXJlL21hbGlfY3NmZncuYmluIFwKKwkJJChUQVJHRVRfRElSKS9saWIvZmlybXdhcmUv
CisJJChNQUxJX0lNWF9JTlNUQUxMX0NPTVBJTEVSUykKK2VuZGVmCisKKyQoZXZhbCAkKGdlbmVy
aWMtcGFja2FnZSkpCgotLS0KYmFzZS1jb21taXQ6IDVlZGI4ZDZhMGMzZGI1ODdmNWRiZmEzMGFl
Mzc3ZTRmYTQwOGQ4ZjMKY2hhbmdlLWlkOiAyMDI2MTExNy1hZGQtbWFsaS1pbXgtcGFja2FnZS03
ZWY0MGQxNDhmY2UKCkJlc3QgcmVnYXJkcywKLS0gIApTw6liYXN0aWVuIFN6eW1hbnNraSA8c2Vi
YXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
