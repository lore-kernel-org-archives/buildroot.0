Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDCEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 09:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB9CC60DC2;
	Wed, 27 Apr 2022 09:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-LuKcspv0LP; Wed, 27 Apr 2022 09:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B799560B4B;
	Wed, 27 Apr 2022 09:47:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3F61BF2F8
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 09:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17BF660B4B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 09:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hQcllK8Lnrk for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 09:46:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1589260B3B
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 09:46:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so3086061wmb.4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZxKsUeoKWTnk0ecp5M/dqqc4Qz/KxyHNL4lVfiBgdws=;
 b=mdALBzR8pG0JM1d0a2J7okGBlGJdYRgUYUwLZodAVLKlhUTjd/2uZOaAqgoWRrcY7k
 b+yTK48zBkJDm8G/2xm6q9nJIsea1QaKy2Urq/oq2mfQRTvQTUWCpi6TRlpdAIfKObPY
 0tyWLQmEONar4FAM6AxrGYvBm0aETR9xW4nlSjBnA9KLfHmAnPE2avFHkL0PMQfHf/i+
 KdytlIZ86AP2QpMOuGRWC2FtKpoLSnt9dcpeXRj+il8QnNHx7NWZvdCb2O5TusSd4+RP
 RmsaURl88pHhtDnDNCJJjNiGF5LSBCDAQInRq4lVk/3GYsAY3Ufhm9+sYgp2w5lmU7IO
 DW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZxKsUeoKWTnk0ecp5M/dqqc4Qz/KxyHNL4lVfiBgdws=;
 b=BUiYAG23WWiQVP7PunAdUSaJj4BeEBfHUk9p4hdnPyqHNIUAzeJKX+ah4PWJnCJltM
 7m9yfhWsorkonEBvXsztmjrnW4A/jFOpXghYnWYiIMm81MPI11m3tr+DJhBQbUttiuM7
 aThDDXmtwCPPlMcV6WhZWRa0tb5I3G2jy20qYIsj5OkE4WVG4V9OOKUV9BcR6A9DpP6R
 dtk7PqQKd8IUqv1BwOcetIgN1zO8ucEvhQ6fQeZqmekgIW0b1kesTgJ76mCMol428IQX
 uBfKFptjWVHflL6jFgAICMzK6j45zSlx92K171D6Q1ldTGn+mJfB+GrdG/w6jpmzNfmg
 13aQ==
X-Gm-Message-State: AOAM531GwTOkMrrMerqY+rs3qVRTrYnLDKhSrawXyCysLt8stXKjBmz1
 dTYy8Xu08vzKCQW/yQgQt1nPtC96aXfUHg==
X-Google-Smtp-Source: ABdhPJxi/Ky+i3LpJLP/6tuCZKWpS/llxI9H7OiobpREJH2S4YkUTUW8WYCJWLFeKM7pQT8tZK5VWg==
X-Received: by 2002:a05:600c:3c8d:b0:38e:4bc6:abde with SMTP id
 bg13-20020a05600c3c8d00b0038e4bc6abdemr24783869wmb.13.1651052794048; 
 Wed, 27 Apr 2022 02:46:34 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:116a:ef1f:b81d:eca1:1a27:59be])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b0038ed39dbf00sm1169198wmb.0.2022.04.27.02.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 02:46:33 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 11:46:02 +0200
Message-Id: <20220427094608.16698-4-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427094608.16698-1-etienne.carriere@linaro.org>
References: <20220427094608.16698-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/optee-examples: bump to version
 3.17.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCBPUC1URUUgRXhhbXBsZXMgcGFja2FnZSB2ZXJzaW9uIHRvIE9QLVRFRSByZWxlYXNlIDMu
MTcuMC4KCkNjOiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+ClNp
Z25lZC1vZmYtYnk6IEV0aWVubmUgQ2FycmllcmUgPGV0aWVubmUuY2FycmllcmVAbGluYXJvLm9y
Zz4KLS0tCiBwYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4YW1wbGVzLmhhc2ggfCA0ICsr
LS0KIHBhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMubWsgICB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMuaGFzaCBiL3BhY2thZ2Uv
b3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMuaGFzaAppbmRleCA5MjI4ZmIzOWQyLi4wNDMz
YzcyNzUyIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4YW1wbGVz
Lmhhc2gKKysrIGIvcGFja2FnZS9vcHRlZS1leGFtcGxlcy9vcHRlZS1leGFtcGxlcy5oYXNoCkBA
IC0xLDQgKzEsNCBAQAotIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9saW5hcm8tc3dnL29wdGVl
X2V4YW1wbGVzL2FyY2hpdmUvMy4xNi4wL29wdGVlLWV4YW1wbGVzLTMuMTYuMC50YXIuZ3oKLXNo
YTI1NiAgNDVlMDZkYzU1MjBmMzA5N2NjMTI0NDM0YWNhZmMyNmI4ZGIyOGRiODdkZjYyZjNhZDJk
ZGZmMDZjYWNjZTk2OSAgb3B0ZWUtZXhhbXBsZXMtMy4xNi4wLnRhci5negorIyBGcm9tIGh0dHBz
Oi8vZ2l0aHViLmNvbS9saW5hcm8tc3dnL29wdGVlX2V4YW1wbGVzL2FyY2hpdmUvMy4xNy4wL29w
dGVlLWV4YW1wbGVzLTMuMTcuMC50YXIuZ3oKK3NoYTI1NiAgMDNkMThhMDQzOWNmZTk5ZWQxY2Vl
ZmM5YWYwMDBiMzliMjg0MjRjODc0N2UwZDkyYTI3MDFlN2ZiYjZjNTE5YSAgb3B0ZWUtZXhhbXBs
ZXMtMy4xNy4wLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkCiBzaGEyNTYgIDZmMWVmODQ0OWNi
ODJhZTc5ZDIxNTU2MDVmNzk4NWJkZjBmMDhlN2FiNTAwN2RlOWI0MzYyZThiZjI4NzMzYjkgIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMu
bWsgYi9wYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4YW1wbGVzLm1rCmluZGV4IDMxZTVm
MjYwZGYuLmViYjA2ODhhZjUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0
ZWUtZXhhbXBsZXMubWsKKysrIGIvcGFja2FnZS9vcHRlZS1leGFtcGxlcy9vcHRlZS1leGFtcGxl
cy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLU9QVEVF
X0VYQU1QTEVTX1ZFUlNJT04gPSAzLjE2LjAKK09QVEVFX0VYQU1QTEVTX1ZFUlNJT04gPSAzLjE3
LjAKIE9QVEVFX0VYQU1QTEVTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGxpbmFyby1zd2csb3B0ZWVf
ZXhhbXBsZXMsJChPUFRFRV9FWEFNUExFU19WRVJTSU9OKSkKIE9QVEVFX0VYQU1QTEVTX0xJQ0VO
U0UgPSBCU0QtMi1DbGF1c2UKIE9QVEVFX0VYQU1QTEVTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
