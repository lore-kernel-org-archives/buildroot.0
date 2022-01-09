Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74489C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 23:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05472400FB;
	Sun,  9 Jan 2022 23:27:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQju5fw91lIS; Sun,  9 Jan 2022 23:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1C6040332;
	Sun,  9 Jan 2022 23:27:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F3661BF2E5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 23:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D63560BA4
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 23:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lg37rHGHvD49 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 23:27:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A64560B98
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 23:27:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id l4so7661400wmq.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 15:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rLhfuXnu6uK8/c5zKDSpxiKVIaYhsU+xIAD90ZeJwUM=;
 b=JBaFGzlEbJ7E7wdnM6ikYqQ3yUgyez+ZOJp7H67acEiVYbpztU1OYOYJYcI83LeMq0
 TFDxvybhFgM+7ighmsvs1KMuCal2dNCBG3n3kwUrqD/59GUeLyJ696TbUCEndp1ICizV
 UhUT5a5eFIp5DoxVLzrEtPrxn5/fmC12ZEDWw/+EXzS2kR7JaK5/aiVXYbUDDyh1BwwK
 nqWgWemCDJFcdXVKeQSMhUBHbErJpZ3fvDl9jp6CF1L+hGOw03kDt2IAApcxPTpL0CYM
 B9FrNmZHwBb61jiw6vTVgwWHrBJnCX+PIea6hOJoNkAfujcE/Gl0eDQ1OHtEcZH877KM
 l7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rLhfuXnu6uK8/c5zKDSpxiKVIaYhsU+xIAD90ZeJwUM=;
 b=yS468kU8sbQCoDTdn8sp9OOablO4IC38oLgMqhBgXYjitDEQ59wPXVqc46sdy30H6Z
 oT80yVMVRLELsS7Gbm0cK/egrplK2FKjlSEFc802kv7U3IQrJrBQdHada2/c1yT+bSVU
 kDQH7mUkQk/nOxZoTg73Z2oidxRsXXakhY1pnyoA/g7/prlpNtVDjt3S8ploVYx1aPY2
 XM4/yTt93Be5dx9csH1Ztw7f9JEhKHJqS5o+51osPuNH/fe1JZqX+f1jOWDt9L3pc6Sb
 E0GG4Kb5qE70QoRW3rUpQQSIEs/6TRYXFl0CqwyJRP4F6whur/3DhYiCVu8zzyaQKn8f
 8pew==
X-Gm-Message-State: AOAM5308N2RYxWaFi93h91TWcZ6hOPKkWBRmVkrb9aflARQaldyHkYBV
 lVu9kUmp9po9rexoQMVepPQQW3QW/iqODg==
X-Google-Smtp-Source: ABdhPJwdCmktz8PUuKQAqrX80aayWjNJgKM1wuormCghL9ooVwLTSPhECE/CgWY1qXFVB5GyV2FCiQ==
X-Received: by 2002:a05:600c:20d3:: with SMTP id
 y19mr5138841wmm.151.1641770835479; 
 Sun, 09 Jan 2022 15:27:15 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id x8sm5109904wmj.44.2022.01.09.15.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 15:27:15 -0800 (PST)
Message-ID: <5269b781-3bed-9b6c-9a4f-2d077964a16e@smile.fr>
Date: Mon, 10 Jan 2022 00:27:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 buildroot@buildroot.org
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
 <20210518113652.29609-4-patrickdepinguin@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20210518113652.29609-4-patrickdepinguin@gmail.com>
