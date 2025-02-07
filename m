Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A09C0219B
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 17:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BBAB42C0D;
	Fri,  7 Feb 2025 17:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOSO1mLGRoa1; Fri,  7 Feb 2025 17:15:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D30F242C1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D30F242C1E;
	Fri,  7 Feb 2025 17:15:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6296E4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 932264012D
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVXYywRfqg4m for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 17:15:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1ADA740017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ADA740017
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1ADA740017
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.179]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1Ygt-1tiMYG3Df1-00CjJO; Fri, 07
 Feb 2025 18:15:11 +0100
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Fri,  7 Feb 2025 18:14:56 +0100
Message-ID: <20250207171458.1127620-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250207171458.1127620-1-fiona.klute@gmx.de>
References: <20250207171458.1127620-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DQxQRWZpSiZr5GCJltXdWUHZMtVeRF2s6xWrw5dWhMUFKTf3bSi
 04CeexcE1QYCjc1VYogrTCDb9DgZzlkYajO9d/vvUVEcX3NUUzog4v+2Jxq0HZxbinjJa6j
 mer0HNW+DLR0ltjDOHLL8IbQniO68vd7XnLl24SSME3fYcWmH3+QArg4DkSfxgx8yg+VS96
 ZArFtDJXahOclnpGH+lbA==
UI-OutboundReport: notjunk:1;M01:P0:qWf95YiPKZ8=;itNj+dWeE3LfjBp1Xra25Y3YpGJ
 ikXZzmN95s3rVoYg9b5+4f3nHkAENe1PeXR2vvRTF8LyUEfxlVk1/gbcxOVYCMgedGHJvMtDZ
 jkb5YHDJ4NoCEWGK/unPdg3sBI7kCFLGsl2ecfbQvfPIA5scwg5SqWm8g78nJlDfhdz/SALjA
 NcNEpe69vyz16/WqaOAGdV1Wx/CjMxZ8EF6hoapzwAT+Gtv3jCCj4l0Cp8wCy4b+cprX5ArQ6
 H0euglyK9qSUa0MnskDYsL+sv+e5dvhkHU1VGS+tCwza3A+O0iSVs59ZOjsTk9tfvTbkadxRp
 gCDHH/rKvdehwfzcSw3y+8+gOyQiUWz/lIEANiCm0+0DhrQfjZo5f/o3yCyUnVy51ZLYwGx0h
 uCZMhwT5zXxYM9PlkhK5MhzEvK58GDE75jkOxEC2I+xMI5YEeXyHzmcUcgERouhVHsASRH6tT
 9lNckiwLXxDFJww2ljF4UwIma9D3yCuO2SDznDSP/KrbLjRK/n3Fblp+rGLKA7ucj4kcyLNHM
 GyhRwBB2To6FEZ8ZJPXzrDu4Yb6+cNgtI7hR1Y3aWsTn4Ywgy549FtEJLtnTWjdjvlDBhsdqm
 LFAa+VpPgYGLTtp8ZKH/hYQwieDwViV0cSpQLMiEewZx8ryjbuvlpOPkXOX2b6dD2/OjZAZGa
 k+e51lNeQU2iBiep63OnAP6rBf+JsCeTb1fJWookls3Dq2P6f6aWG6PqLoDCqPpUIRpvJKpnO
 HzOZlaBPgx9u88ZCyJDXG+dxu5Fq5Z9S1iRBd6C8KnTQiQN2K2A1V4jOGSEhV/x1hbsPxIljS
 m8JJDwVam65ofr1Bjm4ABmT6srBoopDYszGvVK1BoLfiGNevYTTil36xYgDn1Z07QD+tTbGJ6
 xAGPg1PUiZ2mInI/BfZE0yNG58nkvQ08xPqtzx8kccucbckxhpDlciHGE5eq0yFqBL/+ZZOBo
 TnZN4Il6b4SdDxqIzAW0ZWhZZfSFMiuXP4J2AE0SDtue2EyRh0MPvuQXXY39CNnMUDjm5B8Q4
 aMBGnl56BF/kEhbyu/rMGV4mLgivE/84g4fLh6LlKjSwhEGecfS+8k8lkWJwjdrXlHQjVZIwn
 h4Oje/j4Pj3HwHRcQTHM21URgCojLzj3idmaTbZVy7d2hWjW4yr2z4qHUZlYWCOrvB6mt9zL8
 tKNY8j7D74FT7xS1PlBLQdG99mEU5hkPY82YoxcuQx7I3GSyboXD0z+QqBx6lz4r0CUQ/1U5u
 F+fCNChUTwWdfcKJXVxWpAaFGRwE4k/4Cd+n2w6bg8E0dus71AGhABX2spo5ft9EtJNhKQzCu
 bOQ67zIjBa5myjK6OaKHEQZ+rjCbMakZV+aqm/hrSEa19KOSbFgFKVgQl/YAaIQmeGmilHaI/
 zKaZ6We71yIfmbHGC0E8No0u2OpCs6Itjd/q4eb8GUE9iCI5aA+/SwBaiX
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738948512; x=1739553312; i=fiona.klute@gmx.de;
 bh=yxxt4ewCsF+jzjTkLt/K4LW1n5rSJaNdibdLQxzRQSQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=HzhkIpxsrtIgfUalfzO+8d5ADcGS7FpfJGYGgz6vuBEleHXtm3lORpALPhX/CJtn
 K9amsUfwK/qVr5293rU9fPPHLeMII6vvwqlURBU12AArXT4OvGNPOXLKGp7gkirQL
 N/QTJuc7HvtpNg9FdNUbW8msNBqPCz/JaY4ZJ4QnDT0awkPwjY4Or72xg13KBFHDY
 exPU4KuqdCHOjBCZfNLWS/YuAxkbJ/UBThxdctAXTRa6zcsh1RzmShYCtfQBc9Vkr
 3JQDG2PhUq/XXO/W1/ghm+mVpObaLM7xI+DdvRiHvAoCm3q8R97jyq7c3xZpFOq6U
 sJBMrkxZ+tU4dgkmnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=HzhkIpxs
