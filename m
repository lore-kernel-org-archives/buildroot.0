Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D37C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87A1160B95;
	Thu,  6 Jan 2022 22:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bn7aNfiqAR7C; Thu,  6 Jan 2022 22:42:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA81B60B62;
	Thu,  6 Jan 2022 22:42:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C3F01BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E01F3404BD
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWWUZsfNQU8q for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:42:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF4A7400E5
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:42:23 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r17so7632007wrc.3
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cWLgL86Ei+Y4rH+ZeAXxaHgvgnrRzOfd35XARUSsT7Q=;
 b=EVnqVtGKOkvD6/BhIq0U8nl3bqouH9L/t79JWEymveeW3MTohm74hLs1nsJkqm72AB
 fbKRCKtihvgge23U1e4wP1q+BchZ79He2a44185uWdQxlamUr8FZ24O4n22T670fkVoT
 m/IVLyLU38GheiBgdgUNs/pRRVeRnrN0EZaR9a8Zc9xEdHyaMNtkZ6dhK5THEuNDfKTw
 JG95P+KQO4innI/FyfL/jlv0YDqX00IBeU39J4Xn3Ka0Ki5/bxDMjnEq7WE6kjj2Pp3z
 hZfJ1PZ5AbAZMUK2+jWhJiNBKgsitT+zvyHx5/FyOAo8fxuDej/e3QO2vgtI1IfUeF3L
 pG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cWLgL86Ei+Y4rH+ZeAXxaHgvgnrRzOfd35XARUSsT7Q=;
 b=GZfyecQMC8DKwtN0J7wujf49zLCF1HnCw/e2fC7NV40+zdS+VC5EcjggNCVOsAMdCG
 VsJ0s5Q5chrHC7gT+VU/rWO3Il4vO9FTjh64isjQlXLnzhJ15ZIjU1lbXrpLkUahg1yx
 8cNdYeypnrY1+vJynoMfyWbVwgyxaD/UzZiAX/JYGE7PnSRImjEtfBk58NP1n5ozLl/z
 AqhJpvIp7YqU5+tKP5x3BFJxLvgs2Hp0+X2lWVeRQtJl1UoiGO4gKGu3Ln+HkXwL8fHi
 8hVnnZpdebafheNb4tc2hPbMw0Km/Mq+hpWJR11m7lCmpFm5VzpGeZSP48+Y4/pbNnpO
 18cg==
X-Gm-Message-State: AOAM530sq5Ehxl6cBIow41AfhTuhO6HbfF5RGlTFGnnNj+ry39E9Uaq5
 jMQv/TqMx7PhFQl/lK7cAqb+4Q==
X-Google-Smtp-Source: ABdhPJwEMbGOv7Rtv4FIYaJwtROaJmiO80C+oTtPXDowTKLzglyQ0IipBx2Keqy4baPsWbVznFEBkg==
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr22768018wrq.681.1641508942040; 
 Thu, 06 Jan 2022 14:42:22 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id y3sm3169239wrq.12.2022.01.06.14.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 14:42:21 -0800 (PST)
