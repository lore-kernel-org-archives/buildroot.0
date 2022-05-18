Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA70C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 17:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3F9E419B0;
	Wed, 18 May 2022 17:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8wovBqP-vDAU; Wed, 18 May 2022 17:24:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 602BF41868;
	Wed, 18 May 2022 17:24:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3714D1BF310
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 17:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24DF641868
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 17:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mu7auwuJWCNR for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 17:24:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FB4E41620
 for <buildroot@buildroot.org>; Wed, 18 May 2022 17:24:00 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id wh22so4986076ejb.7
 for <buildroot@buildroot.org>; Wed, 18 May 2022 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nOSMeRQ9IOFC/cHF7h/iXHPCI8fOU6NkF/uXwE87O/E=;
 b=QXIHKcoypdwzF96wIGc1c4CSId7WZaF1gdjYzuJVd4Dm9xnk9ZXOUa3zNXqXyvYTJZ
 JFNtkL8kW78vDDBtp338hSFe8zqLYyIJXABILzlLKSBDoTDY5oO8phgC0DwC2CkIaRIc
 Y6OWLFzJJcRlGv9Y1td07dLLYMvIZvOvm8mzAoe5OoWOu8BQ+nyn0lYsM+UFpN+15W9b
 KN8vCZrZ2u9i2sBOs37P5gS156JM1p0TBdf6cM3WNnnDQshMDH8jApckI72k3ogwU2vI
 9I3oJJEJt0mxXXuv1sOKfCxB86FnhOpb+nwy3YCmW7C/sT2tCpAG31DrQy8fjO+Q58TO
 1svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nOSMeRQ9IOFC/cHF7h/iXHPCI8fOU6NkF/uXwE87O/E=;
 b=poza8yA5vrWu63/NhiJilX8au1bJohtKhAL0Vj8p2JPCFzk2V5DQbDooasQeeSFsuj
 B0ts8l3vlNEXZG2PlhQAGyKArRQtZGVXWUK5orFVsyRdXHNKSKW65k0E7OU8lZcodU+w
 m3W5vLgqj2RPF7U8YgA4xdVywZL6HaGQq1cH5FrpCSnsqjsAvV0W3ywHRCWIMUN9eGn2
 r+It2jSifLY1mTVRViziXEZ6vuyAou6XNv/FMRRAj8kZIgFnjceb9lw5kcjm74llbXdC
 e1Qd5tm8dC3RAmiwtMSPa650B622HHIcFZNFb7APCxE4W89wWidtRj6x0nYXZci+or3K
 ojkQ==
X-Gm-Message-State: AOAM531CrC07bqO9W7ZxJsfv6gmGcVo2Gpaz9O4r+B2KpBaVSa/p/imy
 pl8klN2vi1o8G8DXbJ298FfWi+6XAW7ldw==
X-Google-Smtp-Source: ABdhPJzy68GKpOEIzqSBT2wTahCxefmG7YolupJ1yL+2WvXAGgJ3zWJ2USvPbM3YTcFJ2Rx1se9MSw==
X-Received: by 2002:a17:907:7247:b0:6f9:bb40:efd8 with SMTP id
 ds7-20020a170907724700b006f9bb40efd8mr557790ejc.273.1652894638359; 
 Wed, 18 May 2022 10:23:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 er21-20020a170907739500b006fe50668941sm1160258ejc.158.2022.05.18.10.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 10:23:57 -0700 (PDT)
Message-ID: <693a9659-d2f2-8a74-2402-592a429af336@mind.be>
Date: Wed, 18 May 2022 19:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Michael Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>
References: <20220510022055.67582-1-joel@jms.id.au>
 <a18d0411-9134-2ee7-62d0-4ba6a1780846@mind.be>
 <87a6bh7h2e.fsf@mpe.ellerman.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87a6bh7h2e.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNi8wNS8yMDIyIDE1OjE3LCBNaWNoYWVsIEVsbGVybWFuIHdyb3RlOgo+IEFybm91dCBW
