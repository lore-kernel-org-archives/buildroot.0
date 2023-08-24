Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A28C3DA6F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 15:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF0A822D2;
	Thu, 24 Aug 2023 15:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CF0A822D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdOIypkjCLWI; Thu, 24 Aug 2023 15:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC5BD81AA7;
	Thu, 24 Aug 2023 15:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC5BD81AA7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5ABD1BF329
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 15:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C85E260FF2
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 15:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C85E260FF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7n6YJXFr3fKO for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 15:10:17 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DF4260FDA
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 15:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DF4260FDA
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso6038444f8f.3
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 08:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692889814; x=1693494614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JlXPI+s6RoLKSfelsSu/LW+0cbxfuqkJiS2J1SkjOGU=;
 b=kr9rNbwqP06LEDEy4LsOw67fSdpvTi5o6wX5z17vodMEtShWHQcNarcAEmfP1PHzYC
 fqgt4P7bLCrSdDHjw8X/kmA2kgYIQFmHVI11TvYZQwV6YS9vRO/Iv2EHskkwMahRN9bp
 zs261C9uhwycYJuLZHGGQrIWdMijMgNJVwZfO0OmmhEj++UYxMMvLZIUhwhdz1nvq2dz
 NONIxhSyOl+bbItXTJa61Z+hMrvQ5kQ9Ofhub/gdrcppJL0+gst0f8ItLwOueYk4DViD
 sAtISVEqoeTHyWDAMYrap7K9GkGg52TjP2Kp8/frW/hXGK6l6wrhOatHIqQS1euOKN4y
 B3iw==
X-Gm-Message-State: AOJu0YytdX9LJ83IyfLU1AvNdbCYANWMAug0waR9iA4t6n89vfQ0IxK+
 jwSgb+U+FDGzJU9180uMenORSBhCMdLgDHbtT5GoIgw8
X-Google-Smtp-Source: AGHT+IEDUE11EYqkuMWYZtrMFebiFL8Z7VatkN3qkrO3ZTFn5pQNCnAeTmQ7WjcAm2ckVE72y9su0Q==
X-Received: by 2002:a5d:6305:0:b0:31a:e87e:103 with SMTP id
 i5-20020a5d6305000000b0031ae87e0103mr11651684wru.48.1692889814081; 
 Thu, 24 Aug 2023 08:10:14 -0700 (PDT)
Received: from debian-hp-1.fritz.box (94.105.100.233.dyn.edpnet.net.
 [94.105.100.233]) by smtp.gmail.com with ESMTPSA id
 y7-20020adffa47000000b0031c79de4d8bsm1819770wrr.106.2023.08.24.08.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 08:10:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 17:09:48 +0200
Message-ID: <20230824150950.56165-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1692889814; x=1693494614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JlXPI+s6RoLKSfelsSu/LW+0cbxfuqkJiS2J1SkjOGU=;
 b=G61+Sa/VZp+kHrDCAxYv1W8JQWKMmbJI9z7t6x2+9fYE2ZdyVCySl4+BMOfiV6qpiM
 gsFMHa560N5twdPdsdZjTvLGdYTj/mZPz67ZUugd8zAVva9Un9A0MZ71boblOTEyw/ts
 n/PcSK5LlYYV6T6ZxJ+VbbldidLCNUGJ8CSuQepBozS25q2W70R9XOy3abCw8gfQ/4mZ
 wRbMwh7Z0TVJ1dn7ROKdMUe8KAEInbsSJEoXFd0B8IBezWAUnhYidI3FAUCNbMPINm1x
 fPvuLEXQsLMJ2FYGxpaw4wz856KPdGHZfEGpCItkc3wd9oEBi/0KUvrOyx36uBc/dOpZ
 naUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G61+Sa/V
Subject: [Buildroot] [PATCH 1/1] package/network-manager: remove leftover
 comment about headers
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IDBhOGVmMmYzZjdiYzIxMWQzOGE1YTM3MDA3YmRlYjQ4OWJkMzdhYWUgYnVtcGVkIHRo
ZSBoZWFkZXJzCnZlcnNpb24gcmVxdWlyZW1lbnRzLCBidXQgZGlkIG5vdCB1cGRhdGUgdGhlIGFz
c29jaWF0ZWQgY29tbWVudC4KClJlbW92ZSB0aGUgY29tbWVudCBlbnRpcmVseSwgYXMgaXQgZG9l
cyBub3QgYXBwbHkgYW55bW9yZS4KClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxy
YXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiBwYWNrYWdlL25ldHdvcmstbWFuYWdlci9Db25m
aWcuaW4gfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9uZXR3b3JrLW1hbmFnZXIvQ29uZmlnLmluIGIvcGFja2FnZS9uZXR3b3JrLW1hbmFn
ZXIvQ29uZmlnLmluCmluZGV4IDM3YzRhNzlkMTYuLjU3ZDc1NDMxMzEgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvbmV0d29yay1tYW5hZ2VyL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL25ldHdvcmstbWFu
YWdlci9Db25maWcuaW4KQEAgLTQsNyArNCw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9ORVRXT1JL
X01BTkFHRVIKIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZGJ1cwogCWRlcGVuZHMgb24gQlIy
X1BBQ0tBR0VfSEFTX1VERVYKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNU
XzRfOQotCSMgVGVzdGVkIHdpdGggMy4yLCBidXQgbWF5IGV2ZW4gd29yayB3aXRoIGVhcmxpZXIg
dmVyc2lvbnMKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF80XzYK
IAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQyAjIENMT0NLX0JPT1RUSU1FLCBJ
UFRPU19DTEFTU18qCiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgbGli
Z2xpYjIKLS0gCjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
