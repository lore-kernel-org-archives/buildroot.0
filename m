Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA189C369CF
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 08:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 750BC84078;
	Fri, 18 Apr 2025 08:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDNNH1Wpesc6; Fri, 18 Apr 2025 08:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83A9984003
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83A9984003;
	Fri, 18 Apr 2025 08:05:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ECB369
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32AA881F89
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AmDyPsDbo3K for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 08:05:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F8D181A6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F8D181A6D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F8D181A6D
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:05:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([213.196.211.137]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5UD-1uJkxa0XqR-004JxN; Fri, 18
 Apr 2025 10:05:45 +0200
Date: Fri, 18 Apr 2025 10:03:46 +0200
MIME-Version: 1.0
Message-Id: <20250418-ffmpt-v1-2-5540e2621486@gmx.net>
References: <20250418-ffmpt-v1-0-5540e2621486@gmx.net>
In-Reply-To: <20250418-ffmpt-v1-0-5540e2621486@gmx.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>, 
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744963541; l=810;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=2gz9a+vGNW/ZPDTaNB+YTFEGY9QNREdhmIY+p0siFlE=;
 b=FM0enZgUO+lwvUiIo07HH7dr0a1n2cYk0Qgr8eq4vW5W6Q7PH4zv231+gmv1oWM8xTMtSi4+g
 0Ai/yxocfc3AxbuivcmlDzv98fjjFcuaPVdeWS07R7GAA9/xit6d6Ny
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:GaaOMuYHescXjdc6BbfanOuYTrLMBZl9XXVSVzmH/qwoJ1NOiUr
 CA2xVVHe/pXpAev9teCavLJc99GJACZUeJhZ/0lkU2wP+itPeWEoAgd2LE9fxCerhjp4CO4
 UNxA+CApa3kpLH7cpL6WC22P75DnLt3IirYWAz2iOrOGXFw8TmfyUgJHy+KumYoxiwoo418
 PkWCZ5d/soLqIWq9xdaww==
UI-OutboundReport: notjunk:1;M01:P0:uynifcvSgpc=;YKLwx0lV4Io2FN4bqZFVX+7tXzF
 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
 J2XBrs36eMwcQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1744963545; x=1745568345; i=j.neuschaefer@gmx.net;
 bh=IEEjrxfdHEqKkdLdJhEiqzvoifnuyzIk4nkjS4VdnMo=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hEpCfHt7yImLBvoZzcfBy+9FV9brzh/fVTWaG5Exdjp2vevROTZuwl2bDWM3rZzM
 KHdH6dy58VVmPaF+jO5PTl5+mOH74T0e+BGeTJouPnvKOUhLxs3mn6W3weBClQCnS
 riFaBmzpqu7Z664qR2cO35uc3nppBfqAKv86Ls+9Oh2/UF8iRirLetx4VidhCM6qM
 8qwAMCFqzvkXaVw7KLzwE814C9U/+E1wcJCVV8VXaUjjyoYmWMACGoLUGAEkh/O3W
 ka/1GXcFOtxunU91h3NcisYurmJ7iSrRRhCXOjJWXZcJwWN8aS8lQkbQYo+7KL4WS
 v1BHjlpViNeGYUGzlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=hEpCfHt7
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: add support for libopenmpt
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29uZmlndXJlIGZmbXBlZyB0byB1c2UgbGlib3Blbm1wdCBpZiBhdmFpbGFibGUuCgpTaWduZWQt
b2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgotLS0KIHBhY2th
Z2UvZmZtcGVnL2ZmbXBlZy5tayB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmZtcGVnL2ZmbXBlZy5tayBiL3BhY2thZ2Uv
ZmZtcGVnL2ZmbXBlZy5tawppbmRleCA5Mzg3MGIwNDcwOTU4NTZjYmRlYmFiMzQxZDJmMzgxMGVk
ODUxMTI5Li43OTkyMDFjODIwOWNiOTY0NzAxOGVlNTc1Mjc4NTAzYzAwNDgxMDhiIDEwMDY0NAot
LS0gYS9wYWNrYWdlL2ZmbXBlZy9mZm1wZWcubWsKKysrIGIvcGFja2FnZS9mZm1wZWcvZmZtcGVn
Lm1rCkBAIC0zNjIsNiArMzYyLDEzIEBAIGVsc2UKIEZGTVBFR19DT05GX09QVFMgKz0gLS1kaXNh
YmxlLWxpYm1vZHBsdWcKIGVuZGlmCiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElCT1BFTk1QVCks
eSkKK0ZGTVBFR19DT05GX09QVFMgKz0gLS1lbmFibGUtbGlib3Blbm1wdAorRkZNUEVHX0RFUEVO
REVOQ0lFUyArPSBsaWJvcGVubXB0CitlbHNlCitGRk1QRUdfQ09ORl9PUFRTICs9IC0tZGlzYWJs
ZS1saWJvcGVubXB0CitlbmRpZgorCiBpZmVxICgkKEJSMl9QQUNLQUdFX1NQRUVYKSx5KQogRkZN
UEVHX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1saWJzcGVleAogRkZNUEVHX0RFUEVOREVOQ0lFUyAr
PSBzcGVleAoKLS0gCjIuNDguMC5yYzEuMjE5LmdiNmI2NzU3ZDc3MgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
