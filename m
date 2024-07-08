Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71FFC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 22:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 881E2406D4;
	Mon,  8 Jul 2024 22:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HhC9VUIb8_Ct; Mon,  8 Jul 2024 22:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C69F406F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C69F406F2;
	Mon,  8 Jul 2024 22:45:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64D2C1BF3DE
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFCAC404A9
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7B1ZPbQ8BteL for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 22:45:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 14C1E40607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14C1E40607
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14C1E40607
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 22:45:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.165.29]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5iZ-1sheeS33Lx-00Iaq6; Tue, 09
 Jul 2024 00:45:37 +0200
Date: Tue, 09 Jul 2024 00:45:33 +0200
MIME-Version: 1.0
Message-Id: <20240709-tipidee-v2-2-a69a8668005e@gmx.net>
References: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
In-Reply-To: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720478736; l=1022;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=nZBP61AqUv0fhoPNy8SggwVPPkFarZnFJoq5bpQlzI4=;
 b=0rsaiTno/aeFWZHdiMeuSGV31omhktLvsPxAl4G2C4W/oZXtkgN0Dzfr2oe7qU+pFEJ4oQeHA
 YHZuPXfk2XkDgRthyAzts9K+p+ymnvQzwho9ngc3GVqisikESwg3r8b
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:QS3cljsIbXg6ERynIV6zyVoCN2rOnnFlanSjerGsbhI9vTTjepT
 BKaVPY4STzo/JEwUpmWchKx0dM0ELM3A921NMTZDdwCA6CwGkbnc4dxLeMO59+L5y3qHzla
 0P9AMMT5mr8YqDzpggpPOxpwW470yRXs/3d5NJCNmdYDZDk12T5rQfnDRTfDMJYsN8RnjNt
 Bqii9WWu232HNw/oP6e/Q==
UI-OutboundReport: notjunk:1;M01:P0:BzxeMYp76GY=;HDLrIMA+MKw6xA4eqfAtMwh+I+a
 DxifHNWC3P4hsu8A30+OPkubKE561PP1tEJlF27eEvvlr/NcD96seERWd0qn4D3ru+ia5PD0u
 nlxB/wAUbPnjw2EzSB+DB1Ca+gNuefTBAOW+lwtVd3B4iWbqpCniEf1u+smC3ZZRqcD/wljEM
 Bq9hOvMpvRtoQ2j81rQlpHYdvBnbXI/DO3L4Hm3qdl6U5LEexLfQ+A1S8nb2WghdhXAiFa+Zu
 4SKX/9O8I8DdmrSkV2awXrk0JWxqF0Ck6SEIxMmNJiZ0qBIJ4+QdIpXRPQa2/21H4P2uXzHGR
 F3diErgMaOj8JEDenO4xj9ZP8tgFqTz9C5uUoKX5xi7sbvkkxlPs6TtSyCP6ud7jSeASLFpbc
 acVg9DvgehKMaEjXsRSnChGjgvQ6xAjvCQBHqZFuagUS1r86uYcXp8L0+VneFBq5KaT3RQyEx
 oRLLzwEEvgJGhbcU4IJXbfE3uSXSTvshpYfgdzGBrathuYC7VMCo9dFVNRjJo+/oxcvqSskqX
 Ut9h5fF1c5p1eYKDceGZKqZRHkK25CES/PcVREox8kamhFzmRzB/ANhuDf8McXoHL6xMUq6o3
 jBenLaA9956+NSq4BIFUT6XKnsyorCMc7JjSGGEgDkxybqyzvzY4vz0bvayrDtq6ohWxJAcrj
 0iKQuQSxPE/hWWyxcnREBGv09efi4ZwqkSswJ5icKpuNtgnwk66ZUlXu5QU0B4W1jxRhxFL6L
 /+yPBXmYneQq7Bc22ZgTBlKZ659swa4IJtE5l671zmFp/eGbF2kKuvj3EzlPOgzhcKcX8X+ZA
 Gs6PtQzUynrY7w3LHsQcsg/tpaN91Ic7MKyoQcK0/g66Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720478737; x=1721083537; i=j.neuschaefer@gmx.net;
 bh=OKxpsV3g5t9cCfOH85b+ftIVuq3n5a2MaHXutysc+pY=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=J/HBiAnTIE6KyXOMCifHOBszvXcih9WFYJmi0QcNQc1HejXOomZv7uvH4OnGRsQo
 srqZqbXqOVwQY/wR6NnAvl4TBbmQ7xVDn8TlXDm2cFIFUi/RvVV+r00EcFiAaaDqQ
 56VgPH2I7r5mofk+OgfDcJN9tStmUuKthCSW4BhbFStr+faFz07LD+IiqPFm2tv1O
 j51SMyYqcvx1cwHdVhsNx6GY9mXd4xhb+/NEU3o6R7+XGaMWYS/rSM6ZC98uuP+a5
 aJ/I1y5LGJg6jd6whqKfuDPe4tkpsBkVyY/D3XsnM80N628OCr/PUDbJoKJSLZmEB
 WOyHmuqyCKPpvOsPzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=J/HBiAnT
Subject: [Buildroot] [PATCH v2 2/8] s6: bump to version 2.13.0.1
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CiBwYWNrYWdlL3M2L3M2Lmhhc2ggfCAyICstCiBwYWNrYWdlL3M2L3M2Lm1rICAgfCAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3M2L3M2Lmhhc2ggYi9wYWNrYWdlL3M2L3M2Lmhhc2gKaW5kZXggZmI1ZTc0
ZTQwMy4uNmFiZWI4MDY2YSAxMDA2NDQKLS0tIGEvcGFja2FnZS9zNi9zNi5oYXNoCisrKyBiL3Bh
Y2thZ2UvczYvczYuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBnZW5lcmF0ZWQKLXNo
YTI1NiAgYzk1ZDUxNzg3NjAyZTBjOGM4ZTRmOTJhNzEwY2JkYWE0ZWU3OTdlZTg4NmU3MTM0Mjcy
N2UyOTc0Zjk1YzA2YiAgczYtMi4xMi4wLjQudGFyLmd6CitzaGEyNTYgIDdlNDZmOGY1NWQ4MGJi
MGUyMDI1YTY0ZDVkNjQ5YWY0YTRhYzIxZTM0ODAyMGNhYWFkZGUzMGJhNWU1YjQ4MzAgIHM2LTIu
MTMuMC4wLnRhci5negogc2hhMjU2ICBmZGM5MzEyOTU1MjVkZDAwMDljZGYzMzkxODljYmVjZDIy
OGQ2NWNlZmUzMzQwMmYwMzdmOWIwNDZmMDc5ODllICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3M2L3M2Lm1rIGIvcGFja2FnZS9zNi9zNi5tawppbmRleCBmYjQ5MTBlMjhiLi43ZTAyYzI2
ZDAzIDEwMDY0NAotLS0gYS9wYWNrYWdlL3M2L3M2Lm1rCisrKyBiL3BhY2thZ2UvczYvczYubWsK
QEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKLVM2X1ZFUlNJT04g
PSAyLjEyLjAuNAorUzZfVkVSU0lPTiA9IDIuMTMuMC4wCiBTNl9TSVRFID0gaHR0cHM6Ly9za2Fy
bmV0Lm9yZy9zb2Z0d2FyZS9zNgogUzZfTElDRU5TRSA9IElTQwogUzZfTElDRU5TRV9GSUxFUyA9
IENPUFlJTkcKCi0tCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
