Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4257C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 12:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF5260D4D;
	Sat, 29 Apr 2023 12:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FF5260D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJ3kcFXxOS5x; Sat, 29 Apr 2023 12:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F1B760BFE;
	Sat, 29 Apr 2023 12:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F1B760BFE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D86171BF3AD
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 12:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B278840AB2
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 12:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B278840AB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sCk3HCNueSVh for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 12:47:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1023C4014D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1023C4014D
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 12:47:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.193]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsYux-1q8d6p1kjr-00u2Ik; Sat, 29
 Apr 2023 14:47:36 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 14:47:31 +0200
Message-Id: <20230429124731.4014394-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Qk7dIi2yAARpMMfyv2VlM2nfbmFYeEu9jfZ6StPmAS/31rosAY2
 GGLIBNsc2krScAdBiovJesE+DUuEnn6H3FRFk+yfqWZNShsK+a+pJG3JLSGrJ9o26u3ucWI
 T1sf1RycAovCniH8OcRjpaz/rSvMKEgvNlXA6P/eb28B/iJKVGldEwfH6lMNF7wN2j2HML+
 f7NrTK5CB/HQRZSP4DBlg==
UI-OutboundReport: notjunk:1;M01:P0:ul0ELtyKGE4=;Z25DfZhICuxQTzQ4rY2NYrAGI77
 iMqxLECBN7WWFGgMW6w6nR5sE0xOa+Nek09QZ4MtmWnpx8QncyVi2BCjGOis0EgSr0l86cIQP
 FHtnW/LeeHhqxi/ZXkGVhJDIVQpT7NTV7OCHUcZPn07mOhv1pne+3unEdbzYHiJUzHOUba3Lw
 HY5OpblONxqj4xiYafpwJBcJnd+oTI//MKQ69oAl80XqP5Fs29jTp0yGSyHxJkc0wRqqwFJWj
 vtQ6yvqqoqN0s65bJ3ToM5aV+wOMWec6U0tT/BN6AzvUUiZ2Ll13x5mxgeW9g2QPDYygeNKKw
 +fsJBQiooc+pebZsVN6zoMk58dRs5weprXbivIu8y02NhxrdWdhZ/LmoDJHPmOdffBkPpVbiG
 XMdpa9k16YLjf1qH21tQTWI/uo/oPZ/gM552+W+1x6Y+mI7p6Cp+Be+CQKnzdASwSXo5o6+h0
 D+G/OznGJVr0tsCUFNAtGjVsWNhN+hol6LbZtlb/l3JuShvhT3vCBs8w5fU5JOnmYoLFdoEUa
 tT7AaAcP9AzcV2lPu9VhkHWQQV/7FegjEncNp9aNVjT/n1NN6VgrXuL8RfuFXj6ntAEoqjFWz
 fBgU21N8RYkC/XibbSIiR61jC7vPj+GEpYCofs2QI4oLLgcSvZgxGb7bJfV4aF1+n+lwoUm8E
 viS17x2Rf0YcZ8fIVMpa6xfKjyWqQM+nHhjnzC3zwf73lJdNVVxauQ6d/CgXD7BMAUipCpT5N
 va/OyFQFAM9IfNZvWbWpeucXEmQkBfXf1LJfk+UjsT6NuKe39ikoAipnwoGDqGH8omPJc+mh1
 9HX3Nlv6Nb6qucJUpU1woFZy0A1vDX/eEsUxYa9LvIc81dXLa+Sy+71rv+BsUlezO85xL6RZl
 YQ1zzhMtUZntgT1pMjZhUadutPj9KjLYVQLkqAlcNEIXW7V6bEkFzwtA7vVq4l4cSZVVs4+7X
 wQkCezhRGDpuPKW5eJfRmm5AamQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1682772456; i=j.neuschaefer@gmx.net;
 bh=obpUyhYRtSfS7CXsNwaCPg1LCrwEZEQ9L1VB8FuVWxU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=GbU8EOdQE+/FP7MGX+r3U7CP78thMim8rz8W4Bzhszmr8UYKWqm/v4G5S2dKlDxaG
 mHd9z1pUF+/Z+ACM/cgDObyzW7kxnWn0fnYV/XuPCTMb975xIgTL5iHYJlmO7XYKGj
 Z4D8nuMRdpyfm4lAlILw5UKhc6PeMMmCknB0K6KmXoOxsyPxCBTCX5TFj6WFkz89nQ
 oUGxF588/AcjJQE/cKxXXwJxRmchWYM4H+a1PSXNVD5JVDZhuNklY1wbgxrOco8gK0
 uYp9F5rxJZD9A9K/uhskUSD6JnxtQI7kybFF2GXI+OvgXgHjBp2x7XxclkYqSHlNVm
 rJcugo+GQQCtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=GbU8EOdQ
Subject: [Buildroot] [PATCH] package/micropython: pass $TARGET_LDFLAGS to
 build
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
Cc: Chris Packham <judge.packham@gmail.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TERGTEFHUyBuZWVkIHRvIGJlIHBhc3NlZCB0byB0aGUgbWljcm9weXRob24gYnVpbGQgc3lzdGVt
IHZpYSB0aGUKTERGTEFHU19FWFRSQSB2YXJpYWJsZSwgd2hpY2ggd2FzIHNvIGZhciBtaXNzaW5n
LiBUaGlzIHBhdGNoIGFkZHMgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBOZXVzY2jDpGZl
ciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgotLS0KCihyZXNlbmRpbmcgZHVlIHRvIGVtYWlsIGlz
c3VlcykKLS0tCiBwYWNrYWdlL21pY3JvcHl0aG9uL21pY3JvcHl0aG9uLm1rIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL21pY3JvcHl0
aG9uL21pY3JvcHl0aG9uLm1rIGIvcGFja2FnZS9taWNyb3B5dGhvbi9taWNyb3B5dGhvbi5tawpp
bmRleCA1MWI0NWU1ZTk5Li41ZjY4N2M3M2I5IDEwMDY0NAotLS0gYS9wYWNrYWdlL21pY3JvcHl0
aG9uL21pY3JvcHl0aG9uLm1rCisrKyBiL3BhY2thZ2UvbWljcm9weXRob24vbWljcm9weXRob24u
bWsKQEAgLTM2LDYgKzM2LDcgQEAgTUlDUk9QWVRIT05fTUFLRV9PUFRTICs9IFwKIAlNSUNST1BZ
X1BZX1VTU0w9MCBcCiAJQ1JPU1NfQ09NUElMRT0kKFRBUkdFVF9DUk9TUykgXAogCUNGTEFHU19F
WFRSQT0kKE1JQ1JPUFlUSE9OX0NGTEFHUykgXAorCUxERkxBR1NfRVhUUkE9IiQoVEFSR0VUX0xE
RkxBR1MpIiBcCiAJQ1dBUk49CgogZGVmaW5lIE1JQ1JPUFlUSE9OX0JVSUxEX0NNRFMKLS0KMi4z
OS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
