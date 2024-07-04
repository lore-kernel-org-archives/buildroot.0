Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC766C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80BAE813D5;
	Thu,  4 Jul 2024 19:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5v5WYX0CRpQn; Thu,  4 Jul 2024 19:53:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22DE9847D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22DE9847D8;
	Thu,  4 Jul 2024 19:53:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 334291BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D49CA81297
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2zKgCpojPTx for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:53:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D8DB8129A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D8DB8129A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D8DB8129A
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:53:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MacOQ-1rrlaa0gBu-00ZWzO; Thu, 04
 Jul 2024 21:53:14 +0200
Date: Thu, 04 Jul 2024 21:53:12 +0200
MIME-Version: 1.0
Message-Id: <20240704-s6-multicall-v1-3-b6adb2bd0905@gmx.net>
References: <20240704-s6-multicall-v1-0-b6adb2bd0905@gmx.net>
In-Reply-To: <20240704-s6-multicall-v1-0-b6adb2bd0905@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122792; l=1442;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=m1Py5yeMrsW0DWQSESQasKHcTW2AEqX2LU0z+wnMl74=;
 b=jEDJnQqJXBnUbj3IO/K0MHrJWb/DyYKWkWyUWcBCpUUi1b16VC4ccpquvKeXh2JYkJ5C1qqpI
 qzZ/M+5mozNBiwmRRcezOr/JccEzfoMJ9nIKMPZXZHRMoHgeq7EJKl3
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:kjYdxH2sK9zzpZGNmIhAFL16ingQASCFBWYIBCwhFQznmOJTkwj
 D7vwoJEI3TChEj8dPmPRo3COBrnt0D3eFLkQCnohBtgWBjCQzQzMt6nxpiIO1fPvW+AfUdk
 QMyme4qnFVGtD98Be3sae99KFvgvCByfyG4QWvqGiNkiZfE9P6TIlZjode+P/zTKykouzgI
 ih+/W2sxukC3isQYK0Hhg==
UI-OutboundReport: notjunk:1;M01:P0:kui7JrmEZ1M=;dO5w7LlgnrLaURmMmdF+97EIlZq
 j2DjdDM6+UI9dUmifdJ93CBpB0UbSsoxZyWKHSYWrwsQ7E3Hk8Sy9po6TnsA4w3fkyiWMANFm
 ghbZkf9AKpfAo8ppikJl+sP8NEh18+R4NWxQaUS9zR9QwIowYsQCriE71E+ZBAijsfvI5v9h2
 x7PjXz241qZlgbnrc4b1X7STIrknR+S8oOzdIt1DVExSTUgtHmMS7iu/kpkNiR1vOn7AXXT7B
 Phg/lAftV0jSZf2uiqQtH54PKiXIilGXU2ZLahZs+F385xSPQQKb7C8kIjIvwvbm6bb7ujhbw
 u3SMQSkJXqOYCYolF2ps/abyuwh+hriB3GDwPpPfP7v1lNwbXkJeX2aYw2myw0pO6+iEFUkP3
 aK26fzc8onLYYwRBbtWW3FYrn7daBbRqHyy/jcpeld/LJshRU3OSwv+7OOqn1vfQrbnuyIhWm
 EwO8PzgUX4mRKLCfgxISfjvLJxMw+feMIOPeZipLT3m/Fs7dvHiP6X8u5bMGdBQCcQSB7UTOi
 sK2wihFUWfx84SXE1+QNOyDxS/V+8ZXAOsY81uvkk0rQSjRsgoRy45AWV+0cVvShyXQ1gzH23
 PaqgMBCyETGrbxaq0CoYEnBz+EAtHrpT+94PV1pAngM9Uctd1PXY2A9LfVxLFxdcS6u0BkvNk
 V5YJau7fc0oy5JbTVL1WJaCaLKwC8Mhgy5uGSrnVeKIFkuEs7ntVLnMQXHc8W+T1YHNWLCND+
 EkiWhMa+LZax6/NE1Vq2bgpQRv12JGKRmtyBuFVIKGq/4YVzG1kmXmc4AAaeSybuvzNn1gsfJ
 RC6XV2dUqsKlKibYY4PGwg7Hk6nKlSQvCURag3QnNQg9I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122794; x=1720727594; i=j.neuschaefer@gmx.net;
 bh=GCEwQ2uf4KTtIQBjRypxHOEkl1sRawQ4FyXNkLZKFzc=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kYLdb2i1Gtm8/gIkf1h2WFGViR3ZLMMR0fsMxyqkuBt9BpSHPvjnD1DhgWcvLq5C
 pKnzMcX8r/EmEntBQ0giD1IbfpOwsqy17Iy9YDAgcRO0txMWcHQLqYpYMVxM7qDRN
 wyxMY9SKuOrGCzeXFuTHN+c08whJCfZAjFN/tA+14njJ29RW4K9ClgUUnkk/MUe1E
 Gyq4xEeuWl3weHTA1BFcNfMt9GlkDqd1gM05VNx26DJQHI+pVK3pvTyqlvk0mKk3d
 pwjj0+yx+ZBidrtJo1hfnBAk4nSFgQl2Fl7tTZHE3O5pjMkvIzL0BGX+Vc506f58K
 EnXRlk71PybEVckmkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=kYLdb2i1
