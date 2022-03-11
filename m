Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FE9C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 12:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E087607F6;
	Fri, 11 Mar 2022 12:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8e1RJ7R6qYG; Fri, 11 Mar 2022 12:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 892FD605BE;
	Fri, 11 Mar 2022 12:38:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFA1F1C116E
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9929408ED
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YuEE5oQ3YCuG for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 12:38:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58797401D6
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 12:38:04 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BEA13C000B;
 Fri, 11 Mar 2022 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647002282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBH8z0Fhf3YOrdMe6ijC8nHq/IGi2aymksX+T+Xm5UE=;
 b=IP4s8tUctZdRsoGkDZdFmvUOT2u2Qv3ZUFvdYvcRt6IiXWXkPLgc0DF7dHL5CnwfNCGXJs
 hz4dXRlKp2UpqqQO3gwI++DAEYjxbQ8T8Pp2BUqttJASc3qzDTuaSbCiqt3XBz/q54La9N
 XNmwrAjjigukHIZPlFqQt43jMuSo9C2Ka4NWPIBod0z/tz4X043rImKijepqytsarPtnXa
 weuaKYlqs6xBoC8CjOa6D/VHxBYOeCrXRky9DTo/K8A8YFzJZ2XYZXja/GhctNowoeHIWp
 aly4YKZIgglQ6x6l9e4XXlOX0ISaoDR8oelL+qBFmCs8IUDdiSEIP7lv1ihDzA==
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 13:36:30 +0100
Message-Id: <20220311123636.13415-2-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311123636.13415-1-clement.leger@bootlin.com>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/7] package/python-cryptography: enable host
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

RW5hYmxlIGhvc3QgcGFja2FnZSBhbmQgYWRkIG5lZWRlZCBkZXBlbmRlbmNpZXMuCgpBY2tlZC1i
eTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJyaWVyZUBsaW5hcm8ub3JnPgpTaWduZWQt
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
