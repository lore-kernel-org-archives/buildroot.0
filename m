Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631B3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 06:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E372140491;
	Tue, 12 Apr 2022 06:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMwtjSWE083s; Tue, 12 Apr 2022 06:28:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9976C4043D;
	Tue, 12 Apr 2022 06:28:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18A021BF310
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 06:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E63B40400
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 06:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PdpPSr9YaT9L for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 06:28:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA8BD4032B
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 06:28:13 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id t25so30425677lfg.7
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 23:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6DiQjqaJYeUZ0oXApT3peiJkD1nTuWFa0VGvo3p2YTo=;
 b=FxdVpnmK9z68Mww/K9AUy8nuATS6NO9UVq2cAp8JSiiz9jFaov9qbtG6p5wYYliHXI
 EIcV4ySPqUVNP7NNBASvfhe1Y6QhjW+Y4i6zih1t2nKn/+HHGW//P12iZys1GALS8YNQ
 FPpHS9NjlDcyxqYdu2K3ZxTlUyZoZ/wo4YmESi1hbuw5MxcdL2ZXGD5N95PYH22apz89
 8nzPKvFL3s4AALlrcZuIGntDeu7CSekH8A3r8ns9LrVUaCjIl1NIlkSbnAxX3QpA0YWG
 f9EMjb1Rhf9yBp41LcN5nQWcOi6wGKgxkydYrdaNk4T6PJoodNRd2rn2kCuK6Yv+/lJ3
 A/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6DiQjqaJYeUZ0oXApT3peiJkD1nTuWFa0VGvo3p2YTo=;
 b=7yaLanBKTkWWoroKCITj+8oyyTfKZiLuWYnOuefjgQGz0GT8hgn4vbSr8c06Houe1X
 +VqtjbzkuwQ/li6/giNRGG3Kp0gp8I5rptBQlgzLNdXp6p0a74wQhrh50aypfLBujHLO
 LNZfCSHlNOSCI0pppDEvImDhzwp59q8FgF9xr4hhsDBGowfNOqVenEqUq+V8zqa+GFfB
 hUWh1myQWicx04f1hI4WH5E5sBTl3HY3/KL6CcE/C3lbytDnKXjd8KG1AaVacG2joKvS
 7CM023QhQ36pjJ6huNDDluHGFpakf3WQYtXW7DQWp3TfgXWKnnlMUwLKb1+2MvYt3zSP
 eJ5Q==
X-Gm-Message-State: AOAM533Njl6/8lqje4sWJiqw5pwyGOaSUH4vVq5fLdnGBPqyXVVAfPIc
 PSopZg/W6nzSwiF/J1rhD4MKAPh3JvNNgSi8zd/bne3k
X-Google-Smtp-Source: ABdhPJxeBeaELISkwwe7QbyglZ0MYxhCw5rJfYaXUwIf9nMsmnDTthUJZ5kszAIjUA2bdRll/sBBLQ==
X-Received: by 2002:ac2:5979:0:b0:46b:b5a6:fef9 with SMTP id
 h25-20020ac25979000000b0046bb5a6fef9mr2535032lfp.33.1649744891623; 
 Mon, 11 Apr 2022 23:28:11 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (dxtytb4yd7v3b681jnfcy-3.rev.dnainternet.fi.
 [2001:14ba:9c01:e0:3dc:6e1d:72a7:5904])
 by smtp.googlemail.com with ESMTPSA id
 k22-20020a056512331600b0046bbeacbd98sm14531lfe.138.2022.04.11.23.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 23:28:11 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 09:28:10 +0300
