Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8542C7EE2E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 10:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8700860EFA;
	Tue, 13 Jun 2023 10:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8700860EFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27wFbop4v8Rl; Tue, 13 Jun 2023 10:50:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB31C6103A;
	Tue, 13 Jun 2023 10:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB31C6103A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CAE81BF95E
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 10:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 366F740223
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 10:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 366F740223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8MGKThweexq for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 10:50:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76DCD400FB
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76DCD400FB
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 10:50:24 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MTREY-1qYHg60RbA-00Tj1c; Tue, 13
 Jun 2023 12:50:18 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 12:50:12 +0200
Message-Id: <20230613105015.739870-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230613105015.739870-1-laurent@vivier.eu>
References: <20230613105015.739870-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Hosc+mGs+9jCSaDsA8fZdvV0yEeSr5hV0K5VHprSJPMmOuivED9
 EnKbqww/r9V/oCdPrzgbR4vlWL9D/q8CJYGKHofJYoCIz3MHQ7NxXVermXtHcyAkljZThrC
 xy0LWI8zfoMppZzW7HTzEO/W7xJ89/v6Z0KkaC1JPs6U5UPb2uCoam6+u4ZCifUzUES6Zg/
 ckcRZhDecfoOJelAAzK1A==
UI-OutboundReport: notjunk:1;M01:P0:8MTDNwZyJnY=;7aVU0y2JzXaEBCBudQ1GK/bBDz6
 PDELnmp+pnRHadK5D+mVb0ZdvB7zijYkH7C4f+gi+LWy6Ykw3jPMbzfUE/u+5xHUsbD1b9O3v
 Yam5cL9VdtDPi6o/eitbLkTXHRqKtdzl0CtzuBVWqf5D/hppjmw/RsTFEj33U/9/rh+CBp1aN
 pJQOZ8RSSi4f9/AfvEW1JKQG/LBCoxE6d1EQQOO1Mjdpy5CaylGrCrpdS93UMyRPwhjsDrydH
 OKFBMSClDQmaJ9FVEaAIp66DKCUJPpFqeMUrQUk+6mYyIsCFwJ2UnaKvr3dpLOlZkO111y7n5
 Wq8uI/xa450rRj4UpMMTZNQMIeo2y0V7b+6kPq/1UvzfS+LUcwgcV//Zro4y9JlIQgBYaiOEh
 N2ElqLegMd6jq7GOf0bjFZvuaseIiMx0Hg8BHEuuwa9ZTt0lzwAQ3hQhR0DZaY9lBOzofdsz2
 dxAQvobCMDHn96/VY/U3IjpBw8pOlEkjvN/XulGk+PBAKBBoIsh5yizr8ou1pbwpgdic9AxvG
 K//KXhniP5uA6f6Xhj/KWXG5o5vSoX8ehWtTlm/ZrlLnS8HWR5C/x91GnxGCvcm3AU6eCWK4w
 HJpl5hC+xktFS01a0yCk6E0HHhtI5SXwfL+REYVUZhDviO5N/oURTPMhV7oS5cSS5q/I6xPnK
 PSzjE9W9LOfWkub8zGF36dmRZBPElfRKi5y4YeNNXA==
