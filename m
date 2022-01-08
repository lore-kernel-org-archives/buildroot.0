Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE7AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5967E40159;
	Sat,  8 Jan 2022 18:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJbZxMMWchmg; Sat,  8 Jan 2022 18:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66C5C40136;
	Sat,  8 Jan 2022 18:43:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1A41BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67C2B60A73
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9zSWlG5QZBo for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:43:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC9E1607B5
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:43:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l25so7158300wrb.13
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 10:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Bov6hHHeH39q46EL0DjoGSsv4TYPbU9prrH5DTwYGK8=;
 b=LRkX5e/BNnhwMsb50wamP35jJUdzQgH/SAPQOjIE5VlkauJ6jdVjMz/P4lU0nTqAUi
 9qq3YLh8dBi3LBaJFoXUd+gTNYXhW2Ap0GHSC1WOYNJGs6eySBgjOuDwf4JQnGJfakSb
 uBCqSaT5k+zMV98gSl8eCs4fTXF9gtpievXUP+qyyJPH8jIXtcnRORApr8u3g3+EggGa
 JQJplE8FrhA9aElEXakgWhDwi2HD6dCG1Yrx/nuF7d001GK4czZHASwmT3bZ6uNIy7eM
 PdqJI1vy1GBDogR+hrzB0v4p00uY76g57OtRg27sJ6ahAxGUwQD/5sUk9qZ2taDgH7m0
 todQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bov6hHHeH39q46EL0DjoGSsv4TYPbU9prrH5DTwYGK8=;
 b=BvAp3VnQQ80yFEyQ6S/Gm/OmqgsHBtXSoYO8o1WITvdjld98F50IUZLCOVl2XwExqA
 KG2Nyw0ieT1hSgj0f9x+CFrCEFhA3o4t3guohBJts10zkjgsi9V2n/7N5hXBs1J+FviG
 DQGgLsmsRZLi6yK6ieRNzvXpTR0snfhENrXM2b/RMUGjixrU9poHgZ6Kug93jiJ/qCou
 Spt6Db99rHXcU52KZEWJU5XP+JQuychRQSv4H5a5sJTTSmIVVe2kPVZZGrO8ppmEzUGc
 Fi89qOwj/6defkSE3Jvguwk/vFmLTbTIPApv4KoYO5cLkymNqGeVUM73Qd8rwQqJF4Pb
 ZBMQ==
X-Gm-Message-State: AOAM530PApXjp/QrRZ+yBobGJRAUdCMFted1D6K55gxUolgQNWZAWGuq
 7uWlLRmY3wS3Nr5irLL9YxxA1T4kXRgAUA==
X-Google-Smtp-Source: ABdhPJx3fMgap1IPXrKHAsq7k22GB4QESR2r7C4alMkfjFVpUppufkwbVWjIJJwsffwgzAplI3PPrA==
X-Received: by 2002:a05:6000:1e08:: with SMTP id
 bj8mr15183070wrb.10.1641667392755; 
 Sat, 08 Jan 2022 10:43:12 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id 14sm2460129wry.23.2022.01.08.10.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 10:43:12 -0800 (PST)
Message-ID: <382b2896-92a6-4a75-0093-bea2b6f91bf9@smile.fr>
Date: Sat, 8 Jan 2022 19:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Cyril Bur <cyrilbur@gmail.com>, buildroot@buildroot.org
References: <20210623145231.19243-1-cyrilbur@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20210623145231.19243-1-cyrilbur@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/python-greenlet: enable as host
 package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAyMy8wNi8yMDIxIMOgIDE2OjUyLCBDeXJpbCBCdXIgYSDDqWNyaXTCoDoKCldo
eT8KClRoZXJlIGlzIG5vdCBwYWNrYWdlIHVzaW5nIGhvc3QtcHl0aG9uLWdyZWVubGV0IGluIHRo
ZSB0cmVlLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gU2lnbmVkLW9mZi1ieTogQ3lyaWwgQnVy
IDxjeXJpbGJ1ckBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uLWdyZWVubGV0L3B5
dGhvbi1ncmVlbmxldC5tayB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
PiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZ3JlZW5sZXQvcHl0aG9uLWdyZWVubGV0
Lm1rIGIvcGFja2FnZS9weXRob24tZ3JlZW5sZXQvcHl0aG9uLWdyZWVubGV0Lm1rCj4gaW5kZXgg
MDFkNTc4YTE4My4uZTkwZDFjMGY1NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1ncmVl
bmxldC9weXRob24tZ3JlZW5sZXQubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1ncmVlbmxldC9w
eXRob24tZ3JlZW5sZXQubWsKPiBAQCAtMTIsMyArMTIsNCBAQCBQWVRIT05fR1JFRU5MRVRfTElD
RU5TRSA9IE1JVCwgUFNGLTIuMAo+ICBQWVRIT05fR1JFRU5MRVRfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UgTElDRU5TRS5QU0YKPiAgCj4gICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKPiArJChl
dmFsICQoaG9zdC1weXRob24tcGFja2FnZSkpCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
