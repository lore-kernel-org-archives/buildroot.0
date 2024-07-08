Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72262C3DA42
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 22:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2515940756;
	Mon,  8 Jul 2024 22:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfl5MG_eMjV8; Mon,  8 Jul 2024 22:46:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A745B4073F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A745B4073F;
	Mon,  8 Jul 2024 22:46:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE47E1BF969
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9A88811DC
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hl55wU85vSGr for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 22:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7885181244
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7885181244
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7885181244
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.165.29]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiacH-1rw28j3uv1-00dxPP; Tue, 09
 Jul 2024 00:45:38 +0200
Date: Tue, 09 Jul 2024 00:45:36 +0200
MIME-Version: 1.0
Message-Id: <20240709-tipidee-v2-5-a69a8668005e@gmx.net>
References: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
In-Reply-To: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720478736; l=1256;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=vL/oLtLGL0b0h8v4je/FxUjwLJqHniWzqIOAQwXgbns=;
 b=kxUD/yjEQZVgeWhM3r2+/GmZTczbNfCSk6AOPGKe4a8f/k9J2RLtbSJOoqmwvr1GXWP0hgwP/
 WwmIzLUozPTCkosJDB/gey5I0zsdXTRpbDezovweH4tsAr2wZCQjqVE
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:b+otZ6b3tmZ/SE1x1+1g3ULURLQmjceXPzRnW4LawjouGaWGpkt
 fRwPNHYxW990c/S6Mui2UKVOUKX3521shBocZOfgc6g+JLNR4Ly+FVtWGYuJerckYer7na0
 uXntxo4psdv4qTCm/Uygk3mrZsdIOUAuNVBl+TOtIbIjxW7w8BU6Q18jyuRIOdoSOsVEdGL
 h0e2TraMeqyxTbjMJOdjg==
UI-OutboundReport: notjunk:1;M01:P0:gSNVewUlq0o=;LqTOLvbIjy4VAfNVrstGdDoiSTg
 ZSNvXpLJjRntR6OUKZFU9CpWGLgI2RXBVtdu9zf6krmIiBe5degjb8oEK9s0KMsfjz0Rdh5ML
 /q7+VFu9Xl0+DtgWAhAmT/64Yqxi/U4ItNtEj12LDvoKuHSZDnYccV8tQbkLlkipBy9MwzvLX
 shqewz/MmG/yA2fV2iVsPUaTleqcr5EIURuYeI+iRoFmRsah6M/E0F59L1Ebiyn2uIHNsIZqq
 +O17rp/fca1xq84WvazvBNR6Uyj83WNCJ83k1NMmie1VklXKp2Wk5iN4H/0vODMBn0EeIUoYW
 YnNFgvEMclUswHtdHfuusHa91R2QgaJ1EcCNmH4d2FMH46cSs/57VLPX3Z/XO8KMgaxx67mr3
 m7Ae1WWSh8hjCTNuVZMJL6/ArXrxl+0sgEd9sXQyYOoIjxeGXtFmm7ylQMhAOQ6zVv34eNX70
 +DACPIBo4ImFgRjVEqO+HJY1WSw3NNT4MOzfuykQyuoFtuDHXuxj4+6eIjGYv1pfJ00YT3QFd
 A6qXHJDuUJ5P1PPlvmNTp5bC7w4FnQ2X/TAZVj96Mg39dlMMHQtO87EIZpWIEeWzDhIUrKSXh
 66pcm6S+xGVZrBIHdQp6UrefGCfRTfvs82Ys/fegBSOp4mQ/Vr0NLz694j4XSjhPoDdG7xhbc
 EwCcxIwEn1Lf16FcqBpLFMtoecwqvrAOYoqfFk/EMiFAYp/D1MrlcmY9TO9TaiylDWif6LakF
 QGHFwp9u4Rjne5eBSGOeS/6cMRuNgLWdciS51Ba9ZC/yWlEHFdVRcR/rgbwKkKBt5iWBm4qDR
 AaYm+pxY6ERhtiXVrXCjVnoXLyqMPiLrsmkTM+zGdDFMY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720478739; x=1721083539; i=j.neuschaefer@gmx.net;
 bh=bGcxYVVJxXkvc72/I0jOir4lr8xbhfkDEfXZzRVbN7I=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OQzDvC9f/XqEuuBB7Sn710asDfCHnSSxWkwRrN1uM6kqDPxrR3BlhfOp4Io/Sdfu
 ub6aOTYghiqBLkQYNWaWD0wuVbzgmfvUes5qWBVZY/DPGflXclw0IE0dFk22tNsjV
 0TtPeXvaK7sM4+kZkRy+excGr6Is4pF1VjuqyOIDZjodC4fPVZ9XsLBc4TmnrlO/T
 6OH7metf0ff6DEOFWWDXBPpmehIX451o1N6JkHKaspP4G56yAWT6beTypl7RC1gir
 VerBR6OySD3kqTej4ZZfhaG5CuofHuzPTrZ4s6rRn8vF01gv97/40RXhiLbLW/k9C
 StLh+1bwoWgJG33F1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=OQzDvC9f
