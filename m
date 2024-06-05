Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E8EC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B10D8448B;
	Wed,  5 Jun 2024 21:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiAQ3sGZhtZR; Wed,  5 Jun 2024 21:20:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C3DC8449E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C3DC8449E;
	Wed,  5 Jun 2024 21:20:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AE951BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3538B60EE2
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UCTzZhZIG_g for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD6A460A4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD6A460A4F
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD6A460A4F
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:20:19 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7eb351e38f9so11563739f.2
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 14:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717622418; x=1718227218;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XmGuqlCJ+oq/ytAYZlqDWLGT+n4WS6/NKnkd3FbsPbQ=;
 b=brUVMAJTC0w2VODrddqu/oWv/eJDCJfliCCyK/NObvDRubHfJuceIOEr2NoTX3qfQO
 NvV8pTzv7Ix8QZapqQgfKeOwjQ9XgSJ+XyDm6Df2euWqBdxKuydLPVKk9x0PgjKVAvMk
 tvqfkIBW/KzFAdc7b0Q/KtHN/8vhJYINir7Px1HORc6D4/bN9moCC7mMw8hEbmelkLeg
 WYgrYNcD9t+1WYMGX0rwJJ5/xQWc3RG/SlDtogPE52FG86g1RNc7pltHfG5KBF+2iaVg
 A/UO+jNhRSym7zo8yKvhabs2heJbMNO2js2JhMsRclo46EVmgnFCzv5Q0ruYv7oAnpes
 2PJw==
X-Gm-Message-State: AOJu0Yye59ftbWruaNl0cXxUETmK9X4KOmAyIcecdGp5r4nA5F/aLNx8
 w7TMwz0jjdkohhjKP4CPMXIN4TXf2Ptdyp/kv2CSxZOa15+XsFqXpB8rSg==
X-Google-Smtp-Source: AGHT+IHV5UQgDaNXAWLdkJmiZg/cC/dJxnlSNzxkxNqtA/NZb/sdDrayN4oThJAHa9mohuiPX241uQ==
X-Received: by 2002:a05:6602:1643:b0:7ea:fe9a:8048 with SMTP id
 ca18e2360f4ac-7eb3c929ffemr413160939f.19.1717622418070; 
 Wed, 05 Jun 2024 14:20:18 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b4884b6ebasm3153448173.68.2024.06.05.14.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 14:20:17 -0700 (PDT)
From: lancethepants <lancethepants@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 15:20:01 -0600
Message-Id: <20240605212001.1724218-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717622418; x=1718227218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XmGuqlCJ+oq/ytAYZlqDWLGT+n4WS6/NKnkd3FbsPbQ=;
 b=CMpHlGYgciCEiizUZBqyR+7H4djA7cH+a0ylo5eXoiWuh0qW7d6LiCAMZD+F19SD8G
 YPDSALMFloCLfA9Z5Fx46HgnppBWJNX9NKqg5shts3GmwUPQu40VqyltxY6w1XEa7Hmj
 pA5lkf/bGc8Ld3SxIpVxgMT126xn3p9pCH3QxG4J7D7LoR/ibfhzcbivTH5gMkj5UEBI
 3YtfwMGCG8qJhKk64HGxND+xQJEHn0p98epih/8vr4E2N/BzFqAuYYLMsKBuH1e9m9+N
 NfvQ7BTeGZJDYEz9TqN9Fa4CESB5qSN8LoUxYsLFTDWE7JwBgzBjAUApP26AfpVWjEG9
 WT7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CMpHlGYg
Subject: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with GCC 14.x
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
Cc: lancethepants <lancethepants@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIG1pc3Npbmcgc3RkaW8uaCBpbmNsdWRlLiBXaXRob3V0IGl0IHJlc3VsdHMgaW4gdGhlIGZv
bGxvd2luZyBlcnJvciB1bmRlciBHQ0MgMTQueAoKLi4vLi4vLi4vY29tMzIvbGliL3N5c2xpbnV4
L2RlYnVnLmM6IEluIGZ1bmN0aW9uIOKAmHN5c2xpbnV4X2RlYnVn4oCZOgouLi8uLi8uLi9jb20z
Mi9saWIvc3lzbGludXgvZGVidWcuYzo5MTo1OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YgZnVuY3Rpb24g4oCYcHJpbnRm4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9u
XQogICA5MSB8ICAgICBwcmludGYoIkR5bmFtaWMgZGVidWcgdW5hdmFpbGFibGVcbiIpOwoKU2ln
bmVkLW9mZi1ieTogTGFuY2UgRnJlZHJpY2tzb24gPGxhbmNldGhlcGFudHNAZ21haWwuY29tPgot
LS0KIC4uLi8wMDIwLXB1bGwtaW4tc3RkaW8taC1mb3ItZ2NjMTQucGF0Y2ggICAgICB8IDI1ICsr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgYm9vdC9zeXNsaW51eC8wMDIwLXB1bGwtaW4tc3RkaW8taC1mb3ItZ2Nj
MTQucGF0Y2gKCmRpZmYgLS1naXQgYS9ib290L3N5c2xpbnV4LzAwMjAtcHVsbC1pbi1zdGRpby1o
LWZvci1nY2MxNC5wYXRjaCBiL2Jvb3Qvc3lzbGludXgvMDAyMC1wdWxsLWluLXN0ZGlvLWgtZm9y
LWdjYzE0LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjY3MTFj
N2FhNzgKLS0tIC9kZXYvbnVsbAorKysgYi9ib290L3N5c2xpbnV4LzAwMjAtcHVsbC1pbi1zdGRp
by1oLWZvci1nY2MxNC5wYXRjaApAQCAtMCwwICsxLDI1IEBACitGcm9tIGRmYTI3MDUxMDBhODkz
YmMwMTdkMjM0MDZkYWE5YTM4M2ZiYzNjOTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
OiBsYW5jZXRoZXBhbnRzIDxsYW5jZXRoZXBhbnRzQGdtYWlsLmNvbT4KK0RhdGU6IFdlZCwgNSBK
dW4gMjAyNCAxNDozMTozOCAtMDYwMAorU3ViamVjdDogW1BBVENIXSBjb20zMi9saWIvc3lzbGlu
dXgvZGVidWcuYzogYWRkIG1pc3Npbmcgc3RkaW8uaCBpbmNsdWRlLgorCitGaXhlcyBidWlsZGlu
ZyB3aXRoIEdDQyAxNC54CistLS0KKyBjb20zMi9saWIvc3lzbGludXgvZGVidWcuYyB8IDEgKwor
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQorCitkaWZmIC0tZ2l0IGEvY29tMzIvbGli
L3N5c2xpbnV4L2RlYnVnLmMgYi9jb20zMi9saWIvc3lzbGludXgvZGVidWcuYworaW5kZXggZDlh
Yjg2M2YuLmU4ZjUzZDU3IDEwMDY0NAorLS0tIGEvY29tMzIvbGliL3N5c2xpbnV4L2RlYnVnLmMK
KysrKyBiL2NvbTMyL2xpYi9zeXNsaW51eC9kZWJ1Zy5jCitAQCAtMSw2ICsxLDcgQEAKKyAjaW5j
bHVkZSA8bGludXgvbGlzdC5oPgorICNpbmNsdWRlIDxzdHJpbmcuaD4KKyAjaW5jbHVkZSA8c3Rk
Ym9vbC5oPgorKyNpbmNsdWRlIDxzdGRpby5oPgorIAorICNpZmRlZiBEWU5BTUlDX0RFQlVHCisg
CistLSAKKzIuMzkuMgorCi0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
