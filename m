Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EDCCDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 13:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CDD540B03;
	Tue, 17 Oct 2023 13:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CDD540B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHhoPodWdgLS; Tue, 17 Oct 2023 13:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C428416EF;
	Tue, 17 Oct 2023 13:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C428416EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73A471BF267
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D21341DB2
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D21341DB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8w_Jc8UuavU for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 13:13:11 +0000 (UTC)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBB0B417BD
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 13:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB0B417BD
Received: by mail-lj1-x244.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so65084701fa.1
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 06:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697548388; x=1698153188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Spxr/47PEdDbY/lRrzDlxoQD8Hca6RP99fhx95nJwlE=;
 b=GXzbKmeqWVNx9VRqos3dfFIG5yRTraL5ZcD65SY0spENjPl1emlJGkwrdFbc3tvsUv
 4OtAyPcKfRFQly8QCsOUllh0dKG0NQYVAR26U7pR6Bs/umAnlHeqs4ZqRGi9rA3plV2M
 2pq/VrWo4mZHy5kU2QcgA4Mbil8JdkKJWgG8fIy3ocJmqWUtQjqLF+0HKz5UgrXIU34i
 yhIQljFcD79MFsWbb/4jJxEFLsTn/fHh/NyCsEf8nes7aTJhbU6DCSIs1mzbGGlDIl3f
 GGRKY95bagyChWy0pOJw7pZa9oyx2C4Ab8iFPba+oncHPIoFamTKHZnflDWW4C6zzztZ
 1TJA==
X-Gm-Message-State: AOJu0Yw7E53/e54Go/72NvLMMhEZeDiasfHp2CGCvWYDuTXhpUMQGwTw
 cUACmWR7Yha98bYQF/TsRJ5XqaleaQmcjhCvzqJpio3c2pnVHg==
X-Google-Smtp-Source: AGHT+IE70HNMp+xa6cFIt8vhdJPxrSotce3px8kAZavMJbhE/8+NoBdEJDbEPdjdXpBc6sprKs/jFA==
X-Received: by 2002:a2e:b1d4:0:b0:2c5:2184:c53d with SMTP id
 e20-20020a2eb1d4000000b002c52184c53dmr1764152lja.25.1697548388222; 
 Tue, 17 Oct 2023 06:13:08 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 s26-20020a05600c319a00b00405588aa40asm1880730wmp.24.2023.10.17.06.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 06:13:07 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 15:12:55 +0200
Message-ID: <20231017131257.2211225-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017131257.2211225-1-adam.duskett@amarulasolutions.com>
References: <20231017131257.2211225-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697548388; x=1698153188;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Spxr/47PEdDbY/lRrzDlxoQD8Hca6RP99fhx95nJwlE=;
 b=r1zmPYNr2NoUObd3tFC/Ugrcemu++HsQ8+aRJT5P8u5lm8Lb/jvACKBremIWyrJMl5
 KnTmx1E41DOoGOQn5vlXaODwOCwE0cVvoIfK+UcOpY3lIhCFyXKNJxc9B+hnuENFjmt8
 yk0F9wGhbsiaKJnDA+p7gKcxWK/r+p9VTROrY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=r1zmPYNr
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
aW5lLm1rCmluZGV4IDA4NjQ3NmRkY2QuLjZiMTQwZWIyYjEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
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
