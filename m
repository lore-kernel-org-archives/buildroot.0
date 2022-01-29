Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D54C433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 11:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3988640273;
	Sat, 29 Jan 2022 11:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEQYtOG-ymxJ; Sat, 29 Jan 2022 11:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 459AD400CB;
	Sat, 29 Jan 2022 11:17:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB0EC1BF82C
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C75E640080
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:17:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHmB87fY7ZUc for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 11:17:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1561A40061
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 11:17:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso5837734wms.4
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 03:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iCfXavVbyfXDg2Auh+SvA1yduV4i3zLgERS1ljBM/Xc=;
 b=HmVbLqWLX3ma+LwNvrYWRaqiZfvreJ/6kts/v5NVIGRSPJ+5O3RzMHHcE8518Gx7Pk
 +xzrCycIzRYO6lYAEYPkkiFqP/e1TIasitaAIu+zTss+d4u/15WeorsLNV2prU+dLdWL
 4vu0agRZ3X9ovGXGF+E0oK67b/7j4EVDmRvhxwGG//On8mCWWejbZKpI5MvZVUlYE9at
 N7jte0CEAiQxonn1gXIBzFxR5/zHhC4HfEGjgGNFDU8EK2N8IgWn/yCM/11U3N7HYraW
 RwCDHRh1Xw/U+mKW3KcRBbOATkgdQqrtLUp5Ab9OASLuaImCTJozbRrC3W4wYVAvOTa5
 gA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iCfXavVbyfXDg2Auh+SvA1yduV4i3zLgERS1ljBM/Xc=;
 b=g0PvfbFncbIvNBusN9q/jzi+3ffXbkFzmBkeN48pTv45H962H6Afci55q/R3yWqFUW
 1fqoLm4hv5gAIV1cYWLWmor4WdDBILUySOL6c/5vXEDbiR1Rg8uxQyoIn08+QD6sfPDR
 puQnfpalPv+XJrln2hflFzSxduZQYd3tqUHarp0ie15u8osQ1+g7P+UQTuTEY9pCCusC
 mvK379aVF1igcjPZ7c1T+x/77SCA7jJVeTdI2vWE9JwdNn23cW5J2UJqvQaHWfsIymxk
 xDu69whOLYQeuWuRvvmNNRN/X4nS6Aq+f1l6sNMPedRIBERudaKWdfP4KuaIkiKXTQnK
 nWDw==
X-Gm-Message-State: AOAM530OYYDGU1d/SSac5laF4sFwk6PzV0tMZao3mmVcK/2kSSdCUmtx
 tK/d2FnczKCgi+UW0iU0YNc+/64ySps=
X-Google-Smtp-Source: ABdhPJz7fr/Ukic2TlGsfqIyMsgw7foZY0a/VCrTcdEHGo4Xaw1paxUDrOMt0+hT3KirpKbJCY6X0Q==
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr10846920wmc.71.1643455057787; 
 Sat, 29 Jan 2022 03:17:37 -0800 (PST)
Received: from Clement-Blade14.home
 (2a01cb0003ba9b005c3703e14046740e.ipv6.abo.wanadoo.fr.
 [2a01:cb00:3ba:9b00:5c37:3e1:4046:740e])
 by smtp.gmail.com with ESMTPSA id 1sm8204742wry.52.2022.01.29.03.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 03:17:37 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 12:17:30 +0100
Message-Id: <20220129111731.736265-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] configs/beelink_gs1: increase rootfs
 size to 120M
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIHRoZSBtb21lbnQgQmVlbGluayBHUzEgdXNlIGEgZGVmYXVsdCByb290ZnMgc2l6ZSBvZiA2
ME0sCndoaWNoIGlzIGEgYml0IGxvdyBpZiB5b3Ugd2FudCB0byBhZGQgc29tZSBwYWNrYWdlcyBs
aWtlIGEKZ3JhcGhpYyBzdGFjay4KCkluY3JlYXNlIHRoZSByb290ZnMgc2l6ZSB0byAxMjBNLgoK
UmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5l
ZXJpbmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21h
aWwuY29tPgotLS0KIGNvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmlnIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9jb25maWdzL2JlZWxpbmtfZ3Mx
X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmlnCmluZGV4IGU4OGYzZTNi
NjkuLjE4NzJhYWJkZjAgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmln
CisrKyBiL2NvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmlnCkBAIC0yNCw2ICsyNCw3IEBAIEJS
Ml9QQUNLQUdFX0FVVE9TU0g9eQogQlIyX1BBQ0tBR0VfRFJPUEJFQVI9eQogQlIyX1RBUkdFVF9S
T09URlNfRVhUMj15CiBCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQorQlIyX1RBUkdFVF9ST09U
RlNfRVhUMl9TSVpFPSIxMjBNIgogCiAjIEZpcm13YXJlCiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVE
X0ZJUk1XQVJFPXkKLS0gCjIuMzIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
