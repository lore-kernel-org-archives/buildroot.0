Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AF3CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 07:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CE5B424A8;
	Thu, 19 Oct 2023 07:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CE5B424A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ga0EI1l5P0iD; Thu, 19 Oct 2023 07:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50A9A424BD;
	Thu, 19 Oct 2023 07:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50A9A424BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 819A01BF45A
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6849683B48
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6849683B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYXbWA-Ek8CV for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 07:46:28 +0000 (UTC)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B49A83B3E
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 07:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B49A83B3E
Received: by mail-lj1-x244.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so89244131fa.1
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 00:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697701585; x=1698306385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z/Y+gzb7EePrJLuLEYawuUcjP78mTtgic8gj/L5XS+E=;
 b=iBkIX+2CkA35Jrt0br3K8M0WfQfEWWTfaiE2AQKqU2iMbKydTtfbNx8JSmT0w1lec8
 +2dldqdLTemb8eSQpDaltVhii9B6jF5IWeFWioDwxHYMkvYX8SmyLP7FEK5KBcLtfIcW
 mbxh4gCbjbxTQHkdu8gQ8/sZHIMB/k2NdUzOmSsZuCvXaXhK7GEmcrfQSkZx8NDJv9vu
 Zc/cf7TmMpWiLraEZDF5jaoLHmp4NYBvsoc5ZSGiqfC6rnnACREBfDmFFWPvYlnNnPT3
 88myJgTyM/GNkZDWeXpVnlk83Yv5OscFT2J2xwXFP8fCqUFKL3mqqZnY+1LJf2RlK83O
 mrCQ==
X-Gm-Message-State: AOJu0Yxr5weLlrJQhM+p/hCtfRHctK1BnOUwTdfZrdH25Quh9z+bRAAF
 NQQQzRtXIfb0yIov5i1Ot0evD7ACZ3qC8zJcsCkIa/tjHMk=
X-Google-Smtp-Source: AGHT+IH4xPGKVdmr9thH9TRaDF2ENcpSsD7eicG7HIgv9b1ZKdgCEC/CtvFfcRwOKWVCLieddfN6Sw==
X-Received: by 2002:a05:651c:1505:b0:2c5:2126:127a with SMTP id
 e5-20020a05651c150500b002c52126127amr1060623ljf.17.1697701585544; 
 Thu, 19 Oct 2023 00:46:25 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 fc8-20020a05600c524800b0040535648639sm3739268wmb.36.2023.10.19.00.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 00:46:25 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 09:46:13 +0200
Message-ID: <20231019074615.1672645-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019074615.1672645-1-adam.duskett@amarulasolutions.com>
References: <20231019074615.1672645-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697701585; x=1698306385;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/Y+gzb7EePrJLuLEYawuUcjP78mTtgic8gj/L5XS+E=;
 b=CGYBqC9UTQ0lPTD5HfSN1Iwf9ym7beYV4dzcAVJk2tqc7lDuB11Ch1RCaMU0paiJzF
 10RnlEGZHgxm9toRHJNw9YvWC5bpHeOYel6GDUV7gRuZXunzxaNdfb6EkXjf3j/oHtGg
 Ffe5NaR3YryTx30Uq/IN0+TMxc3wYx/x3Re80=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CGYBqC9U
