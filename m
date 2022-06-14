Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAA1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 12:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAAD560E91;
	Tue, 14 Jun 2022 12:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sh9TnlupSG29; Tue, 14 Jun 2022 12:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D28BC60B15;
	Tue, 14 Jun 2022 12:40:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C0E81BF2C4
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 12:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69C0560B15
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 12:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id If1izyhh2XUJ for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 12:40:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47AA56058F
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 12:40:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id o10so11465200edi.1
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x6nKC4fmXwQVT3ljf62LsBit25fr1qML5ZCcMNspKLw=;
 b=Tw/cxdgfNV4+O59Ey71QG7PA1U4tVYSOJzWd+amW/ExtSNeYB5GetkoMPrl6l7nCmP
 fg46+lVokIaEbLqeufXGOgAJNoQB6tO7AL0GV0Z0tg5Hd6nepYYxgjK7H7cB8yMMNLBH
 3x/cQIBjKY8jhzHOLXYAfh0ypJzKFGz1jnFiKxaIKUkYpoRsmsodbuSHNWACZbO6yrh+
 6uN/GxQHtCz6bI3hxBhNFave48TrLXJeElgK8OD/iMXs83yS/+CwrRd0g4ARkg7rDtWS
 6EqAHKuwsZjWp6d4xzFgYkaN7/0zBUhiJhb2hVa8Q//VrFy7Nx29nJlGYPYijKnMTLpS
 AIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x6nKC4fmXwQVT3ljf62LsBit25fr1qML5ZCcMNspKLw=;
 b=5FbyIOqMTO4r1yxJ91Lr803EU2CsPuVCZSdMNwYzD37iq1fyW0dOwFh3fvBgVXsy2l
 vzPCwTzzaOHYCTN26I+ktpI5IKn8a5X83sRh2cKd0eEcjV1xihh3ix7vNVEZz43VLTF1
 Xd+4sw9ygJGBDYi8vXpu/p0oMRfOfTOzm192QZA8Sma7VhDRtLw7NsEKMZ7g4ubDOfkv
 hgeEf3mOk/9mhh4wF/EkzatuYvls6Ggka8BHauQYgJ/HNmHfMQ0UenpRkZSPedp0lUfU
 0mrff1BhEVSM/Geh0kQoJOh7PTil4zqoOGuMCSFRNX4EtFd5bDnLOUKLfatjSkojVMWV
 DIbA==
X-Gm-Message-State: AOAM530zSClqa7H33foJlyTUx7PUnNytklGtBQaArZHwZBSMjf791WNX
 wOyL6PCpzJ16i2+jKV5WB+IZ787MtI6gINpB
X-Google-Smtp-Source: ABdhPJwQI9m6itOJobn4STN7lqdtRkXMHoYlVqG1aUHJbHT+JjT3Cf39Y+2YeW4EWW+MdNKAhHObOg==
X-Received: by 2002:a05:6402:84a:b0:426:262d:967e with SMTP id
 b10-20020a056402084a00b00426262d967emr5958434edz.286.1655210449285; 
 Tue, 14 Jun 2022 05:40:49 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.139.153])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a170906804900b006fed062c68esm4948910ejw.182.2022.06.14.05.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 05:40:48 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 14:40:18 +0200
Message-Id: <20220614124020.710305-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version 1.24.8
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nOiBodHRwczovL2dpdGh1Yi5jb20vYm90by9ib3RvMy9ibG9iL21hc3Rlci9DSEFO
R0VMT0cucnN0CgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxv
dHRlQG1pbmQuYmU+Ci0tLQogcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLmhhc2gg
fCAyICstCiBwYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMubWsgICB8IDQgKystLQog
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLmhhc2ggYi9wYWNrYWdlL3B5
dGhvbi1ib3RvMy9weXRob24tYm90bzMuaGFzaAppbmRleCAzNThmYWJkMzliLi45NmMwM2JlNjFj
IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMuaGFzaAorKysg
Yi9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMuaGFzaApAQCAtMSw0ICsxLDQgQEAK
ICMgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2JvdG8zL2pzb24KLXNoYTI1NiAg
MTFhNjAzNTA2MDIzMGU5MjMyN2Q0ZjEwZmVmNmJjNDQxODhiMmNkNjg1MDQwMTJiYzI1ZWQ2MmFj
MzFkNjcwYiAgYm90bzMtMS4xOS4yLnRhci5negorc2hhMjU2ICA4MzNlNjdlZGZiNzNmMmNjMjJm
ZjI3YTFjMzM3Mjg2ODZkYzkwYTllODFiYTI1NTFmOTQ2MmVhMmQxYjA0ZjQxICBib3RvMy0xLjI0
LjgudGFyLmd6CiAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICAw
ZDU0MmUwYzg4MDRlMzlhYTdmMzdlYjAwZGE1YTc2MjE0OWRjNjgyZDc4Mjk0NTEyODdlMTFiOTM4
ZTk0NTk0ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24t
Ym90bzMubWsgYi9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMubWsKaW5kZXggOGUx
MGFhNDgyZC4uYzVmOTEzMzU3MyAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tYm90bzMvcHl0
aG9uLWJvdG8zLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5tawpA
QCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVBZVEhPTl9CT1RP
M19WRVJTSU9OID0gMS4xOS4yCitQWVRIT05fQk9UTzNfVkVSU0lPTiA9IDEuMjQuOAogUFlUSE9O
X0JPVE8zX1NPVVJDRSA9IGJvdG8zLSQoUFlUSE9OX0JPVE8zX1ZFUlNJT04pLnRhci5negotUFlU
SE9OX0JPVE8zX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMv
ZWMvNDUvZDEyZjljMDliNWM0ZGFkOGJjYjA5OGRmYWU1ZTllMTI1M2VkNjQwOGVmYmJkOWEzZTYw
YmZmNTViODI0CitQWVRIT05fQk9UTzNfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVk
Lm9yZy9wYWNrYWdlcy82MC8zYi82ZmVkMzA2MzQxMDAzZmQwNTlmNDAyZDIyNzQ3YmEzM2QwN2I4
YWM4YmZlNTNkYmVkYjJjNmU0MmVlM2IKIFBZVEhPTl9CT1RPM19TRVRVUF9UWVBFID0gc2V0dXB0
b29scwogUFlUSE9OX0JPVE8zX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCiBQWVRIT05fQk9UTzNfTElD
RU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