Message-Id: <20220412062810.8567-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Add overrides configuration option
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
Cc: Mika Joenpera <mika.joenpera@unikie.com>,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogTWlrYSBKb2VucGVyYSA8bWlrYS5qb2VucGVyYUB1bmlraWUuY29tPgoKT3ZlcnJpZGVz
IGNvbmZpZ3JhdGlvbiBvcHRpb24gZW5hYmxlZCB0aHJvdWdoCndwYV9zdXBwbGljYW50IGNvbmZp
Z3VyYXRpb24gZmlsZS4KClNpZ25lZC1vZmYtYnk6IE1pa2EgSm9lbnBlcmEgPG1pa2Euam9lbnBl
cmFAdW5pa2llLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbjxqb3NlLnBla2th
cmluZW5AdW5pa2llLmNvbT4KLS0tCiBwYWNrYWdlL3dwYV9zdXBwbGljYW50L0NvbmZpZy5pbiAg
ICAgICAgIHwgIDcgKysrKysrKwogcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2Fu
dC5tayB8IDEwICsrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluIGIvcGFja2FnZS93
cGFfc3VwcGxpY2FudC9Db25maWcuaW4KaW5kZXggOGYwOTVjZGYyZC4uYmI0Yjc4NDMzZSAxMDA2
NDQKLS0tIGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC9Db25maWcuaW4KKysrIGIvcGFja2FnZS93
cGFfc3VwcGxpY2FudC9Db25maWcuaW4KQEAgLTg0LDYgKzg0LDEzIEBAIGNvbmZpZyBCUjJfUEFD
S0FHRV9XUEFfU1VQUExJQ0FOVF9NRVNIX05FVFdPUktJTkcKIAkgIEVuYWJsZSBzdXBwb3J0IGZv
ciBvcGVuIGFuZCBzZWN1cmVkIG1lc2ggbmV0d29ya2luZwogCSAgKElFRUUgODAyLjExcykKIAor
Y29uZmlnIEJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5UX09WRVJSSURFUworCWJvb2wgIkVuYWJs
ZSBIVC9WSFQgb3ZlcnJpZGVzIgorCWhlbHAKKwkgIEVuYWJsZSB3cGFfc3VwcGxpY2FudCBvdmVy
cmlkZXMgZm9yIEhUIGFuZCBWSFQgKGRpc2FibGUKKwkgIEhUL0hUNDAsIG1hc2sgTUNTIHJhdGVz
LCBldGMuKSBpbiB3cGFfc3VwcGxpY2FudAorCSAgY29uZmlndXJhdGlvbiBmaWxlLgorCiBjb25m
aWcgQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfQVVUT1NDQU4KIAlib29sICJFbmFibGUgYXV0
b3NjYW4iCiAJaGVscApkaWZmIC0tZ2l0IGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3Vw
cGxpY2FudC5tayBiL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWsKaW5k
ZXggM2MwYjBjMWRmYy4uYjlkYTZjMGM2ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS93cGFfc3VwcGxp
Y2FudC93cGFfc3VwcGxpY2FudC5taworKysgYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9z
dXBwbGljYW50Lm1rCkBAIC0xMTAsNiArMTEwLDE2IEBAIGVsc2UKIFdQQV9TVVBQTElDQU5UX0NP
TkZJR19ESVNBQkxFICs9IENPTkZJR19NRVNICiBlbmRpZgogCitpZmVxICgkKEJSMl9QQUNLQUdF
X1dQQV9TVVBQTElDQU5UX09WRVJSSURFUykseSkKK1dQQV9TVVBQTElDQU5UX0NPTkZJR19FTkFC
TEUgKz0gXAorCUNPTkZJR19IVF9PVkVSUklERVMgXAorCUNPTkZJR19WSFRfT1ZFUlJJREVTCitl
bHNlCitXUEFfU1VQUExJQ0FOVF9DT05GSUdfRElTQUJMRSArPSBcCisJQ09ORklHX0hUX09WRVJS
SURFUyBcCisJQ09ORklHX1ZIVF9PVkVSUklERVMKK2VuZGlmCisKIGlmZXEgKCQoQlIyX1BBQ0tB
R0VfV1BBX1NVUFBMSUNBTlRfQVVUT1NDQU4pLHkpCiBXUEFfU1VQUExJQ0FOVF9DT05GSUdfRU5B
QkxFICs9IFwKIAlDT05GSUdfQVVUT1NDQU5fRVhQT05FTlRJQUwgXAotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
