Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D2BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB1C060ECF;
	Sun, 27 Mar 2022 15:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XgRUFQgS4N7a; Sun, 27 Mar 2022 15:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1659F60E27;
	Sun, 27 Mar 2022 15:46:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 708731BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D8AA40133
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4neAbFj7YyBg for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:45:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E62440104
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:45:59 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id c62so14352885edf.5
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=c4UszGs/SBI5anTfcbedhAU8BvCm1HQGb9ICUfbJIIQ=;
 b=UMKp26d0i6vGKMJ3ObsjltzekgiSwvQ5GNWct3GAXovdOBZ4Y1C+fuqmrTGU8nE/+w
 ORQKgP2ijzagNRREs3rWyNi25C4T/joOvJME5G38D6hgo3PNgOrzN7QcxgSb9HahQlFm
 L0JQs1XpawyLtsakjHuHuwwp3Rsm/YRb4ntc/m1J/6Ox2FbEihUhN3j5TGUQXa0GgYc0
 UkqxhTiuZfqnVrCUboQKVeyobZRf0l72cD18YG7E06tIA77tXdpTiqnlrzVWfpnoYwam
 tkdeOswf0wdpyfSRQ5upfwKfHCXr9txA+KhKTq0Jfl1LhBo/OzFoZ9O6sxtsl0vydo+f
 U18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=c4UszGs/SBI5anTfcbedhAU8BvCm1HQGb9ICUfbJIIQ=;
 b=SKzyPWfKMyJs5kkpXF6xXt/mSkeMg6faen3t3VgBghn9a7GKCf/llI4D76UK1MjUKl
 i0pfg0//ZMW51Wf4UTxqyuA0v5WxuBWRMAu0QOQwlgucsi+JyRKbbovFM5hCbYaJywCU
 wXPv6algZMHffTy0b+J3S9X06ycqbL6d0lZVNAW3N/Ea16+PWunyl/pXhMmCkN8qwEUU
 B/soe+rWmZlHBEFKnzLFh7/3l7l+VuWCjkSZL4X2BhZgDtk5DnrSSSueQQ8Pq6E0NNrP
 1hdA8TE0Xf8OfFe+UwP2Rir1k3XIfHpUC7N1Njsh5ZXj2zi92ozDfQ2oJt7PNr7n0413
 2Tmw==
X-Gm-Message-State: AOAM531toAtChi9vea83Mvue9jiQsVFAzAJGttw9sigDR3ETxWYb478f
 NoJ2kbRgCSHoE3E4pU0oaiMwzg==
X-Google-Smtp-Source: ABdhPJxcjiaoGrTT1VVLjKJpUDMgwXQwehdqSpct41IrSkG+tBPZhKwd2CjPnnQr0OSacPVn1K9tPQ==
X-Received: by 2002:a05:6402:168a:b0:3fb:600e:4cc3 with SMTP id
 a10-20020a056402168a00b003fb600e4cc3mr11007328edv.32.1648395957675; 
 Sun, 27 Mar 2022 08:45:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a17090672cd00b006df86017b61sm4755285ejl.105.2022.03.27.08.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:45:57 -0700 (PDT)
Message-ID: <217207ff-69d0-5f8c-6fa0-8139f38bee63@mind.be>
Date: Sun, 27 Mar 2022 17:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220319094939.1588302-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220319094939.1588302-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] boot/optee-os: fix version choice
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wMy8yMDIyIDEwOjQ5LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IENvbW1pdCBjNWQ0
NDFiN2YyZWUgKGJvb3Qvb3B0ZWUtb3M6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjApIGZvcmdvdCB0
bwo+IHByb3BhZ2F0ZSB0aGUgcnVzdGMgYXJjaCBkZXBlbmRlbmN5IGZyb20gdGhlIG5ldyB2ZXJz
aW9uLCB0byB0aGUgZGVmYXVsdAo+IGNsYXVzZSBvZiB0aGUgY2hvaWNlLgo+IAo+IFRoaXMgbGVh
dmVzIG9ubHkgdGhlIGN1c3RvbSBnaXQgdHJlZSBhcyBhIHBvc2libGUgc291cmNlIGZvciBidWls
ZGluZwo+IE9QLVRFRSBPUyBpbiBjYXNlIHRoZSBob3N0IGNhbid0IGhhdmUgYSBydXN0YyBjb21w
aWxlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThA
ZnJlZS5mcj4KPiBSZXBvcnRlZC1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9u
aUBib290bGluLmNvbT4KPiBDYzogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3Rs
aW4uY29tPgo+IENjOiBFdGllbm5lIENhcnJpZXJlIDxldGllbm5lLmNhcnJpZXJlQGxpbmFyby5v
cmc+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+
IC0tLQo+ICAgYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gfCAyICstCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC9v
cHRlZS1vcy9Db25maWcuaW4gYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+IGluZGV4IDE4ZTFl
ZmVlNTUuLjMwYjZmNjI0MzQgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4K
PiArKysgYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+IEBAIC0xMyw3ICsxMyw3IEBAIGlmIEJS
Ml9UQVJHRVRfT1BURUVfT1MKPiAgIAo+ICAgY2hvaWNlCj4gICAJcHJvbXB0ICJPUC1URUUgT1Mg
dmVyc2lvbiIKPiAtCWRlZmF1bHQgQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1QKPiArCWRlZmF1
bHQgQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1QgaWYgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19B
UkNIX1NVUFBPUlRTCj4gICAJaGVscAo+ICAgCSAgU2VsZWN0IHRoZSB2ZXJzaW9uIG9mIE9QLVRF
RSBPUyB5b3Ugd2FudCB0byB1c2UKPiAgIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
