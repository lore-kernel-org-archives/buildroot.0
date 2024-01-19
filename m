Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2472BC4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 12:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA74760B49;
	Fri, 19 Jan 2024 12:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA74760B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJckj_XCwNjH; Fri, 19 Jan 2024 12:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EB9E60B8B;
	Fri, 19 Jan 2024 12:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB9E60B8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1BB71BF379
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 12:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB92B80C66
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 12:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB92B80C66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBW0tUO8Ftnx for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 12:53:23 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FBF780A8D
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 12:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FBF780A8D
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e9ffab5f2so3220955e9.1
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 04:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705668800; x=1706273600;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eY2hqHF2VAGkaPsOescsEGC50TVd1TMBwKA+fGZq5dg=;
 b=uj9CvIcLyQ8GtlsEqf506SzMfkxTdFQsdPWxwxZlOE9ID4/POiFHS0/9Rj/E4mIzDX
 ez4JUN/i6HuE8Sr6QMu55JvRKmV8bfekvjyNt3VKcjw9P0ElOZO6FjULnDCaRltm9+dg
 +2kBL9ig7W6S96L4tfhfgmwsGY1E+l0Q8VMEbgmlwbL+C4Dk4B4shdX5vOBJCk6cDq0v
 y9bzyTkpOxxRL4D8EEy7C1vYMuu9V2fG/Lh/TGtjqH3YnM68+UbRExMlzsfCijjmY+1L
 XrElPffV06Q+WBEMBjkMEipyscdoCELJAyaUHyzYddXYXuxwSgYXL3183ErEyurFw6gu
 B3BQ==
X-Gm-Message-State: AOJu0Yzj0vPxpWL8HlLlqvvKu+V94ahfW7SPeDsH+xR6FY6JaYZSyPJm
 neT5KzRygoAf9/flkJ7ldIaH9v48EZbjBXhujdCcHU/+VF4QgNyxzs3Ud8Irj1CBBn8TW4mMHP4
 b
X-Google-Smtp-Source: AGHT+IH7k7BdsZmzCQS5ro34K8pP9U2BHPSDVIBa56zjcD5o63RQA9APHHdOpVIc/Ozk6/sn/PcIFw==
X-Received: by 2002:a05:600c:3595:b0:40e:5c7c:f357 with SMTP id
 p21-20020a05600c359500b0040e5c7cf357mr1326432wmq.133.1705668800539; 
 Fri, 19 Jan 2024 04:53:20 -0800 (PST)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c351000b0040e4914f28dsm32671428wmq.18.2024.01.19.04.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 04:53:20 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 19 Jan 2024 13:53:20 +0100
Message-Id: <CYIP4LD5W3RU.2MKOU2RUGWG5T@rtone.fr>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
To: "Christophe Blaess" <christophe.blaess@logilin.fr>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
X-Mailer: aerc 0.15.2
References: <20231211081730.1406640-1-christophe.blaess@logilin.fr>
 <ZXobtaqzrUQ3eXLw@landeda>
 <c12b0b06-8481-4e29-92d9-125ab8b9ab11@logilin.fr>
In-Reply-To: <c12b0b06-8481-4e29-92d9-125ab8b9ab11@logilin.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1705668800; x=1706273600; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eY2hqHF2VAGkaPsOescsEGC50TVd1TMBwKA+fGZq5dg=;
 b=Pku1rnKCY7DcKIgQVuB5aiAXdA1UTrla9pWQk0t+UYigbTq64NW2Av2xskcHMGxY01
 JbUQckKy/FZdxuuB5hRNFaoUS49+GVQNAgBnaIBid7cV3Kz+kDImsyVeTq35UWCxXC8v
 jbxmFv+/kYNVSXHcKctgrPY6vVYSwqhH2vyfQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=Pku1rnKC
Subject: Re: [Buildroot] [PATCH 1/3] configs: add support for the Raspberry
 Pi 5 board.
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCk9uIFRodSBEZWMgMTQsIDIwMjMgYXQgMzowNiBQTSBDRVQsIENocmlzdG9waGUgQmxh
ZXNzIHdyb3RlOgo+IEhlbGxvIFlhbm4gYW5kIEdhw6tsLAo+Cj4KPiA+IEdhw6tsIGhhcyBzZW50
IGFub3RoZXIgc2VyaWVzIGFib3V0IHRoZSBycGk1Ogo+ID4gICAgICBodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0zODYxNDQKPiA+Cj4g
PiBDYW4geW91IGxvb2sgYXQgaGlzIHBhdGNoIGFuZCBzZWUgd2hhdCBpcyBtaXNzaW5nIGNvbXBh
cmVkIHRvIHdoYXQgeW91Cj4gPiBkaWQ/Cj4KPiBJIHRoaW5rIHRoYXQgR2HDq2wncyBwYXRjaGVz
IGFyZSBtb3JlIGNvbXBsZXRlIHRoYW4gbWluZXMgKGVzcGVjaWFsbHkgZm9yIAo+IDE2SyBwYWdl
cyBzdXBwb3J0KS4KPgo+IEkgc3VnZ2VzdCB1c2luZyBoaXMuCj4KPiBSZWdhcmRzLAoKR2VudGxl
IHBpbmcuCgpSZWdhcmRzLApHYcOrbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
