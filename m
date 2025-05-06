Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F80C3ABAC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 09:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05D2440650;
	Tue,  6 May 2025 09:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcIWEaZqIv4U; Tue,  6 May 2025 09:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CFA7408C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CFA7408C8;
	Tue,  6 May 2025 09:26:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B272D5
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CE7560C1E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVmL5Y3wuZLY for <buildroot@buildroot.org>;
 Tue,  6 May 2025 09:26:15 +0000 (UTC)
X-Greylist: delayed 921 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 May 2025 09:26:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F78C60C18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F78C60C18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=87.98.174.144;
 helo=16.mo583.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 16.mo583.mail-out.ovh.net (16.mo583.mail-out.ovh.net
 [87.98.174.144])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F78C60C18
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:26:15 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.2.205])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4ZsCL45yrnz1WgC
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:10:52 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hvfz4 (unknown [10.110.168.221])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8BF801FEC2;
 Tue,  6 May 2025 09:10:52 +0000 (UTC)
Received: from armadeus.com ([37.59.142.110])
 by ghost-submission-5b5ff79f4f-hvfz4 with ESMTPSA
 id tXJvGRrSGWjOQgAADTKBBw:T6
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 06 May 2025 09:10:52 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 06 May 2025 11:10:35 +0200
MIME-Version: 1.0
Message-Id: <20250506-bump-imx-packages-lf-6-12-v1-5-56ee2884287a@armadeus.com>
References: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
In-Reply-To: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 15139976047821056992
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiudefueehuefgkeelheefjeejgfefvdeuuddtffekvefhtdelgfehheffheeggfenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=VjkaC6fVEiYuRODGmNQy6nmXLF9zqR9+d+ioJLRvJkk=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1746522652; v=1;
 b=GYGEYNP7SGJ5rddW6Oi9l6oVkVyG8wKiBlgTZzOSuYyVG8lluIUDocj9V2j+qQtgqXxOeO2J
 XCgYijl9rYZmYYb/Gtzuw8aK5ltYkQtyz+wvUiw+YRWaCBZgswwZ+0Uko1aX8qqCx5L4iFhMZd3
 CgUxwih5Z4dz3gP6TQirDf8fRexSZMXWpXxCMt+HcCdPu5nWOmuKW0FwbatP5HbEBjYJxgL5X02
 5wRs9XxfnPsMKInMh1d8YtyTjr0F3Mr+h1nUWIYcQ/7eHAo3TeSgIOiGFAXoxEGAelxt1fnZLDo
 m+PSBTLvn92bNfYC0fL6Inu3FaDk6oXN5Dug0/OgQ4MxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=GYGEYNP7
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004521d0a4b-d7ae-4732-90be-e9983ffd68e6,
 89164E2DADC3E9651536EDF06570BAAA20166E3F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 5/7] package/freescale-imx/imx-vpu-hantro: bump
 version to 1.36.0
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
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB2ZXJzaW9uIGlzIGFsaWduZWQgd2l0aCBOWFAgTGludXggQlNQIHZlcnNpb24gImxmLTYu
MTIuMy0xLjAuMCIuCgpMaWNlbnNlIGhhc2hlcyBjaGFuZ2VkIGJlY2F1c2UgdGhlIExBX09QVF9O
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY1NyBKdWx5IDIwMjQiIHRvICJ2NTgg
Tm92ZW1iZXIgMjAyNCIuCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2Vi
YXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogcGFja2FnZS9mcmVlc2NhbGUtaW14
L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFudHJvLmhhc2ggfCA2ICsrKy0tLQogcGFja2FnZS9m
cmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFudHJvLm1rICAgfCA0ICsrLS0K
IDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby9pbXgtdnB1LWhhbnRy
by5oYXNoIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFu
dHJvLmhhc2gKaW5kZXggZjEwMzk3MDg5MzQ2YjgzMGVhYTQ2YWU5YTU0NGM2MjExOGZiNzVhMC4u
NmIyNjdiM2VmMDFiNzE4ODFmMmFjODM1NGM1YzFhNGI3MzVlMWVjMiAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFudHJvLmhhc2gKKysr
IGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFudHJvLmhh
c2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYgIGM0NzMwY2I5
OTZhM2VhZmJjMDZlZDA3NjVjZDUwOWNhYTYzY2RlZWNkYzBjNDk1OGVmYmM5MTM4M2UwNTAxZmQg
IGlteC12cHUtaGFudHJvLTEuMzUuMC05OGZmMTgzLmJpbgotc2hhMjU2ICA2MDFmYTc5MGM1YjRk
MDM1NzliZDE4MmZiNGQ2NWE2ZjMyOWEzMmZhZjQ5ZGIyMmY5OGU0NjA4MjIxZTg2MWY3ICBDT1BZ
SU5HCi1zaGEyNTYgIGMzZDlhN2IyYTVhN2RiNWRhNjkwZTljMTA4MWI5OGI2NjU4MDJjM2VmYmJi
YTdmYjIzNzMzOTM5NWE5MmY2MDcgIEVVTEEKK3NoYTI1NiAgMGVmMWZiNWM2NjUzYzA4ZjJkMjgx
MmM3MmRlZGYzZThiZWIwOTFkZDViM2Q3MGQ2ZTI2ZjQxYmFjNGViZmZhNyAgaW14LXZwdS1oYW50
cm8tMS4zNi4wLTE5NGEzMDUuYmluCitzaGEyNTYgIDNmNGExMmM4MmE4NGJkMWMzNTc4YzljOTg2
ZDYzNzFhNjFkMzM5OTUyNWU3NjI4OGVjYmJhZTAxZGFmMGFlMjYgIENPUFlJTkcKK3NoYTI1NiAg
MzhmMTQwOGQ2ZTkzNWM1NjRlZmQ5MTE5YzMxMzI2OWU2NDNjMWE4NWNhYjFkOTMwYzNjNWJkNzBi
YzI2MTc2OSAgRVVMQQogc2hhMjU2ICA1ZDA2ZmY5ZGU1NmYwNzg4ZjZiMDkwYzkzMjI2ZGQ5NTE3
NjQxMjQ2MzVjNjg3Y2VmNjRmMjk3NzZjMmU4Y2Y4ICBTQ1ItaW14LXZwdS1oYW50cm8udHh0CmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8vaW14LXZwdS1o
YW50cm8ubWsgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8vaW14LXZwdS1o
YW50cm8ubWsKaW5kZXggMjU2MTUzODkyYmRjNDA1ZTE0OGE0ZWVlMjBiMzM4OGJhZWFiZDNmOC4u
ZGJkNTBiZmFlOGYzYWRmZjkwMDM0MmY5MWU2MGQzNDhkMWEwYzBlZSAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFudHJvLm1rCisrKyBi
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby9pbXgtdnB1LWhhbnRyby5tawpA
QCAtNCw4ICs0LDggQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUlNWF9WUFVfSEFO
VFJPX1ZFUlNJT04gPSAxLjM1LjAKLUlNWF9WUFVfSEFOVFJPX1JFVklTSU9OID0gOThmZjE4Mwor
SU1YX1ZQVV9IQU5UUk9fVkVSU0lPTiA9IDEuMzYuMAorSU1YX1ZQVV9IQU5UUk9fUkVWSVNJT04g
PSAxOTRhMzA1CiBJTVhfVlBVX0hBTlRST19TSVRFID0gJChGUkVFU0NBTEVfSU1YX1NJVEUpCiBJ
TVhfVlBVX0hBTlRST19TT1VSQ0UgPSBpbXgtdnB1LWhhbnRyby0kKElNWF9WUFVfSEFOVFJPX1ZF
UlNJT04pLSQoSU1YX1ZQVV9IQU5UUk9fUkVWSVNJT04pLmJpbgogSU1YX1ZQVV9IQU5UUk9fREVQ
RU5ERU5DSUVTID0gbGludXgKCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
