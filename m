Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F50EC48BC3
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 01:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B14E7410A1;
	Sun, 18 Feb 2024 01:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3TwW1DLaqRv; Sun, 18 Feb 2024 01:11:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0E2E410A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0E2E410A5;
	Sun, 18 Feb 2024 01:11:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 535101BF83E
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 01:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D03E410A5
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 01:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ty5sjw7h0zJy for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 01:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BFF36410A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFF36410A1
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFF36410A1
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 01:11:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41241f64c6bso14082225e9.0
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 17:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708218703; x=1708823503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c8Y7Uv2xfTb06pybQrCZd50tp5QQWseN/OLfA0MubhE=;
 b=GCz8HYb4M9SaLDJMvkVp+Dz1AQdxG/qPjJWh+AIgyl6IfxcjYLdcA/Ua06I0VoPpIG
 Mi9VwX3s2IyS79t7vFF7mx/YO4d2LpGNa6E5znefd6EFIccE00h2oAxPTAQDA0bZWXf+
 QKHZVuvAl3c01K6w1oqA/aXu7lhVIsHEf8bRGIcmTFfKccOjF1rAVKHCPHfBBiyVWRGI
 YQvtc65XQyQlnADNV7EUK5laM7UxcNgNP5PMIOHtQO+4pg+LNJUC4PNjTV1lPK5n2xQi
 ONvyg2ETPCMjgYiCtAfRj5gwq1ZUAJu4sakO+BzpmS5u6CrVijRwO6mULFoXQV5edy+8
 V8LQ==
X-Gm-Message-State: AOJu0Yxg5lq97QhqqEBvvS7lne+5Cvej23tlMuP9WIdgB1+MWjO/s3GN
 xingoPxSwCGKH5ZKYRYnuTSS3whETk4wz8mcDr+VTo6UDAhPXmZW5Jq62B6w8pk3OI6WcPVXqpC
 b
X-Google-Smtp-Source: AGHT+IH7sebyoDBl8K280OWrMuBztgck4f6VPl54x4E3RXaMVXEyT5gkZdUnBDO2tQOUznd8Ljo62w==
X-Received: by 2002:a05:600c:5486:b0:411:d8de:b6c9 with SMTP id
 iv6-20020a05600c548600b00411d8deb6c9mr6306807wmb.12.1708218702640; 
 Sat, 17 Feb 2024 17:11:42 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 x6-20020adff0c6000000b0033cfc035940sm6145672wro.34.2024.02.17.17.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 17:11:42 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 02:11:17 +0100
Message-ID: <20240218011118.1077002-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1708218703; x=1708823503; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c8Y7Uv2xfTb06pybQrCZd50tp5QQWseN/OLfA0MubhE=;
 b=LwVZz+F69fvqc0IcKfrxEsqKUJ3gDgm8XNs7XJL+qLDYupJQB63XAna0sAbNybk57b
 BKu1VhJ4iL0hx98W7bl73Rw9yb6NyddFv+UkKGEE3Rc1gs0kcBeQJuIErfsIZoQ9sFS+
 273GlFeLMnm49kYUioeJWMhqo/t6750GO5lR8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=rtone.fr header.i=@rtone.fr header.a=rsa-sha256
 header.s=google header.b=LwVZz+F6
Subject: [Buildroot] [PATCH 1/1] package/musl: enable on s390x
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIHMzOTB4IG11c2wgc3VwcG9ydGVkIGFyY2hzLiBVcHN0cmVhbSBtdXNsIGFscmVhZHkgc3Vw
cG9ydHMgczM5MHhbMV0uCgpUZXN0ZWQgd2l0aCBxZW11X3MzOTBzX2RlZmNvbmZpZzoKCgkkIG91
dHB1dC9ob3N0L2Jpbi9xZW11LXN5c3RlbS1zMzkweCAtTSBzMzkwLWNjdy12aXJ0aW8gLWNwdSBt
YXgsenBjaT1vbiAtbSA0RyAtc21wIDIgLWtlcm5lbCBvdXRwdXQvYnpJbWFnZSAtZHJpdmUgZmls
ZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyLGlmPXZpcnRpbyxmb3JtYXQ9cmF3IC1hcHBlbmQg
InJvb3R3YWl0IHJvb3Q9L2Rldi92ZGEgbmV0LmlmbmFtZXM9MCBiaW9zZGV2bmFtZT0wIiAtZGlz
cGxheSBub25lIC1zZXJpYWwgbW9uOnN0ZGlvIC1uZXQgbmljLG1vZGVsPXZpcnRpbyAtbmV0IHVz
ZXIKCSguLi4pCglXZWxjb21lIHRvIEJ1aWxkcm9vdAoJYnVpbGRyb290IGxvZ2luOiByb290Cgkj
IHVuYW1lIC1hCglMaW51eCBidWlsZHJvb3QgNi4xLjQ0ICMyIFNNUCBTdW4gRmViIDE4IDAxOjMz
OjQyIENFVCAyMDI0IHMzOTB4IEdOVS9MaW51eAoJIyAvbGliL2xkLW11c2wtczM5MHguc28uMQoJ
bXVzbCBsaWJjIChzMzkweCkKCVZlcnNpb24gMS4yLjQKCUR5bmFtaWMgUHJvZ3JhbSBMb2FkZXIK
CVVzYWdlOiAvbGliL2xkLW11c2wtczM5MHguc28uMSBbb3B0aW9uc10gWy0tXSBwYXRobmFtZSBb
YXJnc10KClsxXTogaHR0cHM6Ly9naXQubXVzbC1saWJjLm9yZy9jZ2l0L211c2wvY29tbWl0Lz9p
ZD0xNTA5NDk0MzA1MGViOWE1NjRmNDA5MzIzMDcwZTUwYjQwZjc4ODE2CgpTaWduZWQtb2ZmLWJ5
OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgotLS0KIHBhY2thZ2UvbXVzbC9D
b25maWcuaW4gfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbXVzbC9Db25maWcuaW4gYi9wYWNrYWdlL211c2wvQ29uZmlnLmluCmluZGV4
IDg5ZjQxZDJmZjEuLjQ0NjU0ZWZmMzQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbXVzbC9Db25maWcu
aW4KKysrIGIvcGFja2FnZS9tdXNsL0NvbmZpZy5pbgpAQCAtMTYsNiArMTYsNyBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfTVVTTF9BUkNIX1NVUFBPUlRTCiAJZGVmYXVsdCB5IGlmIEJSMl9wb3dlcnBj
NjQKIAlkZWZhdWx0IHkgaWYgQlIyX3Bvd2VycGM2NGxlCiAJZGVmYXVsdCB5IGlmIEJSMl9SSVND
Vl82NAorCWRlZmF1bHQgeSBpZiBCUjJfczM5MHgKIAlkZWZhdWx0IHkgaWYgQlIyX3NoCiAJZGVm
YXVsdCB5IGlmIEJSMl94ODZfNjQKIAlkZXBlbmRzIG9uICFCUjJfUE9XRVJQQ19DUFVfSEFTX1NQ
RSAjIG5vdCBzdXBwb3J0ZWQsIGJ1aWxkIGJyZWFrcwotLQoyLjQzLjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
