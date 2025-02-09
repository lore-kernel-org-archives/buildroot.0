Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B032AC0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 20:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EE2C404C8;
	Sun,  9 Feb 2025 20:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_BJJNI2HDcZ; Sun,  9 Feb 2025 20:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1198C404CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1198C404CB;
	Sun,  9 Feb 2025 20:57:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7304CC2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F7B840965
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5s5Fr80PMDH for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 20:57:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F7BF400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F7BF400E7
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F7BF400E7
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:57:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-434f398a171so3105935e9.2
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 12:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739134668; x=1739739468;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:sender:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y5nrUbI8cqQl0C5R/KIMxnNW+d4Vk8+RFvqnrhM+ARk=;
 b=u2TnLvGhL3B/V+CO9DWoyQH6BsOZhq7UYIInLuoEDBszqjx9gkZwkQX9n1r2WX5RwL
 /2ASK0HPwqoi5F9KOxW+rItmtJtgLd7fq9b/1xovVD2Qw+HoGrkylXNTuhGULQeuIQuA
 jVICcJV3pEjRSmf2BXCb4oQNsbxm8yx4URs4N7mfvbdeKE7sj9V6055Y8TKNwpTMr9u3
 BaYOT3zL9VNoIetApu0mQFQU8H+nM5se+El+PmVZpyS8/DVxD17bJ+AJ79hC1SCmXSrj
 T8yWGAX0UqYmEqNi7rd+neZ/5kJJASQ0gs4/ts3usMwPYliamBuNqgJDuW1Wuck7QIbI
 HHDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdECRHFZUSJYm+hGLfuyUIdMrGsLhWHcBfLtgZs+P/MI/cObr01J9Kef4apr+3RKtp+K4xqnYOc3o=@buildroot.org
X-Gm-Message-State: AOJu0YyiVJUFGCOK3kXVO1TgmdVP/rloAE3V/pHArFhqo7qx4PSgr56y
 gCw3IU05mEC6gYsgAedxIbJ2ljmh18JWpw7fzyTnCHUiK/oxewPAzx24l8o8
X-Gm-Gg: ASbGnctOvAQTdtTjA8R1erbj4McmTQ1M3Z7kHjAdK5LJbJzoCMToBvNN/HL8AWsCxhf
 i9c09qbATJAqqtPVQozhdDMNszsarxJmQB/pj5hbjpjYeBmTqI1wGCb4a/y/AbZp0s7gg0WctMW
 C2psRfVrGlLSvtkfLgBKorsHjqDktqOvHCXdrOhV+c7iQBlFIC/B5aeCWbdkwFzUJMjsNN4mD/a
 URWdplOqRzPRmThjdYkF2AxEHkuw2oWihS9dCpz1VmjFFeKw3HV+FYseaaX8NWha0+g7rnTqlw/
 VMR9Z2A/3FqpFx+w4Uj/KVw=
X-Google-Smtp-Source: AGHT+IEKl+KFkfred2xq4lILmPCDV8NlC2E95K0pt5GLLLvKJUh2ak5kk/B2FW2+qcM6bIOySVVboQ==
X-Received: by 2002:a05:600c:3b24:b0:434:a0fd:95d0 with SMTP id
 5b1f17b1804b1-439249af823mr35560905e9.4.1739134667984; 
 Sun, 09 Feb 2025 12:57:47 -0800 (PST)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc53ae9c0sm9090032f8f.101.2025.02.09.12.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Feb 2025 12:57:47 -0800 (PST)
Mime-Version: 1.0
Date: Sun, 09 Feb 2025 21:57:47 +0100
Message-Id: <D7O7SCG0RDZI.3K368TWRGA1IB@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
To: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250204092915.66776-1-gael.portay+rtone@gmail.com>
 <5e87541e-bde2-4a3b-975e-3897de1f5ae1@smile.fr>
