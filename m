Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B164FC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 00:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 464274196F;
	Thu,  7 Apr 2022 00:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lx2AFoCPMRxm; Thu,  7 Apr 2022 00:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E1514196B;
	Thu,  7 Apr 2022 00:51:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 609701C1135
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E37783E92
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B2E-9jK5po54 for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 00:51:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8F1883E84
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 00:51:16 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id f10so3485797plr.6
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 17:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=leeouw7/otw1u0RDO/ps3Wl6pTRqFX+dWvy8IVWXjDM=;
 b=nGyUEyO1/ayiZeeHyqE08sOByS9zVrOxJCMmoGMGE8LAumbO2U0qKhmg5NgiaiXulM
 j09jWlBhwvo4pXZxQDOEj9MSRT7IYr5mjVHcISq35/jiVMFVbmRW/pQ8ZsBxX3oZH25u
 V7Dg4vFnJ8/PJT8ym0eOZFcfBGqPjYhQbMgwaFBBEMpcsm6SZz7XDJb0GesRk4xM351z
 JKK/8yL1Lm3qWwYEQEWLSPSFt9/38xBjT5mXAtYeeTD3MADLjsokY3C92FlKvHedmrNP
 1RDoDkBlSpSTjEVSeOcfgM4nImIKabnY+lwCiYW+aMybfA3uSJN+sG8EBIC1TRJ30rgj
 cMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=leeouw7/otw1u0RDO/ps3Wl6pTRqFX+dWvy8IVWXjDM=;
 b=rE79iM7EhfM3c9/Wca0vjxjCshLgzOXIWH43aD3EH+7K5nEISL6v0ZkAAh6h/AR9n2
 zsNOxefksdNRz6snQumh7XDGHq8jV4+02+atIv7AuMAbfE9Ucmpkh7wst0KDaefraYYh
 DkAhHFpzeR4NLF4ABVOZ2Orsv84cOQiPPpIHikz3SFBJXHTl3th3XWW7hSpFILzCMSc3
 S0MdZCx8Twa+AkrF9fTd2om4VJRiVnPYPxhnq1BsEuZoJsNh7ZKhHBdORu83Pazm1D5w
 cOt25/qZC6e611GmIMuPF6wPQUbNKbGX9h1NB/VtK2t8nFw0Wuhk1+lV6yLPf8/Mtodo
 pbag==
X-Gm-Message-State: AOAM533An3T34swtXREJk+NaR9F5/KekICwIXqjarqTD6Z8v/dL6aJBi
 /nCsWMnenJOHMhl+KAeleGqvXWnTIQo=
X-Google-Smtp-Source: ABdhPJxgBBps2fYXUYoFg06M/FJ10Q/i7aVbbmeUX/qIWAGLUzDfVLZ2HXqtYe4w1Sja6EPNJ1OoRQ==
X-Received: by 2002:a17:90a:8591:b0:1b9:da10:2127 with SMTP id
 m17-20020a17090a859100b001b9da102127mr12889301pjn.13.1649292675344; 
 Wed, 06 Apr 2022 17:51:15 -0700 (PDT)
Received: from voyager.ibm.com (cpe-172-197-129-163.sa.foxtel.net.au.
 [172.197.129.163]) by smtp.gmail.com with ESMTPSA id
 r8-20020a17090a0ac800b001c9e35d3a3asm6873480pje.24.2022.04.06.17.51.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 17:51:14 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Thu,  7 Apr 2022 10:21:07 +0930
Message-Id: <20220407005107.202695-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zlib-ng: Conditionally enable Power8
 option
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

