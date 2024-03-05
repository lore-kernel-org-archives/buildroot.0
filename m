Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3109C54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 17:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 679A8400A6;
	Tue,  5 Mar 2024 17:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jj-P6kUQ5Vpv; Tue,  5 Mar 2024 17:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 679864178E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 679864178E;
	Tue,  5 Mar 2024 17:19:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26FE01BF3A4
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 17:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1402E60EBC
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 17:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nToL-VLn59Fs for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 17:19:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04B1E60E91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04B1E60E91
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04B1E60E91
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 17:19:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-412ee78edbbso5690025e9.0
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 09:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709659184; x=1710263984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oQvlb2SKlPfY7rRkulYVgx7LZ1odXwW42n/60WLcMaw=;
 b=QBniE4HFHNIKAPY9lvFMhh//KAiLW7nuPPgwHcvc/YtNkjT7+e0lLC49k9iCpeCLVw
 y9BXbRSliHpV5aHf3TGqOphGCZ488r9dxpCycQwS2hskAJ0clHABMfLMqSeYUErNDroD
 x5Zks9nmQC2E9iT0ZzwWPKYNTLKq2lse2NEkFIrwcfQl2snaQYuw054fMnNqFHqbLDFM
 BOriuA9ml/lyu7fZN3Ag5EDNhXQrNwuWvhgc1Lveh8HN5yzhnLAKrbBIj21SJbDJ3VB1
 9N/KzVMi6lT/cDBO4IlZPAcv5ofKA4aY3m/F7vk0ITSCrt9qrDYSSQrgNVwDgNOjm0Er
 E6ZA==
X-Gm-Message-State: AOJu0YwADr0yMXXO0Ys/GNZDQ8n/oU9nDpjmWWjDajfmyM/Z++2/NR5P
 bAD2CwpWiM5FKsgK1+4W3lKgGdNH4BEoo6VJswqOtKLMao7xPDBKjDS2hxj6
X-Google-Smtp-Source: AGHT+IFo0T+C2ww4viwXWLdAR+OuE0TCint51Jd+rAWMIOUox6KadmmkdfWEs2FEvJkOSGiaqDRsyw==
X-Received: by 2002:a5d:43c7:0:b0:33e:4ff5:edb6 with SMTP id
 v7-20020a5d43c7000000b0033e4ff5edb6mr661178wrr.49.1709659184324; 
 Tue, 05 Mar 2024 09:19:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b0033e34982311sm7413735wrw.81.2024.03.05.09.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 09:19:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 18:19:38 +0100
Message-ID: <20240305171938.2252446-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709659184; x=1710263984; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oQvlb2SKlPfY7rRkulYVgx7LZ1odXwW42n/60WLcMaw=;
 b=FqKaoeRawIMSTYiiRv6wuCGFv9xH4wXCdLs9cQ7pY8KQ1jYnmRL71u2NB5cRVj5X/Y
 Cicp2a9LGe45yRbqYaU1OAamXslPHQGH7kJDNQO6X0Va1zUN1p+h7EihbTgCZWsUaDMm
 98X7EdQhw0wjOpld0y+vNlu6chj4eHU+WCPgggKN6IkoT3RQmXIIn0gSVg1dLLDcG8/o
 LyTqZLuAFv+P0ZPOJSwNmjo6JxVkmzKLfMFJX+lCbjkp2nkqTcT6QEVeRgG7O8DZxZEA
 LNXGhHmWy+lP1O+cDHQOOZpK/nUQW+sJUgJRKr4/Jq8BDQg6DHglVXuMibwPiKEvw3L4
 OyFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FqKaoeRa