Subject: [Buildroot] [PATCH 3/5] package/flutter-engine: use impeller
 rendering engine
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogaHR0cHM6Ly9kb2NzLmZsdXR0ZXIuZGV2L3BlcmYvaW1wZWxsZXIKSW1wZWxsZXIgcHJv
dmlkZXMgYSBuZXcgcmVuZGVyaW5nIHJ1bnRpbWUgZm9yIEZsdXR0ZXIuIFRoZSBGbHV0dGVyIHRl
YW3igJlzCmJlbGlldmVzIHRoaXMgc29sdmVzIEZsdXR0ZXLigJlzIGVhcmx5LW9uc2V0IGphbmsg
aXNzdWUuIEltcGVsbGVyIHByZWNvbXBpbGVzIGEKc21hbGxlciwgc2ltcGxlciBzZXQgb2Ygc2hh
ZGVycyBhdCBFbmdpbmUgYnVpbGQgdGltZSBzbyB0aGV5IGRvbuKAmXQgY29tcGlsZSBhdApydW50
aW1lLgoKSW1wZWxsZXIgaGFzIHRoZSBmb2xsb3dpbmcgb2JqZWN0aXZlczoKCiAgLSBQcmVkaWN0
YWJsZSBwZXJmb3JtYW5jZTogSW1wZWxsZXIgY29tcGlsZXMgYWxsIHNoYWRlcnMgYW5kIHJlZmxl
Y3Rpb24KICAgIG9mZmxpbmUgYXQgYnVpbGQgdGltZS4gSXQgYnVpbGRzIGFsbCBwaXBlbGluZSBz
dGF0ZSBvYmplY3RzIHVwZnJvbnQuCiAgICBUaGUgZW5naW5lIGNvbnRyb2xzIGNhY2hpbmcgYW5k
IGNhY2hlcyBleHBsaWNpdGx5LgoKICAtIEluc3RydW1lbnRhYmxlOiBJbXBlbGxlciB0YWdzIGFu
ZCBsYWJlbHMgYWxsIGdyYXBoaWNzIHJlc291cmNlcyBsaWtlCiAgICB0ZXh0dXJlcywgYW5kIGJ1
ZmZlcnMuIEl0IGNhbiBjYXB0dXJlIGFuZCBwZXJzaXN0IGFuaW1hdGlvbnMgdG8gZGlzawogICAg
d2l0aG91dCBhZmZlY3RpbmcgcGVyLWZyYW1lIHJlbmRlcmluZyBwZXJmb3JtYW5jZS4KCiAgLSBQ
b3J0YWJsZTogRmx1dHRlciBkb2VzbuKAmXQgdGllIEltcGVsbGVyIHRvIGEgc3BlY2lmaWMgY2xp
ZW50IHJlbmRlcmluZyBBUEkuCiAgICBZb3UgY2FuIGF1dGhvciBzaGFkZXJzIG9uY2UgYW5kIGNv
bnZlcnQgdGhlbSB0byBiYWNrZW5kLXNwZWNpZmljIGZvcm1hdHMgYXMKICAgIG5lY2Vzc2FyeS4K
CiAgLSBMZXZlcmFnZXMgbW9kZXJuIGdyYXBoaWNzIEFQSXM6IEltcGVsbGVyIHVzZXMsIGJ1dCBk
b2VzbuKAmXQgZGVwZW5kIG9uLAogICAgZmVhdHVyZXMgYXZhaWxhYmxlIGluIG1vZGVybiBBUElz
IGxpa2UgTWV0YWwgYW5kIFZ1bGthbi4KCiAgLSBMZXZlcmFnZXMgY29uY3VycmVuY3k6IEltcGVs
bGVyIGNhbiBkaXN0cmlidXRlIHNpbmdsZS1mcmFtZSB3b3JrbG9hZHMKICAgIGFjcm9zcyBtdWx0
aXBsZSB0aHJlYWRzIGlmIG5lY2Vzc2FyeS4KClNpZ25lZC1vZmYtYnk6IEFkYW0gRHVza2V0dCA8
YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgotLS0KIHBhY2thZ2UvZmx1dHRlci1l
bmdpbmUvZmx1dHRlci1lbmdpbmUubWsgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmx1dHRlci1lbmdp
bmUvZmx1dHRlci1lbmdpbmUubWsgYi9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL2ZsdXR0ZXItZW5n
aW5lLm1rCmluZGV4IGRiYTlmNzFjNGQuLjRlYjg0ODdkNDAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
Zmx1dHRlci1lbmdpbmUvZmx1dHRlci1lbmdpbmUubWsKKysrIGIvcGFja2FnZS9mbHV0dGVyLWVu
Z2luZS9mbHV0dGVyLWVuZ2luZS5tawpAQCAtMTI0LDYgKzEyNCw3IEBAIGVuZGlmCiAKIGlmZXEg
KCQoQlIyX1BBQ0tBR0VfSEFTX0xJQkdMRVMpLHkpCiBGTFVUVEVSX0VOR0lORV9ERVBFTkRFTkNJ
RVMgKz0gbGliZ2xlcworRkxVVFRFUl9FTkdJTkVfQ09ORl9PUFRTICs9IC0tZW5hYmxlLWltcGVs
bGVyLW9wZW5nbGVzCiBlbmRpZgogCiBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQkdMRlcpLHkpCkBA
IC0xNDIsNyArMTQzLDcgQEAgZW5kaWYKIAogIyBUaGVyZSBpcyBubyAtLWRpc2FibGUtdnVsa2Fu
IG9wdGlvbgogaWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUikseSkKLUZM
VVRURVJfRU5HSU5FX0NPTkZfT1BUUyArPSAtLWVuYWJsZS12dWxrYW4KK0ZMVVRURVJfRU5HSU5F
X0NPTkZfT1BUUyArPSAtLWVuYWJsZS12dWxrYW4gLS1lbmFibGUtaW1wZWxsZXItdnVsa2FuCiBl
bmRpZgogCiBpZmVxICgkKEJSMl9QQUNLQUdFX1hPUkc3KSQoQlIyX1BBQ0tBR0VfTElCWENCKSx5
eSkKLS0gCjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
