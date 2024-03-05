Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D1DC54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 09:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C58A40844;
	Tue,  5 Mar 2024 09:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdtmHNNMzycD; Tue,  5 Mar 2024 09:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 213AB4085C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 213AB4085C;
	Tue,  5 Mar 2024 09:39:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADFB51BF25F
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 09:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A82DD40BD1
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 09:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yd9l5Z84OFh6 for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 09:39:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9EC0140531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EC0140531
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EC0140531
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 09:39:02 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51340e89df1so2705516e87.1
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 01:39:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709631540; x=1710236340;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+6KECqF1GhT/D7yIW5H6Uph43ct1Fy4AfLJ5sRkd6c0=;
 b=Phu+Oo+TE4pKpTUgQDbGBV6Ti2rNFK3t+ZuiepFuZWjZG3nKJYM387W6dJirBY2SN9
 X4IEoxiVCq4QZAvTjWjLlPCzOO0bXzKRfZty3zu1jPZXp5okZ5jVXQmcYrC/O7DApwiK
 8LNjZrq6GowN50/85pQge0O/RMzy829UNZ9LdgY1QjcXIIAYsi2izLmwp1ICcFvDMtDQ
 566s2UmVZdXUKNBp2BLAig7ACaqztsuSDm9JLckJVpiSdEM/03nOxUbfz3fNNPyJXKR3
 wObty7d6POW4bcUiOWD6dh2F86QPFBaziIwEhWAvLFqexmKt4yL/rOLOj5QlxnihaGNz
 xDtQ==
X-Gm-Message-State: AOJu0YxSAQHyppaDqCCU3uGpmaCxQfty/Ln8CwN1/nlfiScEOoC8CjNu
 d7q3TTvzSqaO1QKl0Uhu1iM9V8Ekjlz2cChTzRQT8wmw3NF9zv7rKGlNU5p48AXzmJh2rWIpSlF
 4tgk=
X-Google-Smtp-Source: AGHT+IHdNbpzlSNqnBzUqycDsQEq3kQsdolkNFGARdtx0WQyzvNGAeX4tvdADwPu/wGYVF/ERsENPg==
X-Received: by 2002:ac2:4ac8:0:b0:513:55ed:918a with SMTP id
 m8-20020ac24ac8000000b0051355ed918amr535012lfp.50.1709631539912; 
 Tue, 05 Mar 2024 01:38:59 -0800 (PST)
Received: from nola.getinternet.no ([84.209.57.13])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a196459000000b00512b2ea0472sm2145161lfj.32.2024.03.05.01.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 01:38:59 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 10:38:38 +0100
Message-Id: <20240305093839.3152030-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1709631540; x=1710236340; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+6KECqF1GhT/D7yIW5H6Uph43ct1Fy4AfLJ5sRkd6c0=;
 b=Z+Oi5ktRHo+P4B/F7XHtSwI3e9y4YJBqlWqzhSoDqKzDHQ4ZvCiun/wSXFYqzR5Q6a
 v8iU/T+uCXwxo7XIXf2YaHd1mdZl6BtpO/r3YnlztcaAUvYCvFGkogaVvFtKhkdZ1QN2
 kxlmDmXtiHWm4t7IEqQCmrX1zKtpGM18IgA04=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qbee.io
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=Z+Oi5ktR
Subject: [Buildroot] [PATCH 0/1] package/qbee-agent: new package
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>,
 Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGlzIHBhdGNoIGFkZHMgdGhlIG9wZW4gc291cmNlIHFiZWUtYWdlbnQgdXRpbGl0
eSB0byBidWlsZHJvb3QuIEkndmUKc3VibWl0dGVkIHRoaXMgcGF0Y2ggYmVmb3JlLCBidXQgZGVj
aWRlZCB0byBob2xkIGl0IG9mZiBiYXNlZCBvbgpmZWVkYmFjayBmcm9tIHRoZSBidWlsZHJvb3Qg
Y29tbXVuaXR5LiBXaXRoIHRoZSBjb2RlIGNoYW5nZXMgaW4KcmVsZWFzZSAyMDI0LjA5IEkgYmVs
aWV2ZSB0aGF0IHRoZSBxYmVlLWFnZW50IGluIGEgYmV0dGVyIHNoYXBlCndpdGggcmVnYXJkcyB0
byBpbnRlZ3JhdGlvbiB3aXRoIGJ1aWxkcm9vdC4KCldpdGgga2luZCByZWdhcmRzLAoKSm9uIEhl
bnJpayBCasO4cm5zdGFkCgpKb24gSGVucmlrIEJqw7hybnN0YWQgKDEpOgogIHBhY2thZ2UvcWJl
ZS1hZ2VudDogbmV3IHBhY2thZ2UKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDMgKysrCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFj
a2FnZS9xYmVlLWFnZW50L0NvbmZpZy5pbiAgICAgICB8IDE3ICsrKysrKysrKysrKysrKwogcGFj
a2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQuaGFzaCB8ICAzICsrKwogcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQubWsgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
NSBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9xYmVlLWFnZW50L0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcWJl
ZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3FiZWUt
YWdlbnQvcWJlZS1hZ2VudC5tawoKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
