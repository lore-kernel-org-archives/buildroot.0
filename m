Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850D9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 13:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DA7A419F6;
	Fri, 18 Mar 2022 13:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id endpOMvlrIpc; Fri, 18 Mar 2022 13:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D1640529;
	Fri, 18 Mar 2022 13:34:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 351D61BF27E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16C8A419F5
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FwxolCBVmxbn for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 13:34:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36745404A3
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 13:34:55 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22A8E4000B;
 Fri, 18 Mar 2022 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647610494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SBFC1Dah0Dmjx8/3H7xVZG3CZswzvlv2ssRkk2Ex3RU=;
 b=jX+eRwaBClQ42+L6WFWg/ObwKlxLFVd2XDR5HNezbsT6ky3rkyx0piZd2Jy0LB6e92lV+O
 F7LwS++rTh+HcbT5mp9mBctJ72glm54Sh1N9L0epwL6txL/asIaIlzpKyBSawTOwC2AqwU
 zI5krsbW0iEj5Bt1PrypEzwMGY/MzZrvHOasHEBTyBPJV0aeJkeNLqXd8zJA89vW4LOp+e
 PprM/JruDhHy1DXiSLQiwWBj5jnJZ5aC1TO+Mmov6hadWgq3URN/rFx0QHSEzh1tGWghmQ
 rc+inibwotbIMk5QqeGXVKQTMPM6SgdjGsX38APIazBWJ0ODDu4uunoS4t0SWg==
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 14:24:21 +0100
Message-Id: <20220318132427.48737-3-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132427.48737-1-clement.leger@bootlin.com>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/8] package/python-cryptography: enable host
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

RW5hYmxlIGhvc3QgcGFja2FnZSBhbmQgYWRkIG5lZWRlZCB2YXJpYWJsZXMuIEhvc3QgUE9TVF9Q
Uk9DRVNTIGFuZApET1dOTE9BRF9ERVBFTkRFTkNJRVMgdmFyaWFibGVzIGFyZSBpbmhlcml0ZWQg
ZnJvbSB0YXJnZXQgb25lcy4KCkFja2VkLWJ5OiBFdGllbm5lIENhcnJpZXJlIDxldGllbm5lLmNh
cnJpZXJlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVu
dC5sZWdlckBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0
aG9uLWNyeXB0b2dyYXBoeS5tayB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkv
cHl0aG9uLWNyeXB0b2dyYXBoeS5tayBiL3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRo
b24tY3J5cHRvZ3JhcGh5Lm1rCmluZGV4IGE1MjRmNzI5YzguLjg3MmVkZTliODkgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCisr
KyBiL3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCkBA
IC0xNywxNCArMTcsMjYgQEAgUFlUSE9OX0NSWVBUT0dSQVBIWV9ERVBFTkRFTkNJRVMgPSBcCiAJ
aG9zdC1weXRob24tY2ZmaSBcCiAJaG9zdC1ydXN0YyBcCiAJb3BlbnNzbAorSE9TVF9QWVRIT05f
Q1JZUFRPR1JBUEhZX0RFUEVOREVOQ0lFUyA9IFwKKwlob3N0LXB5dGhvbi1zZXR1cHRvb2xzLXJ1
c3QgXAorCWhvc3QtcHl0aG9uLWNmZmkgXAorCWhvc3QtcnVzdGMgXAorCWhvc3Qtb3BlbnNzbAog
UFlUSE9OX0NSWVBUT0dSQVBIWV9FTlYgPSBcCiAJJChQS0dfQ0FSR09fRU5WKSBcCiAJUFlPM19D
Uk9TU19MSUJfRElSPSIkKFNUQUdJTkdfRElSKS91c3IvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJT
SU9OX01BSk9SKSIKK0hPU1RfUFlUSE9OX0NSWVBUT0dSQVBIWV9FTlYgPSBcCisJJChIT1NUX1BL
R19DQVJHT19FTlYpIFwKKwlQWU8zX0NST1NTX0xJQl9ESVI9IiQoSE9TVF9ESVIpL3Vzci9saWIv
cHl0aG9uJChQWVRIT04zX1ZFUlNJT05fTUFKT1IpIgogIyBXZSBuZWVkIHRvIHZlbmRvciB0aGUg
Q2FyZ28gY3JhdGVzIGF0IGRvd25sb2FkIHRpbWUKIFBZVEhPTl9DUllQVE9HUkFQSFlfRE9XTkxP
QURfUE9TVF9QUk9DRVNTID0gY2FyZ28KIFBZVEhPTl9DUllQVE9HUkFQSFlfRE9XTkxPQURfREVQ
RU5ERU5DSUVTID0gaG9zdC1ydXN0YwogUFlUSE9OX0NSWVBUT0dSQVBIWV9ETF9FTlYgPSBcCiAJ
JChQS0dfQ0FSR09fRU5WKSBcCiAJQlJfQ0FSR09fTUFOSUZFU1RfUEFUSD1zcmMvcnVzdC9DYXJn
by50b21sCitIT1NUX1BZVEhPTl9DUllQVE9HUkFQSFlfRExfRU5WID0gXAorCSQoSE9TVF9QS0df
Q0FSR09fRU5WKSBcCisJQlJfQ0FSR09fTUFOSUZFU1RfUEFUSD1zcmMvcnVzdC9DYXJnby50b21s
CiAKICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKKyQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2th
Z2UpKQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
