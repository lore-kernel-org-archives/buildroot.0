Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A66C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 19:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8E4A81902;
	Tue, 14 Jun 2022 19:12:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NA_7SGn_c8aO; Tue, 14 Jun 2022 19:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A32381769;
	Tue, 14 Jun 2022 19:11:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E60F11BF5B4
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 19:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D434D60E82
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 19:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6YYlAyPMNBM for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 19:11:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A77A607F2
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 19:11:36 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id n10so19015892ejk.5
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 12:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FwozQlIjHbHnakkRZhRoRxsDcQVSQwicb0I7gYaCjY8=;
 b=YeOnssCFYY09vXacXhg8/VxlLlMdvRxJ1OYiNZdr3ryhF4jo0gwFHqRtRqX3PxeEen
 m4GT4s0tIsgtNm5Y0FQfPEoWxnailqsLN9qLXZIBEDJTpSh5dxZ0PQiMjxjf9vxtHMhY
 XYuBMMzUrIJP2pirPeU9hmRA43/Sxd7eF058h8EH/Vo4OJiYNIgBzkaxF92sBEgftd8E
 i/fJkhFJ4hVhYxPyjrMg+OerDiOpUXAvgDr6HQq/JdCwc//dQFBkUu6SMTqgs0Y149Fc
 yOb9PBGaXisOleb2spjXDeBGPBdZFfPJmLwX7r52UFv9It0V2ri3T57OygmE62j4yBdk
 JHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FwozQlIjHbHnakkRZhRoRxsDcQVSQwicb0I7gYaCjY8=;
 b=KUPzxhtZZkvAmr6wll2mTKIE4+HSQe+8O6SbkUbKFkZrSGCMWRJdOLzCXrD5lFFjkP
 kougWpkKsEErk2t5XyO5ptqXVH4S0QrqMqpYa7cWIwHldAty66IEWx6AxdlQZYvs9SZe
 c+IR7szWXLiewnTigQ00iW4aeECXil5chgPaoGcNVk5IohKlmZWa+4Z63xP95h8Pwi5G
 DVu2tbx+Ykz8zN0iYP203homf+noUiY++5r4R/h1bh6wg2Lj7J44bhSPzl/cjHA/O67+
 oxBFiG8N9MgJmeU3RoByeXHcS2RTuG4h/OSQfUBeNjYMYVYPrXn+Vzfluwn4jv/vs+CU
 CwKg==
X-Gm-Message-State: AOAM53092jK3d82iPJ55OH9h1zegcaRFvIvXLvkUaAA4naLYdrJQ3E6r
 wU5vsnl1iUVERdGJOE9DTRFtZirulwoOO7Nz
X-Google-Smtp-Source: ABdhPJx2+bo60lN9/PVrcVOniY0e6f45aXxcx2XH5rpwwm5MBcWBBUpeTwM/cGGizQXxDdR0GY698g==
X-Received: by 2002:a17:906:1018:b0:718:dd3f:f28c with SMTP id
 24-20020a170906101800b00718dd3ff28cmr2874073ejm.55.1655233417652; 
 Tue, 14 Jun 2022 12:03:37 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 g4-20020a17090670c400b00711d5bc20d5sm5326600ejk.221.2022.06.14.12.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 12:03:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 21:03:23 +0200
Message-Id: <20220614190325.723977-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/testing: add new test for
 python-s3transfer
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWFueSBhY3R1YWwgdGVzdHMgcmVxdWlyZSBuZXR3b3JrIHVzYWdlLCBzbyBqdXN0IGltcG9ydCB0
aGUgbW9kdWxlIHRvCmNoZWNrIHRoYXQgYXQgbGVhc3QgdGhhdCBwYXJ0IHdvcmtzLgoKU2lnbmVk
LW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0K
IC4uLi90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fczN0cmFuc2Zlci5weSAgICAgICAgfCAg
MSArCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3MzdHJhbnNmZXIucHkg
IHwgMTIgKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0
aG9uX3MzdHJhbnNmZXIucHkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zM3RyYW5zZmVyLnB5CgpkaWZmIC0tZ2l0IGEvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zM3RyYW5zZmVyLnB5IGIvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zM3RyYW5zZmVyLnB5Cm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmZmNTMwNzdjOWUKLS0tIC9kZXYv
bnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3Mz
dHJhbnNmZXIucHkKQEAgLTAsMCArMSBAQAoraW1wb3J0IHMzdHJhbnNmZXIKZGlmZiAtLWdpdCBh
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3MzdHJhbnNmZXIucHkg
Yi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zM3RyYW5zZmVyLnB5
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmRjNjY5NDQ0Y2UKLS0tIC9k
ZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9z
M3RyYW5zZmVyLnB5CkBAIC0wLDAgKzEsMTIgQEAKK2Zyb20gdGVzdHMucGFja2FnZS50ZXN0X3B5
dGhvbiBpbXBvcnQgVGVzdFB5dGhvblBhY2thZ2VCYXNlCisKKworY2xhc3MgVGVzdFB5dGhvblB5
M1MzdHJhbnNmZXIoVGVzdFB5dGhvblBhY2thZ2VCYXNlKToKKyAgICBfX3Rlc3RfXyA9IFRydWUK
KyAgICBjb25maWcgPSBUZXN0UHl0aG9uUGFja2FnZUJhc2UuY29uZmlnICsgXAorICAgICAgICAi
IiIKKyAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OMz15CisgICAgICAgIEJSMl9QQUNLQUdFX1BZ
VEhPTl9TM1RSQU5TRkVSPXkKKyAgICAgICAgIiIiCisgICAgc2FtcGxlX3NjcmlwdHMgPSBbInRl
c3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zM3RyYW5zZmVyLnB5Il0KKyAgICB0aW1lb3V0ID0g
MTAKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
