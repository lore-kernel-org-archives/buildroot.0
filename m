Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E02CC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 22:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA92360D5C;
	Mon,  6 Feb 2023 22:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA92360D5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9TWVcwg6ZDq; Mon,  6 Feb 2023 22:48:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD01D60C30;
	Mon,  6 Feb 2023 22:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD01D60C30
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCF2C1BF422
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 22:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4BF740520
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 22:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4BF740520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXan9P3bYP_A for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 22:48:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DECE4016B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DECE4016B
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 22:48:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id z13so2335420wmp.2
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 14:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eM11cqdXzPcyY0HQNLbg8kHMht6NsIcppYD6Vx+aSSA=;
 b=RWLUsFCVGb2RGuveOCh+HnDbC4CbO2aLBF+xDphY5G1gaBj/kkUoh7GrJ1Rid2zZcI
 CbmxxNA3C9FEZrObUwtkFNmkKaIFMJ2c/LrCDo2kdgu7o8yTuiKb//w/7qhQaGehhOrT
 zcxK1VIR1W4Bz4QwZWvOSoDu0I1KNSQsRAkoEwH7+aJyi3HD26VHPpuZrHKrQMIjYK9p
 M20k2IYcqdccnnn2SIACzy96zASYV+UoiHXs7UEScPolq2VeD+rs9h9r3wDaMmw/LbwY
 b6vO1ZH/RTbCOP5epESIBGhWzF0gJfHT4lwBA9ch9+2U4mgQkZPcsSgoftDrvZR8FM9G
 4rkQ==
X-Gm-Message-State: AO0yUKX268RcHrkWufOg81GeOy3Y3x/w4pARh8FWzlf/r9f/5SZZqiMm
 dy9G28dtPIrmHmzswJt8cwDszQ==
X-Google-Smtp-Source: AK7set+LxDrb8DZXZWqk7buUsaTHhV1X3tbnMXHKU5pRNFRWDU/PuKSnnp7tt+vCqHLPQVL5ztPonQ==
X-Received: by 2002:a7b:c8c6:0:b0:3df:9858:c03b with SMTP id
 f6-20020a7bc8c6000000b003df9858c03bmr12519820wml.16.1675723693842; 
 Mon, 06 Feb 2023 14:48:13 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c19d000b003dd1b00bd9asm12975587wmq.32.2023.02.06.14.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 14:48:13 -0800 (PST)
Message-ID: <350106ad-b8a0-9fbf-5fc2-cf41bd32a93b@smile.fr>
Date: Mon, 6 Feb 2023 23:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, buildroot@buildroot.org
References: <20220616020353.497241-1-uwu@icenowy.me>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220616020353.497241-1-uwu@icenowy.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eM11cqdXzPcyY0HQNLbg8kHMht6NsIcppYD6Vx+aSSA=;
 b=1KMO+KwF02vSFh1RvSy51mXIChxxBmRTCm6f8gAJ9BQHiGrShLtnxUm+5D1pu8xgsP
 6M1YchoLXg4jTZMPiHuXoIQMNSBUsPuwrfXJI0gHCU0F955t61QEairaH6fN1L85STbH
 KH2lij+IH9KA1FVgzA9+xSJ83btm/ajLEwiCIMqU2kazVLEjI1NicP4K8WXqkOHM/XZo
 oIjkcALQVxN2xNe0beflQxCOX0jfkvQs/iWAANen8Df4XpSKePczgbUp/78pJ/FI4dtS
 fgni/snWVO7jWY9ZN9LotijId1QXBL9eIQUL4FTedo+1t2yqZ5JeyuqRVM3cjiFFGhYu
 D3zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=1KMO+KwF
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: ignore error when
 chmod'ing extracted source
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxNi8wNi8yMDIyIMOgIDA0OjAzLCBJY2Vub3d5IFpoZW5nIGEgw6ljcml0wqA6
Cj4gVGhlIGNobW9kIGNvbW1hbmQgaW5jbHVkZWQgaW4gR05VIGNvcmV1dGlscyA5LjAgd2lsbCBl
eGl0IHdpdGggMSB3aGVuIGluCj4gYSByZWN1cnNpdmUgYSBzeW1saW5rIGlzIG1ldCBhbmQgdGhl
IG1vZGUgb2YgYm90aCBpdHNlbGYgYW5kIGl0cyB0YXJnZXQKPiBpcyByZXRhaW5lZDsgaG93ZXZl
ciB0aGlzIHNpdHVhdGlvbiBpcyB1c3VhbGx5IGV4cGVjdGVkIChzdWNoIGtpbmQgb2YKPiBzeW1s
aW5rIGV4aXN0cyBpbiwgZS5nLiwgYSBuZXdseSBleHRyYWN0ZWQgdGFyYmFsbCBvZiBMaW51eCBr
ZXJuZWwpLAo+IHRodXMgbm90IGEgZmFpbHVyZS4KPiAKPiBDb25zaWRlcmluZyB0aGlzIGNobW9k
IGNhbGwgaXMgb25seSBraW5kIG9mIHZhbmlzaGluZywgaWdub3JlIGVycm9yIGZvcgo+IGl0LgoK
VGhhbmtzIGZvciB0aGUgcmVwb3J0LCBpdCBzZWVtcyB0aGF0IEdOVSBjb3JldXRpbHMgY2htb2Qg
OS4wIGhhZCBhIHJlZ3Jlc3Npb24KWzFdIHRoYXQgaGFzIGJlZW4gZml4ZWQgaW4gR05VIGNvcmV1
dGlscyA5LjEuCgpJJ20gbm90IHN1cmUgaWYgd2Ugc2hvdWxkIGFwcGx5IHRoaXMgd29ya2Fyb3Vu
ZCBub3cgdGhhdCBjb3JldXRpbHMgaXMgZml4ZWQuCgpbMV0gaHR0cHM6Ly9kZWJidWdzLmdudS5v
cmcvY2dpL2J1Z3JlcG9ydC5jZ2k/YnVnPTUwNzg0CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiAtLS0KPiAg
cGFja2FnZS9wa2ctZ2VuZXJpYy5tayB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWdlbmVy
aWMubWsgYi9wYWNrYWdlL3BrZy1nZW5lcmljLm1rCj4gaW5kZXggYjIzM2IwNzU0OC4uMDNlNGIw
MjliMyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy1nZW5lcmljLm1rCj4gKysrIGIvcGFja2Fn
ZS9wa2ctZ2VuZXJpYy5tawo+IEBAIC0yMTYsNyArMjE2LDcgQEAgJChCVUlMRF9ESVIpLyUvLnN0
YW1wX2V4dHJhY3RlZDoKPiAgCSQoUSlta2RpciAtcCAkKEBEKQo+ICAJJCgkKFBLRylfRVhUUkFD
VF9DTURTKQo+ICAjIHNvbWUgcGFja2FnZXMgaGF2ZSBtZXNzZWQgdXAgcGVybWlzc2lvbnMgaW5z
aWRlCj4gLQkkKFEpY2htb2QgLVIgK3J3ICQoQEQpCj4gKwktJChRKWNobW9kIC1SICtydyAkKEBE
KQo+ICAJJChmb3JlYWNoIGhvb2ssJCgkKFBLRylfUE9TVF9FWFRSQUNUX0hPT0tTKSwkKGNhbGwg
JChob29rKSkkKHNlcCkpCj4gIAlAJChjYWxsIHN0ZXBfZW5kLGV4dHJhY3QpCj4gIAkkKFEpdG91
Y2ggJEAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
