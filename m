Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914DBC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 22:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E36D406D9;
	Mon,  8 Jul 2024 22:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nE0C6JYTQSU; Mon,  8 Jul 2024 22:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5659406E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5659406E4;
	Mon,  8 Jul 2024 22:45:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BE9A1BF3DE
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE337811DC
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBdcTj9CxuFe for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BA25811F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BA25811F7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BA25811F7
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 22:45:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.165.29]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnakX-1rzpVX2DIb-00gff7; Tue, 09
 Jul 2024 00:45:38 +0200
Date: Tue, 09 Jul 2024 00:45:35 +0200
MIME-Version: 1.0
Message-Id: <20240709-tipidee-v2-4-a69a8668005e@gmx.net>
References: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
In-Reply-To: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720478736; l=1326;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=q6nWCViKe4w6hj75mE2DSIqda2O+cIaC0bN2ymWWFxA=;
 b=xXiqCV6gygpJX2Wqx23s5j+f6CA0Ibe/NGvydp4baqtljMkIcccED1JrM0y+nibD/UkJEVmj8
 54p3ygHXgZVDt6LeeCcUv83lcyK8OjJInUq/Xzvh9qj2bZCDU6VbhMJ
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:oaSyhW6jQ3wE0AoyQ7fa30/5wXIa+KI19ZU6BoCEKrNbu9oipui
 wNeczJTTc1Zin2BuUHW3tsPASei27Rq+HAsZzyxIovO9J4pxtyAB8Mw1bZ1itode0gmZYFO
 LYdvKDIBg4ryd8weFHOTPUubLwjOpolXtwNCnZaJLzy99Qw2pIYpZViS74hQja5uLWM+xbj
 WYGQdV5EDNsZHKlnaEZ1g==
UI-OutboundReport: notjunk:1;M01:P0:7EX5gX7gfEI=;E/wtpTI0ux7f3cLYia8I7V9xrdo
 m6jEgajeHjugSBjIqgQ12PVOCTrQt+MtucrHZUyOjWRNjmahNdaPw1aGr3+cp5wmdxmvpLISE
 RPLqqy6EZz88YPHsPrwcwKTxBq4EknvcVOhNSQ3hBn9GsZxDphFDPfhZZP/DQfJprt9vzUgRo
 pIjnRMK5iFYV1ieNSpXINcZ/xb5VrtifvJkjFl+z3Xj4TJFJprvDx1M8KCxk+g5C3545Cxy7y
 5Gp7KPnW27XzmdFzYw2FQbeKeG6rZt/bwK24KePNKsf5tLes7pX31GIr95DhadAKesKS1HoAh
 jGwVMYZ2qZ51NwyvvehcHsBIhvUAIce3/tBSJj+QzCvTpeLlhwLk6hODM1VJtTXwOQXwKJD3H
 334u/CU78Dki96mftDNWPiesk9xYv+Qw8MNJ0FMDt2UXFH4JR1pA/Itf3fBier6mxV0edbwVa
 RiZOXuVJXxlY5g4tmNPJtuva87AE79n5COTq8bO8JY5N65IljrvKxUh7Kcs3dnfGKT43nslG7
 Wx92QGbMyVCAb+y6RkLfQzciYbywNN/fSsajyvfymKuGsuDJDSUKDtABafusOhHqND+rflgO7
 RHqXPsK7MVFqWGZSCMhxbOng6uO13wBhPam1sKdPvwCrRpE5KgHUGBrEDGSF5ttekHRiqpxOm
 RS25rJA4scTrht0HB9A/oL7A8wVcvK/qrO8c9xFW6VckD82b6X2KqqfpZtvWHWKrhA0v/uRbK
 1S3ibyETO8w0HoOu2DD/HVaQgGkuH/m/qKRxle1nt/tRuyUDtS8780Jsq/yq85D6EO8VIs5dO
 hfLmGjDFtduWocDKnrtvBoWpCTSw75Nz7xDk6b6q6lf7A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720478738; x=1721083538; i=j.neuschaefer@gmx.net;
 bh=l6kJgMzsJ4qjt2YUbIg/a869oG5N4IMAM27nGT7HZHE=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hbf0yyH/rwyhhn8InsTtg7lzrTUXm6Mt5Bs10e/LydqMOPsQHMkRbkh03bIS2zzZ
 xP3dxc+2sGdc0z2A+FOnUR5NnvSxk3KY421OESPyW8SjxWtG87X50KVFXLx6jkOGV
 LzOAMH/MXdsW9Yv9fmdU6Ms2LDWQgLtfw58yEdPdjxLdgwOXG1NNs5wvLBHoP4c8x
 YO06Iy4VDDPJHgtnpYeMjBH7a6WDmnc4tWCwLYg8nyL3+7U07mQCfJ2S4riEN2foG
 1ybnxn4oiBdDgv8R9Ko5jwIMmfqyroengnaaIEsDuZectGAXpTcyhLAAN9KK85loR
 Zt6j7pI367LusvkMOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=hbf0yyH/