Subject: [Buildroot] [PATCH v2 5/8] s6-rc: bump to version 0.5.4.3
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

VGhlIENPUFlJTkcgaGFzaCBjaGFuZ2VkIGJlY2F1c2UgdGhlIGNvcHlyaWdodCB5ZWFyIHdhcyB1
cGRhdGVkLgoKU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214
Lm5ldD4KLS0tCiBwYWNrYWdlL3M2LXJjL3M2LXJjLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvczYt
cmMvczYtcmMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvczYtcmMvczYtcmMuaGFzaCBiL3Bh
Y2thZ2UvczYtcmMvczYtcmMuaGFzaAppbmRleCBhMDljMDhiYTNjLi43MmJkNWQ0MmJlIDEwMDY0
NAotLS0gYS9wYWNrYWdlL3M2LXJjL3M2LXJjLmhhc2gKKysrIGIvcGFja2FnZS9zNi1yYy9zNi1y
Yy5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGdlbmVyYXRlZAotc2hhMjU2ICAwMGJk
ZmE1OTZmYTcxNjE1MTJlOTcyZWM5MjgyYTJhYmQ4ZmQwZTMxZjA5MTc3YmFkN2EyYmMzZDhmMjgz
OTgyICBzNi1yYy0wLjUuNC4yLnRhci5negotc2hhMjU2ICBmNjg0NTFlNTVlNjY4NmRjMTg3ZGYx
Y2E0MjdjNTc0ZDlhYzBkNmY2OTI2ZTFiZGI5MDlhZDhiNjU3NjY4ZmU1ICBDT1BZSU5HCitzaGEy
NTYgIGUzMjcyNzk2YTk0NzkwNGRlMzdhYjM0ZWMxMDQzMGUyNjEwN2I4ZWYwNTIxMGQ4MTA1OWM4
YjM2MjAzZTZhOWYgIHM2LXJjLTAuNS40LjMudGFyLmd6CitzaGEyNTYgIDc1YjBiNTBkN2JjYjli
MmZjMTc0ZDAxNDQyNTM2YmNlMDMzMzNkYTE4MTRkZjNlNjFjZDZlZjhmNjYzNTQ4ZjEgIENPUFlJ
TkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvczYtcmMvczYtcmMubWsgYi9wYWNrYWdlL3M2LXJjL3M2
LXJjLm1rCmluZGV4IDYxMDkwYzlhMjcuLjMwMWM3MDU5MTAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
czYtcmMvczYtcmMubWsKKysrIGIvcGFja2FnZS9zNi1yYy9zNi1yYy5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgotUzZfUkNfVkVSU0lPTiA9IDAuNS40LjIK
K1M2X1JDX1ZFUlNJT04gPSAwLjUuNC4zCiBTNl9SQ19TSVRFID0gaHR0cHM6Ly9za2FybmV0Lm9y
Zy9zb2Z0d2FyZS9zNi1yYwogUzZfUkNfTElDRU5TRSA9IElTQwogUzZfUkNfTElDRU5TRV9GSUxF
UyA9IENPUFlJTkcKCi0tCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
