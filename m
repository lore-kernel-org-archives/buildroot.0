Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C917C18E7C
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 14:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F07D240CD7;
	Wed, 26 Feb 2025 14:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqE0SSZDIsVb; Wed, 26 Feb 2025 14:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C2E40BCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C2E40BCE;
	Wed, 26 Feb 2025 14:28:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CC9368
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF49F400DA
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gfofy2ujPeDf for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 14:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.58.60;
 helo=3.mo575.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8514E403B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8514E403B4
Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net
 [46.105.58.60])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8514E403B4
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:28:29 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.139.198])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4Z2xfM2mgMz1snY
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:28:27 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-vdgn2 (unknown [10.110.178.91])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 07AEC1FD62;
 Wed, 26 Feb 2025 14:28:26 +0000 (UTC)
Received: from armadeus.com ([37.59.142.97])
 by ghost-submission-5b5ff79f4f-vdgn2 with ESMTPSA
 id ARlTFAolv2dTIQAABrTzDg:T2
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 26 Feb 2025 14:28:26 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 26 Feb 2025 15:28:15 +0100
MIME-Version: 1.0
Message-Id: <20250226-nxp-mwifiex-kconfig-fix-v1-1-5e2a46c520a5@armadeus.com>
References: <20250226-nxp-mwifiex-kconfig-fix-v1-0-5e2a46c520a5@armadeus.com>
In-Reply-To: <20250226-nxp-mwifiex-kconfig-fix-v1-0-5e2a46c520a5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 2669227207282912235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfelvdefjeeivefhuefhledtjeduieevvefhffehjefgudetfedufeeuhedvudenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheejhegmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=CVRVULFeWrFmqe9cRgeUJYHW+HTAvhyZ6Ebs9xIu1+w=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1740580107; v=1;
 b=CcL8jtDyqffnSfEagSoo8xUJaimyo3+tZNB7TfruQZiiyadaUwH2g8tMM+onxTS3MYLz0/1x
 auZN0Xh+BYaAvvJh5BMHf9kcnCAsHK+nNy1Jp4xEqQi+XKuSS26BcvuWXaufXSzlQ6XtOW2pExx
 L1u80yKpS3Y7YNaxRTWu76aBW2TC80H7u+jU38CmTP4axE+27AXbv3/tuZ/PPZP3rUqiE4hsN5y
 8AqDCs9K9gKQX39QlGEAUK9TZQN6FPQemM+VDZ1iFHIfCKwXSku45+voeEDukxt93HN9FTRALiY
 jwT31HGm4cnysaSODs9zQjM1GY3W8XBE3UYxjepwKFWdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=CcL8jtDy
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0021e235e17-569b-4c9c-b811-30ac71cd29aa,
 A50FC0A5E7C9DA406CB1ACD9B6A167DCAC5E06BF)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/2] package/nxp-mwifiex: use right kernel
 config symbol to enable PCI
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IDYyMGQwZTg2ZWUxNiAoInBhY2thZ2UvbnhwLW13aWZpZXg6IGZpeCBidWlsZCBmYWls
dXJlIGR1ZSB0bwptaXNzaW5nIExpbnV4IG9wdGlvbnMiKSBhZGRlZCBrY29uZmlnIGZpeHVwIHRv
IGVuYWJsZSBQQ0kgc3VwcG9ydCBidXQKbWlzdHlwZWQgdGhlIGNvbmZpZyBzeW1ib2wuCgpGaXgg
aXQuCgpGaXhlczoKICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZWI5
NzJiNzgxZWFkMzU3YzNlNDRhODgwY2MxYjhlNGFiNGIxNWI1OAoKU2lnbmVkLW9mZi1ieTogU8Op
YmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0K
IHBhY2thZ2UvbnhwLW13aWZpZXgvbnhwLW13aWZpZXgubWsgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL254
cC1td2lmaWV4L254cC1td2lmaWV4Lm1rIGIvcGFja2FnZS9ueHAtbXdpZmlleC9ueHAtbXdpZmll
eC5tawppbmRleCA4ZjA4NTY2OGYxOTY0ZGY4NGQwYzRkYThhZDEwMTk0ZTg3MDAzYjEwLi4zMzNm
OGVjNGZiODRiZjE2ODZhNGVlZTdjYzZjMmMzMTM0YjUyOTU5IDEwMDY0NAotLS0gYS9wYWNrYWdl
L254cC1td2lmaWV4L254cC1td2lmaWV4Lm1rCisrKyBiL3BhY2thZ2UvbnhwLW13aWZpZXgvbnhw
LW13aWZpZXgubWsKQEAgLTE4LDcgKzE4LDcgQEAgZGVmaW5lIE5YUF9NV0lGSUVYX0xJTlVYX0NP
TkZJR19GSVhVUFMKIAkkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19VU0JfU1VQUE9S
VCkKIAkkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19VU0IpCiAJJChjYWxsIEtDT05G
SUdfRU5BQkxFX09QVCxDT05GSUdfTU1DKQotCSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09O
RklHX1BDSUUpCisJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfUENJKQogZW5kZWYK
IAogJChldmFsICQoa2VybmVsLW1vZHVsZSkpCgotLSAKMi40NS4zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
