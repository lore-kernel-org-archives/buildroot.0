Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C08C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 22:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1BF1406F2;
	Mon,  8 Jul 2024 22:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbZxst4-DqEf; Mon,  8 Jul 2024 22:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0254240724
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0254240724;
	Mon,  8 Jul 2024 22:45:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 288EC1BF3DE
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12F7040562
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mh6NX7_e6AB for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 22:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 70A86403C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70A86403C4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70A86403C4
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.165.29]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1ML9uU-1sj2ED1VFi-00KLGN; Tue, 09
 Jul 2024 00:45:39 +0200
Date: Tue, 09 Jul 2024 00:45:37 +0200
MIME-Version: 1.0
Message-Id: <20240709-tipidee-v2-6-a69a8668005e@gmx.net>
References: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
In-Reply-To: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720478736; l=1256;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=WqIUrgG2e5c1/pMNzLfK85NyrWx5uz1UdZLCCj5zpJU=;
 b=gukwk5fW4Vf8gJ1n7y1on05q9nlIRSjfTNrfWQzPZbxk6lfX6Cw6O/kS2qxkENI+LTfnTTQkd
 Cjd3Xwyv+fgAfl7AL2X3kAO6n/sHBQ+rnMDzWP0UVbfkOTaatWfghB/
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:RAIy+iwM+QHATAh3b8Z63dp31qs7flMUvKz4bg37ICamFGRrBsA
 ezoo44+xcbKQbwva8VnFNMzv1sIBXOQrFBaCesFECyT77qAY8RzuFsSNhwC3iSTRck8YE37
 uePRaa0KEzFM8eEnN0v4PTz7Yxjgsn446aF4g/Arkg4NsOH6u2XcWnR9oRWjhlY9CRv5foi
 RCfQZHQSLbPsTCC7+1nEA==
UI-OutboundReport: notjunk:1;M01:P0:nuwTMinLym8=;MCnpno05XQ7A++o6EB8BQ3u8ZPl
 npoNQoDXvUUkVJX4Xg2WZzywK/svj07tF42AX8s7TulxeHPpFBvAHqQ7GGGUNiECK/HhzLH06
 cYej23v2DCK+1/pEzt5nMmvGOI0mnQv9koH8Kl1IwxJTNn57MX413AlDGDxtxg5SYCG+2JIwu
 2J5pbxf6Bl7GrBgO5cVruKBo5cUhuDEnFRwp+eGeJMNV0pVJtd5hjpSM5SQCIi9tJDMiipJwg
 zHsydkTRjQ+u3lCzZ+BiQA/81x+2HGsvf/2a5AbyWWr9/eP/bDdsCxrePRSwaGzNsRB4E5kLD
 i8kYGpFXJG4pDKEY+dI2SVs3FHhoceXjqazv/wCyfmDsnVyVI0wbRCznhYeEJ+futwKAPiDS6
 +Q2WpmJ0X3tOzH2lI4jB5NtDU7RJs2H9G2S8Bap8+EM9v0lZoPFM5nM0Hkeo1c+DwjjqDbZa4
 iAyLDghIw/hqi6YBk8d/KbaUCPn5F0NzaiLbdAmCCRAKD8I1YWkqtsv2HR2eOdo/KxlpcX/Kg
 +J1u8NRKCHmUCT6cpOF+EHb+Dtf4QeUAN5B019DePYxO3k6LJwCQuRTLCt1AfyMRsvfIOiuxy
 XOP3M95X55ff7JIOO5svW4vXyBwDa1OrYW8yKhjeIM1XZDkYCfDCjXqgJ2HLwQztwMg8W7ikn
 aWnAH9HlZjLkJC/73njNx8S5xHcgHTmI+mSMKvVQX6ShN+tFixlrKVU8yqGu8MSDavZzYwlku
 lqCt522D2KiLMhSlIc1hn6FNtBhm/qxIVS82rhr/5kXQsfKoJn1Z9gODLBIjrsYDdrHWdXoHf
 4vk5dBDeJ3l9P0t3p5YJhn0cG2Cb/j9PB0amRGhZKa7Io=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720478739; x=1721083539; i=j.neuschaefer@gmx.net;
 bh=UKNec28ZWYOvcb1S8IYCGtsMtztjpCI70UgaqCrMmXY=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FwmKIx9/R52xfI11nBOL5jKNfsda7y41V1rcaiudyMGUkgBr84OPJ/3tlLSC3chA
 V3i6vpqV/4V11hGThzB9IupyxYb7ypw3pgiRWS2QIoS1+vJiQBqcG3dL6jRfgDrEt
 8lywq7uKneWFiNeq49rT1cCfjjoDXPsKVibz5s/ThxYVhAdEi9pQ8VJviRK4JiRWp
 rSanmHHEKNkWtImqW8aYy/z3NxTLUtNdDgmlmbLBiQgBfqpf+ofZNtbuLZxBZHLe4
 fmo0Vozm3VxoCL2wWWfyHxZNmpOp6LOHwVHdsdX3bI0oK5xClsMAAIrxWihPCa+G1
 pGogDlyfMiEOyvpfrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=FwmKIx9/
