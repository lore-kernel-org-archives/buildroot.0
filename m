Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A96C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 22:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F16B984CFB;
	Thu, 13 Jan 2022 22:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-WG5rDGJ2hm; Thu, 13 Jan 2022 22:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B40784CFC;
	Thu, 13 Jan 2022 22:05:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F01161BF476
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 22:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D41BD40A71
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 22:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WESOxg7O9ibe for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 22:05:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E23C940123
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 22:05:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so2949937wms.0
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 14:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ytscOZPG4gLcVPFzLrqZ8TR+INY5UGwCFkwjg/XpoNU=;
 b=keYszqQRPREq09XQjFa6blzjyT6JcWj9hRpGO7wbukfVT5RNUHD2ZySPLACzC4B5XV
 5xF5gY0xgNi0zrHa+XiVIcEQlTnYRqlvwNybLOLiBsLlk3EgKcXliEYcnMkKPlJ+kxX+
 h9USPLBaXBAsM1Xc8BN6HO2/maFdev18ivN/GaqpbrsAyu1cjkn0gYAlB8DKh+Jcue+8
 0PSPsVMPpB4RFO7Dy8dMTxMpL5A3T36/clJOJBccBg71oNp8+aLtVcs7ghvL1PkfbZJC
 c16VaGX+//IQ/OCRkV/GkLOuFq+SLPNlzKQ9wwgOIyXYiU7kzi2WuGJWl9Nj9AjLXwD9
 +tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ytscOZPG4gLcVPFzLrqZ8TR+INY5UGwCFkwjg/XpoNU=;
 b=g9vMaJGsiC7i5QhaC+VPkMIeoDgpuQwbeB/JSabCU151jhZlmSRj9ifhRCcIst4KXe
 +PDTrphCJyRtTK3sxzI1PKhJSV4VqEUW6XUTyOVrxY288KpzaHDePs0KB5B+6A+puGcF
 +c4QdODRKYAUDJVX8t29qwbf2XGkVZyThiL+JKuF/g+aJtKaW5M31qJPxlOrrcHrxbCc
 K+XSw84tHAotJPTk31ACM4YPzxpp50Aq3KgDj1cOmhX/9A4lj7dYK7ptnv9QdoPTVLoT
 w8/swLByABC991Yn3h+FyE8YyH42SmsEjI7O/oHVjB1bW60dnETUMiSEjL85zkFhO09y
 rftw==
X-Gm-Message-State: AOAM530T11ZAby5Cb1ZvnT41FFJ9q9Mca1vWiN8oysUVUwD4hBpkn5FD
 FaMoCiIujvvffMfgg2AvAuA=
X-Google-Smtp-Source: ABdhPJwj5ZP1GwFCjGdQSw7AMeHg/JXtfQngwh0ky0hJ9ejNS/o7CpW4+lkcJBS6qZe+371GrXaVKw==
X-Received: by 2002:a1c:a747:: with SMTP id q68mr12778140wme.98.1642111503148; 
 Thu, 13 Jan 2022 14:05:03 -0800 (PST)
Received: from [192.168.1.43]
 (amontpellier-158-1-160-63.w92-145.abo.wanadoo.fr. [92.145.131.63])
 by smtp.gmail.com with ESMTPSA id q206sm3900956wme.8.2022.01.13.14.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 14:05:02 -0800 (PST)
Message-ID: <1a139b63-48ff-fe9e-2041-cc1724a753b2@gmail.com>
Date: Thu, 13 Jan 2022 23:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 buildroot@buildroot.org
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
 <20210518113652.29609-4-patrickdepinguin@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
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