Subject: [Buildroot] [PATCH 1/1] package/esp-hosted: disable -Werror
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGlzYWJsZSAtV2Vycm9yIHRvIGZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2Vk
IGF0IGxlYXN0IHNpbmNlCmNvbW1pdCBhMzgyYTdkNTU0MzI5MThkMmExZTQ3YWU0Y2JlN2VkNTBm
YTE3YTA4OgoKSW4gZnVuY3Rpb24g4oCYZGVzdHJveV9jbWRfd3HigJksCiAgICBpbmxpbmVkIGZy
b20g4oCYZXNwX2NvbW1hbmRzX3RlYXJkb3du4oCZIGF0IC9ob21lL2F1dG9idWlsZC9hdXRvYnVp
bGQvaW5zdGFuY2UtNC9vdXRwdXQtMS9idWlsZC9lc3AtaG9zdGVkLWNlM2M1MGEzM2ZhNGJjNTYy
YTFiNmNiY2VlMjkyYzFhZTBiMGE0MDQvZXNwX2hvc3RlZF9uZy9ob3N0L2VzcF9jbWQuYzoxNDY3
OjI6Ci4vaW5jbHVkZS9saW51eC93b3JrcXVldWUuaDo2Mzk6OTogZXJyb3I6IGNhbGwgdG8g4oCY
X193YXJuX2ZsdXNoaW5nX3N5c3RlbXdpZGVfd3HigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUg
d2FybmluZzogUGxlYXNlIGF2b2lkIGZsdXNoaW5nIHN5c3RlbS13aWRlIHdvcmtxdWV1ZXMuIFst
V2Vycm9yPWF0dHJpYnV0ZS13YXJuaW5nXQogIDYzOSB8ICAgICAgICAgX193YXJuX2ZsdXNoaW5n
X3N5c3RlbXdpZGVfd3EoKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAg
fCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KL2hvbWUvYXV0b2J1aWxk
L2F1dG9idWlsZC9pbnN0YW5jZS00L291dHB1dC0xL2J1aWxkL2VzcC1ob3N0ZWQtY2UzYzUwYTMz
ZmE0YmM1NjJhMWI2Y2JjZWUyOTJjMWFlMGIwYTQwNC9lc3BfaG9zdGVkX25nL2hvc3QvZXNwX2Nt
ZC5jOjQwODoxNzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGZsdXNoX3NjaGVkdWxl
ZF93b3Jr4oCZCiAgNDA4IHwgICAgICAgICAgICAgICAgIGZsdXNoX3NjaGVkdWxlZF93b3JrKCk7
CiAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+CgpGaXhlczoKIC0g
aHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNmFjN2E0NjAxOTM4ZDMyOTZl
ZDE2NTdjMDZmOGNkZjQzMzc1N2Q3MwogLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcv
cmVzdWx0cy83OTk3Y2M4YTY3NjQ1YTZlMWNmNGUyNGQxNzJjNmZlYWU0NTlkY2ZiCgpTaWduZWQt
b2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0t
CiBwYWNrYWdlL2VzcC1ob3N0ZWQvZXNwLWhvc3RlZC5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9lc3AtaG9zdGVkL2VzcC1ob3N0
ZWQubWsgYi9wYWNrYWdlL2VzcC1ob3N0ZWQvZXNwLWhvc3RlZC5tawppbmRleCBjYzYxZTM5YjM2
Li4wMmRlM2RiYzUyIDEwMDY0NAotLS0gYS9wYWNrYWdlL2VzcC1ob3N0ZWQvZXNwLWhvc3RlZC5t
aworKysgYi9wYWNrYWdlL2VzcC1ob3N0ZWQvZXNwLWhvc3RlZC5tawpAQCAtMTIsNiArMTIsNyBA
QCBFU1BfSE9TVEVEX0xJQ0VOU0VfRklMRSA9IExJQ0VOU0UKIEVTUF9IT1NURURfTU9EVUxFX1NV
QkRJUlMgPSBlc3BfaG9zdGVkX25nL2hvc3QKIAogZGVmaW5lIEVTUF9IT1NURURfTElOVVhfQ09O
RklHX0ZJWFVQUworCSQoY2FsbCBLQ09ORklHX0RJU0FCTEVfT1BULENPTkZJR19XRVJST1IpCiAJ
JChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfTkVUKQogCSQoY2FsbCBLQ09ORklHX0VO
QUJMRV9PUFQsQ09ORklHX1dJUkVMRVNTKQogCSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09O
RklHX0NGRzgwMjExKQotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