In-Reply-To: <5e87541e-bde2-4a3b-975e-3897de1f5ae1@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739134668; x=1739739468; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:sender:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Y5nrUbI8cqQl0C5R/KIMxnNW+d4Vk8+RFvqnrhM+ARk=;
 b=Hdzn4ufNTUFja2CkC/WUy++YvgDdJI1FoVHfcnMwcsmJpe/2AEkV1+v/BRrQUp3ril
 +MrBn/qmHPbPsae6CefIj9tI/mqOzXzNwAQU/ItVO6F7gwL9wE1Js0o25X3MFnN/6VGL
 bh1DKNsRNsZE8q/BxWzQrMVFY3QOb/ZiA1KNogZTbFLYgrn/B070WLlz7vYKXs/zbrBC
 ZwG2Owhatz44I4R9A3+q+YuWLm2Fn7SdJXQZ6JjicCTeqn2K4/8mFe1P8uaTIQfNtF1j
 E9pw/R+nKGnASGOvbqa2CDXPeb14BIdzWLMXlfzKY3UahYP4BeNN29vIz4hDtFPuKZg/
 SRbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Hdzn4ufN
Subject: Re: [Buildroot] [RFC 1/1] package/skeleton-init-systemd: ignore
 credential services
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

SGVsbG8gUm9tYWluLAoKT24gV2VkIEZlYiA1LCAyMDI1IGF0IDExOjMwIEFNIENFVCwgUm9tYWlu
IE5hb3VyIHdyb3RlOgo+IEhlbGxvIEdhw6tsLCBBbGwsCj4KPiBMZSAwNC8wMi8yMDI1IMOgIDEw
OjI5LCBHYcOrbCBQT1JUQVkgYSDDqWNyaXTCoDoKPj4gVEw7RFI7IFRoaXMgaWdub3JlcyB0aGUg
dG1wZmlsZXMuZCBjcmVkZW50aWFsIHNlcnZpY2VzIHNpbmNlIHRoZXNlIGxpbmVzCj4+IGltcG9y
dCBjcmVkZW50aWFsIGNvbnRlbnRzIGZyb20gdGhlIGhvc3QuIEl0IGludGVuZHMgdG8gc2h1dGRv
d24gdGhlCj4+IGVycm9yIGF0dGFjaGVkIGluIHRoZSBlbmQgb2YgdGhlIGNvbW1pdCBtZXNzYWdl
Lgo+PiAKPj4gTm90ZTogVGhlIGlzc3VlIGhhcHBlbnMgaWYgdGhlIGhvc3Qgc3lzdGVtIGhhcyBj
cmVkZW50aWFsIHNlcnZpY2VzIChpLmUuCj4+IENSRURFTlRJQUxTX0RJUkVDVE9SWSBvciBFTkNS
WVBURURfQ1JFREVOVElBTFNfRElSRUNUT1JZIHNldCBpbiBpdHMgaG9zdAo+PiBlbnZpcm9ubWVu
dCkgYW5kIGlmIHRoZSB0YXJnZXQgaXMgc2V0dXAgdG8gcnVuIHN5c3RlbWQgb24gYSByZWFkLW9u
bHkKPj4gZmlsZXN5c3RlbToKPj4gCj4+IAlCUjJfSU5JVF9TWVNURU1EPXkKPj4gCUJSMl9JTklU
X1NZU1RFTURfUE9QVUxBVEVfVE1QRklMRVM9eQo+Cj4gSSB0aGluayBpdCBjb3VsZCBiZSByZXBy
b2R1Y2VkIHVzaW5nIEluaXRTeXN0ZW1TeXN0ZW1kQmFzZU92ZXJsYXlmcyB0ZXN0IHdoZW4KPiB0
aGUgaG9zdCBzZXQgQ1JFREVOVElBTFNfRElSRUNUT1JZIG9yIEVOQ1JZUFRFRF9DUkVERU5USUFM
U19ESVJFQ1RPUlkuCj4KPiBNYXliZSB3ZSBjb3VsZCBleHRlbmQgdGhlIHN5c3RlbWQgdGVzdHMg
dG8gY2F0Y2ggdGhpcyBwZWN1bGlhciB1c2UgY2FzZSBieQo+IHNldHRpbmcgb25lIG9mIHRoZXNl
cyBvcHRpb24gaW4gdGhlIGVudmlyb25tZW50Pwo+CgpJdCBpcyBhIGdvb2QgY2FzZSB0byBsZXQg
bWUgZGlnIGFuZCB1c2UgdGhlIGF1dG9tYXRlZCB0ZXN0cy4KCj4+IAo+PiBGaXhlczoKPj4gCj4+
IAk+Pj4gICBHZW5lcmF0aW5nIGZpbGVzeXN0ZW0gaW1hZ2Ugcm9vdGZzLmV4dDIKPj4gCSguLi4g
VE1QRElSPSBURU1QPSBUTVA9IC9ob21lL2dwb3J0YXkvc3JjL2J1aWxkcm9vdC9vdXRwdXQvaG9z
dC9iaW4vc3lzdGVtZC10bXBmaWxlcyAtLWNyZWF0ZSAtLWJvb3QgLS1yb290PS9ob21lL2dwb3J0
YXkvc3JjL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL2V4dDIvdGFyZ2V0IC0t
ZXhjbHVkZS1wcmVmaXg9L2RldiAtLWV4Y2x1ZGUtcHJlZml4PS9wcm9jIC0tZXhjbHVkZS1wcmVm
aXg9L3J1biAtLWV4Y2x1ZGUtcHJlZml4PS9zeXMgLS1leGNsdWRlLXByZWZpeD0vdG1wIC0tZXhj
bHVkZS1wcmVmaXg9L21udCAtKQo+PiAJaWdub3JlZCBzcGVjOiBoIC92YXIvbG9nL2pvdXJuYWwv
JW0gLSAtIC0gLSArQwo+PiAJRmFpbGVkIHRvIHJlYWQgY3JlZGVudGlhbCAnbG9naW4ubW90ZCc6
IFBlcm1pc3Npb24gZGVuaWVkCj4+IAlGYWlsZWQgdG8gcmVhZCBjcmVkZW50aWFsICdsb2dpbi5p
c3N1ZSc6IFBlcm1pc3Npb24gZGVuaWVkCj4+IAlGYWlsZWQgdG8gcmVhZCBjcmVkZW50aWFsICdu
ZXR3b3JrLmhvc3RzJzogUGVybWlzc2lvbiBkZW5pZWQKPj4gCUZhaWxlZCB0byByZWFkIGNyZWRl
bnRpYWwgJ3NzaC5hdXRob3JpemVkX2tleXMucm9vdCc6IFBlcm1pc3Npb24gZGVuaWVkCj4+IAlp
Z25vcmVkIHNwZWM6IHggL3Zhci90bXAvc3lzdGVtZC1wcml2YXRlLSViLSoKPj4gCWlnbm9yZWQg
c3BlYzogWCAvdmFyL3RtcC9zeXN0ZW1kLXByaXZhdGUtJWItKi90bXAKPj4gCWlnbm9yZWQgc3Bl
YzogeCAgL3Zhci9saWIvc3lzdGVtZC9jb3JlZHVtcC8uI2NvcmUqLiViKgo+PiAJaWdub3JlZCBz
cGVjOiB6IC92YXIvbG9nL2pvdXJuYWwvJW0gMjc1NSByb290IHN5c3RlbWQtam91cm5hbCAtIC0K
Pj4gCWlnbm9yZWQgc3BlYzogeiAvdmFyL2xvZy9qb3VybmFsLyVtL3N5c3RlbS5qb3VybmFsIDA2
NDAgcm9vdCBzeXN0ZW1kLWpvdXJuYWwgLSAtCj4KPiBJdCdzIG5vdCBjbGVhciBpZiB0aGV5IGFy
ZSBoYXJtZnVsIGVycm9yIG9yIG5vdD8KPiBJcyByb290ZnMuZXh0MiBnZW5lcmF0ZWQgYW5kIHRo
ZSBidWlsZCBzdWNjZWVkPwo+CgpUaGV5IGFyZSEgc3lzdGVtZC10bXBmaWxlcyBmYWlscywgdGhl
biB0aGUgc2NyaXB0IGZhaWxzIGFuZCBtYWtlIGlzCmhhbHRlZCAobm90IGNvbnRpbnVpbmcgdGhl
IGJ1aWxkKS4KCkkgc2hvdWxkIGhhdmUgY29weS9wYXN0ZSB0aGUgbGFzdCBsaW5lIHNheWluZyBp
dCAoSSB3aWxsIGRvIGl0IGluIHYxKS4KCj4+IEltcG9ydGFudDogVGhlIGlzc3VlIGhhcHBlbmVk
IG9uIG15IHNldHVwIGZvciBhIHdoaWxlICgyNTYuOCkgYW5kIGl0IGhhcwo+PiBzaWxlbnRseSBk
aXNhcHBlYXJlZCB3aXRob3V0IHNheWluZyBnb29kYnllICgyNTcuMiBhcyBvZiB0b2RheSkuCj4+
IFRoZXJlZm9yZSwgSSBjYW5ub3QgcmVwcm9kdWNlIGl0IGluIGEgdHJ1ZSBzaXR1YXRpb24gYXMg
dGhlIGVudmlyb25tZW50Cj4+IENSRURFTlRJQUxTX0RJUkVDVE9SWSBpcyBub3Qgc2V0IGFueW1v
cmUuIEkgaGF2ZSBubyBpZGVhIGlmIGl0IHdhcyBhbgo+PiBob3N0IHBhY2thZ2UgbWlzY29uZmln
dXJhdGlvbiwgd2hvIGtub3dzLiBIb3dldmVyLCBvbmUgY2FuIGZha2UgaXQgdXNpbmcKPj4gdGhl
IGNvbW1hbmQgYmVsb3c6Cj4+IAo+PiAJQ1JFREVOVElBTFNfRElSRUNUT1JZPS9ydW4vY3JlZGVu
dGlhbHMvZ2V0dHlAdHR5MS5zZXJ2aWNlIG1ha2UKPgo+IFVzdWFsbHkgeW91IHNob3VkIGF2b2lk
IHVzaW5nICdJJyBpbiB0aGUgY29tbWl0IGxvZywgaXQncyBmaW5lIG9ubHkgdW5kZXIgdGhlCj4g
LS0tIHNpZ24gYmVsb3cuIFRoaXMgaW5mb3JtYXRpb24gaXMgc2hvdWxkIGJlIGluIHRoZSBjb21t
aXQgbG9nIHNpbmNlIGl0IGV4cGxhaW4KPiBob3cgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZS4KPgoK
VXN1YWxseSwgSSBuZXZlciB1c2UgSS95b3Uvd2UuLi4gaW4gY29tbWl0IG1lc3NhZ2VzOyB0aGlz
IHdhcyBhbgpleGNlcHRpb24gYmVjYXVzZSBpdCBpcyBhbiBSRkMgKEkgaGF2ZSBub3QgcGxhbm5l
ZCB0byB3cml0ZSBzb21ldGhpbmcKYWZ0ZXIgdGhlIC0tLSwgYW5kIEkgZGlkIGl0IGluIHRoZSBl
bmQuLi4pLgoKSSBkbyBub3Qga25vdyBob3cgdG8ga2VlcCBzdWNoIHRlbXBvcmFyeSB0aGluZ3Mg
aW4gdGhlIGNvbW1pdHMgZm9yICJXSVAiCmNvbW1pdHMuCgpTbyB5b3UgcmlnaHQsIEkgc2hvdWxk
IGhhdmUgbW92ZWQgaXQgYmVmb3JlIHNlbmRpbmcgdGhlIG1haWw7IGJlY2F1c2UKdGhlcmUgaXMg
aGlnaCBjaGFuY2UgSSBmb3Jnb3QgdG8gcmVtb3ZlIGl0LgoKPj4gKyMgZGlzYWJsZSBjcmVkZW50
aWFsIGhvc3Qgc2VydmljZXMgKHNpbmNlIHYyNTIpCj4KPiBDYW4geW91IGV4dGVuZCB0aGlzIGNv
bW1lbnQgdG8gZXhwbGFpbiB0aGF0IGFsbG93IHRvIGF2b2lkIGVycm9ycyBkdXJpbmcgdGhlCj4g
aW1hZ2UgYnVpbGQuCj4KCk9rYXksIHdpbGwgZG8uCgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4K
PgoKUmVnYXJkcywKR2HDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