Subject: [Buildroot] [PATCH v3 1/3] board/raspberrypi: Support boot.scr for
 U-Boot
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

RnJvbTogIkZpb25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdteC5kZT4KCklmIHVzaW5n
IFUtQm9vdCBhcyAia2VybmVsIiBmb3IgdGhlIHJhc3BiZXJyeXBpIGJvb3Rsb2FkZXIsIGluY2x1
ZGUKYm9vdC5zY3IgaW4gdGhlIGJvb3QgcGFydGl0aW9uIGlmIGl0IGV4aXN0cy4KClRvIHVzZSB0
aGlzLCB1c2UgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0NPTkZJR19GSUxFIHRvIHNldCBhIGNv
bmZpZwpmaWxlIHRoYXQgdXNlcyBVLUJvb3QsIGFuZCBlbmFibGUgYnVpbGRpbmcgYSBib290IHNj
cmlwdCBpbiB0aGUgVS1Cb290Cmhvc3QgdG9vbCBzZXR0aW5ncy4KClNpZ25lZC1vZmYtYnk6IEZp
b25hIEtsdXRlIChXSVdBKSA8ZmlvbmEua2x1dGVAZ214LmRlPgpSZXZpZXdlZC1ieTogWWFubiBF
LiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+ClRlc3RlZC1ieTogR2HDq2wgUE9SVEFZ
IDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20+Ci0tLQogYm9hcmQvcmFzcGJlcnJ5cGkvcG9z
dC1pbWFnZS5zaCB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvcG9zdC1pbWFnZS5zaCBiL2JvYXJkL3Jhc3Bi
ZXJyeXBpL3Bvc3QtaW1hZ2Uuc2gKaW5kZXggOWI5ZWFjOTcyYi4uZTQ2MTFkMDVkZCAxMDA3NTUK
LS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvcG9zdC1pbWFnZS5zaAorKysgYi9ib2FyZC9yYXNwYmVy
cnlwaS9wb3N0LWltYWdlLnNoCkBAIC0xOSw2ICsxOSwxMiBAQCBpZiBbICEgLWUgIiR7R0VOSU1B
R0VfQ0ZHfSIgXTsgdGhlbgogCUtFUk5FTD0kKHNlZCAtbiAncy9ea2VybmVsPS8vcCcgIiR7QklO
QVJJRVNfRElSfS9ycGktZmlybXdhcmUvY29uZmlnLnR4dCIpCiAJRklMRVMrPSggIiR7S0VSTkVM
fSIgKQogCisJIyBJZiBjb25maWcudHh0IGNhbGxzIGZvciBydW5uaW5nIFUtQm9vdCwgaW5jbHVk
ZSB0aGUgYm9vdAorCSMgc2NyaXB0IGlmIGFueS4KKwlpZiBbICIke0tFUk5FTH0iID0gInUtYm9v
dC5iaW4iIF0gJiYgWyAtZSAiJHtCSU5BUklFU19ESVJ9L2Jvb3Quc2NyIiBdOyB0aGVuCisJCUZJ
TEVTKz0oICJib290LnNjciIgKQorCWZpCisKIAlCT09UX0ZJTEVTPSQocHJpbnRmICdcXHRcXHRc
XHQiJXMiLFxcbicgIiR7RklMRVNbQF19IikKIAlzZWQgInN8I0JPT1RfRklMRVMjfCR7Qk9PVF9G
SUxFU318IiAiJHtCT0FSRF9ESVJ9L2dlbmltYWdlLmNmZy5pbiIgXAogCQk+ICIke0dFTklNQUdF
X0NGR30iCi0tIAoyLjQ3LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
