Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54598C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 14:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC02D408EC;
	Wed,  5 Jan 2022 14:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08-m5pwfFemH; Wed,  5 Jan 2022 14:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1D7F4037C;
	Wed,  5 Jan 2022 14:32:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87BEA1BF574
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 14:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7446882F19
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 14:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2Rbkcr8cKgj for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 14:32:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FAB782F14
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 14:32:55 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l10so2058466wrh.7
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 06:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=XWx5DHglSJO+h1bGNQxZTbmngEbQkIJSGD9MCgwO7jQ=;
 b=Ok8L9wrQ3/PvpUr6lPEPiteU+vEJ/JaTQNPxC1exOgK4LC25uJgHEIh+kK4DHDzL9t
 wQMwsvByTLyBcRW3kJEvyHppYV+9vi4bFbjAe29jSdlYXtrX2t6mP9pKMxBx8zrv8yiW
 Ri2PwYe2XFT11P8jJPsvQQGPeRBLH6ZY0Uy2d0V2KjjlPBSIlNAtbPqIcZiyqtkar9de
 XJJ3Te9fvxEBh5iAuSZrdHBHgSyGJdtp736NWAsrtiDZ6JtELE+AYSupB9+mH3cyCOeX
 liDwS3itrdwnYEYZzUhzQVHqd06ypPs02MXyaHWtqP7TKrOrBe4OXCqYaqtzB5Zo+eWv
 POmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XWx5DHglSJO+h1bGNQxZTbmngEbQkIJSGD9MCgwO7jQ=;
 b=GY8muUUJdI9S4XrUWYZ71iF2vg7Abme+Z+wVogJODS3lwuowd4pIRDkO44N3lVKYSW
 d+Y5d36SDPS/ssRBetH5AQVEg7W/7MeEJce4+rHXWY8+7UqRGFet7QtsqhUxYDBEL4fK
 GFg+C1OHr0atWmH3tNgCXUJ/hch24VbGJrfvK+9r847FzwjW6m5mU6XRUlKkHFtXn+rY
 4uXXsEzdSI3lWwxhhdr3LVcv08Ui0wvDjhzM5fzPCmw2rVZqR6HJER8IS8IC7NUHFZ2A
 pv9eMOw3Y3KrlN0n04X3gYWOiJGRZMW6IvP3geu8Yk4uou/L5uSv+CdI43sERhzh4E6K
 J6Bw==
X-Gm-Message-State: AOAM533Mj7+chnWExa0BMXU08JYdx9HSzcW/hNfaI99Us8ImlE/7I3yD
 a/EPE4LseyPBcDxOnuiNtjLOCTWGeBFkPg==
X-Google-Smtp-Source: ABdhPJxqctJRX6waXCXl4KRsttRuAezCSOUVoN0uLVNLXis1UyJUS+T7jARV094UP+J3leMcNgHckQ==
X-Received: by 2002:a5d:4450:: with SMTP id x16mr45843513wrr.95.1641393173703; 
 Wed, 05 Jan 2022 06:32:53 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id g6sm42657944wri.67.2022.01.05.06.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 06:32:53 -0800 (PST)
Message-ID: <21546798-75a4-c7ef-6b80-420bf5b516d8@smile.fr>
Date: Wed, 5 Jan 2022 15:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
References: <2209e11a-bda9-5193-9b4d-20a5f0fa34e3@linatsea.fr>
 <20220105142924.4b11ed83@windsurf>
 <5d0600a1-eb8c-8d69-cf9a-fee4fbca0c73@smile.fr>
 <5be78f0b-fdb2-66a0-71a1-11538c064148@linatsea.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <5be78f0b-fdb2-66a0-71a1-11538c064148@linatsea.fr>
Subject: Re: [Buildroot] candidate packages : ros2 and wxwidgets
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

TGUgMDUvMDEvMjAyMiDDoCAxNDo0OSwgVGhpZXJyeSBCdWx0ZWwgYSDDqWNyaXTCoDoKPj4gV2Ug
YWxzbyBoYXZlIHNvbWUgY29tcGFuaWVzIGludGVyZXN0ZWQgYnkgUk9TMiBidXQgdGhleSBhcmUg
dXNpbmcgbWV0YS1yb3MgWW9jdG8KPj4gbGF5ZXIuCj4+Cj4gCj4gVGhhdCB3b3VsZCBiZSB0aGVy
ZWZvcmUgb2YgbGVzcyBpbnRlcmVzdCB0byB0aGVtLCB1bmxlc3MgdGhleSBhcmUgdGhpbmtpbmcg
b2YKPiBzd2l0Y2hpbmcgdG8gYnVpbGRyb290LgoKV2VsbCwgSSBndWVzcyB0aGV5IHVzZSBZb2N0
byBieSBkZWZhdWx0IHNpbmNlIHRoZXJlIGlzIGN1cnJlbnRseSBubyBvdGhlciBjaG9pY2UuCgo+
IEluIG15IGNhc2UsIEkgcmF0aGVyIHNlZSBjb21wYW5pZXMgdGhhdCBqdXN0IHN0YXJ0IHRvIGVu
dGVyIGluICJ0aGUgZW1iZWRkZWQKPiB3b3JsZCIgYnV0IGFscmVhZHkgdXNlIFJPUygxLzIpIG9u
IGRlc2t0b3BzLAo+IHNvIGl0IGlzIHN0aWxsIG5vdCB0byBsYXRlIGZvciB0aGVtIHRvIG1ha2Ug
dGhlIGdvb2QgY2hvaWNlLgoKUk9TIGlzIGRlZmluaXRlbHkgbm90IGFuIGVhc3kgZnJhbWV3b3Jr
IHRvIHBhY2thZ2UgaW50byBCdWlsZHJvb3QsIGl0J3MgZG9hYmxlCmJ1dCByZXF1aXJlcyBhIGxv
dCBvZiB3b3JrIGFuZCB0aW1lLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
