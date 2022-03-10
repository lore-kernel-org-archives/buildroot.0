Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039E3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 16:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A6C58137D;
	Thu, 10 Mar 2022 16:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJzVytdiI0E7; Thu, 10 Mar 2022 16:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9923D81384;
	Thu, 10 Mar 2022 16:59:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BED81BF293
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 475E540545
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VniNNbkKTR1V for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 16:59:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3312B400CC
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 16:59:04 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 735B16000A;
 Thu, 10 Mar 2022 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646931542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljua03uAIFSDW2+x4FebmR2qrtdvu3ELO+UFN9cuYUw=;
 b=Modl90VPtnQTOXUttVwXtDfIbIgmLTJ1GEzTdYY5ce53yogzbWXRo6xaSHUeifLWMMIb6P
 KNTlq4qT7OmeGqxyhNNw1Ii24zA3YhBl6h0I8CHNQoBeq/p+ekSSllBQ6kDQPctBnV4kyZ
 xoPQmIpb8HwV3iQMe0sA2UM00xC0MFlMLgEfuEDTQaqJL+KpTnX/W0a9tAnEZGhiX8CHi1
 wku9aPhilsXupdFhYCjlYfyKQqWW068fD67Xkzo4oHewxytzAIIintodfnvjIzjnOuq+iE
 s+bpKpNlqGHMXvCxTKqVsUckJ11rV4NpHvHSql0LG0MvWS7qd7mKiTA1HHcPYw==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 17:57:29 +0100
Message-Id: <20220310165735.1102802-2-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310165735.1102802-1-clement.leger@bootlin.com>
References: <20220310165735.1102802-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/7] package/python-cryptography: enable host
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RW5hYmxlIGhvc3QgcGFja2FnZSBhbmQgYWRkIG5lZWRlZCBkZXBlbmRlbmNpZXMuCgpTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Ci0tLQog
cGFja2FnZS9weXRob24tY3J5cHRvZ3JhcGh5L3B5dGhvbi1jcnlwdG9ncmFwaHkubWsgfCA3ICsr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0b2dyYXBoeS5tayBiL3BhY2thZ2Uv
cHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCmluZGV4IGE1MjRmNzI5
YzguLjRmZjYxYzdmODYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9w
eXRob24tY3J5cHRvZ3JhcGh5Lm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9w
eXRob24tY3J5cHRvZ3JhcGh5Lm1rCkBAIC0xNyw2ICsxNywxMSBAQCBQWVRIT05fQ1JZUFRPR1JB
UEhZX0RFUEVOREVOQ0lFUyA9IFwKIAlob3N0LXB5dGhvbi1jZmZpIFwKIAlob3N0LXJ1c3RjIFwK
IAlvcGVuc3NsCitIT1NUX1BZVEhPTl9DUllQVE9HUkFQSFlfREVQRU5ERU5DSUVTID0gXAorCWhv
c3QtcHl0aG9uLXNldHVwdG9vbHMtcnVzdCBcCisJaG9zdC1weXRob24tY2ZmaSBcCisJaG9zdC1y
dXN0YyBcCisJb3BlbnNzbAogUFlUSE9OX0NSWVBUT0dSQVBIWV9FTlYgPSBcCiAJJChQS0dfQ0FS
R09fRU5WKSBcCiAJUFlPM19DUk9TU19MSUJfRElSPSIkKFNUQUdJTkdfRElSKS91c3IvbGliL3B5
dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKSIKQEAgLTI3LDQgKzMyLDYgQEAgUFlUSE9OX0NS
WVBUT0dSQVBIWV9ETF9FTlYgPSBcCiAJJChQS0dfQ0FSR09fRU5WKSBcCiAJQlJfQ0FSR09fTUFO
SUZFU1RfUEFUSD1zcmMvcnVzdC9DYXJnby50b21sCiAKKwogJChldmFsICQocHl0aG9uLXBhY2th
Z2UpKQorJChldmFsICQoaG9zdC1weXRob24tcGFja2FnZSkpCi0tIAoyLjM0LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