Subject: [Buildroot] [PATCH v2 6/8] mdevd: bump to version 0.1.6.4
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
Lm5ldD4KLS0tCiBwYWNrYWdlL21kZXZkL21kZXZkLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvbWRl
dmQvbWRldmQubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWRldmQvbWRldmQuaGFzaCBiL3Bh
Y2thZ2UvbWRldmQvbWRldmQuaGFzaAppbmRleCA5NDM2ZWQ4YjAxLi4wMTUxYjAzYmQ1IDEwMDY0
NAotLS0gYS9wYWNrYWdlL21kZXZkL21kZXZkLmhhc2gKKysrIGIvcGFja2FnZS9tZGV2ZC9tZGV2
ZC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGdlbmVyYXRlZAotc2hhMjU2ICBmNmVj
ZjBlZjdjZDQ4ZDA0ZWZjNzVhY2IyZGFkOTY3ZDg1MGJjODgxNWJkYjAwOThmMWM5ZWYwNDMzOTRk
NDMwICBtZGV2ZC0wLjEuNi4zLnRhci5negotc2hhMjU2ICBiMmVkZDU5YTIwMmE3MTA0NDA1MjJm
MDVkY2JmNDE4YjA0OTM1NDAxMjBlZmNiNDA3ODc2NzcyZWU0MmQyYzdjICBDT1BZSU5HCitzaGEy
NTYgIDczNThjZTUzMGI2YjliZWZiNzE1ZTQ4MTkwOTgxZTliNjlhMTJjY2E4NTg1MTllNmQyZTRi
NDZlYWI3ZTI0NzAgIG1kZXZkLTAuMS42LjQudGFyLmd6CitzaGEyNTYgIDcwMWUwZTdkOTNhNWRh
NjQyMWY2OWJlZDIxMzZkNGM2NGZkNGJjMTdmMzUyMjEyOTc4MzhhM2FkOWJhNjA1MGUgIENPUFlJ
TkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWRldmQvbWRldmQubWsgYi9wYWNrYWdlL21kZXZkL21k
ZXZkLm1rCmluZGV4IGM5MjY1OWQ5NjEuLmExZDllMTdjZWYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
bWRldmQvbWRldmQubWsKKysrIGIvcGFja2FnZS9tZGV2ZC9tZGV2ZC5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgotTURFVkRfVkVSU0lPTiA9IDAuMS42LjMK
K01ERVZEX1ZFUlNJT04gPSAwLjEuNi40CiBNREVWRF9TSVRFID0gaHR0cHM6Ly9za2FybmV0Lm9y
Zy9zb2Z0d2FyZS9tZGV2ZAogTURFVkRfTElDRU5TRSA9IElTQwogTURFVkRfTElDRU5TRV9GSUxF
UyA9IENPUFlJTkcKCi0tCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
