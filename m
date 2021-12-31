Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF606C433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 11:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65E7E409C3;
	Fri, 31 Dec 2021 11:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9oXt_lhv8pTC; Fri, 31 Dec 2021 11:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08C4409AB;
	Fri, 31 Dec 2021 11:42:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DE231BF33C
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 11:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C1A98195C
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 11:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOcHv0D2n1zM for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 11:42:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD67B81947
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 11:42:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id b73so17230016wmd.0
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 03:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=GF9BRrkjUs3BaxgOL08biadFY5ljRSZLBLJyRsF7QjA=;
 b=CFm9odW7Cia5r9z1LQygJ35/s2rLDCbO3iBhYB+TnZL9EqpNCuJSmEimixY5+9BS7L
 moTWlJ6QVCq1xf4vf6zAo2FtoZTOgGTWVhHiNJynkw33nshEH5Q+lEnenWWnZztkmIHZ
 pWuSkgc5pgJlUvPWOltAFfAef5hWOLAlAO/7kxKIc2l0dKgs70DUmcfuB3OxS96YkCNz
 rzOrFYIgnHTeZ+azztcayTVs1JcqqZNqaTxovj++w7pqvB/4AN9CirI5mFXEOcHZbgIh
 0jbk7cIwhX+67x2LdFHh+hhA6kcmo/Jo+5p4Pz/KZA74lb6a5OYzhV8H0B28c0B1mLBe
 rkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GF9BRrkjUs3BaxgOL08biadFY5ljRSZLBLJyRsF7QjA=;
 b=GcDTXVhqLrxVpoppIbdIp+vtZ/AQMrNAH8rDoXG4gDosBxlrPxm7cYWJ0u3FhHy57n
 +nRexz7hAG7DG4KToAIb/EGuMpunZXIKA34uLYA50M9ks114REixV0hVL4n1mxz1I1Ju
 NkgmvN1zLelPVPxvkrXzGzSEdzlvVatVYr5etby5GrVd1hXF9xHqvY2LLnm6AWhqRtxo
 CEStr6Pr5eNka5mk9dkClqcd1KEYPw0+Er7C3A5X3yU51ustpHG8dNVyvdMTTad8ylDh
 N1C6NyorcxZXoL2qfUegELogaoW9CyM9oCet4oF4w07PBydtr4Hkr8MIHUex1z+ig1oJ
 wAbA==
X-Gm-Message-State: AOAM531mPa57y8HUEWiEd/IQHSQit6aBpYV8+Yy6mxqLh6qWjEg9m7Hi
 U4Ln6jv99mPFKA5ZGUvarIjYQR+Cmtc=
X-Google-Smtp-Source: ABdhPJxBainjtZ81hwlmh/LShifTyhHD+WJpnh9LMHfLF6uP6tMwo/dTejgExGIWXONNGJazb42OSg==
X-Received: by 2002:a05:600c:2242:: with SMTP id
 a2mr29274810wmm.63.1640950963901; 
 Fri, 31 Dec 2021 03:42:43 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id a24sm10642235wmj.8.2021.12.31.03.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 03:42:43 -0800 (PST)
Message-ID: <813b2250-89c2-59ba-44c7-6cae63f4c9de@gmail.com>
Date: Fri, 31 Dec 2021 12:42:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211231090030.3437133-1-fontaine.fabrice@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211231090030.3437133-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ogre: disable csharp
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMzEvMTIvMjAyMSDDoCAxMDowMCwgRmFicmljZSBGb250YWluZSBhIMOpY3JpdMKgOgo+IERp
c2FibGUgY3NoYXJwIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIHB5
dGhvbiBzaW5jZQo+IGJ1bXAgdG8gdmVyc2lvbiAxLjEyLjEyIGluIGNvbW1pdAo+IDRlODE0MjI3
Y2FhMGE1ZDE5MGUzNmNkNTE3NDIzOWZlNWM2MjcyNzkgYW5kCj4gaHR0cHM6Ly9naXRodWIuY29t
L09HUkVDYXZlL29ncmUvY29tbWl0LzNmZDgzOWM3NmExNTNlNjE0YzllMzEzMWZmOTk1OTIzNDA5
OWU3NDk6Cj4gCj4gL2Jpbi9zaDogMTogbWNzOiBub3QgZm91bmQKPiAKPiBGaXhlczoKPiAgLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy81ZjM4NGRiZWQ4ZTUyNDFmOTEw
NzJiZmZmYTU0YmE2YjljNTA5NzUxCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWlu
ZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpBY2tlZC1ieTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gLS0tCj4gIHBh
Y2thZ2Uvb2dyZS9vZ3JlLm1rIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29ncmUvb2dyZS5tayBiL3BhY2thZ2Uvb2dyZS9v
Z3JlLm1rCj4gaW5kZXggNzJjOTZjYjMzYS4uNzJmZDYxNmMwYyAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL29ncmUvb2dyZS5tawo+ICsrKyBiL3BhY2thZ2Uvb2dyZS9vZ3JlLm1rCj4gQEAgLTMzLDYg
KzMzLDcgQEAgT0dSRV9DWFhGTEFHUyA9ICQoVEFSR0VUX0NYWEZMQUdTKSAtREdMRVdfTk9fR0xV
Cj4gICMgRGlzYWJsZSBqYXZhIGFuZCBudmlkaWEgY2cgc3VwcG9ydC4KPiAgIyBEaXNhYmxlIGlt
Z3VpIG92ZXJsYXkgdG8gYXZvaWQgZXh0cmEgZG93bmxvYWQgZnJvbSBDTWFrZS4KPiAgT0dSRV9D
T05GX09QVFMgPSAtRE9HUkVfQlVJTERfREVQRU5ERU5DSUVTPU9GRiBcCj4gKwktRE9HUkVfQlVJ
TERfQ09NUE9ORU5UX0NTSEFSUD1PRkYgXAo+ICAJLURPR1JFX0JVSUxEX0NPTVBPTkVOVF9KQVZB
PU9GRiBcCj4gIAktRE9HUkVfQlVJTERfUExVR0lOX0NHPU9GRiBcCj4gIAktRE9HUkVfQlVJTERf
Q09NUE9ORU5UX09WRVJMQVlfSU1HVUk9T0ZGIFwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
