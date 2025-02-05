Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5018C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2CD41270;
	Wed,  5 Feb 2025 11:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCqj8O3WC7Ms; Wed,  5 Feb 2025 11:49:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63325417A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63325417A5;
	Wed,  5 Feb 2025 11:49:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6816112A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57BB460747
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MC2MqjlH5NGT for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:49:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.58.226;
 helo=3.mo560.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 331286071D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 331286071D
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net
 [46.105.58.226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 331286071D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:49:25 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.140.215])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4Ynywx4Vz0z1dyg
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:05 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C8C571FE0E;
 Wed,  5 Feb 2025 11:41:04 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ:T8
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:41:04 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:40:57 +0100
MIME-Version: 1.0
Message-Id: <20250205-imx-packages-bump-v1-7-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
In-Reply-To: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5643291809436789728
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepiedufeeuheeugfekleehfeejjefgfedvuedutdffkeevhfdtlefgheehffehgefgnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=Bkqd03IJAO4GwWdYqYnRvzWXGtkCizxXsWpfUaYHklQ=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755665; v=1;
 b=HrVkNfYZLdg/+PzpQN5O5fz6pOOgu1qp+mTxEpSYc31su/j3lNAhzc71ppixTrtgKJ/lsNRD
 Xswzmzmh7D/Iv9zf+0Abrk/VupmNtYhx2+INd6VxKIa0vbEyf+j4B6rSQDH2T8Y4z5GcxRl4SQN
 BOatGkXqcg/yN39LjtAHgmRdBZgAKcLUeTavFmldWOT1sk33J6nvXgjMtr+VGVSw3cvskAIjqd1
 UYGqjGkZ6kKn7hLtYS8ua75o1mSPBC+KJpGjTyM/A6Spwux/K7Xj6PXXUqfxziBUjknkAhRazdK
 eAEHAevyeQaMDKiwtNE8PgNhr/FdxIRedlGD7kue8NF7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=HrVkNfYZ
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S0070fb95bca-2ea5-4742-a871-a8f6ee2f68e6,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 07/11]
 package/freescale-imx/imx-vpu-hantro-daemon: bump version to 1.4.0
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
Ni41NS0yLjAuMCIuCgpBZGQgU0NSLWlteC12cHUtaGFudHJvLWRhZW1vbi50eHQgdG8gX0xJQ0VO
U0VfRklMRVMuCgpOb3RlOiBpbiB0aGlzIHJlbGVhc2UsIHRoZSBwYWNrYWdlIHNvdXJjZSBhcmNo
aXZlIG5hbWUgY2hhbmdlZCB0bwppbmNsdWRlIGEgcmV2aXNpb24uIFRoaXMgY29tbWl0IGFkZHMg
YSBuZXcgX1JFVklTSU9OIHZhcmlhYmxlIHdpdGggdGhlCnZhbHVlIHB1Ymxpc2hlZCBpbiB0aGUg
Y29ycmVzcG9uZGluZyBOWFAgQlNQLgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5z
a2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0KIC4uLi9mcmVlc2NhbGUt
aW14L2lteC12cHUtaGFudHJvLWRhZW1vbi9pbXgtdnB1LWhhbnRyby1kYWVtb24uaGFzaCAgfCAz
ICsrLQogLi4uL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8tZGFlbW9uL2lteC12cHUtaGFu
dHJvLWRhZW1vbi5tayAgICB8IDYgKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgv
aW14LXZwdS1oYW50cm8tZGFlbW9uL2lteC12cHUtaGFudHJvLWRhZW1vbi5oYXNoIGIvcGFja2Fn
ZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvLWRhZW1vbi9pbXgtdnB1LWhhbnRyby1kYWVt
b24uaGFzaAppbmRleCAwZmQ2NGNkZjlkMTEzMTY0YzAzMWVlNjk0ZDRhN2I4MGEwOTYzZjVlLi4w
ZjNjYTYwODY1MzU5ZjNhZWU1OTMyYTAzYTBkMTM1YTM3ODc1NzM4IDEwMDY0NAotLS0gYS9wYWNr
YWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8tZGFlbW9uL2lteC12cHUtaGFudHJvLWRh
ZW1vbi5oYXNoCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby1kYWVt
b24vaW14LXZwdS1oYW50cm8tZGFlbW9uLmhhc2gKQEAgLTEsMyArMSw0IEBACiAjIExvY2FsbHkg
Y29tcHV0ZWQ6Ci1zaGEyNTYgIDgwZDY2MjAwNjNmZDVlNTUwNmIwNWM5MDc2NzdiNTc5ZDQ3MWE5
YjZkYWE4YjI2ZmZiOTYzMTEwY2M2ODBiZjkgIGlteC12cHUtaGFudHJvLWRhZW1vbi0xLjEuOS50
YXIuZ3oKK3NoYTI1NiAgYzNhYzM2YzIwM2ZlZjQ0ZWYyMWM5OGE5MGIzZmZmNzNhZjlmMzI4ZjE2
YjRkODUxNTczMDg4NDhmNmMzNDgyMyAgaW14LXZwdS1oYW50cm8tZGFlbW9uLTEuNC4wLTc1ZDlk
ZDkudGFyLmd6CiBzaGEyNTYgIGJiNjQ1ZjAyYjI2MDk1NWYzMzMzNDgxMDBlNDBhZjc2MjUzZTJj
ZDhiMTE2YmFjMDQ3MjMwNDM5ZGQ1M2VjNWEgIExJQ0VOU0UudHh0CitzaGEyNTYgIGM2MTE3NjA0
OGY3NDk1MGMwODQ5ZDkxYjRiNmIzMGUzMzVlMDUwNDYyYTg5NTBiODlhNGU2ZjM1YzdmZTU3N2Ig
IFNDUi1pbXgtdnB1LWhhbnRyby1kYWVtb24udHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvaW14LXZwdS1oYW50cm8tZGFlbW9uL2lteC12cHUtaGFudHJvLWRhZW1vbi5tayBi
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby1kYWVtb24vaW14LXZwdS1oYW50
cm8tZGFlbW9uLm1rCmluZGV4IDEyZWMwNTVmOTI4OGRmMGU3NWQ5ZDVjYTFlNGI2ZDVjY2FjMDli
MzUuLmEzMjgwMDUzMjhmMGZjNDhlYTZlMjlkOWY1YzRmOTNhNDk4ZDgxMzUgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby1kYWVtb24vaW14LXZwdS1oYW50
cm8tZGFlbW9uLm1rCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby1k
YWVtb24vaW14LXZwdS1oYW50cm8tZGFlbW9uLm1rCkBAIC00LDEwICs0LDEyIEBACiAjCiAjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwogCi1JTVhfVlBVX0hBTlRST19EQUVNT05fVkVSU0lPTiA9IDEu
MS45CitJTVhfVlBVX0hBTlRST19EQUVNT05fVkVSU0lPTiA9IDEuNC4wCitJTVhfVlBVX0hBTlRS
T19EQUVNT05fUkVWSVNJT04gPSA3NWQ5ZGQ5CitJTVhfVlBVX0hBTlRST19EQUVNT05fU09VUkNF
ID0gaW14LXZwdS1oYW50cm8tZGFlbW9uLSQoSU1YX1ZQVV9IQU5UUk9fREFFTU9OX1ZFUlNJT04p
LSQoSU1YX1ZQVV9IQU5UUk9fREFFTU9OX1JFVklTSU9OKS50YXIuZ3oKIElNWF9WUFVfSEFOVFJP
X0RBRU1PTl9TSVRFID0gJChGUkVFU0NBTEVfSU1YX1NJVEUpCiBJTVhfVlBVX0hBTlRST19EQUVN
T05fTElDRU5TRSA9IE5YUCBTZW1pY29uZHVjdG9yIFNvZnR3YXJlIExpY2Vuc2UgQWdyZWVtZW50
Ci1JTVhfVlBVX0hBTlRST19EQUVNT05fTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0CitJTVhf
VlBVX0hBTlRST19EQUVNT05fTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0IFNDUi1pbXgtdnB1
LWhhbnRyby1kYWVtb24udHh0CiBJTVhfVlBVX0hBTlRST19EQUVNT05fUkVESVNUUklCVVRFID0g
Tk8KIElNWF9WUFVfSEFOVFJPX0RBRU1PTl9ERVBFTkRFTkNJRVMgPSBpbXgtdnB1LWhhbnRybyBs
aW51eAogaWZlcSAoJChCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JNX0lNWDhNUCks
eSkKCi0tIAoyLjQ1LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
