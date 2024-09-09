Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AE4ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 17:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3648B4021F;
	Mon,  9 Sep 2024 17:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtoLkUIDXInQ; Mon,  9 Sep 2024 17:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E7B40266
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4E7B40266;
	Mon,  9 Sep 2024 17:25:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 337281BF2F2
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 17:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2158380E4B
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 17:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQnjV9FSlJG3 for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 17:25:56 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3202480E26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3202480E26
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3202480E26
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 17:25:55 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-205659dc63aso45110535ad.1
 for <buildroot@buildroot.org>; Mon, 09 Sep 2024 10:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725902754; x=1726507554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a83V6beKdFdBHHho5Dy+gOjo3WrQsiVB9YXR/Roz/bE=;
 b=e85axKV/lBjhZ9fqxj53DzaioDjPg4Y6AqeGn7LTeeK8YXjr29Jpqw07OHZNMLDK3Q
 FWqaMqc5AXVopB3bnPLegBmy9YUOYoZJBCmMcMyGzNMP9PYp2Mt0DypK4gxHiGE4Sq+T
 Y1Q3Dr1YE46ZklgZHn8u4XdOCH9TtvZQN5dF//aWWRzUL0El4cvZ3tEmBcm6ArDE5a9h
 Ct80Za2ImW/+yzQ7BQLvIaaJlNxEewnagkFOJlFk8wy2/w5fvXFhF4SIDef4e+T2fsI4
 gt+PHIUfGxNZAhVH/g3JmDG3wFhoYsuV77ZArukdty3IlEcaVxgmNQgP7/T2jQch7vpJ
 57Yg==
X-Gm-Message-State: AOJu0YxB43aX7Er6Dl+9S2B9yaTwGffijZcd6Dj5+umAdOyFbALB4HVE
 JXejXiZE1b//O4C8coqXJgIgDBC4rFSnATv7qW5P72wODRY19mHXMyl9+a3TBVplLoUOrWU4xAG
 g
X-Google-Smtp-Source: AGHT+IELrsSOWBiEk/CpMxp47GTjjBjqGIiHPFggd0zIk58KsOaq4oYjocE+vYy7Lp5aCpg48obxig==
X-Received: by 2002:a17:903:2352:b0:1fc:568d:5f05 with SMTP id
 d9443c01a7336-206f04c6f5amr110273225ad.8.1725902753791; 
 Mon, 09 Sep 2024 10:25:53 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f1f608sm36352645ad.222.2024.09.09.10.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 10:25:53 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 14:25:42 -0300
Message-ID: <20240909172542.29995-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1725902754; x=1726507554;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a83V6beKdFdBHHho5Dy+gOjo3WrQsiVB9YXR/Roz/bE=;
 b=vU6mzy/Q9CUWhnQ9I/1BXomSDDA3tjMy5k8dL9QO65ul4C0BoT+jpSeIAURkgDiQqH
 HDFg8IwK/Z/x0muCB6CBqVYGHtXSYPhsNBcXZLZgJMeP0ljMZ/xI7YmEzqnbWCz6ucuI
 tuF18RO1+ZDfABc6OJijNrSAa2sjdHc0SkoTQEHZZmHTwPcKxnb4bTS7iiaA1PiLeeSu
 yqUtusZeZMETrtwKwLNFBnUzSI4rn7sdnzcYtBGU1GNnrCmJjxvPjYA9hKCjVv008c8O
 PmxLCJP2li/iklNEd7AH0K3wC8mP5zChP7BN+1gBbA/OlMYGNMf3+SUNF4phmGD8+x8Z
 5dbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=vU6mzy/Q
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: add dynamic security
 plugin option
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Titouan Christophe <titouanchristophe@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9tb3NxdWl0dG8vQ29uZmlnLmluICAgIHwgMTAgKysrKysrKysr
KwogcGFja2FnZS9tb3NxdWl0dG8vbW9zcXVpdHRvLm1rIHwgIDQgKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9tb3NxdWl0dG8vQ29u
ZmlnLmluIGIvcGFja2FnZS9tb3NxdWl0dG8vQ29uZmlnLmluCmluZGV4IDhiZWRmMmFkMjEuLjcx
ZWVhMjU2YjMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbW9zcXVpdHRvL0NvbmZpZy5pbgorKysgYi9w
YWNrYWdlL21vc3F1aXR0by9Db25maWcuaW4KQEAgLTI5LDYgKzI5LDE2IEBAIGNvbmZpZyBCUjJf
UEFDS0FHRV9NT1NRVUlUVE9fQlJPS0VSCiAJaGVscAogCSAgQnVpbGQgYW5kIGluc3RhbGwgdGhl
IG1vc3F1aXR0byBicm9rZXIgb250byB0YXJnZXQuCiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9NT1NR
VUlUVE9fQlJPS0VSX0RZTkFNSUNfU0VDVVJJVFlfUExVR0lOCisJYm9vbCAiZHluYW1pYyBzZWN1
cml0eSBwbHVnaW4iCisJZGVmYXVsdCBuCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9NT1NRVUlU
VE9fQlJPS0VSCisJc2VsZWN0IEJSMl9QQUNLQUdFX0NKU09OCisJc2VsZWN0IEJSMl9QQUNLQUdF
X09QRU5TU0wKKwloZWxwCisJICBCdWlsZCBhbmQgaW5zdGFsbCB0aGUgZHluYW1pYyBzZWN1cml0
eSBwbHVnaW4KKwkgIGZvciBtb3NxdWl0dG8gYnJva2VyIG9udG8gdGFyZ2V0LgorCiBjb21tZW50
ICJtb3NxdWl0dG8gYnJva2VyIG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSIK
IAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCiAJZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJQlMKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbW9zcXVpdHRvL21vc3F1aXR0by5tayBiL3BhY2thZ2UvbW9zcXVp
dHRvL21vc3F1aXR0by5tawppbmRleCA2YjI0OWMzN2ZkLi5jMDMxZjEwYzZiIDEwMDY0NAotLS0g
YS9wYWNrYWdlL21vc3F1aXR0by9tb3NxdWl0dG8ubWsKKysrIGIvcGFja2FnZS9tb3NxdWl0dG8v
bW9zcXVpdHRvLm1rCkBAIC05NCw2ICs5NCwxMCBAQCBpZmVxICgkKEJSMl9QQUNLQUdFX01PU1FV
SVRUT19CUk9LRVIpLHkpCiBNT1NRVUlUVE9fTUFLRV9ESVJTICs9IHNyYyBhcHBzL21vc3F1aXR0
b19jdHJsIGFwcHMvbW9zcXVpdHRvX3Bhc3N3ZAogZW5kaWYKIAoraWZlcSAoJChCUjJfUEFDS0FH
RV9NT1NRVUlUVE9fQlJPS0VSX0RZTkFNSUNfU0VDVVJJVFlfUExVR0lOKSx5KQorTU9TUVVJVFRP
X01BS0VfRElSUyArPSBwbHVnaW5zL2R5bmFtaWMtc2VjdXJpdHkKK2VuZGlmCisKIGRlZmluZSBN
T1NRVUlUVE9fQlVJTERfQ01EUwogCSQoTUFLRSkgLUMgJChARCkgJChUQVJHRVRfQ09ORklHVVJF
X09QVFMpIERJUlM9IiQoTU9TUVVJVFRPX01BS0VfRElSUykiIFwKIAkJJChNT1NRVUlUVE9fTUFL
RV9PUFRTKQotLSAKMi40Ni4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
