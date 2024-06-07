Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A8CC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 07:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F7EA42666;
	Fri,  7 Jun 2024 07:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvF6ouoDm9ub; Fri,  7 Jun 2024 07:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D938C4265D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D938C4265D;
	Fri,  7 Jun 2024 07:14:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0D41BF4D6
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 07:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39E51417F5
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 07:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29To1jFbIicU for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 07:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6A2C41461
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6A2C41461
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6A2C41461
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 07:14:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-35dceef429bso954635f8f.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 00:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717744460; x=1718349260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bThEz6HQ5hQjANCq0tgzoLaNWGfoKxn9DRHeDVAxO0k=;
 b=LUuNxXW/AiFAoJeRdzKz7NQh8mK5WcDquRtHnsBi8x+BkE5xDEX09jYVtq3vFZE126
 u4stgiI4FCPXlhCaaXXsTO0EE9LxbSHYmDarM/JJRQf0ajp6V3SjV7d8P2Z5FjzsHs2P
 WScl+aXWa68zNZ1OvFRx5J4ekB08sLKuC8n+4nIjK5EBRcYigjmD8SzCHvrl00OEoY/5
 mi8/KdzLwv13G6ZWTIKTktnhrQ/iAWQsm1Hqs6vU2gDLCLYzOZIPyM9Bfptjw6KT2Qir
 kdg/2uYCu/dTlCW6TXf9re6MzoHpkurTDEXb7zBX2xRRp3NW8RwsEl1nFUvCBWgcy8QP
 vSew==
X-Gm-Message-State: AOJu0YwwdeF3ppMYkSdlDV/UcEceZY3E18/Mo+ynsyz3/nla6poy2n3A
 oZd9sA5EkGAPDA6wB/fc2BOZ834nq+CKUtHVXTht94spsrHbl5t9QRrfR9Sb4mIeazR/eC7czQ7
 4H9o=
X-Google-Smtp-Source: AGHT+IEf5pNO5517YTaX5IrFukL9djFN0yna24j5P93Ylia8+BNw5bE3A+4BS3/BoBd6e7WD74Gq7g==
X-Received: by 2002:adf:f302:0:b0:34d:8d11:f8c0 with SMTP id
 ffacd0b85a97d-35efea26b9emr1470786f8f.18.1717744460288; 
 Fri, 07 Jun 2024 00:14:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5fc12e0sm3324083f8f.100.2024.06.07.00.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 00:14:19 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 09:13:59 +0200
Message-ID: <20240607071359.767329-3-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240607071359.767329-1-gael.portay@rtone.fr>
References: <20240607071359.767329-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1717744460; x=1718349260; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bThEz6HQ5hQjANCq0tgzoLaNWGfoKxn9DRHeDVAxO0k=;
 b=Vm1I7d1W40QnA2Fl8tyfe8YDqgniNgkOFBEf97In2Kb2EXvWuCfvUD1mf8aG2DDrkG
 mLtN1zsAni+WkyO1bAaKVQbMB0XMx11Kb21eUplBRl3clCkR1orgqH9IWW0i6Ek0TxUJ
 eWTanoK8TX5IpCD7cXcFxIXwId5vR92CO0DOw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=Vm1I7d1W
Subject: [Buildroot] [next v2 2/2] package/rpi-firmware: bump version to
 5476720
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, Athaariq Ardhiansyah <foss@athaariq.my.id>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VmVyc2lvbiA1NDc2NzIwIG1hdGNoIHRoZSB3aXRoIGtlcm5lbCA2LjYuMjguCgpTaWduZWQtb2Zm
LWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgotLS0KIHBhY2thZ2UvcnBp
LWZpcm13YXJlL3JwaS1maXJtd2FyZS5oYXNoIHwgMiArLQogcGFja2FnZS9ycGktZmlybXdhcmUv
cnBpLWZpcm13YXJlLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGkt
ZmlybXdhcmUuaGFzaCBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5oYXNoCmlu
ZGV4IDMzZTA1YTJmNGEuLjQ1MDFkYjczOWMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcnBpLWZpcm13
YXJlL3JwaS1maXJtd2FyZS5oYXNoCisrKyBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJt
d2FyZS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIGRk
NDNlNzdjYTFhODk2OWNkYjdmMDVkZDcyYTU3ZjkwODYyMDcxZDVhOTNiZGQ2YWVhODI0NmFiYTg1
Njg5Y2YgIHJwaS1maXJtd2FyZS04M2RhZmJjOTJjMGU2M2Y3NmNhMmVjZGQ0MjQ2MmQ1NjQ4OWQx
Yzc3LnRhci5negorc2hhMjU2ICAwMGZlNTQ4NzM3NmU5ZDVlZDE0Y2JjNzJhOWI3YTViZDhkNjkw
MGM4NGFlZTEwZjZkNjU2ZjE5MmEyNmQxNjFjICBycGktZmlybXdhcmUtNTQ3NjcyMGQ1MmNmNTc5
ZGMxNjI3NzE1MjYyYjMwYmExMjQyNTI1ZS50YXIuZ3oKIHNoYTI1NiAgYzcyODNmZjUxZjg2M2Q5
M2EyNzVjNjZlM2I0Y2IwODAyMWE1ZGQ0ZDhjMWU3YWNjNDdkODcyZmJlNTJkM2Q2YiAgYm9vdC9M
SUNFTkNFLmJyb2FkY29tCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmly
bXdhcmUubWsgYi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsKaW5kZXggMTEx
NzdhZWUwMi4uN2FlOWZmNmMyOCAxMDA2NDQKLS0tIGEvcGFja2FnZS9ycGktZmlybXdhcmUvcnBp
LWZpcm13YXJlLm1rCisrKyBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawpA
QCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVJQSV9GSVJNV0FS
RV9WRVJTSU9OID0gODNkYWZiYzkyYzBlNjNmNzZjYTJlY2RkNDI0NjJkNTY0ODlkMWM3NworUlBJ
X0ZJUk1XQVJFX1ZFUlNJT04gPSA1NDc2NzIwZDUyY2Y1NzlkYzE2Mjc3MTUyNjJiMzBiYTEyNDI1
MjVlCiBSUElfRklSTVdBUkVfU0lURSA9ICQoY2FsbCBnaXRodWIscmFzcGJlcnJ5cGksZmlybXdh
cmUsJChSUElfRklSTVdBUkVfVkVSU0lPTikpCiBSUElfRklSTVdBUkVfTElDRU5TRSA9IEJTRC0z
LUNsYXVzZQogUlBJX0ZJUk1XQVJFX0xJQ0VOU0VfRklMRVMgPSBib290L0xJQ0VOQ0UuYnJvYWRj
b20KLS0gCjIuNDUuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