Subject: [Buildroot] [PATCH 3/3] s6-linux-utils: Add option to build
 multicall binary
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

U2luY2UgdmVyc2lvbiAyLjYuMS4wLCB3aXRoIGFub3RoZXIgYnVnZml4IGluIDIuNi4yLjAsIHM2
LWxpbnV4LXV0aWxzCmNhbiBiZSBidWlsdCBhcyBhIG11bHRpY2FsbCBiaW5hcnksIHNpbWlsYXIg
dG8gYnVzeWJveC4KClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVy
QGdteC5uZXQ+Ci0tLQogcGFja2FnZS9zNi1saW51eC11dGlscy9Db25maWcuaW4gICAgICAgICB8
IDkgKysrKysrKysrCiBwYWNrYWdlL3M2LWxpbnV4LXV0aWxzL3M2LWxpbnV4LXV0aWxzLm1rIHwg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3M2LWxpbnV4LXV0aWxzL0NvbmZpZy5pbiBiL3BhY2thZ2UvczYtbGludXgtdXRpbHMvQ29u
ZmlnLmluCmluZGV4IDQzZTZiYjkxNDQuLjIwYjI2N2EyY2MgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
czYtbGludXgtdXRpbHMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvczYtbGludXgtdXRpbHMvQ29u
ZmlnLmluCkBAIC03LDMgKzcsMTIgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1M2X0xJTlVYX1VUSUxT
CiAJICBzeXN0ZW0gdXRpbGl0aWVzLgoKIAkgIGh0dHA6Ly9za2FybmV0Lm9yZy9zb2Z0d2FyZS9z
Ni1saW51eC11dGlscy8KKworaWYgQlIyX1BBQ0tBR0VfUzZfTElOVVhfVVRJTFMKKworY29uZmln
IEJSMl9QQUNLQUdFX1M2X0xJTlVYX1VUSUxTX01VTFRJQ0FMTAorCWJvb2wgInM2LWxpbnV4LXV0
aWxzIG11bHRpY2FsbCBiaW5hcnkiCisJaGVscAorCSAgQnVpbGQgczYtbGludXgtdXRpbHMgYXMg
YSBtdWx0aWNhbGwgYmluYXJ5IHRvIHNhdmUgZGlzayBzcGFjZS4KKworZW5kaWYKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvczYtbGludXgtdXRpbHMvczYtbGludXgtdXRpbHMubWsgYi9wYWNrYWdlL3M2
LWxpbnV4LXV0aWxzL3M2LWxpbnV4LXV0aWxzLm1rCmluZGV4IGY4M2Y0N2FjM2UuLjA0ZTA4YzNk
NDMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvczYtbGludXgtdXRpbHMvczYtbGludXgtdXRpbHMubWsK
KysrIGIvcGFja2FnZS9zNi1saW51eC11dGlscy9zNi1saW51eC11dGlscy5tawpAQCAtMTcsNiAr
MTcsNyBAQCBTNl9MSU5VWF9VVElMU19DT05GX09QVFMgPSBcCiAJLS13aXRoLWR5bmxpYj0kKFNU
QUdJTkdfRElSKS9saWIgXAogCS0td2l0aC1saWI9JChTVEFHSU5HX0RJUikvbGliL3NrYWxpYnMg
XAogCSQoaWYgJChCUjJfU1RBVElDX0xJQlMpLCwtLWRpc2FibGUtYWxsc3RhdGljKSBcCisJJChp
ZiAkKEJSMl9QQUNLQUdFX1M2X0xJTlVYX1VUSUxTX01VTFRJQ0FMTCksLS1lbmFibGUtbXVsdGlj
YWxsLCkgXAogCSQoU0hBUkVEX1NUQVRJQ19MSUJTX09QVFMpCgogZGVmaW5lIFM2X0xJTlVYX1VU
SUxTX0NPTkZJR1VSRV9DTURTCgotLQoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
