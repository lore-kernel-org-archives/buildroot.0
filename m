Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24143C5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 13:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F29606EE;
	Sun, 25 Aug 2024 13:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ND-SP7Cm9dkV; Sun, 25 Aug 2024 13:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF08A60720
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF08A60720;
	Sun, 25 Aug 2024 13:56:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28C741BF2CC
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 173124004A
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEtMXiJzk1vj for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 13:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB63E4013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB63E4013C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB63E4013C
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 13:56:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.48.155]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlw7V-1sH6201WXj-00jmxq; Sun, 25
 Aug 2024 15:55:59 +0200
Date: Sun, 25 Aug 2024 15:55:51 +0200
MIME-Version: 1.0
Message-Id: <20240825-rgbmatrix-v1-3-0f2b0106f2ee@gmx.net>
References: <20240825-rgbmatrix-v1-0-0f2b0106f2ee@gmx.net>
In-Reply-To: <20240825-rgbmatrix-v1-0-0f2b0106f2ee@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724594157; l=579;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=QM9f7KMI3UUiCUtYR5XDHWzO+WxJhbHt6pKvFNWJVZs=;
 b=iPUpAtebuvitSw7vGEaqansrLtvYT7tsRsYzroetE10Nb/vxamIL4sNiASmosb0E8uHu368Bh
 /GVGBMBX8hwDDSHGjqEx5dN8WA13rXeNgSPj+Xo2+tyzUmPrKnCcZj9
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:Q2FksEddfrw49XkCET/EHJHDy4TederqGIWdnq8okKa7zBTpsT/
 iFsUXLlGqDnM0OfFAF4GMQZr9X/jseV4hXkB+Uz/7we7Z0Ro6/g6ZC/OSJt2Mr6fnOlXrBr
 CE30+wPB1rEyP1xeez/o5P19jkj8ruvyAxxXkq/IiYFrCObvut71GcRfvj+BFLw5cUHop/e
 3faqlZk/Bv8jtD0IrUuPw==
UI-OutboundReport: notjunk:1;M01:P0:6eBHNNMSVyI=;gsV5r03vv5nvcKgYrMYYOHHVH/C
 tZ7K5FgnNeCWQOLsX7DHWdAqubEg6YzIu6Wgl18a+XlprX3jvSL/iCMhE/KSyWH9u2KZiKn/Y
 uyTO1nE/D9YWRuwhxnyPnEGqtrBevldtwnu1r9hIvSLg59Pj6tFcZJ3SnhWlPvj+nw26xDse4
 svslA2UjLNn2uujvW3H1/1bsyNUdPJ5w5/469+qjOGn38AIMFgoATl500DPeGxw/MH0VqIkYq
 8A9pAHnmdkDcqpyk/toaxmBx2HWIozalgTo8xtWSOPNfDcaKLQQAM47lITXomhjcoJfjzhyL4
 oqPFM17Q3E/3W7R9Ywd705V/TQZ7ivmr04ZB0uyz6vYyG0bBX0Hu1SbEpM17CynUmXmHu2dSp
 U8mim/lgUf8sHQxc/mQvABjwb8tHaXMwEmRXiktW5iEsU3j+A0A/5Y8DsOyNqglyajTJjyyca
 oJ+sMee1wy069xD1TJW9b6sXJxz1x6xdfwGgZJsTcrW1Hf/ACTVRHYDcHvsKISX1Kmn0mplq+
 WDG6xN1EgOyuyYnvtDViZ/H9PuaRzkpsdOaGKbzuMRdV3BvruiEbAHbP17B2JxkBP0eX0nzzw
 Pr/2VlQI7mj8y5xwyiL781+e276YTAoJFjHw7LfFwWTZzW9hRNmLyhDf1AYA+VQo5pPlag0fL
 EUmEOe/qwd3xc9FTDYuFa1Yfi1V9O4yLyjnOthDg5osTeFAtDpY3nOwV+DWwlx1pYvpFImoNN
 ngXJPtiigItwIXywXJXffQ3nwFVNsL5do1sPLKjIegn2eGAw7Vag5I3hVIFQiqt1PVfu5IrWO
 6r7rbEsMCppRlBuqHU/qtqbQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724594159; x=1725198959; i=j.neuschaefer@gmx.net;
 bh=2yZgrgJfe7QciC9Mx38T40hmadAsjgHz6Ffcrcla5I0=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iih3KtZo/JqPXbCmptbqg/B1WjEEO4v1rypc9OD9Dq1e/kupx+/NxRI23qJpU8UO
 JMtivLDPapBywjPYFvm1ZF7W1BkGlKFbbfA8deJjGfogIcnbSKFuTyGyq73kRILs8
 YnsFxZ6kZNr4bw9ZlwoTr6nt8UMgpZJWjnURsf7ly6mi2DxrsWcAWQy1+7Yl/omAK
 gXOAlCfyQnd4bzKAII4OK6/fuYuDqnfMKnm9ANjkDs4u95T3tNusIBGdgI2Bn4bRY
 /c4nqv3beABIlB7x4Mza1CZusCR9eVAdcn3XJTbeuBlCPOUcVqR4Xae823KKPBcc0
 71TBIgykkBojPLw9jQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=iih3KtZo
Subject: [Buildroot] =?utf-8?q?=5BPATCH_3/3=5D_DEVELOPERS=3A_add_J=2E_Neu?=
 =?utf-8?q?sch=C3=A4fer_for_rpi-rgb-led-matrix/python-rgbmatrix?=
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIG15c2VsZiBhcyBtYWludGFpbmVyIHNvIEkgY2FuIGJlIG5vdGlmaWVkIG9mIHBhdGNoZXMv
cHJvYmxlbXMvZXRjLgoKU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVm
ZXJAZ214Lm5ldD4KLS0tCiBERVZFTE9QRVJTIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IGQy
YjY0ZWU1YzYuLjlmZmE5MTYzNjQgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxP
UEVSUwpAQCAtMTQ1NSw2ICsxNDU1LDggQEAgRjoJcGFja2FnZS9tYXdrLwogTjoJSi4gTmV1c2No
w6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KIEY6CXBhY2thZ2UvZXhlY2xpbmUvCiBGOglw
YWNrYWdlL21kZXZkLworRjoJcGFja2FnZS9weXRob24tcmdibWF0cml4CitGOglwYWNrYWdlL3Jw
aS1yZ2ItbGVkLW1hdHJpeAogRjoJcGFja2FnZS9zNi8KIEY6CXBhY2thZ2UvczYtbGludXgtaW5p
dC8KIEY6CXBhY2thZ2UvczYtbGludXgtdXRpbHMvCgotLQoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