Subject: [Buildroot] [PATCH v2 4/8] s6-networking: bump to version 2.7.0.3
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
CiBwYWNrYWdlL3M2LW5ldHdvcmtpbmcvczYtbmV0d29ya2luZy5oYXNoIHwgMiArLQogcGFja2Fn
ZS9zNi1uZXR3b3JraW5nL3M2LW5ldHdvcmtpbmcubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
czYtbmV0d29ya2luZy9zNi1uZXR3b3JraW5nLmhhc2ggYi9wYWNrYWdlL3M2LW5ldHdvcmtpbmcv
czYtbmV0d29ya2luZy5oYXNoCmluZGV4IGRmNjUyNzRiM2QuLjRlZmY0ZDQ5ZjQgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvczYtbmV0d29ya2luZy9zNi1uZXR3b3JraW5nLmhhc2gKKysrIGIvcGFja2Fn
ZS9zNi1uZXR3b3JraW5nL3M2LW5ldHdvcmtpbmcuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9j
YWxseSBnZW5lcmF0ZWQKLXNoYTI1NiAgYzMzYzZmMWIyYmUxNmY4OWEyMWFmOTQ2Y2ZkMDYyNDJh
MTJmOTgxODRjODk4Yjc1NWRkYjI0MzM4NjcxY2ViMSAgczYtbmV0d29ya2luZy0yLjcuMC4yLnRh
ci5negorc2hhMjU2ICBkYjQxMWM1NDM3MWExN2VkN2Q0NTQzZGQ4NmNmOTUzMGNlMjVmY2Y2MjRi
ZWY4M2FlMmI1Nzk1MjBlNWU3MGJmICBzNi1uZXR3b3JraW5nLTIuNy4wLjMudGFyLmd6CiBzaGEy
NTYgIGZkYzkzMTI5NTUyNWRkMDAwOWNkZjMzOTE4OWNiZWNkMjI4ZDY1Y2VmZTMzNDAyZjAzN2Y5
YjA0NmYwNzk4OWUgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvczYtbmV0d29ya2luZy9z
Ni1uZXR3b3JraW5nLm1rIGIvcGFja2FnZS9zNi1uZXR3b3JraW5nL3M2LW5ldHdvcmtpbmcubWsK
aW5kZXggMjM5ZDhhNjc5ZS4uMjEyZmFlNzM2MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9zNi1uZXR3
b3JraW5nL3M2LW5ldHdvcmtpbmcubWsKKysrIGIvcGFja2FnZS9zNi1uZXR3b3JraW5nL3M2LW5l
dHdvcmtpbmcubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoK
LVM2X05FVFdPUktJTkdfVkVSU0lPTiA9IDIuNy4wLjIKK1M2X05FVFdPUktJTkdfVkVSU0lPTiA9
IDIuNy4wLjMKIFM2X05FVFdPUktJTkdfU0lURSA9IGh0dHBzOi8vc2thcm5ldC5vcmcvc29mdHdh
cmUvczYtbmV0d29ya2luZwogUzZfTkVUV09SS0lOR19MSUNFTlNFID0gSVNDCiBTNl9ORVRXT1JL
SU5HX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCgotLQoyLjQzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
