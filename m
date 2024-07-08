Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6767CC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 22:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01BD9404A9;
	Mon,  8 Jul 2024 22:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MBPJsdDoHl3; Mon,  8 Jul 2024 22:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C35EA406D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C35EA406D8;
	Mon,  8 Jul 2024 22:45:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A10D11BF3DE
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B12881248
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuTfDBIZDHhq for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 22:45:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5644C811DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5644C811DC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5644C811DC
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 22:45:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.165.29]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFbW0-1sbNFM0Jzi-0018Bn; Tue, 09
 Jul 2024 00:45:38 +0200
Date: Tue, 09 Jul 2024 00:45:34 +0200
MIME-Version: 1.0
Message-Id: <20240709-tipidee-v2-3-a69a8668005e@gmx.net>
References: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
In-Reply-To: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720478736; l=1186;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=aCdsjg67PFC2OJqeVt769uNU4LeTXf1KhT7eAf2AcOU=;
 b=/QjDgpS5iPYIpza8YsxP8NYGic4HVn+MAB9mGCJ+IRc1frwed28mf5CEF84OQA3/v9ldpsFb0
 WAXE7TAL+IbD9UtDw3sC1CcvfPOTwIFRq+pvOgVg5aErk0ER6OoPhxC
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:LI6J//r1sK+sFBwUhGhEnzSFb013/w2Jj4oV1kqnFEC2vBNm5G3
 Orr/ebucsMgnMuo2qTyWaHlyBVA7hBwN5MmwDz2IaVypLO2YAdcEU3euxAyUWWbN26Ttcog
 +vhbGnipu7Ek3ORtOT1cEs/y6p5a4BT8ZSYvRTt4Me97uz+Zxl6FcNanP85s+w/wjF8om86
 CVIPvizHIDYzNKF3bQqUA==
UI-OutboundReport: notjunk:1;M01:P0:N7BbNGTJZms=;N3CKXv/Xn7ynA8m0lOXjtkLPmZT
 qb/AhsJ3l3DICWY7ReZuSflwBUrvMVc8/Kxobt0cP7fWjOKkzyI7EYOCz4kRPwAr/WS29WEDc
 5v4Ac6YyPrLQLd6xI0LG/rTL8pezOsb3Dgjhq8xfVmMcmioJW2zF+7VXIOe+/PIBacP8YPenu
 2H8qNqPtcvWDfx1gCH/qMdkuAWYxVxL2/dGN4KGF1F7ebIsoNLH4tiqM46m0+tZ7nxc7hlgGA
 FsYBLtQ5eVmyv5vXQFy88kwMfKgvY9gJcrALAEukCG4jmCir3eGN4WusUcObTPJsJj1eMIUZD
 t/fHegiDrG2kOptFjp+/oetM/HqsQRLlPijO2LMdhI2Wd4HY7z7mRXHHNlSOOPDI4MnqZE9Hn
 ZqDsycHVkzPw2YaMIZcKVQ9h/8vbes4PiVTqi8ULMLou+e5GyhnqELyH8aB/8X6IOruTU/+8i
 SdoKdB/DbQzCJtfLxgpjKrk/cHNRn35bSZ/NIzywYY4E5MNskoBRJamt3ZbTObcBB0Uimjzyd
 1epwaQumeY38VI3Uewi1wZr4L8hNe82sZnIU6SOkl8AccY2MHdD9R8JWfk/6Kb7AB10rTGL2c
 /lWVlkH8btEDnHIeO5i8NrKgIQs+qFuKsCROwfp2soU9Xg6Xcr5FlYN5CV3yS0rzMf4MNySKN
 vqxv4F3KhpCLgOYG/gs8s30Db8cq29dkBBCFCBznfg4wJHxhTEWssMoZ4x/WZD8HPD/YCA/Zq
 1CY3F2fKiJhJKfdjFUd01QyROsoKp0Wtxycg6xfS89wHINfucL7IbhmuKVOl9xdLU859eVbt+
 3MfcuCuQrdF5KSeB/DtMBUBi8YMd+RKYCeLwYUeMsb1mQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720478738; x=1721083538; i=j.neuschaefer@gmx.net;
 bh=zNF5DGLTfGxR3NvaWbSMC+G4AtNYgGlW3PSxaFkJSNk=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SAJvf9nouQvTCRKCGkV3+nezoeEZSxB/tsrN6emhEB9SphStXdX8tyv65loyHT3y
 nHg+eQxbn7sLqhGz7qE6wYIcqD3IJZnyXDhJD8oSd4+u3JQr86Qb618qewmnJ6od9
 AdRec0+z3x+pevygD07BavhA34woPhTxX4u5pRlKC5ttWEcOarbNlwb2u6W7Upm0J
 4FycuAdgukRudgzzhvQSZcO4YFJo4Iqywm8NtM7jFWYUPzkSY/Zq0U0hMXLTGZCdS
 VcbfKRJxQQbfnX94fVgnRf2DYcahKR8xYfIFFfWpr2oZhGLlNmzcAdyabOYXYt/cI
 fxAAiqEEfa4jJcTYiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=SAJvf9no
