Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C731C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 15:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D79600CA;
	Mon, 14 Mar 2022 15:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8c5aMgMzsGj; Mon, 14 Mar 2022 15:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 119EE60073;
	Mon, 14 Mar 2022 15:33:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 490121BF395
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 334A6404AA
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1C-oXN_lKyBn for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 15:33:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1D6A4019C
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 15:33:00 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8205760007;
 Mon, 14 Mar 2022 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647271979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LqXQToyTjGdhLs2X1hqA5zZLC3pe+Y1Q6PP7UXO9Z+Q=;
 b=d4dUDa/TOImvEkhj9YFW8uTmml1LdyCsPl1Hey41y79qw0e7aj1iB20IT5Q7CkEcQBOS5a
 3Nvq5hy+y2MRB9nKuj0KvQ/BhU5913Bi47agHnTaagEwaVTeA51QATtB4C6aDgowI6ux0o
 HAdH4fS/2KGfNsoCrwrPAySw6QobeG9I2AZ6bXkAvwYTMDjj/ufqK6l59K2qWr7Ei+Gw4J
 oa0VrlzkAXxeltGoaypXsuUpzINbPzUXu3iUf0aBxCTDCwayyffIkpWPnrsLN452aLThNE
 7YNicMjqHxxMACiB7nv3xPHAaak4/kUd25csPkQ5Nq4b9BLVPkHkJexFLs49+g==
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 16:31:05 +0100
Message-Id: <20220314153111.1390512-3-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314153111.1390512-1-clement.leger@bootlin.com>
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/8] package/python-cryptography: enable host
 package
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
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RW5hYmxlIGhvc3QgcGFja2FnZSBhbmQgYWRkIG5lZWRlZCBkZXBlbmRlbmNpZXMuCgpBY2tlZC1i
eTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJyaWVyZUBsaW5hcm8ub3JnPgpTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Ci0tLQog
cGFja2FnZS9weXRob24tY3J5cHRvZ3JhcGh5L3B5dGhvbi1jcnlwdG9ncmFwaHkubWsgfCAxNCAr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0b2dyYXBoeS5tayBi
L3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCmluZGV4
IGE1MjRmNzI5YzguLjhhNGZmZTZkNzUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLWNyeXB0
b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLWNyeXB0
b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCkBAIC0xNywxNCArMTcsMjggQEAgUFlUSE9O
X0NSWVBUT0dSQVBIWV9ERVBFTkRFTkNJRVMgPSBcCiAJaG9zdC1weXRob24tY2ZmaSBcCiAJaG9z
dC1ydXN0YyBcCiAJb3BlbnNzbAorSE9TVF9QWVRIT05fQ1JZUFRPR1JBUEhZX0RFUEVOREVOQ0lF
UyA9IFwKKwlob3N0LXB5dGhvbi1zZXR1cHRvb2xzLXJ1c3QgXAorCWhvc3QtcHl0aG9uLWNmZmkg
XAorCWhvc3QtcnVzdGMgXAorCWhvc3Qtb3BlbnNzbAogUFlUSE9OX0NSWVBUT0dSQVBIWV9FTlYg
PSBcCiAJJChQS0dfQ0FSR09fRU5WKSBcCiAJUFlPM19DUk9TU19MSUJfRElSPSIkKFNUQUdJTkdf
RElSKS91c3IvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKSIKK0hPU1RfUFlUSE9O
X0NSWVBUT0dSQVBIWV9FTlYgPSBcCisJJChIT1NUX1BLR19DQVJHT19FTlYpIFwKKwlQWU8zX0NS
T1NTX0xJQl9ESVI9IiQoSE9TVF9ESVIpL3Vzci9saWIvcHl0aG9uJChQWVRIT04zX1ZFUlNJT05f
TUFKT1IpIgogIyBXZSBuZWVkIHRvIHZlbmRvciB0aGUgQ2FyZ28gY3JhdGVzIGF0IGRvd25sb2Fk
IHRpbWUKIFBZVEhPTl9DUllQVE9HUkFQSFlfRE9XTkxPQURfUE9TVF9QUk9DRVNTID0gY2FyZ28K
K0hPU1RfUFlUSE9OX0NSWVBUT0dSQVBIWV9ET1dOTE9BRF9QT1NUX1BST0NFU1MgPSBjYXJnbwog
UFlUSE9OX0NSWVBUT0dSQVBIWV9ET1dOTE9BRF9ERVBFTkRFTkNJRVMgPSBob3N0LXJ1c3RjCitI
T1NUX1BZVEhPTl9DUllQVE9HUkFQSFlfRE9XTkxPQURfREVQRU5ERU5DSUVTID0gaG9zdC1ydXN0
YwogUFlUSE9OX0NSWVBUT0dSQVBIWV9ETF9FTlYgPSBcCiAJJChQS0dfQ0FSR09fRU5WKSBcCiAJ
QlJfQ0FSR09fTUFOSUZFU1RfUEFUSD1zcmMvcnVzdC9DYXJnby50b21sCitIT1NUX1BZVEhPTl9D
UllQVE9HUkFQSFlfRExfRU5WID0gXAorCSQoSE9TVF9QS0dfQ0FSR09fRU5WKSBcCisJQlJfQ0FS
R09fTUFOSUZFU1RfUEFUSD1zcmMvcnVzdC9DYXJnby50b21sCiAKICQoZXZhbCAkKHB5dGhvbi1w
YWNrYWdlKSkKKyQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQotLSAKMi4zNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
