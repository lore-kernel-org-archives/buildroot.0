Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5954C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9800F84493;
	Fri,  9 Aug 2024 19:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNOeLNNdJgOw; Fri,  9 Aug 2024 19:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61861844B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61861844B6;
	Fri,  9 Aug 2024 19:18:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4267B1BF2F5
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C40841168
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNL8VR7LzRGa for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:18:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13A3741165
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13A3741165
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13A3741165
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:18:50 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-530e2548dfdso2512914e87.1
 for <buildroot@buildroot.org>; Fri, 09 Aug 2024 12:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723231128; x=1723835928;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JAE5YIkHpUIuONhXr+W0zwBuSkZIRPo96t1dZpT9Fyo=;
 b=ifcQn7uofQC51Rab8IEcyDOskxAVUAnFYcqOz1lTdUdosTWWXWCg2w2j88XaAcqpPh
 grqJvcNl068LrmOLzW5S3NAHM5dkmc7y3EEkRxO2vrOYDJsL0+Sfh3n6guoTt1pSwzFC
 uiylNcjgUwZYLcCVFuxsCuzTXDgWT4ba14AA9fnSJBO7MkxhX1a2dsY+r6l8JyB5mgDV
 sUIIN4EdnP4cnGntLr96eKs4qgvYn7l0KkI6q22JWhxgghMB8tXDRtuLosT9VhwQk0R1
 7OeJLy/t6Wv9pLYvGM9dVAbOSseLPeajrxjDYzylmK2EeWIOTphOELJkaLFT7scf8Nij
 XLLA==
X-Gm-Message-State: AOJu0Yw02zyCx7ArrlpAHQBXOY2Sl6K5vyYsVcU9sc3qWp4kS5TZb01H
 C93b78lfzHCiTsTVWi6KSaos48SgPJHxoHgHtlBXKKo0vsH+DHi/THnVZsik
X-Google-Smtp-Source: AGHT+IFztjm+3lXywDqnGKp+L0Yzj58MQbyTW3zqIhShhtYbHN9ARrDUlBnS44EVKkimnWk9muqJIQ==
X-Received: by 2002:a05:6512:114c:b0:52c:a016:5405 with SMTP id
 2adb3069b0e04-530ee96bf59mr1840053e87.8.1723231128026; 
 Fri, 09 Aug 2024 12:18:48 -0700 (PDT)
Received: from tollan.lan (d149.broadband8.quicknet.se. [192.176.51.149])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f1b855sm8961e87.233.2024.08.09.12.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 12:18:47 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Aug 2024 21:18:31 +0200
Message-ID: <20240809191831.1389128-3-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809191831.1389128-1-lazzer@gmail.com>
References: <20240809191831.1389128-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723231128; x=1723835928; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JAE5YIkHpUIuONhXr+W0zwBuSkZIRPo96t1dZpT9Fyo=;
 b=d22jeSVholWDHA+BlKnd6HfUfUCk4zmxLoUCQio+BzewvuBrLk9HJ9IsHVUG7sRgOe
 j/5abra32IdWlidKfVVqNyd6anZeJozscyUqHRJjJIMItNbcuRCUmy/TamDHpNklhiu/
 i2OtwBNiVL1jLH6L7KXJZcEc9mp3ChakIAaWbVmuvsQrN3K2UwaO0n0p06Fuza6dFIcf
 +9EDL8n1M/FCGey7fQ4/LAWaB009oDlpNELN7HrrburpWk/h8QHbpPzUiGinl6K5W6tl
 69cVnJUI4MHSPz9/jVy3/6pJiucVw0jWUaAExS8/9wDIzbXGgY49CX64DQggie1y1Bpg
 Hw7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d22jeSVh
