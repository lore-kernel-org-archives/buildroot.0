Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33158C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA38260B01;
	Tue, 19 Apr 2022 20:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1v8d66b9-7mH; Tue, 19 Apr 2022 20:34:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7D1B60AB0;
	Tue, 19 Apr 2022 20:34:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 029BC1BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E266541717
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GjQvCc97FC6 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:34:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EC86415DB
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:34:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ks6so35319279ejb.1
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1uFHAbBKNC8G6qFA1s9WfmeAuYuvifX2g2RQV8FuOrY=;
 b=cXFiOmJTElfVPRlZkw+0JbkVjUzJQBZdKCbPGEJyPMrQZReodfeUOPNpnRXqWeoROJ
 pBOaYjwdmev7cc+WQG3nA0u68aDcxF9sW7GCV3AJucfpbWLzkC/gY24mdPFxR+cDk07j
 n57BN6Kaeqpn0pkYIdIqIxKJV5YsoHECyYUtxzwqBwoiRSpGOEUum0sXA/2NFDO8tLRo
 IVho5Fl1AlrHikSctsEocAc8SwNY03g78g0jrJ7+Hkzs78YdIFTJdAJzLc1ECwJPTFWr
 /GPi9fh0aAJ0Hqk8sB+bipcQZdLwHfEyELRGBoMkskl3itoR6CQYnS76FsKF7A6IOBCQ
 E9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1uFHAbBKNC8G6qFA1s9WfmeAuYuvifX2g2RQV8FuOrY=;
 b=O1umw+fRyTur+ZVqflk21XsmmQuwJx0wtNjc7JqRT4WggC3V7aT1kCYwiVHNWR3wQn
 hZJrYgmhMGXCyCjKKKz+Lfks4XXAzvNXUjDjTEG6rJpaw9V82GnNSFttEMO/s4aOhHng
 5jL14LBHHuyjRYKZ8xziB9svnuHmvAk95UjoPaLUsk7AWm7Y+eGnmSNEmAFQUgeawLLp
 T2GEjDbhRO2Wqqptrw0nb9iix7re6x2dcRayLfxAQT5qMsF64yIiQdm5nBXnrZreDhAO
 v83vCtKlAd2FgZc/0h8GeTj2I20At4Uu3gOy3sfXCnkIup5HTtCu3IaLCxWm2WH6N4hl
 Y3dg==
X-Gm-Message-State: AOAM533BpYSkfCRhE7Ln4cS1Ye8HifzEB4w5riuAoa8yDhlMGAHlBFtn
 GOmAf+EIJG4H5pi8NCe3epnAlg==
X-Google-Smtp-Source: ABdhPJzWjELBLDPyN/qokQW/YZvZG3/uvirvWsCsAXKXVi6BIT6RKNCVYoPvlN0NnY/9NaP/Hdooxg==
X-Received: by 2002:a17:906:57c1:b0:6d6:da73:e9c0 with SMTP id
 u1-20020a17090657c100b006d6da73e9c0mr15543815ejr.45.1650400487651; 
 Tue, 19 Apr 2022 13:34:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a1709061b5800b006e88dfea127sm5986981ejg.3.2022.04.19.13.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 13:34:47 -0700 (PDT)
Message-ID: <e47c0b0e-6eaf-ddbb-2b4e-a3dcd2b3c22f@mind.be>
Date: Tue, 19 Apr 2022 22:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20220419043340.5848-1-jose.pekkarinen@unikie.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419043340.5848-1-jose.pekkarinen@unikie.com>
Subject: Re: [Buildroot] [PATCH v3] package/wpa_supplicant: add overrides
 configuration option
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
Cc: Mika Joenpera <mika.joenpera@unikie.com>,
 Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wNC8yMDIyIDA2OjMzLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IEZyb206IE1p