emxpYi1uZydzIGJ1aWxkIHN5c3RlbSBkb2VzIG5vdCBjb3JyZWN0bHkgZGV0ZWN0IGlmIGl0IHN1
cHBvcnRzIHRoZQpQb3dlcjggZmVhdHVyZS4gRm9yY2UgaXQgb2ZmIHRvIGZpeCBidWlsZGluZyBm
b3IgY29uZmlndXJhdGlvbnMgdGhhdApkb24ndCBzdXBwb3J0IHRoZSB2ZWN0b3IgYnVpbHRpbiBm
dW5jdGlvbnMuCgpGb3IgZXhhbXBsZSwgYnVpbGRpbmcgZm9yIEJSMl9wb3dlcnBjXzYwMToKCiAg
d2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdmVjX3hs4oCZOyBk
aWQgeW91IG1lYW4KIOKAmHZlY19ybOKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dCiAgIDkzIHwgICAgICAgICAgICAgdmJ1ZiA9IHZlY194bCgwLCAodW5zaWduZWQgY2hhciAq
KSBidWYpOwoKU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KCi0t
LQogWyAgMyVdIEJ1aWxkaW5nIEMgb2JqZWN0IENNYWtlRmlsZXMvemxpYi5kaXIvYXJjaC9wb3dl
ci9hZGxlcjMyX3Bvd2VyOC5jLm8KIGJ1aWxkX3BwYzYwMV9nbGliYy9ob3N0L2Jpbi9wb3dlcnBj
LWJ1aWxkcm9vdC1saW51eC1nbnUtZ2NjCiAtLXN5c3Jvb3Q9L2hvbWUvam9lbC9kZXYvYnVpbGRy
b290L2J1aWxkX3BwYzYwMV9nbGliYy9ob3N0L3Bvd2VycGMtYnVpbGRyb290LWxpbnV4LWdudS9z
eXNyb290CiAtREhBVkVfQlVJTFRJTl9DVFogLURIQVZFX0JVSUxUSU5fQ1RaTEwgLURIQVZFX1BP
U0lYX01FTUFMSUdOCiAtREhBVkVfVklTSUJJTElUWV9ISURERU4gLURIQVZFX1ZJU0lCSUxJVFlf
SU5URVJOQUwgLURQT1dFUjgKIC1EUE9XRVI4X1ZTWF9BRExFUjMyIC1EUE9XRVI4X1ZTWF9TTElE
RUhBU0ggLURQT1dFUl9GRUFUVVJFUwogLURXSVRIX0daRklMRU9QIC1EWkxJQl9DT01QQVQgLURa
TElCX0RMTCAtRF9MQVJHRUZJTEU2NF9TT1VSQ0U9MQogLURfX1VTRV9MQVJHRUZJTEU2NAogLUkv
aG9tZS9qb2VsL2Rldi9idWlsZHJvb3QvYnVpbGRfcHBjNjAxX2dsaWJjL2J1aWxkL3psaWItbmct
Mi4wLjYKIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVf
T0ZGU0VUX0JJVFM9NjQgLU9zCiAtZzAgLURfRk9SVElGWV9TT1VSQ0U9MSAtV2FsbCAtV25vLWlt
cGxpY2l0LWZhbGx0aHJvdWdoICAtRE5ERUJVRyAtZlBJQwogLWZuby1zZW1hbnRpYy1pbnRlcnBv
c2l0aW9uIC1zdGQ9Yzk5IC1tY3B1PXBvd2VyOCAtZm5vLWx0byAtbwogQ01ha2VGaWxlcy96bGli
LmRpci9hcmNoL3Bvd2VyL2FkbGVyMzJfcG93ZXI4LmMubyAtYwogYnVpbGRfcHBjNjAxX2dsaWJj
L2J1aWxkL3psaWItbmctMi4wLjYvYXJjaC9wb3dlci9hZGxlcjMyX3Bvd2VyOC5jCiBidWlsZF9w
cGM2MDFfZ2xpYmMvYnVpbGQvemxpYi1uZy0yLjAuNi9hcmNoL3Bvd2VyL2FkbGVyMzJfcG93ZXI4
LmM6IEluIGZ1bmN0aW9uIOKAmGFkbGVyMzJfcG93ZXI44oCZOgogYnVpbGRfcHBjNjAxX2dsaWJj
L2J1aWxkL3psaWItbmctMi4wLjYvYXJjaC9wb3dlci9hZGxlcjMyX3Bvd2VyOC5jOjkzOjIwOgog
d2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdmVjX3hs4oCZOyBk
aWQgeW91IG1lYW4KIOKAmHZlY19ybOKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dCiAgIDkzIHwgICAgICAgICAgICAgdmJ1ZiA9IHZlY194bCgwLCAodW5zaWduZWQgY2hhciAq
KSBidWYpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICBefn5+fn4KICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgdmVjX3JsCgpTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1z
LmlkLmF1PgotLS0KIHBhY2thZ2UvemxpYi1uZy96bGliLW5nLm1rIHwgNyArKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96bGliLW5n
L3psaWItbmcubWsgYi9wYWNrYWdlL3psaWItbmcvemxpYi1uZy5tawppbmRleCBmYjQ5N2I4YzEx
ZDAuLmRkMTcyM2FjODY3MiAxMDA2NDQKLS0tIGEvcGFja2FnZS96bGliLW5nL3psaWItbmcubWsK
KysrIGIvcGFja2FnZS96bGliLW5nL3psaWItbmcubWsKQEAgLTIzLDQgKzIzLDExIEBAIGlmZXEg
KCQoQlIyX2FybSkseSkKIFpMSUJfTkdfQ09ORl9PUFRTICs9IC1EV0lUSF9BQ0xFPTEgLURXSVRI
X05FT049MQogZW5kaWYKIAoraWZlcSAoJChCUjJfcG93ZXJwY19wb3dlcjgpLHkpCitaTElCX05H
X0NPTkZfT1BUUyArPSAtRFdJVEhfUE9XRVI4PU9OCitlbHNlCitaTElCX05HX0NPTkZfT1BUUyAr
PSAtRFdJVEhfUE9XRVI4PU9GRgorZW5kaWYKKworCiAkKGV2YWwgJChjbWFrZS1wYWNrYWdlKSkK
LS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