SGkgVGhvbWFzLAoKTGUgMTgvMDUvMjAyMSDDoCAxMzozNiwgVGhvbWFzIERlIFNjaGFtcGhlbGVp
cmUgYSDDqWNyaXTCoDoKPiBGcm9tOiBUaG9tYXMgRGUgU2NoYW1waGVsZWlyZSA8dGhvbWFzLmRl
X3NjaGFtcGhlbGVpcmVAbm9raWEuY29tPgo+IAo+IFRoZXJlIGFyZSBjYXNlcyB3aGVyZSBhIDY0
LWJpdCBhcmNoaXRlY3R1cmUgaXMgcnVubmluZyBhIDY0LWJpdCBrZXJuZWwgYnV0Cj4gMzItYml0
IHVzZXJzcGFjZS4gRXhhbXBsZXMgaW5jbHVkZToKPiAgICAgKiBhYXJjaDY0IGFyY2hpdGVjdHVy
ZSwgd2l0aCBhYXJjaDY0IGtlcm5lbCBhbmQgMzItYml0IChBUk0pIHVzZXJzcGFjZQo+ICAgICAq
IHg4Nl82NCBhcmNoaXRlY3R1cmUsIHdpdGggeDg2XzY0IGtlcm5lbCBhbmQgMzItYml0IChpMzg2
KSB1c2Vyc3BhY2UKPiAKPiBJbiBCdWlsZHJvb3QsIHRoZSBBUkNIL0JSMl9BUkNIIGFuZCBOT1JN
QUxJWkVEX0FSQ0ggdmFyaWFibGVzIHdpbGwgcmVmZXIgdG8KPiB0aGUgMzItYml0IGFyY2hpdGVj
dHVyZSwgYnV0IHRoZSBrZXJuZWwgbmVlZHMgdG8gYmUgYnVpbHQgd2l0aCB0aGUgNjQtYml0Cj4g
YXJjaGl0ZWN0dXJlLgo+IAo+IE1ha2UgaXQgcG9zc2libGUgdG8gZGVmaW5lIHRoZSBjb3JyZWN0
IGFyY2hpdGVjdHVyZSB0byBiZSB1c2VkIGZvciB0aGUKPiBrZXJuZWwsIGluIGEgbmV3IGNvbmZp
ZyBvcHRpb24gJ0JSMl9LRVJORUxfQVJDSF9PVkVSUklERScuIFRoZSB1c2VyIGlzCj4gZXhwZWN0
ZWQgdG8ga25vdyB0aGUgdmFsaWQgdmFsdWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBE
ZSBTY2hhbXBoZWxlaXJlIDx0aG9tYXMuZGVfc2NoYW1waGVsZWlyZUBub2tpYS5jb20+Cj4gLS0t
Cj4gIE1ha2VmaWxlICAgICAgIHwgIDQgKysrKwo+ICBhcmNoL0NvbmZpZy5pbiB8IDE1ICsrKysr
KysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+IGluZGV4IGM1Mzk5ZTlhMzUuLmQwOWNmN2M5
NTggMTAwNjQ0Cj4gLS0tIGEvTWFrZWZpbGUKPiArKysgYi9NYWtlZmlsZQo+IEBAIC00MzQsNyAr
NDM0LDExIEBAIFFVSUVUIDo9ICQoaWYgJChmaW5kc3RyaW5nIHMsJChmaWx0ZXItb3V0IC0tJSwk
KE1BS0VGTEFHUykpKSwtcSkKPiAgIyBTdHJpcCBvZmYgdGhlIGFubm95aW5nIHF1b3RpbmcKPiAg
QVJDSCA6PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0FSQ0gpKQo+ICBOT1JNQUxJWkVEX0FSQ0ggOj0g
JChjYWxsIHFzdHJpcCwkKEJSMl9LRVJORUxfQVJDSCkpCj4gK2lmZXEgKCQoY2FsbCBxc3RyaXAs
JChCUjJfS0VSTkVMX0FSQ0hfT1ZFUlJJREUpKSwpCj4gIEtFUk5FTF9BUkNIIDo9ICQoY2FsbCBx
c3RyaXAsJChCUjJfS0VSTkVMX0FSQ0gpKQo+ICtlbHNlCj4gK0tFUk5FTF9BUkNIIDo9ICQoY2Fs
bCBxc3RyaXAsJChCUjJfS0VSTkVMX0FSQ0hfT1ZFUlJJREUpKQo+ICtlbmRpZgo+ICAKPiAgWkNB
VCA6PSAkKGNhbGwgcXN0cmlwLCQoQlIyX1pDQVQpKQo+ICBCWkNBVCA6PSAkKGNhbGwgcXN0cmlw
LCQoQlIyX0JaQ0FUKSkKPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4gYi9hcmNoL0NvbmZp
Zy5pbgo+IGluZGV4IDc1NzVhY2Y0OGMuLmM4MjEwMGY1NDEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9D
b25maWcuaW4KPiArKysgYi9hcmNoL0NvbmZpZy5pbgo+IEBAIC0zMjksNiArMzI5LDIxIEBAIGNv
bmZpZyBCUjJfQVJDSAo+ICBjb25maWcgQlIyX0tFUk5FTF9BUkNICj4gIAlzdHJpbmcKPiAgCj4g
K2NvbmZpZyBCUjJfS0VSTkVMX0FSQ0hfT1ZFUlJJREUKPiArCXN0cmluZyAiS2VybmVsIGFyY2hp
dGVjdHVyZSBvdmVycmlkZSIKCk1heWJlIGl0IHdvdWxkIGJlIGJldHRlciB0byBhZGQgYXJjaGl0
ZWN0dXJlIGRlcGVuZGVuY2llcyBoZXJlIChCUjJfQVJDSF9JU182NCkKCj4gKwloZWxwCj4gKwkg
IE5vcm1hbGx5LCB0aGUgY29ycmVjdCBrZXJuZWwgYXJjaGl0ZWN0dXJlIHZhbHVlIGlzIGRlcml2
ZWQKPiArCSAgZnJvbSB0aGUgc2VsZWN0ZWQgYXJjaGl0ZWN0dXJlLCBhbmQgeW91IHNob3VsZCBr
ZWVwIHRoaXMKPiArCSAgb3B0aW9uIGVtcHR5Lgo+ICsJICBIb3dldmVyLCB0aGVyZSBhcmUgY2Fz
ZXMgd2hlcmUgeW91IG1heSB3YW50IHRvIGVudGVyIGEgY3VzdG9tCj4gKwkgIHZhbHVlLCBmb3Ig
ZXhhbXBsZSB3aGVuIHVzaW5nIGEgNjQtYml0IGFyY2hpdGVjdHVyZSBidXQKPiArCSAgcnVubmlu
ZyB1c2Vyc3BhY2UgaW4gMzItYml0IG1vZGUuCj4gKwkgIEFzIGFuIGV4YW1wbGUsIGluIGNhc2Ug
b2YgYW4geDg2XzY0IHByb2Nlc3NvciB3aGVyZSB5b3Ugd2FudAo+ICsJICAzMi1iaXQgdXNlcnNw
YWNlLCBCUjJfQVJDSCB3aWxsIGJlICdpMzg2Jy8naTQ4NicvJ2k2ODYnIGFuZAo+ICsJICBCUjJf
S0VSTkVMX0FSQ0hfT1ZFUlJJREUgc2hvdWxkIGJlIHNldCB0byAneDg2XzY0Jy4gTm90ZSB0aGF0
Cj4gKwkgIGluIHRoaXMgZXhhbXBsZSB5b3Ugd2lsbCBhbHNvIG5lZWQgYSBtdWx0aWxpYiB0b29s
Y2hhaW4gYW5kCj4gKwkgIHBhc3MgJy1tMzInIHZpYSBCUjJfVEFSR0VUX09QVElNSVpBVElPTi4K
CkFkZGluZyAtbTMyIHdpbGwgZm9yY2UgdGhlIG11bGl0aWxpYiB0b29sY2hhaW4gdG8gcHJvZHVj
ZSAzMmJpdHMgYmluYXJ5LgpCdXQgLW02NCBpcyBhbHNvIGFkZGVkIHRvIHRoZSB0b29sY2hhaW4g
d3JhcHBlciBmb3IgeDg2XzY0LgpNaXhpbmcgLW02NCBhbmQgLW0zMiBkb2Vzbid0IHNlZW1zIGEg
Z29vZCBpZGVhLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICsKPiAgY29uZmlnIEJSMl9FTkRJ
QU4KPiAgCXN0cmluZwo+ICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
