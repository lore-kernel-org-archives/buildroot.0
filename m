Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAFBC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE8FD83F2B;
	Fri, 13 May 2022 21:52:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfP6A9Wo5Kyy; Fri, 13 May 2022 21:52:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 016F883ED7;
	Fri, 13 May 2022 21:52:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7603B1BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64AD440895
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OtxBkM6_cZxD for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:52:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06E8B4050F
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:52:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l18so18574312ejc.7
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GY/+03oXmJS4TnApjoCSDN9QDnpgstK7+iNmRpE67IQ=;
 b=AwvP07xVj1jZvHC23OHQ3tSfPXDyU9VhrxJgFipPxLdXrZUZRZzIDk4rXdMbsswy5I
 dKW3LsxNw9FGedInSG5ForlcKOpjEo1FF6a4+xxTo86hH0D7/jYgY13gqE4qAOE9pVis
 QwBS8z+cExLWVccJQ4H5d/Mjo7PczeOPqFRxkR2P9vyqqhceGITuIxACs+s8I0DSu+ct
 q+FnJwq+bZQH9LOsTfgfoLIAl/ibmu5UdPmNjRZCaOM+Bvx8drPigLNg+uw15NcT6Tjo
 FZ1oi7jSWA7hVxdy5gDLT+8sOX+G9O/nZV6WNlz3OIA1RDvSY668G98Uz9GZnz9HSO8Z
 DM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GY/+03oXmJS4TnApjoCSDN9QDnpgstK7+iNmRpE67IQ=;
 b=7Ma7xsCR8L1guPOEJUq68XbTy286nlJoNNK6Oi3pbawQ/ifhDGi6BymrBjMKHRvJs8
 QIvlV9ZseDiaH6FkRDtWQT11zknANsqXffbt5AfXUFGCWBe+7UmNRJ3PCTCx11dfVFj8
 Uwi2mM/9++Yr8ZLphI5Bb5rod4uNFtv1mMG9j0oTd0Q0xL+/+zBwD4fynCxKOX1KObcF
 aKYAj2aayW8F+dnisWbLyH9nMeKRn7X8YzA3g+dGDQYW3L9Y5uXEQLFD34KA1/OeOBvl
 Rv6/z59CPHb45F2MqUDKLPo39qy+5RpFVVz86mFwi81Ud8Tmm18Otjxnan+6MS9EnhYy
 6hvA==
X-Gm-Message-State: AOAM530ORyNjIM21xI8GG7dpSd6lMLoIVSHyNJ9f6UchzqP+NcKkpyNn
 nGHijR/258RvVMsl+P4MPN5JUkBRM6GbMA==
X-Google-Smtp-Source: ABdhPJznpZHUfi41z/JBQQHL9Em+r+EXlrrf3itQiYBP/84hVm+4BdAPuhHIQ/POxcjblnRziDaTiQ==
X-Received: by 2002:a17:907:72ca:b0:6f9:8675:6a2a with SMTP id
 du10-20020a17090772ca00b006f986756a2amr6078080ejc.98.1652478733189; 
 Fri, 13 May 2022 14:52:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a170907272400b006f3ef214dfesm1162360ejl.100.2022.05.13.14.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:52:12 -0700 (PDT)