Subject: Re: [Buildroot] [PATCH 3/4] core: introduce BR2_KERNEL_ARCH_OVERRIDE
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMTgvMDUvMjAyMSDDoCAxMzozNiwgVGhvbWFzIERlIFNjaGFtcGhl
bGVpcmUgYSDDqWNyaXTCoDoKPiBGcm9tOiBUaG9tYXMgRGUgU2NoYW1waGVsZWlyZSA8dGhvbWFz
LmRlX3NjaGFtcGhlbGVpcmVAbm9raWEuY29tPgo+IAo+IFRoZXJlIGFyZSBjYXNlcyB3aGVyZSBh
IDY0LWJpdCBhcmNoaXRlY3R1cmUgaXMgcnVubmluZyBhIDY0LWJpdCBrZXJuZWwgYnV0Cj4gMzIt
Yml0IHVzZXJzcGFjZS4gRXhhbXBsZXMgaW5jbHVkZToKPiAgICAgKiBhYXJjaDY0IGFyY2hpdGVj
dHVyZSwgd2l0aCBhYXJjaDY0IGtlcm5lbCBhbmQgMzItYml0IChBUk0pIHVzZXJzcGFjZQo+ICAg
ICAqIHg4Nl82NCBhcmNoaXRlY3R1cmUsIHdpdGggeDg2XzY0IGtlcm5lbCBhbmQgMzItYml0IChp
Mzg2KSB1c2Vyc3BhY2UKCkNhbiB5b3UgcHJvdmlkZSBhIG5ldyBxZW11IGRlZmNvbmZpZyB0aGF0
IGNvdmVyIHRoaXMgdXNlIGNhc2U/ClRoaXMgaXMgZm9yIGdpdGxhYi1jaSBydW50aW1lIHRlc3Rp
bmcuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKUFM6IChUaGlzIGVtYWlsIGRvZXNuJ3QgY291bnQg
YXMgYSByZXZpZXcgb2YgdGhpcyBzZXJpZXMgOikpCgo+IAo+IEluIEJ1aWxkcm9vdCwgdGhlIEFS
Q0gvQlIyX0FSQ0ggYW5kIE5PUk1BTElaRURfQVJDSCB2YXJpYWJsZXMgd2lsbCByZWZlciB0bwo+
IHRoZSAzMi1iaXQgYXJjaGl0ZWN0dXJlLCBidXQgdGhlIGtlcm5lbCBuZWVkcyB0byBiZSBidWls
dCB3aXRoIHRoZSA2NC1iaXQKPiBhcmNoaXRlY3R1cmUuCj4gCj4gTWFrZSBpdCBwb3NzaWJsZSB0
byBkZWZpbmUgdGhlIGNvcnJlY3QgYXJjaGl0ZWN0dXJlIHRvIGJlIHVzZWQgZm9yIHRoZQo+IGtl
cm5lbCwgaW4gYSBuZXcgY29uZmlnIG9wdGlvbiAnQlIyX0tFUk5FTF9BUkNIX09WRVJSSURFJy4g
VGhlIHVzZXIgaXMKPiBleHBlY3RlZCB0byBrbm93IHRoZSB2YWxpZCB2YWx1ZXMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIERlIFNjaGFtcGhlbGVpcmUgPHRob21hcy5kZV9zY2hhbXBoZWxl
aXJlQG5va2lhLmNvbT4KPiAtLS0KPiAgTWFrZWZpbGUgICAgICAgfCAgNCArKysrCj4gIGFyY2gv
Q29uZmlnLmluIHwgMTUgKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gaW5kZXgg
YzUzOTllOWEzNS4uZDA5Y2Y3Yzk1OCAxMDA2NDQKPiAtLS0gYS9NYWtlZmlsZQo+ICsrKyBiL01h
a2VmaWxlCj4gQEAgLTQzNCw3ICs0MzQsMTEgQEAgUVVJRVQgOj0gJChpZiAkKGZpbmRzdHJpbmcg
cywkKGZpbHRlci1vdXQgLS0lLCQoTUFLRUZMQUdTKSkpLC1xKQo+ICAjIFN0cmlwIG9mZiB0aGUg
YW5ub3lpbmcgcXVvdGluZwo+ICBBUkNIIDo9ICQoY2FsbCBxc3RyaXAsJChCUjJfQVJDSCkpCj4g
IE5PUk1BTElaRURfQVJDSCA6PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0tFUk5FTF9BUkNIKSkKPiAr
aWZlcSAoJChjYWxsIHFzdHJpcCwkKEJSMl9LRVJORUxfQVJDSF9PVkVSUklERSkpLCkKPiAgS0VS
TkVMX0FSQ0ggOj0gJChjYWxsIHFzdHJpcCwkKEJSMl9LRVJORUxfQVJDSCkpCj4gK2Vsc2UKPiAr
S0VSTkVMX0FSQ0ggOj0gJChjYWxsIHFzdHJpcCwkKEJSMl9LRVJORUxfQVJDSF9PVkVSUklERSkp
Cj4gK2VuZGlmCj4gIAo+ICBaQ0FUIDo9ICQoY2FsbCBxc3RyaXAsJChCUjJfWkNBVCkpCj4gIEJa
Q0FUIDo9ICQoY2FsbCBxc3RyaXAsJChCUjJfQlpDQVQpKQo+IGRpZmYgLS1naXQgYS9hcmNoL0Nv
bmZpZy5pbiBiL2FyY2gvQ29uZmlnLmluCj4gaW5kZXggNzU3NWFjZjQ4Yy4uYzgyMTAwZjU0MSAx
MDA2NDQKPiAtLS0gYS9hcmNoL0NvbmZpZy5pbgo+ICsrKyBiL2FyY2gvQ29uZmlnLmluCj4gQEAg
LTMyOSw2ICszMjksMjEgQEAgY29uZmlnIEJSMl9BUkNICj4gIGNvbmZpZyBCUjJfS0VSTkVMX0FS
Q0gKPiAgCXN0cmluZwo+ICAKPiArY29uZmlnIEJSMl9LRVJORUxfQVJDSF9PVkVSUklERQo+ICsJ
c3RyaW5nICJLZXJuZWwgYXJjaGl0ZWN0dXJlIG92ZXJyaWRlIgo+ICsJaGVscAo+ICsJICBOb3Jt
YWxseSwgdGhlIGNvcnJlY3Qga2VybmVsIGFyY2hpdGVjdHVyZSB2YWx1ZSBpcyBkZXJpdmVkCj4g
KwkgIGZyb20gdGhlIHNlbGVjdGVkIGFyY2hpdGVjdHVyZSwgYW5kIHlvdSBzaG91bGQga2VlcCB0
aGlzCj4gKwkgIG9wdGlvbiBlbXB0eS4KPiArCSAgSG93ZXZlciwgdGhlcmUgYXJlIGNhc2VzIHdo
ZXJlIHlvdSBtYXkgd2FudCB0byBlbnRlciBhIGN1c3RvbQo+ICsJICB2YWx1ZSwgZm9yIGV4YW1w
bGUgd2hlbiB1c2luZyBhIDY0LWJpdCBhcmNoaXRlY3R1cmUgYnV0Cj4gKwkgIHJ1bm5pbmcgdXNl
cnNwYWNlIGluIDMyLWJpdCBtb2RlLgo+ICsJICBBcyBhbiBleGFtcGxlLCBpbiBjYXNlIG9mIGFu
IHg4Nl82NCBwcm9jZXNzb3Igd2hlcmUgeW91IHdhbnQKPiArCSAgMzItYml0IHVzZXJzcGFjZSwg
QlIyX0FSQ0ggd2lsbCBiZSAnaTM4NicvJ2k0ODYnLydpNjg2JyBhbmQKPiArCSAgQlIyX0tFUk5F
TF9BUkNIX09WRVJSSURFIHNob3VsZCBiZSBzZXQgdG8gJ3g4Nl82NCcuIE5vdGUgdGhhdAo+ICsJ
ICBpbiB0aGlzIGV4YW1wbGUgeW91IHdpbGwgYWxzbyBuZWVkIGEgbXVsdGlsaWIgdG9vbGNoYWlu
IGFuZAo+ICsJICBwYXNzICctbTMyJyB2aWEgQlIyX1RBUkdFVF9PUFRJTUlaQVRJT04uCj4gKwo+
ICBjb25maWcgQlIyX0VORElBTgo+ICAJc3RyaW5nCj4gIAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
