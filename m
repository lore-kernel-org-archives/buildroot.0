Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4195FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 16:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E234041520;
	Mon,  4 Apr 2022 16:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJ_Vqu-ndYdr; Mon,  4 Apr 2022 16:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A672B41518;
	Mon,  4 Apr 2022 16:35:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7B31BF983
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 16:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89F3B41518
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 16:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14JbEizUXIh6 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 16:35:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 176AB4150F
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 16:35:02 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h4so15305709wrc.13
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 09:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q7qQF3A4H75iRYcaJcdWRL0W0di9RnJiyD/hEUNeqlA=;
 b=eki6lfGbdB+R3NSHrBTFJ7WGo35t9GcjvjsBZgxLiUlbPvtCuTkyHPcDbn4lFWb3lP
 vUeY3axJrf+Ax4Fp28MFSIkoFPMMuLu+amUHcBUWbNYDX2xmfOsPAPNCA2yKaz5fGETM
 INot41hE+1SIbIM2R/kiReCtcc34wGS0kCoCUW8jLdparZmU231/40G591MUyPjdLPf7
 4D1Dg//4rdjdR5aiO5KDm1dKm12zVCZPHil+ajbsQEiUhOQlkAbyQvZruKNS46Ng9UfL
 JnRKDz5oWWQ9HKMh58yQPjFJdhUE1qWqETo3r587HuZ/d6zXur2w0jcKeaRTjSnf/7rC
 pByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q7qQF3A4H75iRYcaJcdWRL0W0di9RnJiyD/hEUNeqlA=;
 b=TCVHNurRy7lZClgAxcsmhew7FGsZqd+pZL2nUO+5yayYi1LIRPBoE5wbJ6/xnnq3CJ
 go4koVZPl071ca25sahapjbAUlyyfUHP68oOHz5vWmkgNjUkz9LBBXMmKYrOkkBs/ful
 BC0ihhpjYhaqVeNYH4ZtMwuwt8fWrTnorFYEwI5ZQ6xc7qftwAub6ivBaQtF7nbMmOtp
 KrsCbRK6AyhcAZEDEKF7hMJhaLFmxdqGLwak0Wsbk2ViTqtMBY+o/342eBsN0lvFjGNj
 axxcMU6sljNpitGaKdmg0WEsIE6ukkyXk+pqs1a7X0CxTjhyYqm2zrMonVzvJEkzbC4A
 Fsmw==
X-Gm-Message-State: AOAM5337d3bA+HKy//adboqOFKfg0+Iz5Y1yoZdRp0jFt18QVh70FN/W
 RIbMvhqJngFdEOq7WlgMbdoIMomQR2A=
X-Google-Smtp-Source: ABdhPJwV0yM+6GkU+ALF/ROHtgso/I6xHagf5O5rqxCYONSaW+YLralw/JznRF1SesWx7p4tX6hrNg==
X-Received: by 2002:a5d:55c7:0:b0:204:5ff7:74e2 with SMTP id
 i7-20020a5d55c7000000b002045ff774e2mr464142wrw.50.1649090099987; 
 Mon, 04 Apr 2022 09:34:59 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a5d6da7000000b00203d9d1875bsm11100913wrs.73.2022.04.04.09.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 09:34:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 18:33:20 +0200
Message-Id: <20220404163320.337038-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcoap: fix build with libressl
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGxpYnJlc3NsIHJhaXNlZCBzaW5j
ZSBjb21taXQKOGIxNGY2YjQ5Yjk2MmQ0ZDhmNzEzNWQ4NWFmYTE1NjU4ZWE4Zjk0YjoKCnNyYy9j
b2FwX29wZW5zc2wuYzoxMDc6MzogZXJyZXVyOiBub20gZGUgdHlwZSDCq8KgQklPX0FERFLCoMK7
IGluY29ubnUKICAxMDcgfCAgIEJJT19BRERSICpiaW9fYWRkcjsKICAgICAgfCAgIF5+fn5+fn5+
CgpGaXhlczoKIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMzAwMjJl
NDM3ZjM0OTQ1OTk5NGRjY2ZiNjEyNzczZDUyOWQ5N2EyMAoKU2lnbmVkLW9mZi1ieTogRmFicmlj
ZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9saWJj
b2FwL2xpYmNvYXAubWsgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmNvYXAvbGliY29hcC5tayBiL3Bh
Y2thZ2UvbGliY29hcC9saWJjb2FwLm1rCmluZGV4IDhhODVmZjNhMmUuLmVkY2MxYmJlZjggMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvbGliY29hcC9saWJjb2FwLm1rCisrKyBiL3BhY2thZ2UvbGliY29h
cC9saWJjb2FwLm1rCkBAIC0xOCw3ICsxOCw3IEBAIGlmZXEgKCQoQlIyX1BBQ0tBR0VfR05VVExT
KSx5KQogTElCQ09BUF9ERVBFTkRFTkNJRVMgKz0gZ251dGxzCiBMSUJDT0FQX0NPTkZfT1BUUyAr
PSBcCiAJLS1lbmFibGUtZHRscyAtLXdpdGgtZ251dGxzIC0td2l0aG91dC1tYmVkdGxzIC0td2l0
aG91dC1vcGVuc3NsCi1lbHNlIGlmZXEgKCQoQlIyX1BBQ0tBR0VfT1BFTlNTTCkseSkKK2Vsc2Ug
aWZlcSAoJChCUjJfUEFDS0FHRV9MSUJPUEVOU1NMKSx5KQogTElCQ09BUF9ERVBFTkRFTkNJRVMg
Kz0gb3BlbnNzbAogTElCQ09BUF9DT05GX09QVFMgKz0gXAogCS0tZW5hYmxlLWR0bHMgLS13aXRo
b3V0LWdudXRscyAtLXdpdGhvdXQtbWJlZHRscyAtLXdpdGgtb3BlbnNzbAotLSAKMi4zNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