YW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JpdGVzOgo+PiBPbiAxMC8wNS8yMDIyIDA0
OjIwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4+PiBUaGUgZGVmYXVsdCBkZWZjb25maWcgdGFyZ2V0
IGZvciB0aGUgNjQgYml0IHBvd2VycGMga2VybmVsIGlzCj4+PiBwcGM2NF9kZWZjb25maWcsIHRo
ZSBiaWcgZW5kaWFuIGNvbmZpZ3VyYXRpb24uCj4+Pgo+Pj4gV2hlbiBidWlsZGluZyBmb3IgcG93
ZXJwYzY0bGUgdXNlcnMgd2FudCB0aGUgbGl0dGxlIGVuZGlhbiBrZXJuZWwgYXMKPj4+IHRoZXkg
Y2FuJ3QgYm9vdCBMRSB1c2Vyc3BhY2Ugb24gYSBCRSBrZXJuZWwuCj4+Pgo+Pj4gRml4IHVwIHRo
ZSBkZWZjb25maWcgdXNlZCBpbiB0aGlzIGNhc2UuIFRoaXMgd2lsbCBhdm9pZCB0aGUgZm9sbG93
aW5nCj4+PiBhdXRvYnVpbGRlciBmYWlsdXJlOgo+Pj4KPj4+ICAgIFZEU08zMkEgYXJjaC9wb3dl
cnBjL2tlcm5lbC92ZHNvMzIvc2lndHJhbXAubwo+Pj4gICAgY2MxOiBlcnJvcjog4oCYLW0zMuKA
mSBub3Qgc3VwcG9ydGVkIGluIHRoaXMgY29uZmlndXJhdGlvaW4KPj4+ICAgIG1ha2VbNF06ICoq
KiBbYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvMzIvTWFrZWZpbGU6NDk6IGFyY2gvcG93ZXJwYy9r
ZXJuZWwvdmRzbzMyL3NpZ3RyYW1wLm9dIEVycm9yIDEKPj4+Cj4+PiAgICBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9kZDc2ZDUzYmFiNTY0NzBjMGI4M2UyOTY4NzJkN2Ji
OTBmOWU4Mjk2Lwo+Pj4KPj4+IE5vdGUgdGhhdCB0aGUgZmFpbHVyZSBpbmRpY2F0ZXMgdGhlIHRv
b2xjaGFpbiBpcyBjb25maWd1cmVkIHRvIGRpc2FibGUKPj4+IHRoZSAzMiBiaXQgdGFyZ2V0LCBj
YXVzaW5nIHRoZSBrZXJuZWwgdG8gZmFpbCB3aGVuIGJ1aWxkaW5nIHRoZSAzMiBiaXQKPj4+IFZE
U08uIFRoaXMgaXMgb25seSBhIHByb2JsZW0gb24gdGhlIEJFIGtlcm5lbCBhcyB0aGUgTEUga2Vy
bmVsIGRpc2FibGVzCj4+PiBDT05GSUdfQ09NUEFULCBha2EgMzIgYml0IHVzZXJzcGFjZSBzdXBw
b3J0LCBieSBkZWZhdWx0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9l
bEBqbXMuaWQuYXU+Cj4+Cj4+ICAgIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuIEhvd2V2ZXIs
IHRoZSBkZWZjb25maWcgbWVjaGFuaXNtIGZvciAqYWxsKiBwb3dlcnBjCj4+IHNlZW1zIHByZXR0
eSBicm9rZW4uIEhlcmUncyB3aGF0IHdlIGhhdmUgaW4gNS4xNiwgYmVmb3JlIHRoYXQgdGhlcmUg
d2FzCj4+IHNvbWV0aGluZyBzaW1pbGFyOgo+Pgo+PiAjIElmIHdlJ3JlIG9uIGEgcHBjL3BwYzY0
L3BwYzY0bGUgbWFjaGluZSB1c2UgdGhhdCBkZWZjb25maWcsIG90aGVyd2lzZSBqdXN0IHVzZQo+
PiAjIHBwYzY0X2RlZmNvbmZpZyBiZWNhdXNlIHdlIGhhdmUgbm90aGluZyBiZXR0ZXIgdG8gZ28g
b24uCj4+IHVuYW1lIDo9ICQoc2hlbGwgdW5hbWUgLW0pCj4+IEtCVUlMRF9ERUZDT05GSUcgOj0g
JChpZiAkKGZpbHRlciBwcGMlLCQodW5hbWUpKSwkKHVuYW1lKSxwcGM2NClfZGVmY29uZmlnCj4+
Cj4+ICAgIFNvIEkgZ3Vlc3Mgd2Ugc2hvdWxkIHVzZSBhIHNwZWNpZmljIGRlZmNvbmZpZyBmb3Ig
KmFsbCogcG93ZXJwYy4KPj4KPj4gICAgVGhlIGFyY2gtZGVmYXVsdCBkZWZjb25maWcgaXMgZ2Vu
ZXJhbGx5IG5vdCByZWFsbHkgcmVsaWFibGUsIGZvciBleGFtcGxlIGZvcgo+PiBhcm0gaXQgYWx3
YXlzIHRha2VzIHY3X211bHRpLCBidXQgdGhhdCB3b24ndCB3b3JrIGZvciB2N20gdGFyZ2V0cy4u
Lgo+IAo+IFRoZXJlJ3MgYSBmdW5kYW1lbnRhbCBwcm9ibGVtIHRoYXQganVzdCB0aGUgImFyY2gi
IGlzIG5vdCBzdWZmaWNpZW50Cj4gZGV0YWlsIHdoZW4geW91J3JlIGJ1aWxkaW5nIGEga2VybmVs
LgoKICBZZXMsIHdoaWNoIGlzIHByZXR0eSBtdWNoIHVuYXZvaWRhYmxlLgoKPiBUd28gQ1BVcyB0
aGF0IGltcGxlbWVudCB0aGUgc2FtZSB1c2VyLXZpc2libGUgImFyY2giIG1heSBkaWZmZXIgZW5v
dWdoCj4gYXQgdGhlIGtlcm5lbCBsZXZlbCB0byByZXF1aXJlIGEgZGlmZmVyZW50IGRlZmNvbmZp
Zy4KPiAKPiBIYXZpbmcgc2FpZCB0aGF0IEkgdGhpbmsgd2UgY291bGQgaGFuZGxlIHRoaXMgYmV0
dGVyIGluIHRoZSBwb3dlcnBjCj4ga2VybmVsLiBPdGhlciBhcmNoZXMgYWxsb3cgc3BlY2lmeWlu
ZyBhIGRpZmZlcmVudCB2YWx1ZSBmb3IgQVJDSCwgd2hpY2gKPiB0aGVuIGlzIGZlZCBpbnRvIHRo
ZSBkZWZjb25maWcuCgogIEkgZG9uJ3Qga25vdyBpZiBpdCdzIHdvcnRoIGJvdGhlcmluZyB3aXRo
IHRoYXQuIEl0IGNlcnRhaW5seSB3b3VsZCBub3QgbWFrZSAKb3VyIGxpZmUgZWFzaWVyLCBiZWNh
dXNlIGl0IHdvdWxkIG1lYW4gd2UgbmVlZCB0byBzZXQgQVJDSCBjb3JyZWN0bHkuIElmIHdlIGNh
biAKZG8gdGhhdCwgd2UgY2FuIGp1c3QgYXMgd2VsbCBzZXQgdGhlIGRlZmNvbmZpZyBjb3JyZWN0
bHkuCgo+IFRoYXQgd2F5IHlvdSBjb3VsZCBhdCBsZWFzdCBwYXNzIEFSQ0g9cHBjL3BwYzY0L3Bw
YzY0bGUsIGFuZCBnZXQgYW4KPiBhcHByb3ByaWF0ZSBkZWZjb25maWcuCj4gCj4gSSdsbCB3b3Jr
IG9uIHNvbWUga2VybmVsIGNoYW5nZXMgZm9yIHRoYXQuCgogIEkgdGhpbmsgdGhlIG1vc3QgaW1w
b3J0YW50IHRoaW5nIGlzIHRoYXQgaXQgbWFrZXMgbm8gc2Vuc2UgdG8gcmVseSBvbiB1bmFtZSAK
d2hlbiBBUkNIIGFuZC9vciBDUk9TU19DT01QSUxFIGFyZSBzZXQuCgogIFJlZ2FyZHMsCiAgQXJu
b3V0Cgo+IAo+IGNoZWVycwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