Message-ID: <9d963724-22c3-3f38-0535-8e0328e0f2f8@smile.fr>
Date: Thu, 6 Jan 2022 23:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20200603081253.14319-1-heiko.thiery@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20200603081253.14319-1-heiko.thiery@gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/1] utils/check-package: add a check for
 the new spacing convention
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAwMy8wNi8yMDIwIMOgIDEwOjEyLCBIZWlrbyBUaGllcnkgYSDDqWNyaXTCoDoK
PiBUaGUgc2VwZXJhdGlvbiBvZiB0aGUgZmllbGRzIGluIHRoZSBoYXNoIGZpbGUgc2hvdWxkIGJl
IDIgc3BhY2VzIGZvcgo+IGNvbnNpc3RlbmN5LgoKVGhlcmUgYXJlIHN0aWxsIGEgaHVnZSBudW1i
ZXIgb2Ygd2FybmluZ3Mgd2hlbiB0aGlzIHBhdGNoIGlzIGFwcGxpZWQsIGJlY2F1c2UKdGhlcmUg
YXJlIG1hbnkgcGFja2FnZXMgc3RpbGwgbm90IGZpeGVkLgoKQmVzdCByZWdhcmRzLApSb21haW4K
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29t
Pgo+IENjOiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiBDYzogVGhv
bWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiAtLS0KPiB2MSAt
PiB2MjoKPiAgIHJlbW92ZWQgcmUuZXNjYXBlKCkKPiAKPiB2MiAtPiB2MzoKPiAgIHJlLWFkZCBy
ZS5lc2NhcGUgYW5kIHJlbW92ZWQgJ14nIGFuZCAnJCcgZnJvbSByZWdleHAgYmVjYXVzZSB0aGV5
IGFsc28gYXJlCj4gICBlc2NhcGVkIGJ5IHJlLmVzY2FwZSgpLgo+IAo+ICAgTm93ICdtYWtlIGNo
ZWNrLXBhY2thZ2UnIHdpbGwgbm90IHRocm93IGFueSBleGNlcHRpb25zLgo+IAo+ICAgQWZ0ZXIg
Y29udmVyc2lvbiBhbGwgaGFzaCBmaWxlcyB0byB0aGUgcmlnaHQgZm9ybWF0IG5vIG1vcmUgd2Fy
bmluZ3MKPiAgIHdpbGwgb2NjdXJlOgo+IAo+ICAgT25lbGluZXIgcHJvdmlkZWQgYnkgWWFubiB3
aWxsIGRvIHRoYXQgam9iOgo+ICAgJCBmaW5kIC4gLXR5cGUgZiAtbmFtZSAnKi5oYXNoJyAtcHJp
bnQwIHx4YXJncyAtMCBzZWQgLXIgLWkgLWUgJ3MvXihtZDV8c2hhKDF8MjI0fDI1NnwzODR8NTEy
KSlbWzpzcGFjZTpdXSsoW15bOnNwYWNlOl1dKylbWzpzcGFjZTpdXSsoLispJC9cMSAgXDMgIFw0
LycKPiAKPiAtLS0KPiAgdXRpbHMvY2hlY2twYWNrYWdlbGliL2xpYl9oYXNoLnB5IHwgNiArKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS91dGlscy9jaGVja3BhY2thZ2VsaWIvbGliX2hhc2gucHkgYi91dGlscy9j
aGVja3BhY2thZ2VsaWIvbGliX2hhc2gucHkKPiBpbmRleCAzZTM4MTExOWE1Li5hNzJlOGFmMGI5
IDEwMDY0NAo+IC0tLSBhL3V0aWxzL2NoZWNrcGFja2FnZWxpYi9saWJfaGFzaC5weQo+ICsrKyBi
L3V0aWxzL2NoZWNrcGFja2FnZWxpYi9saWJfaGFzaC5weQo+IEBAIC00MCw3ICs0MCw3IEBAIGNs
YXNzIEhhc2hUeXBlKF9DaGVja0Z1bmN0aW9uKToKPiAgICAgICAgICBpZiBsZW4oZmllbGRzKSA8
IDI6Cj4gICAgICAgICAgICAgIHJldHVybgo+ICAKPiAtICAgICAgICBodHlwZSwgaGV4YSA9IGZp
ZWxkc1s6Ml0KPiArICAgICAgICBodHlwZSwgaGV4YSwgZmlsZW5hbWUgPSBmaWVsZHNbOjNdCj4g
ICAgICAgICAgaWYgaHR5cGUgPT0gIm5vbmUiOgo+ICAgICAgICAgICAgICByZXR1cm4KPiAgICAg
ICAgICBpZiBodHlwZSBub3QgaW4gc2VsZi5sZW5fb2ZfaGFzaC5rZXlzKCk6Cj4gQEAgLTUzLDMg
KzUzLDcgQEAgY2xhc3MgSGFzaFR5cGUoX0NoZWNrRnVuY3Rpb24pOgo+ICAgICAgICAgICAgICAg
ICAgICAgIC5mb3JtYXQoc2VsZi5maWxlbmFtZSwgbGluZW5vLCBzZWxmLnVybF90b19tYW51YWwp
LAo+ICAgICAgICAgICAgICAgICAgICAgIHRleHQsCj4gICAgICAgICAgICAgICAgICAgICAgImV4
cGVjdGVkIHt9IGhleCBkaWdpdHMiLmZvcm1hdChzZWxmLmxlbl9vZl9oYXNoW2h0eXBlXSldCj4g
KyAgICAgICAgaWYgbm90IHJlLm1hdGNoKHJlLmVzY2FwZSgie30gIHt9ICB7fSIuZm9ybWF0KGh0
eXBlLCBoZXhhLCBmaWxlbmFtZSkpLCB0ZXh0KToKPiArICAgICAgICAgICAgcmV0dXJuIFsie306
e306IHNlcGFyYXRpb24gZG9lcyBub3QgbWF0Y2ggZXhwZWN0YXRpb24gIgo+ICsgICAgICAgICAg
ICAgICAgICAgICIoe30jYWRkaW5nLXBhY2thZ2VzLWhhc2gpIgo+ICsgICAgICAgICAgICAgICAg
ICAgIC5mb3JtYXQoc2VsZi5maWxlbmFtZSwgbGluZW5vLCBzZWxmLnVybF90b19tYW51YWwpLCB0
ZXh0XQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