Message-ID: <a18d0411-9134-2ee7-62d0-4ba6a1780846@mind.be>
Date: Fri, 13 May 2022 23:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20220510022055.67582-1-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220510022055.67582-1-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] linux: Fix powerpc64le defconfig selection
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
Cc: mpe@ellerman.id.au
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8wNS8yMDIyIDA0OjIwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4gVGhlIGRlZmF1bHQg
ZGVmY29uZmlnIHRhcmdldCBmb3IgdGhlIDY0IGJpdCBwb3dlcnBjIGtlcm5lbCBpcwo+IHBwYzY0
X2RlZmNvbmZpZywgdGhlIGJpZyBlbmRpYW4gY29uZmlndXJhdGlvbi4KPiAKPiBXaGVuIGJ1aWxk
aW5nIGZvciBwb3dlcnBjNjRsZSB1c2VycyB3YW50IHRoZSBsaXR0bGUgZW5kaWFuIGtlcm5lbCBh
cwo+IHRoZXkgY2FuJ3QgYm9vdCBMRSB1c2Vyc3BhY2Ugb24gYSBCRSBrZXJuZWwuCj4gCj4gRml4
IHVwIHRoZSBkZWZjb25maWcgdXNlZCBpbiB0aGlzIGNhc2UuIFRoaXMgd2lsbCBhdm9pZCB0aGUg
Zm9sbG93aW5nCj4gYXV0b2J1aWxkZXIgZmFpbHVyZToKPiAKPiAgIFZEU08zMkEgYXJjaC9wb3dl
cnBjL2tlcm5lbC92ZHNvMzIvc2lndHJhbXAubwo+ICAgY2MxOiBlcnJvcjog4oCYLW0zMuKAmSBu
b3Qgc3VwcG9ydGVkIGluIHRoaXMgY29uZmlndXJhdGlvaW4KPiAgIG1ha2VbNF06ICoqKiBbYXJj
aC9wb3dlcnBjL2tlcm5lbC92ZHNvMzIvTWFrZWZpbGU6NDk6IGFyY2gvcG93ZXJwYy9rZXJuZWwv
dmRzbzMyL3NpZ3RyYW1wLm9dIEVycm9yIDEKPiAKPiAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm5ldC9yZXN1bHRzL2RkNzZkNTNiYWI1NjQ3MGMwYjgzZTI5Njg3MmQ3YmI5MGY5ZTgyOTYv
Cj4gCj4gTm90ZSB0aGF0IHRoZSBmYWlsdXJlIGluZGljYXRlcyB0aGUgdG9vbGNoYWluIGlzIGNv
bmZpZ3VyZWQgdG8gZGlzYWJsZQo+IHRoZSAzMiBiaXQgdGFyZ2V0LCBjYXVzaW5nIHRoZSBrZXJu
ZWwgdG8gZmFpbCB3aGVuIGJ1aWxkaW5nIHRoZSAzMiBiaXQKPiBWRFNPLiBUaGlzIGlzIG9ubHkg
YSBwcm9ibGVtIG9uIHRoZSBCRSBrZXJuZWwgYXMgdGhlIExFIGtlcm5lbCBkaXNhYmxlcwo+IENP
TkZJR19DT01QQVQsIGFrYSAzMiBiaXQgdXNlcnNwYWNlIHN1cHBvcnQsIGJ5IGRlZmF1bHQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KCiAgQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4gSG93ZXZlciwgdGhlIGRlZmNvbmZpZyBtZWNoYW5pc20gZm9y
ICphbGwqIHBvd2VycGMgCnNlZW1zIHByZXR0eSBicm9rZW4uIEhlcmUncyB3aGF0IHdlIGhhdmUg
aW4gNS4xNiwgYmVmb3JlIHRoYXQgdGhlcmUgd2FzIApzb21ldGhpbmcgc2ltaWxhcjoKCiMgSWYg
d2UncmUgb24gYSBwcGMvcHBjNjQvcHBjNjRsZSBtYWNoaW5lIHVzZSB0aGF0IGRlZmNvbmZpZywg
b3RoZXJ3aXNlIGp1c3QgdXNlCiMgcHBjNjRfZGVmY29uZmlnIGJlY2F1c2Ugd2UgaGF2ZSBub3Ro
aW5nIGJldHRlciB0byBnbyBvbi4KdW5hbWUgOj0gJChzaGVsbCB1bmFtZSAtbSkKS0JVSUxEX0RF
RkNPTkZJRyA6PSAkKGlmICQoZmlsdGVyIHBwYyUsJCh1bmFtZSkpLCQodW5hbWUpLHBwYzY0KV9k
ZWZjb25maWcKCiAgU28gSSBndWVzcyB3ZSBzaG91bGQgdXNlIGEgc3BlY2lmaWMgZGVmY29uZmln
IGZvciAqYWxsKiBwb3dlcnBjLgoKICBUaGUgYXJjaC1kZWZhdWx0IGRlZmNvbmZpZyBpcyBnZW5l
cmFsbHkgbm90IHJlYWxseSByZWxpYWJsZSwgZm9yIGV4YW1wbGUgZm9yIAphcm0gaXQgYWx3YXlz
IHRha2VzIHY3X211bHRpLCBidXQgdGhhdCB3b24ndCB3b3JrIGZvciB2N20gdGFyZ2V0cy4uLgoK
ICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiBBbHRlcm5hdGl2ZWx5LCB3ZSBjb3VsZCBkaXNh
bG93IEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUcKPiB3aGVuIEJSMl9w
b3dlcnBjNjRsZT15Lgo+IAo+ICAgbGludXgvbGludXgubWsgfCA0ICsrKysKPiAgIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbGludXgvbGludXgubWsg
Yi9saW51eC9saW51eC5tawo+IGluZGV4IGIyN2U0MzZiMGQ1Ny4uNjc4MzIxMjdkOTJlIDEwMDY0
NAo+IC0tLSBhL2xpbnV4L2xpbnV4Lm1rCj4gKysrIGIvbGludXgvbGludXgubWsKPiBAQCAtMzA3
LDcgKzMwNywxMSBAQCBlbmRpZgo+ICAgaWZlcSAoJChCUjJfTElOVVhfS0VSTkVMX1VTRV9ERUZD
T05GSUcpLHkpCj4gICBMSU5VWF9LQ09ORklHX0RFRkNPTkZJRyA9ICQoY2FsbCBxc3RyaXAsJChC
UjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRykpX2RlZmNvbmZpZwo+ICAgZWxzZSBpZmVxICgkKEJS
Ml9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUcpLHkpCj4gK2lmZXEgKCQoQlIy
X3Bvd2VycGM2NGxlKSx5KQo+ICtMSU5VWF9LQ09ORklHX0RFRkNPTkZJRyA9IHBwYzY0bGVfZGVm
Y29uZmlnCj4gK2Vsc2UKPiAgIExJTlVYX0tDT05GSUdfREVGQ09ORklHID0gZGVmY29uZmlnCj4g
K2VuZGlmCj4gICBlbHNlIGlmZXEgKCQoQlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJ
RykseSkKPiAgIExJTlVYX0tDT05GSUdfRklMRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRSkpCj4gICBlbmRpZgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