Subject: [Buildroot] [PATCH v14 1/4] petitboot: add pb-discover daemon
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgpSZXZpZXdl
ZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBwYWNrYWdlL3BldGl0
Ym9vdC9TMTVwYi1kaXNjb3ZlciB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiBwYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsgICB8ICA0ICsrKwogMiBmaWxlcyBjaGFu
Z2VkLCA1OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJv
b3QvUzE1cGItZGlzY292ZXIKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3BldGl0Ym9vdC9TMTVwYi1k
aXNjb3ZlciBiL3BhY2thZ2UvcGV0aXRib290L1MxNXBiLWRpc2NvdmVyCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uODMzMDVlZDllYThhCi0tLSAvZGV2L251bGwKKysr
IGIvcGFja2FnZS9wZXRpdGJvb3QvUzE1cGItZGlzY292ZXIKQEAgLTAsMCArMSw1NCBAQAorIyEv
YmluL3NoCisKK0RBRU1PTj0icGItZGlzY292ZXIiCitQSURGSUxFPSIvdmFyL3J1bi8kREFFTU9O
LnBpZCIKK0xPR0ZJTEU9Ii92YXIvbG9nLyREQUVNT04ubG9nIgorCitQQl9ESVNDT1ZFUl9BUkdT
PSItbCAkTE9HRklMRSIKKworaWYgWyAiJChwYi1jb25maWcgZGVidWcpIiA9ICJlbmFibGVkIiBd
IDsgdGhlbgorCVBCX0RJU0NPVkVSX0FSR1M9IiRQQl9ESVNDT1ZFUl9BUkdTIC0tdmVyYm9zZSIK
K2ZpCisKK3N0YXJ0KCkgeworCXByaW50ZiAnU3RhcnRpbmcgJXM6ICcgIiREQUVNT04iCisJIyBz
aGVsbGNoZWNrIGRpc2FibGU9U0MyMDg2ICMgd2UgbmVlZCB0aGUgd29yZCBzcGxpdHRpbmcKKwlz
dGFydC1zdG9wLWRhZW1vbiAtUyAtcSAtYiAtcCAiJFBJREZJTEUiIC14ICIvdXNyL3NiaW4vJERB
RU1PTiIgXAorCQktLSAkUEJfRElTQ09WRVJfQVJHUworCXN0YXR1cz0kPworCWlmIFsgIiRzdGF0
dXMiIC1lcSAwIF07IHRoZW4KKwkJZWNobyAiT0siCisJZWxzZQorCQllY2hvICJGQUlMIgorCWZp
CisJcmV0dXJuICIkc3RhdHVzIgorfQorCitzdG9wKCkgeworCXByaW50ZiAnU3RvcHBpbmcgJXM6
ICcgIiREQUVNT04iCisJc3RhcnQtc3RvcC1kYWVtb24gLUsgLXEgLXAgIiRQSURGSUxFIgorCXN0
YXR1cz0kPworCWlmIFsgIiRzdGF0dXMiIC1lcSAwIF07IHRoZW4KKwkJZWNobyAiT0siCisJZWxz
ZQorCQllY2hvICJGQUlMIgorCWZpCisJcmV0dXJuICIkc3RhdHVzIgorfQorCityZXN0YXJ0KCkg
eworCXN0b3AKKwlzbGVlcCAxCisJc3RhcnQKK30KKworY2FzZSAiJDEiIGluCisJc3RhcnR8c3Rv
cHxyZXN0YXJ0KQorCQkiJDEiOzsKKwlyZWxvYWQpCisJCXJlc3RhcnQ7OworCSopCisJCWVjaG8g
IlVzYWdlOiAkMCB7c3RhcnR8c3RvcHxyZXN0YXJ0fHJlbG9hZH0iCisJCWV4aXQgMQorCQk7Owor
ZXNhYwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rIGIvcGFja2Fn
ZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCmluZGV4IGE3OThlN2NhNjE0Zi4uNGQ1NmI3MzkzOGU3
IDEwMDY0NAotLS0gYS9wYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsKKysrIGIvcGFja2Fn
ZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCkBAIC01Myw2ICs1MywxMCBAQCBkZWZpbmUgUEVUSVRC
T09UX1BPU1RfSU5TVEFMTAogCQkkKFRBUkdFVF9ESVIpL2V0Yy9wZXRpdGJvb3QvYm9vdC5kLzAx
LWNyZWF0ZS1kZWZhdWx0LWR0YgogCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKEBEKS91dGlscy9o
b29rcy85MC1zb3J0LWR0YiBcCiAJCSQoVEFSR0VUX0RJUikvZXRjL3BldGl0Ym9vdC9ib290LmQv
OTAtc29ydC1kdGIKKwkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChQRVRJVEJPT1RfUEtHRElSKS9T
MTVwYi1kaXNjb3ZlciBcCisJCSQoVEFSR0VUX0RJUikvZXRjL2luaXQuZC9TMTVwYi1kaXNjb3Zl
cgorCWxuIC1zZiAvdXNyL3NiaW4vcGItdWRoY3BjIFwKKwkJJChUQVJHRVRfRElSKS91c3Ivc2hh
cmUvdWRoY3BjL2RlZmF1bHQuc2NyaXB0LmQvCiBlbmRlZgogCiBQRVRJVEJPT1RfUE9TVF9JTlNU
QUxMX1RBUkdFVF9IT09LUyArPSBQRVRJVEJPT1RfUE9TVF9JTlNUQUxMCi0tIAoyLjQwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
