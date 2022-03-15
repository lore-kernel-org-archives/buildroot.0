Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646B7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09E664056D;
	Tue, 15 Mar 2022 21:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXRzjQlLe_F4; Tue, 15 Mar 2022 21:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E65E2404EB;
	Tue, 15 Mar 2022 21:12:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 302A91BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CCE1404EB
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ng8Dk6dVxsJV for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:12:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D26640359
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:12:00 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r23so476369edb.0
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=4KxmhyM/OUYF8V9uj1jes9kLo01RDokv6a79yNOT7jU=;
 b=My2+NuPA74gg8bPr8SFj/CLZn+0kUHZWrGYTEsle173Us3X+Ufjp9VvRwIle7OP9LV
 Fk61TzcSKHNDVjypZBp2l0oIyG0Ldnb3zOZ+7sUADkh73h8sgqti/iSajsU3PkxyBJh7
 Af00HVFZ7GvqaEB+AZmeAsGHNuw8HHyji/+bHkYHuEW84pTj0jEjOk0ja/LZVPkfKEh9
 ixAn+OwmqHHJLxTak2UmJEnKrWKoBuBUAr0Rk5X5bSWuttJf8yK1Cdl7bvQZjytipAAn
 naa9bJWwW3RAw0QL51NA6hA9AxypHrS0PoHpbaM3DmJgogz4sqMrFs4+8J+ap8BmxqFS
 zAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4KxmhyM/OUYF8V9uj1jes9kLo01RDokv6a79yNOT7jU=;
 b=ljDKPhmN0F15N+BJlca9kf5WsaL5NElH7e+tuP3YbEGkors+KzuY9EDY7dM4RyyZLx
 20A+DnHSrj7HFmh20XL3FW7M3FGjJV1XbJTXrnVf144ZS2N8GUHuB4e6q7oMam6SDsK8
 gwalAEblx/acys8Nde3mEkJboEvOYtIwhpXyfQvJeyzpRs00+AX9IMMgcMhU8t5qypNn
 Afm28NcFUtp1vZPE9g13P1n9HVTuZfkw8xlpQncLpnz2V5iDP7zygkqmzfYT4yNhI6C4
 6x149maqM18FswIcKOKEThqQNjwqT2IW9Qpmlbv3EcvYF7pF7sT/ZErjl/5Uyr8UpJT2
 vufw==
X-Gm-Message-State: AOAM530ezGHUE10lkW2LiogwvykBHeIcBKG7L01heNJv9cSOKAW9iwH6
 AyhvAk/cRy1o/XN/Ghx8/uLux+dEMCx4Lg==
X-Google-Smtp-Source: ABdhPJzaODtJwpRDy+whFx3xaE4Os3QSSmzTstsbMCCi5R7QVP9h83y0osnScYYwjCSL0RqME0gtiw==
X-Received: by 2002:a05:6402:5216:b0:416:3390:3597 with SMTP id
 s22-20020a056402521600b0041633903597mr26802739edd.198.1647378718410; 
 Tue, 15 Mar 2022 14:11:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a056402349000b004162fd77252sm36223edc.95.2022.03.15.14.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:11:57 -0700 (PDT)
Message-ID: <43f2b96c-16e0-b37c-7c41-25d4332ce2e6@mind.be>
Date: Tue, 15 Mar 2022 22:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: =?UTF-8?Q?R=c3=a9mi_Duraffort?= <remi.duraffort@linaro.org>,
 buildroot@buildroot.org
References: <20220228162632.2777188-1-remi.duraffort@linaro.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220228162632.2777188-1-remi.duraffort@linaro.org>
Subject: Re: [Buildroot] [PATCH 1/1] linux: fix kernel image format for
 aarch64 BE
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOC8wMi8yMDIyIDE3OjI2LCBSw6ltaSBEdXJhZmZvcnQgd3JvdGU6Cj4gU2lnbmVkLW9m
Zi1ieTogUsOpbWkgRHVyYWZmb3J0IDxyZW1pLmR1cmFmZm9ydEBsaW5hcm8ub3JnPgo+IC0tLQo+
ICAgbGludXgvQ29uZmlnLmluIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saW51eC9Db25maWcuaW4g
Yi9saW51eC9Db25maWcuaW4KPiBpbmRleCAxM2Q5OWJkMDlkLi4xZjJhOGRiNTQ1IDEwMDY0NAo+
IC0tLSBhL2xpbnV4L0NvbmZpZy5pbgo+ICsrKyBiL2xpbnV4L0NvbmZpZy5pbgo+IEBAIC0yNjEs
MTEgKzI2MSwxMSBAQCBjb25maWcgQlIyX0xJTlVYX0tFUk5FTF9TSU1QTEVJTUFHRQo+ICAgCj4g
ICBjb25maWcgQlIyX0xJTlVYX0tFUk5FTF9JTUFHRQo+ICAgCWJvb2wgIkltYWdlIgo+IC0JZGVw
ZW5kcyBvbiBCUjJfYWFyY2g2NCB8fCBCUjJfcmlzY3YKPiArCWRlcGVuZHMgb24gQlIyX2FhcmNo
NjQgfHwgQlIyX3Jpc2N2IHx8IEJSMl9hYXJjaDY0X2JlCgogIEkgY2hhbmdlZCB0aGUgb3JkZXIg
aGVyZSBzbyB0aGUgdHdvIGFhcmNoNjQgb25lcyBhcmUgbmV4dCB0byBlYWNoIG90aGVyLgoKICBB
cHBsaWVkIHRvIG1hc3RlciB3aXRoIHRoYXQgY2hhbmdlZCwgdGhhbmtzLgoKICBSZWdhcmRzLAog
IEFybm91dAoKPiAgIAo+ICAgY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfSU1BR0VHWgo+ICAgCWJv
b2wgIkltYWdlLmd6Igo+IC0JZGVwZW5kcyBvbiBCUjJfYWFyY2g2NCB8fCBCUjJfcmlzY3YKPiAr
CWRlcGVuZHMgb24gQlIyX2FhcmNoNjQgfHwgQlIyX3Jpc2N2IHx8IEJSMl9hYXJjaDY0X2JlCj4g
ICAKPiAgIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX0xJTlVYX0JJTgo+ICAgCWJvb2wgImxpbnV4
LmJpbiIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