Subject: [Buildroot] [PATCH v2 3/8] execline: bump to version 2.9.6.0
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
CiBwYWNrYWdlL2V4ZWNsaW5lL2V4ZWNsaW5lLmhhc2ggfCAyICstCiBwYWNrYWdlL2V4ZWNsaW5l
L2V4ZWNsaW5lLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2V4ZWNsaW5lL2V4ZWNsaW5lLmhh
c2ggYi9wYWNrYWdlL2V4ZWNsaW5lL2V4ZWNsaW5lLmhhc2gKaW5kZXggM2Y5ZmY4YTEzOC4uNzY0
MTI5NzhiOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5oYXNoCisrKyBi
L3BhY2thZ2UvZXhlY2xpbmUvZXhlY2xpbmUuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxs
eSBnZW5lcmF0ZWQKLXNoYTI1NiAgZGY3NTAwMzVkMGZiMjFjNzI2NWJmZmI3ZWQ3ZTFiNjYxZGUx
ZTg0Mjk0NGEyMjUyYmRjZGRjMzJkMGQ5NzIxNyAgZXhlY2xpbmUtMi45LjUuMS50YXIuZ3oKK3No
YTI1NiAgYmEyYTI3ZTk3YzVlYjZiZDdjYTZhMDk4N2E4OTI1ZTQ0NDY1YTViZTk5NmRhYTBkMThm
OGZlY2EzN2Q3NTcxYSAgZXhlY2xpbmUtMi45LjYuMC50YXIuZ3oKIHNoYTI1NiAgZmRjOTMxMjk1
NTI1ZGQwMDA5Y2RmMzM5MTg5Y2JlY2QyMjhkNjVjZWZlMzM0MDJmMDM3ZjliMDQ2ZjA3OTg5ZSAg
Q09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5tayBiL3BhY2th
Z2UvZXhlY2xpbmUvZXhlY2xpbmUubWsKaW5kZXggYjNkMmQ5ODIxNi4uZWUzOGQzZWQzYyAxMDA2
NDQKLS0tIGEvcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5taworKysgYi9wYWNrYWdlL2V4ZWNs
aW5lL2V4ZWNsaW5lLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKCi1FWEVDTElORV9WRVJTSU9OID0gMi45LjUuMQorRVhFQ0xJTkVfVkVSU0lPTiA9IDIuOS42
LjAKIEVYRUNMSU5FX1NJVEUgPSBodHRwczovL3NrYXJuZXQub3JnL3NvZnR3YXJlL2V4ZWNsaW5l
CiBFWEVDTElORV9MSUNFTlNFID0gSVNDCiBFWEVDTElORV9MSUNFTlNFX0ZJTEVTID0gQ09QWUlO
RwoKLS0KMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
