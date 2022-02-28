Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464C9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 16:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBDF460D91;
	Mon, 28 Feb 2022 16:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHvB_igGuXJr; Mon, 28 Feb 2022 16:26:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12CBA60803;
	Mon, 28 Feb 2022 16:26:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F52A1BF307
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 16:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8886281B72
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 16:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6g302jwhx83U for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 16:26:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2C9281BF4
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 16:26:36 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n14so16308732wrq.7
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 08:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JdGYIecxugS7BStGDmVjUcOJwTVXcanPV9Y2/gr1nlM=;
 b=OF5IIFjXgScD5vDQ+132WbT+ayn6tKWLDV54GTIluE3mvSmz3vYVJpu4myNUz/ShOi
 nfw3acW+NV5i22KdwXKvJ1VVjVGviCx25HV1LnnPM7Fs8ceJQL0bm+Il155mzGGxRBZi
 34GkrjH+q+P+myiwkQg3y4m2nGWCgXUS4laW8EGTplyECMZPflp7eRFZ0H+0o1RHpgxo
 gQyasDtIrjC8L6FoxKhgDFA7GNlm2kCvUUic8cBfpGxismEG/D91ZLmzASC7NAhWhMbX
 AcyKgE/GukRr+R/TCD1/VOVFULm5FNxvc94QPGN5elB+v/GxaplHonYCmyv+VB2mE0Lr
 Pipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JdGYIecxugS7BStGDmVjUcOJwTVXcanPV9Y2/gr1nlM=;
 b=d8sBPjovhi5PWJuaXy8rFv7l/V+M0QgYXQc+ZMFImDSRqLo4SKbYofGE6JCA9eoc7l
 zUdfnLnmiVAdC3QoGTJGqPAZMGFIgD7HMUse2cS+5D5Dt0GAjhGz4YxXqaaGCTbi9RTM
 QYkYNAY7tl2mA3KOSJd+3LimQpDeS2QOBcYe9deJmYEvc9EpNGa/Rt+Hzr5vsiXHmlNV
 DgIN9vdYhrYqW/103+vI5U3jZp/p7l8xFqvZGFwG7K/e0rRMBRHYIrj67U3mcbofqx29
 lbnY8pEDhpVwvSj/7P+NDYVZXrnc6+81laSWk/hyOQ+HH9nB8UjA+C3n1vkprn4n+fWz
 qInA==
X-Gm-Message-State: AOAM533OHLaNebvTTXI3E9IqIOPIo8T64NjZhrdKZUp5EO9iNO1J45S1
 gNS/9A7t+YQ+H48++Z4vmaKEtDMvGzPBBA==
X-Google-Smtp-Source: ABdhPJysFEnHlnkfgvCqPbfNgn1mJTcVSf5RmLPtc0EhHPbVuoPg+D8OdwycGF8aIp90Jr0CC+qgfQ==
X-Received: by 2002:a05:6000:353:b0:1ef:85f2:ac with SMTP id
 e19-20020a056000035300b001ef85f200acmr8592215wre.661.1646065595201; 
 Mon, 28 Feb 2022 08:26:35 -0800 (PST)
Received: from localhost.localdomain ([176.172.124.9])
 by smtp.googlemail.com with ESMTPSA id
 r186-20020a1c2bc3000000b0037bdd94a4e5sm11620141wmr.39.2022.02.28.08.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 08:26:34 -0800 (PST)
From: =?UTF-8?q?R=C3=A9mi=20Duraffort?= <remi.duraffort@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 17:26:32 +0100
Message-Id: <20220228162632.2777188-1-remi.duraffort@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] linux: fix kernel image format for aarch64
 BE
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
Cc: =?UTF-8?q?R=C3=A9mi=20Duraffort?= <remi.duraffort@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUsOpbWkgRHVyYWZmb3J0IDxyZW1pLmR1cmFmZm9ydEBsaW5hcm8ub3Jn
PgotLS0KIGxpbnV4L0NvbmZpZy5pbiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saW51eC9Db25maWcuaW4gYi9s
aW51eC9Db25maWcuaW4KaW5kZXggMTNkOTliZDA5ZC4uMWYyYThkYjU0NSAxMDA2NDQKLS0tIGEv
bGludXgvQ29uZmlnLmluCisrKyBiL2xpbnV4L0NvbmZpZy5pbgpAQCAtMjYxLDExICsyNjEsMTEg
QEAgY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfU0lNUExFSU1BR0UKIAogY29uZmlnIEJSMl9MSU5V
WF9LRVJORUxfSU1BR0UKIAlib29sICJJbWFnZSIKLQlkZXBlbmRzIG9uIEJSMl9hYXJjaDY0IHx8
IEJSMl9yaXNjdgorCWRlcGVuZHMgb24gQlIyX2FhcmNoNjQgfHwgQlIyX3Jpc2N2IHx8IEJSMl9h
YXJjaDY0X2JlCiAKIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX0lNQUdFR1oKIAlib29sICJJbWFn
ZS5neiIKLQlkZXBlbmRzIG9uIEJSMl9hYXJjaDY0IHx8IEJSMl9yaXNjdgorCWRlcGVuZHMgb24g
QlIyX2FhcmNoNjQgfHwgQlIyX3Jpc2N2IHx8IEJSMl9hYXJjaDY0X2JlCiAKIGNvbmZpZyBCUjJf
TElOVVhfS0VSTkVMX0xJTlVYX0JJTgogCWJvb2wgImxpbnV4LmJpbiIKLS0gCjIuMzQuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