a2EgSm9lbnBlcmEgPG1pa2Euam9lbnBlcmFAdW5pa2llLmNvbT4KPiAKPiBPdmVycmlkZXMgY29u
ZmlndXJhdGlvbiBwb3NzaWJpbGl0eSBlbmFibGVkIHRocm91Z2gKPiB3cGFfc3VwcGxpY2FudCBj
b25maWd1cmF0aW9uIGZpbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlrYSBKb2VucGVyYSA8bWlr
YS5qb2VucGVyYUB1bmlraWUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4g
PGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgo+IFJldmlld2VkLWJ5OiBZZWdvciBZZWZyZW1v
diA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+IFsgdjEgLT4gdjIgXQo+IC0gYWRkIEhF
IG92ZXJyaWRlcwo+IC0gY29zbWV0aWMgY2hhbmdlcwo+IAo+IFsgdjIgLT4gdjMgXQo+IC0gYWRk
IG1pc3NpbmcgSEUgb3ZlcnJpZGVzIGluIENvbmZpZy5pbgo+IAo+ICAgcGFja2FnZS93cGFfc3Vw
cGxpY2FudC9Db25maWcuaW4gICAgICAgICB8ICA3ICsrKysrKysKPiAgIHBhY2thZ2Uvd3BhX3N1
cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWsgfCAxMiArKysrKysrKysrKysKPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dwYV9z
dXBwbGljYW50L0NvbmZpZy5pbiBiL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluCj4g
aW5kZXggOGYwOTVjZGYyZC4uZWYyNTU3YjhiMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dwYV9z
dXBwbGljYW50L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmln
LmluCj4gQEAgLTg0LDYgKzg0LDEzIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FO
VF9NRVNIX05FVFdPUktJTkcKPiAgIAkgIEVuYWJsZSBzdXBwb3J0IGZvciBvcGVuIGFuZCBzZWN1
cmVkIG1lc2ggbmV0d29ya2luZwo+ICAgCSAgKElFRUUgODAyLjExcykKPiAgIAo+ICtjb25maWcg
QlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfT1ZFUlJJREVTCj4gKwlib29sICJFbmFibGUgSFQv
VkhUL0hFIG92ZXJyaWRlcyIKPiArCWhlbHAKPiArCSAgRW5hYmxlIHdwYV9zdXBwbGljYW50IG92
ZXJyaWRlcyBmb3IgSFQsIFZIVCBhbmQgSEUgKGRpc2FibGUKPiArCSAgSFQvSFQ0MCwgbWFzayBN
Q1MgcmF0ZXMsIGV0Yy4pIGluIHdwYV9zdXBwbGljYW50Cj4gKwkgIGNvbmZpZ3VyYXRpb24gZmls
ZS4KPiArCj4gICBjb25maWcgQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfQVVUT1NDQU4KPiAg
IAlib29sICJFbmFibGUgYXV0b3NjYW4iCj4gICAJaGVscAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rIGIvcGFja2FnZS93cGFfc3VwcGxpY2Fu
dC93cGFfc3VwcGxpY2FudC5tawo+IGluZGV4IDNjMGIwYzFkZmMuLmQ4NTdiMzJiMTkgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5tawo+ICsrKyBi
L3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWsKPiBAQCAtMTEwLDYgKzEx
MCwxOCBAQCBlbHNlCj4gICBXUEFfU1VQUExJQ0FOVF9DT05GSUdfRElTQUJMRSArPSBDT05GSUdf
TUVTSAo+ICAgZW5kaWYKPiAgIAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5U
X09WRVJSSURFUykseSkKPiArV1BBX1NVUFBMSUNBTlRfQ09ORklHX0VOQUJMRSArPSBcCj4gKwlD
T05GSUdfSFRfT1ZFUlJJREVTIFwKPiArCUNPTkZJR19WSFRfT1ZFUlJJREVTIFwKPiArCUNPTkZJ
R19IRV9PVkVSUklERVMKPiArZWxzZQo+ICtXUEFfU1VQUExJQ0FOVF9DT05GSUdfRElTQUJMRSAr
PSBcCj4gKwlDT05GSUdfSFRfT1ZFUlJJREVTIFwKPiArCUNPTkZJR19WSFRfT1ZFUlJJREVTIFwK
PiArCUNPTkZJR19IRV9PVkVSUklERVMKPiArZW5kaWYKPiArCj4gICBpZmVxICgkKEJSMl9QQUNL
QUdFX1dQQV9TVVBQTElDQU5UX0FVVE9TQ0FOKSx5KQo+ICAgV1BBX1NVUFBMSUNBTlRfQ09ORklH
X0VOQUJMRSArPSBcCj4gICAJQ09ORklHX0FVVE9TQ0FOX0VYUE9ORU5USUFMIFwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
