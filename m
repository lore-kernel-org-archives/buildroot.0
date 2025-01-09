Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4401FE77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 16:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04AB260B02;
	Thu,  9 Jan 2025 16:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mButN-7UkSLL; Thu,  9 Jan 2025 16:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 065D360ADF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 065D360ADF;
	Thu,  9 Jan 2025 16:56:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F7B976C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 16:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D92D4070C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 16:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNP25OPdCvNk for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 16:56:40 +0000 (UTC)
X-Greylist: delayed 1188 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 09 Jan 2025 16:56:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB7234020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB7234020B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.45.51;
 helo=1.mo581.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 1.mo581.mail-out.ovh.net (1.mo581.mail-out.ovh.net
 [178.33.45.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB7234020B
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 16:56:38 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.140.54])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4YTVmb62X9z18hc
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 16:36:47 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-fjps7 (unknown [10.111.182.153])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 496E21FDFB;
 Thu,  9 Jan 2025 16:36:47 +0000 (UTC)
Received: from armadeus.com ([37.59.142.104])
 by ghost-submission-5b5ff79f4f-fjps7 with ESMTPSA
 id zIZ9NR77f2epAgAAOZ7/fw
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 09 Jan 2025 16:36:47 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu, 09 Jan 2025 17:36:25 +0100
Message-Id: <20250109-nxp-mwifiex-firmware-driver-v1-0-b2ec8b34643c@armadeus.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAn7f2cC/x3MQQqDMBAF0KvIrB1IAqm1VykuQpzUvzCVCWhAv
 LvB5du8k4oopNCnO0llR8E/N9i+o7iE/BPG3EzOOG+sGTnXjdcDCVI5QdcjqPCs2EU5eP8exhj
 iyzpqw6aSUJ/9O13XDVfch/ptAAAA
X-Change-ID: 20250109-nxp-mwifiex-firmware-driver-a55879cac612
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 18095181830007614422
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeevgeeghfejvdegtedukeejieetheekjeejvdfhtdeguedukeejtdeftdeugeeileenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=ROFISPyOpq0nPQnK2KLdV+hmCm8NhL4kivll7eUBtbc=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1736440607; v=1;
 b=fBNblcjB+O9CyDNB28p98cUIOU/uHririhixJ0L+cJB+UumkhQVB87WriCc9ePawKEIyWAy4
 x40gfVMENees3g5I5llXOsFySD65xHmIy8yPqLpP/WcrlA5L3+P5LhHn5iwZ88ceGyJZoM7Q0sn
 tl6DZPZ4sp6zF72ubxwNOA1s5Q5oV8FhcYiQc6rq2y5X2xMT/L25hXFpxRjAtpMkeAVU2VVmrVJ
 heKTGJZzpCSRoQrXZqUqBcPd45GLZ5gXKohKkJn1FrAm0E9HLiSUZxbTYUSGP6WTxK2Rq3+vk6T
 c1g53LsQ58hPFLU96m0qJrQflEPONeEDmkExKcPB+7/Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=fBNblcjB
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005f5a3e280-7523-4d90-b33d-2f72b930f6af,
 72BCDE73031BAE8127C6C3DAB41EBC240DC3E12A)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 0/2] Add NXP WiFi chipsets support
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
Cc: Gilles Talis <gilles.talis@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IG9mIFdpRmkgY2hpcHMgZnJvbSBOWFAKSVc0MTYgLyBJ
VzYxMCAvIElXNjEyIC8gVzg4MDEgLyBXODk4NyAvIFc4OTk3IC8gVzkwOTguCgpUaGUgZmlyc3Qg
cGF0Y2ggYWRkcyBhIG5ldyBwYWNrYWdlIHByb3ZpZGluZyB0aGUgZmlybXdhcmVzLgpUaGUgc2Vj
b25kIHBhdGNoIGFkZHMgYSBuZXcgcGFja2FnZSBwcm92aWRpbmcgdGhlIGRyaXZlci4KClNpZ25l
ZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFk
ZXVzLmNvbT4KLS0tClPDqWJhc3RpZW4gU3p5bWFuc2tpICgyKToKICAgICAgcGFja2FnZS9ueHAt
YnQtd2lmaS1maXJtd2FyZTogbmV3IHBhY2thZ2UKICAgICAgcGFja2FnZS9ueHAtbXdpZmlleDog
bmV3IHBhY2thZ2UKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICsKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKwogcGFja2FnZS9ueHAtYnQtd2lmaS1maXJtd2FyZS9Db25maWcuaW4g
ICAgICAgICAgICAgfCA2NyArKysrKysrKysrKysrKysrKysrKysrCiAuLi4vbnhwLWJ0LXdpZmkt
ZmlybXdhcmUvbnhwLWJ0LXdpZmktZmlybXdhcmUuaGFzaCB8ICAzICsKIC4uLi9ueHAtYnQtd2lm
aS1maXJtd2FyZS9ueHAtYnQtd2lmaS1maXJtd2FyZS5tayAgIHwgMzMgKysrKysrKysrKysKIHBh
Y2thZ2UvbnhwLW13aWZpZXgvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgIHwgMTEgKysr
KwogcGFja2FnZS9ueHAtbXdpZmlleC9ueHAtbXdpZmlleC5oYXNoICAgICAgICAgICAgICAgfCAg
MyArCiBwYWNrYWdlL254cC1td2lmaWV4L254cC1td2lmaWV4Lm1rICAgICAgICAgICAgICAgICB8
IDE1ICsrKysrCiA4IGZpbGVzIGNoYW5nZWQsIDEzNiBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNv
bW1pdDogNWMwYTkxZjcyOTM1MjMyNTRlOWM0ODY2N2RmNDQ2ODM3MGZkYTU4ZApjaGFuZ2UtaWQ6
IDIwMjUwMTA5LW54cC1td2lmaWV4LWZpcm13YXJlLWRyaXZlci1hNTU4NzljYWM2MTIKCkJlc3Qg
cmVnYXJkcywKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFy
bWFkZXVzLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
