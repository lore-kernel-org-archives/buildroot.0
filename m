Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A28C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C60FD41794;
	Tue, 19 Apr 2022 20:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZtqge88kyiT; Tue, 19 Apr 2022 20:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CE304176D;
	Tue, 19 Apr 2022 20:48:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5D361BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1B0B4176D
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qh17MzNQS9DU for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:48:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CA694177C
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:48:06 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id lc2so35284401ejb.12
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lJJMx8LkZmFNYeFSAqhR0M8Nj2IKscTHgqzNSPhqpr8=;
 b=IVuK8Ki7687AxMmWTXd7z4XZLMRoWkS6/lUhCS36voZMn4ddbIXHW21Z0v7OsTqM3D
 TfXomjGkQfqj0rgRVaqxOHqU0tAYCYHUdniXnB862EG4XRo73uAVWdLLkl1se1Q3oyz3
 pPTl0Pu/Y9v7Ni3lQtGDrhU3vJO0Zt4PqTlX0RE6CREXRgR/uRSjC4oQzHDaANUMx5/F
 Yqnwzj9eD5y4d/GjjbBTbRDmpgJ27NmbPzK/CzXzk2SUpwqtkhk2quB9HeJLZ/5YyK1/
 XxJMr9t8aQDeYPGGAlP/DGS6DUAhHkvn5uiPhFZ6A6gu1rvzcwbaccsOwtMldCSFJUkF
 SfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lJJMx8LkZmFNYeFSAqhR0M8Nj2IKscTHgqzNSPhqpr8=;
 b=YcAaG1HBmK8Q+muXOS9WBTve6z9NdH1QCPt/8k9d4UVHB4lgPszLHUtzpCj6XiFtU/
 TDRgVpAiXmSMHZluYk4BrStgIo2Y0GRGrmwgSReog601pl2Y6qtK5LRxJwZCYLsnLqRh
 iMQb/90ay1kVSOpW+MfI2URJFGvCvE1GuUlq/t5wEPyP1xlmMxi5vR932OseIDAtpU/a
 N50mbHbd6ThpTKwXfxiSCtbgMHjNkfBmbemIfKaVHjP/8S+q1qe+g3rc04uD1J1VKVSt
 Z8AlV9plescpEV4umIhFvXaK5ooE7w4KtqusyPp4KL9VhX0CW72Rqbh6e+M7oqLNZqiN
 6TzQ==
X-Gm-Message-State: AOAM533VReq2w2by9iuPe/9YV83nn5LyLPOjvF4dN0Z+dYdBUe2z/D5+
 MXn2Yl2b1ofk/5DWkr194yd380WOagrW8g==
X-Google-Smtp-Source: ABdhPJxchLEgbZUDooYd52arsInXHg+gR2vT1LKMSw+cUn/fND1eX+HZzXmEuOETjCZ8lFfCsshkMg==
X-Received: by 2002:a17:907:6e88:b0:6da:8f01:7a8f with SMTP id
 sh8-20020a1709076e8800b006da8f017a8fmr15010552ejc.619.1650401284885; 
 Tue, 19 Apr 2022 13:48:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a1709061e0b00b006eff90d9c18sm106250ejj.92.2022.04.19.13.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 13:48:04 -0700 (PDT)
Message-ID: <cbe24936-565a-09fb-d649-1e4b28cf2078@mind.be>
Date: Tue, 19 Apr 2022 22:48:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220416210750.3065016-1-fontaine.fabrice@gmail.com>
 <4391488.LvFx2qVVIh@pwmachine>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <4391488.LvFx2qVVIh@pwmachine>
Subject: Re: [Buildroot] [PATCH 1/2] package/tbb: bump to version 2021.5.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wNC8yMDIyIDE4OjMyLCBGcmFuY2lzIExhbmllbCB3cm90ZToKPiBIaS4KPiAKPiBM
ZSBzYW1lZGkgMTYgYXZyaWwgMjAyMiwgMjI6MDc6NDkgQlNUIEZhYnJpY2UgRm9udGFpbmUgYSDD
qWNyaXQgOgo+PiAtIFN3aXRjaCB0byBjbWFrZS1wYWNrYWdlCj4+IC0gRHJvcCBET19JVFRfTk9U
SUZZIHdoaWNoIGlzIG9ubHkgdXNlZCBpbiBleGFtcGxlIGFuZCB0ZXN0Cj4+IC0gbGljZW5zZSBm
aWxlIGhhcyBiZWVuIHJlbmFtZWQgdG8gTElDRU5TRS50eHQKPj4gLSBBZGQgdXBzdHJlYW0gcGF0
Y2hlcyB0byBmaXggbXVzbCBidWlsZAo+Pgo+PiBodHRwczovL3d3dy5pbnRlbC5jb20vY29udGVu
dC93d3cvdXMvZW4vZGV2ZWxvcGVyL2FydGljbGVzL3JlbGVhc2Utbm90ZXMvaW50Cj4+IGVsLW9u
ZWFwaS10aHJlYWRpbmctYnVpbGRpbmctYmxvY2tzLXJlbGVhc2Utbm90ZXMuaHRtbAo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4KCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCltzbmlwXQo+IAo+IEkgdGVzdGVkIHlv
dXIgcGF0Y2ggYW5kIGl0IGJ1aWxkcyBzdWNjZXNmdWxseSBhbmQgc3lzZGlnICgwLjI3LjEpIGlz
IHN0aWxsCj4gcnVubmluZyBsaWtlIGEgY2hhcm0uCgogIFBsZWFzZSBmb3JtYWxseSBkZWNsYXJl
IHdoZW4geW91IHJldmlld2VkIG9yIHRlc3RlZCBhIHBhdGNoLCBlLmcuCgpSZXZpZXdlZC1ieTog
RnJhbmNpcyBMYW5pZWwgPGZsYW5pZWxAbGludXgubWljcm9zb2Z0LmNvbT4KVGVzdGVkLWJ5OiBG
cmFuY2lzIExhbmllbCA8ZmxhbmllbEBsaW51eC5taWNyb3NvZnQuY29tPgoKVGhpcyBnZXRzIHBp
Y2tlZCB1cCBieSBwYXRjaHdvcmsgYW5kIHRlbGxzIHVzIGl0J3MgYSBwYXRjaCB3ZSBzaG91bGQg
cHJpb3JpdGl6ZSAKKHNpbmNlIHNvbWVvbmUgZWxzZSBhbHJlYWR5IGxvb2tlZCBhdCBpdCwgd2Ug
ZG9uJ3QgbmVlZCB0byByZXZpZXcgaXQgaW4gZGV0YWlsIAphbnkgbW9yZSkuCgoKICAoQWxzbywg
aWYgeW91IHB1dCB0ZXh0IGJlbG93IGEgdmVyeSBsb25nIHBpZWNlIG9mIHF1b3RlZCB0ZXh0LCBp
dCdzIG5pY2UgdG8gCnJlbW92ZSBwYXJ0IG9mIHRoZSBxdW90ZWQgdGV4dCBzbyB0aGUgcmVhZGVy
IGRvZXNuJ3QgbmVlZCB0byBzY3JvbGwgYXMgbXVjaC4pCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+
IFNvLCB0aGFuayB5b3UgZm9yIHRoZSBidW1waW5nIChJIHNob3VsZCBoYXZlIGRvIGl0Li4uKSBh
bmQgdGhlIHNpbXBsaWZpY2F0aW9uCj4gb2YgdGJiLm1rLgo+IAo+IAo+IEJlc3QgcmVnYXJkcy4K
PiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
