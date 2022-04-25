Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9020C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 21:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A30E640B21;
	Mon, 25 Apr 2022 21:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GL9kEHROqCzA; Mon, 25 Apr 2022 21:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A883940B1F;
	Mon, 25 Apr 2022 21:32:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24C7C1BF3A6
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 221AF82ADD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iw0eqVv3Eohh for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 21:32:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04AF8827FB
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 21:32:28 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id i27so32150277ejd.9
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8u7ELbaiCL6iFkTGSadyt/S131J+yfHyWoKQtaeErc8=;
 b=Lt84RoqNXowcGsRp+7ptA/FdVV1x1EL6eJuz2pcveCi0X76i5xCouCT9fWGuos7mpa
 EVdDrxooi72scl086xzqlIR+NAV/GuF5z49Ml8hBSqxLlvLjFvE8fBJNluX98L3cXUvA
 vZ9v5U4F29QVKQs35ElXSYuorDkU8lhGs6Eef3UZvwAQ2KuAhapX7Su76XMi/VlQujg/
 ve/n5h9KuSVtEb5/mdOL0erHj/+XBBYuXpdU7D9ONX80k+tHp8y6LVJWUTR0LvopOsbN
 oy6xO7s/CGn/DYOlCDp9WBObT1z6DDFQxDHjwaZDhpc5hqLkFxKw+kuYmTayS1Br/J+k
 duDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8u7ELbaiCL6iFkTGSadyt/S131J+yfHyWoKQtaeErc8=;
 b=sbNbUoDuVpFAbfRLBDNF0VJYVJzUEgIVkg9xoPEkdtBhg388e9c/n5YcURZFtBne0c
 PTujDNNDytAbpWh9/vC/11xiglsIODo22Tbxs8olivPU99B292aC1jEVIokCYSm4I9Nl
 MYwTKWFqTqo4AWpQo+aioKshRqsQknw7yfb4Ei+F/yj8lqkfspOLsiCMxBMwbeW9mkfZ
 NGpzOQ1eU8yq6CFAcIdbOJCBtKJ45nPl2tIVKrCNlRp3M+lDVpofugvOF+fKi7nfm2un
 G40CLl94vkvnKiYONGbVNrxRUR7zrC+SnwX7w3IrHOk8i3LY34SvHxZy1T2LMtWlOyFe
 qlhQ==
X-Gm-Message-State: AOAM531CYZydC2Lk2HOr1tuYTHwBrl7RxvygXOyhb+7unFebLZwzwJru
 T+tVsrcqIa44GbfDdfKXhs5QL6btwnccgA==
X-Google-Smtp-Source: ABdhPJwUcvlDYEeQqfU6ggMAU9xzWGLX544IQoU1euZKk7dI2BaB/A7CyKZCtcbis96Jrx7IGlEr8w==
X-Received: by 2002:a17:907:1b09:b0:6d8:faa8:4a06 with SMTP id
 mp9-20020a1709071b0900b006d8faa84a06mr18168781ejc.701.1650922347296; 
 Mon, 25 Apr 2022 14:32:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 22-20020a17090600d600b006dfbc46efabsm3968906eji.126.2022.04.25.14.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:32:26 -0700 (PDT)
Message-ID: <7e1c1baa-0f41-57e2-6260-51bd565b7029@mind.be>
Date: Mon, 25 Apr 2022 23:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
 <20220424213958.1747120-2-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424213958.1747120-2-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v7 2/5] package/pkg-python.mk: remove
 hardcoded paths for host Python
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
Cc: =?UTF-8?B?0KDQvtC80LDQvSDQlNC+0L3Rh9C1?= =?UTF-8?B?0L3QutC+?=
 <dpb@corrigendum.ru>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNC8wNC8yMDIyIDIzOjM5LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBGcm9tOiDQoNC+
