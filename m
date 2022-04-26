Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3479AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 11:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A04F4167A;
	Tue, 26 Apr 2022 11:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O2SFpVE94x3d; Tue, 26 Apr 2022 11:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66ED24155C;
	Tue, 26 Apr 2022 11:30:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 709301BF2B3
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 11:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E16461058
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 11:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vdvecJi1xbU for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 11:30:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D3816100F
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 11:30:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e24so5146422wrc.9
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 04:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VcHwTBg2Gar7knOornNK6/8wfz4VXmWOT2qLK09CFuI=;
 b=o30UIEKLjC3VIqELghyEju+D/3vBUDhqI82k6iUzovd+4CK1bLziU6Sln/+2YL77YB
 A2YLFA51z7AyP/3BOMkGsKEr6Vvzw9YXjaCkL/oOzqLmcbtb2mQgoFN1UPVJm4itosmL
 zLUycsCRWfyzFc3xbJnyD436aATFRs5DJJmz6o4A36YGfcFjrEp77a1eSadjouPR7NHx
 r03NzMF3rRvuymaeEkXH1s1BJthhKH+Fpkn6V+BAgF6ZurGQisNKHUKvUTStUoLblpaC
 oQCuCmxxym4lvN8kFdc5YETorHdPpyNQoQflIKTN+L1ve+gVQ+4loFJAUiAPuU/BUn88
 dz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VcHwTBg2Gar7knOornNK6/8wfz4VXmWOT2qLK09CFuI=;
 b=bVTqKZgex9A8dJ6RkRTbYyBR9mqa/bG7ZhLC3YiX45dDTS2ev//S1vcwyfKp1Y8/qw
 WaEcadX0IRpiM8unhxuUG6A3DU/yZyiaVb46A9Jn8yrid/6E8qcLLOcrDljzQhUzMGRC
 O/oQQCLyYiMh5VpEaGXwcWgduaHpbYP3cFuNaQs8O7MgDGQxBNAuAZCJXMgtOpBgUoy9
 euX0leHVT6l0pDIaj2B+mtU9GtZpzMd6S0OT3at4WjO8F6RG6kqkG0GQN5XaC02mkpOg
 nGRmofwMWRxiiKL9hnOeJJTA3S26ou/MyIV7f4wurT7LrLAMqS/bjNlc1Gza7CD+wkoz
 o75Q==
X-Gm-Message-State: AOAM532y1EkeOu+VpYzHxNPwNL+31U0zBrL8S6H86beuu3CHSP03PQ1u
 JelQS8M1aeSehp8SSd4a6rvwMA1KyDt56A==
X-Google-Smtp-Source: ABdhPJxyOEOv1s0UfcxOyOkie8Ko8TNXpyPjW0hPhwugR6jc+558MzSMsNud99p3M4GBGwYsdxq/hg==
X-Received: by 2002:adf:f346:0:b0:20a:c23f:fb14 with SMTP id
 e6-20020adff346000000b0020ac23ffb14mr18123104wrp.25.1650972636209; 
 Tue, 26 Apr 2022 04:30:36 -0700 (PDT)
Received: from localhost ([207.188.150.225]) by smtp.gmail.com with ESMTPSA id
 k65-20020a1ca144000000b003929a64ab63sm14152569wme.38.2022.04.26.04.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 04:30:35 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Philippe Serbruyns <Philippe.Serbruyns@ugent.be>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Apr 2022 13:30:10 +0200
Message-Id: <20220426113010.1463133-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426113010.1463133-1-salvador.joseluis@gmail.com>
References: <20220426113010.1463133-1-salvador.joseluis@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/zfs: add test case for musl
 toolchain
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
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGF0Y2ggdGl0bGU6IHBhY2thZ2UvemZzOiBhZGQgdGVzdCBjYXNlIGZvciBtdXNsIHRvb2xjaGFp
bgoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3Nl
bHVpc0BnbWFpbC5jb20+Ci0tLQpUaGVzZSBwYXRjaCBzZXJpZXMgcmVmYWN0b3IgdGhlIHRlc3Qg
Y2FzZSBhbmQgYWRkIG11c2wgdG9vbGNoYWluLgpIZXJlIGlzIHNlY29uZCBvbmUsIHRoYXQgYWRk
IHRoZSBtdXNsIHRvb2xjaGFpbiB0ZXN0IGNhc2UuCgogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF96ZnMucHkgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMu
cHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQppbmRleCAxY2Mw
MzBlNzhjLi44OTExZGNmZDllIDEwMDY0NAotLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3pmcy5weQorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X3pmcy5weQpAQCAtNzMsMyArNzMsOCBAQCBjbGFzcyBUZXN0WmZzVWNsaWJjKFRlc3RaZnNCYXNl
KToKICAgICAgICAgIiIiCiAKIAorY2xhc3MgVGVzdFpmc011c2woVGVzdFpmc0Jhc2UpOgorICAg
IGNvbmZpZyA9IFRlc3RaZnNCYXNlLmNvbmZpZyArIFwKKyAgICAgICAgIiIiCisgICAgICAgIEJS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9YODZfNjRfTVVTTF9TVEFCTEU9eQorICAgICAg
ICAiIiIKLS0gCjIuMzYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