Subject: [Buildroot] [PATCH v2 2/2] package/uboot-tools: add new tool
 fdt_add_pubkey
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
Cc: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ZmR0X2FkZF9wdWJrZXkgaXMgdXNlZnVsIHRvIGluc3RhbGwgdHJ1c3RlZCBzaWduYXR1cmVzIGlu
c2lkZQphbiBleGlzdGluZyB1Ym9vdCBkZXZpY2UgdHJlZS4KClNpZ25lZC1vZmYtYnk6IE1hdHRp
YXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPgotLS0KIHBhY2thZ2UvdWJvb3QtdG9vbHMv
Q29uZmlnLmluICAgICAgfCAgNyArKysrKysrCiBwYWNrYWdlL3Vib290LXRvb2xzL3Vib290LXRv
b2xzLm1rIHwgMTEgKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdWJvb3QtdG9vbHMvQ29uZmlnLmluIGIvcGFja2FnZS91
Ym9vdC10b29scy9Db25maWcuaW4KaW5kZXggYjUyNDE5NTkxYi4uNzc0MDkxNmYyOSAxMDA2NDQK
LS0tIGEvcGFja2FnZS91Ym9vdC10b29scy9Db25maWcuaW4KKysrIGIvcGFja2FnZS91Ym9vdC10
b29scy9Db25maWcuaW4KQEAgLTEwNCw0ICsxMDQsMTEgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1VC
T09UX1RPT0xTX0RVTVBJTUFHRQogCSAgVGhlIGR1bXBpbWFnZSB0b29sIGZyb20gRGFzIFUtQm9v
dCBib290bG9hZGVyLCB3aGljaCBhbGxvd3MKIAkgIGV4dHJhY3Rpb24gb2YgZGF0YSBmcm9tIFUt
Qm9vdCBpbWFnZXMuCiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9VQk9PVF9UT09MU19GRFRfQUREX1BV
QktFWQorCWJvb2wgImZkdF9hZGRfa2V5IgorCWhlbHAKKwkgIEluc3RhbGwgdGhlIGZkdF9hZGRf
a2V5IHRvb2wgb24gdGhlIHRhcmdldCBzeXN0ZW0KKworCSAgVGhlIGZkdF9hZGRfcHVia2V5IGlz
IHVzZWQgdG8gYWRkIGEgcHVibGljIGtleSB0byB0aGUgZmR0LgorCiBlbmRpZgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS91Ym9vdC10b29scy91Ym9vdC10b29scy5tayBiL3BhY2thZ2UvdWJvb3QtdG9v
bHMvdWJvb3QtdG9vbHMubWsKaW5kZXggOGVhYWViMTUyYi4uZmRkZDI1ZjljNiAxMDA2NDQKLS0t
IGEvcGFja2FnZS91Ym9vdC10b29scy91Ym9vdC10b29scy5taworKysgYi9wYWNrYWdlL3Vib290
LXRvb2xzL3Vib290LXRvb2xzLm1rCkBAIC04Miw2ICs4MiwxMiBAQCBkZWZpbmUgVUJPT1RfVE9P
TFNfSU5TVEFMTF9NS0VOVklNQUdFCiBlbmRlZgogZW5kaWYKIAoraWZlcSAoJChCUjJfUEFDS0FH
RV9VQk9PVF9UT09MU19GRFRfQUREX1BVQktFWSkseSkKK2RlZmluZSBVQk9PVF9UT09MU19JTlNU
QUxMX0ZEVF9BRERfUFVCS0VZCisJJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL3Rvb2xzL2Zk
dF9hZGRfcHVia2V5ICQoVEFSR0VUX0RJUikvdXNyL2Jpbi9mZHRfYWRkX3B1YmtleQorZW5kZWYK
K2VuZGlmCisKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfVUJPT1RfVE9PTFNfRldQUklOVEVOVikseSkK
IGRlZmluZSBVQk9PVF9UT09MU19JTlNUQUxMX0ZXUFJJTlRFTlYKIAkkKElOU1RBTEwpIC1tIDA3
NTUgLUQgJChARCkvdG9vbHMvZW52L2Z3X3ByaW50ZW52ICQoVEFSR0VUX0RJUikvdXNyL3NiaW4v
ZndfcHJpbnRlbnYKQEAgLTEwNyw2ICsxMTMsNyBAQCBkZWZpbmUgVUJPT1RfVE9PTFNfSU5TVEFM
TF9UQVJHRVRfQ01EUwogCSQoVUJPT1RfVE9PTFNfSU5TVEFMTF9GV1BSSU5URU5WKQogCSQoVUJP
T1RfVE9PTFNfSU5TVEFMTF9EVU1QSU1BR0UpCiAJJChVQk9PVF9UT09MU19JTlNUQUxMX0ZJVF9D
SEVDS19TSUdOKQorCSQoVUJPT1RfVE9PTFNfSU5TVEFMTF9GRFRfQUREX1BVQktFWSkKIGVuZGVm
CiAKICMgaG9zdC11Ym9vdC10b29scwpAQCAtMTM3LDYgKzE0NCw5IEBAIGVuZGlmCiBpZmVxICgk
KEJSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFNfRklUX1NVUFBPUlQpLHkpCiBIT1NUX1VCT09U
X1RPT0xTX01BS0VfT1BUUyArPSBDT05GSUdfVE9PTFNfTElCQ1JZUFRPPXkgQ09ORklHX1RPT0xT
X0ZJVD15IENPTkZJR19NS0lNQUdFX0RUQ19QQVRIPWR0YwogSE9TVF9VQk9PVF9UT09MU19ERVBF
TkRFTkNJRVMgKz0gaG9zdC1kdGMKK2RlZmluZSBIT1NUX1VCT09UX1RPT0xTX0lOU1RBTExfRkRU
X0FERF9QVUJLRVkKKwkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvdG9vbHMvZmR0X2FkZF9w
dWJrZXkgJChIT1NUX0RJUikvYmluL2ZkdF9hZGRfcHVia2V5CitlbmRlZgogZW5kaWYKIAogaWZl
cSAoJChCUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTX0ZJVF9TSUdOQVRVUkVfU1VQUE9SVCks
eSkKQEAgLTIzNyw2ICsyNDcsNyBAQCBkZWZpbmUgSE9TVF9VQk9PVF9UT09MU19JTlNUQUxMX0NN
RFMKIAkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvdG9vbHMvZHVtcGltYWdlICQoSE9TVF9E
SVIpL2Jpbi9kdW1waW1hZ2UKIAkkKEhPU1RfVUJPT1RfVE9PTFNfSU5TVEFMTF9GSVRfQ0hFQ0tf
U0lHTikKIAkkKEhPU1RfVUJPT1RfVE9PTFNfSU5TVEFMTF9NS0VGSUNBUFNVTEUpCisJJChIT1NU
X1VCT09UX1RPT0xTX0lOU1RBTExfRkRUX0FERF9QVUJLRVkpCiAJJChJTlNUQUxMKSAtbSAwNzU1
IC1EICQoQEQpL3Rvb2xzL2Vudi9md19wcmludGVudiAkKEhPU1RfRElSKS9iaW4vZndfcHJpbnRl
bnYKIAlsbiAtc2YgJChIT1NUX0RJUikvYmluL2Z3X3ByaW50ZW52ICQoSE9TVF9ESVIpL2Jpbi9m
d19zZXRlbnYKIAkkKEhPU1RfVUJPT1RfVE9PTFNfSU5TVEFMTF9FTlZJTUFHRSkKLS0gCjIuNDMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