0LzQsNC9INCU0L7QvdGH0LXQvdC60L4gPGRwYkBjb3JyaWdlbmR1bS5ydT4KPiAKPiBXaGVuIGlu
c3RhbGxlciBpcyB1c2VkIHRvIGluc3RhbGwgcGFja2FnZXMgZm9yIGhvc3QgUHl0aG9uLCBpdCBj
YW4gZmlndXJlCj4gb3V0IGJ5IGl0c2VsZiB3aGljaCBwYXRocyB0byB1c2UuIFdlIGp1c3QgbmVl
ZCB0byB1c2UgdGhlIGluc3RhbGxlciBDTEkKPiBpbnN0ZWFkIG9mIG91ciB3cmFwcGVyIHNjcmlw
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiDQoNC+0LzQsNC9INCU0L7QvdGH0LXQvdC60L4gPGRwYkBj
b3JyaWdlbmR1bS5ydT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGls
bGlhcmQxQGdtYWlsLmNvbT4KCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVnYXJk
cywKICBBcm5vdXQKCj4gLS0tCj4gQ2hhbmdlcyB2NCAtPiB2NToKPiAgICAtIGFkZCByZWJhc2Vk
IHJlbW92ZSBoYXJkY29kZWQgcGF0aHMgcGF0Y2gKPiAtLS0KPiAgIHBhY2thZ2UvcGtnLXB5dGhv
bi5tayB8IDEyICsrLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLXB5dGhvbi5t
ayBiL3BhY2thZ2UvcGtnLXB5dGhvbi5tawo+IGluZGV4IDJlNzcwNGEwYTkuLjE1NDgxMGUxY2Mg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctcHl0aG9uLm1rCj4gKysrIGIvcGFja2FnZS9wa2ct
cHl0aG9uLm1rCj4gQEAgLTE0NiwxNCArMTQ2LDYgQEAgSE9TVF9QS0dfUFlUSE9OX1BFUDUxN19F
TlYgPSBcCj4gICAJUFlUSE9OTk9VU0VSU0lURT0xIFwKPiAgIAkkKEhPU1RfQ09ORklHVVJFX09Q
VFMpCj4gICAKPiAtSE9TVF9QS0dfUFlUSE9OX1BFUDUxN19JTlNUQUxMX09QVFMgPSBcCj4gLQkt
LWludGVycHJldGVyPS9iaW4vcHl0aG9uIFwKPiAtCS0tc2NyaXB0LWtpbmQ9cG9zaXggXAo+IC0J
LS1wdXJlbGliPSQoSE9TVF9ESVIpL2xpYi9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikv
c2l0ZS1wYWNrYWdlcyBcCj4gLQktLWhlYWRlcnM9JChIT1NUX0RJUikvaW5jbHVkZS9weXRob24k
KFBZVEhPTjNfVkVSU0lPTl9NQUpPUikgXAo+IC0JLS1zY3JpcHRzPSQoSE9TVF9ESVIpL2JpbiBc
Cj4gLQktLWRhdGE9JChIT1NUX0RJUikKPiAtCj4gICBIT1NUX1BLR19QWVRIT05fUEVQNTE3X0JP
T1RTVFJBUF9JTlNUQUxMX09QVFMgPSBcCj4gICAJLS1pbnN0YWxsZGlyPSQoSE9TVF9ESVIpL2xp
Yi9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikvc2l0ZS1wYWNrYWdlcwo+ICAgCj4gQEAg
LTIyNSwxMSArMjE3LDExIEBAIGlmZXEgKCQoMSksaG9zdC1weXRob24tZmxpdC1jb3JlKQo+ICAg
Iwo+ICAgJCgyKV9CQVNFX0lOU1RBTExfQ01EID0gLW0gYm9vdHN0cmFwX2luc3RhbGwgZGlzdC8q
ICQkKEhPU1RfUEtHX1BZVEhPTl9QRVA1MTdfQk9PVFNUUkFQX0lOU1RBTExfT1BUUykKPiAgIGVs
c2UKPiAtJCgyKV9CQVNFX0lOU1RBTExfQ01EID0gJChUT1BESVIpL3N1cHBvcnQvc2NyaXB0cy9w
eWluc3RhbGxlci5weSBkaXN0LyogJCQoSE9TVF9QS0dfUFlUSE9OX1BFUDUxN19JTlNUQUxMX09Q
VFMpCj4gKyQoMilfQkFTRV9JTlNUQUxMX0NNRCA9IC1tIGluc3RhbGxlciBkaXN0LyoKPiAgIGVu
ZGlmCj4gICBlbHNlCj4gICAkKDIpX0JBU0VfQlVJTERfQ01EID0gLW0gYnVpbGQgLW4gLXcKPiAt
JCgyKV9CQVNFX0lOU1RBTExfQ01EID0gJChUT1BESVIpL3N1cHBvcnQvc2NyaXB0cy9weWluc3Rh
bGxlci5weSBkaXN0LyogJCQoSE9TVF9QS0dfUFlUSE9OX1BFUDUxN19JTlNUQUxMX09QVFMpCj4g
KyQoMilfQkFTRV9JTlNUQUxMX0NNRCA9IC1tIGluc3RhbGxlciBkaXN0LyoKPiAgIGVuZGlmCj4g
ICBlbmRpZgo+ICAgZWxzZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
