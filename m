Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F40C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 13:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBD76FB3A;
	Wed,  5 Jan 2022 13:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rrq26UBswjyy; Wed,  5 Jan 2022 13:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 291E06FB7A;
	Wed,  5 Jan 2022 13:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F23D71BF2C2
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 13:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEBB082FEA
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 13:40:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hwe2KkCNPjhn for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 13:40:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3F0A82FE4
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 13:40:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i22so83082756wrb.13
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 05:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iTISMZ4NvWupO24DHX5WCSUUpPwZ9BVjby3lAqJpzkI=;
 b=g31QJAv3sXzfy3KdariZenzUWgtxsqTQbseNeDWWXkEan5nvwms+Ai0Z/hNAf8RExq
 QUX41ebT96ABInRDMljZxseEcSeaPwcZvNjUtqwUgbnZ7TBJfcp6+d7ufMk62bcrUnfP
 xyQw8equqRldGJMUlYFF5kQ0zgH7sEGTChWk0YKKPFL1XML1rj5UmA3RHOoRfAC6zAYy
 q3k0ZtOEd2Lliy8TNnp+Ega3WA/UM4/FVuQkVu8Q1gtQYqopipgLcIQ8Bmx92kIOAQt9
 5aAB9lvnCkZawjGyWOsdg0OXyjqgAfE8fWAM991MyLEcwt5fdN6yTRIafiuAlXpDyGHG
 Oj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iTISMZ4NvWupO24DHX5WCSUUpPwZ9BVjby3lAqJpzkI=;
 b=kYIBSKMdbmTNKfz3g36i3kj0aI8U3jIWDbLkWdYdHNEh4pCl+cK5WWkyIcK5wLyvBD
 iuEzN2ENHSgRixDaAzt+6Oy56jBl4jjuUU9RSAhd46tLM75LBz2wd121SDYemwDs3U6g
 DI/PnOnGRsLdzzs3Fpc1vNGmpeiobg5Wd+m/jZzP/ywK8NS+3zoSZ685hTY+XKYKBQZt
 dqQvbuLCYl9OdxYMXEd+WIMJY2xUNX+ro7AajBffNm2JejbU0BvPU3Y97nU+dTnAIi7Y
 iPTSUm6iQ+lWWfMEUJp2lGWgSwEYNYZIkbJkIgBtPAr3nvoRdq72iR/Kpo/dGYwCAonU
 89WA==
X-Gm-Message-State: AOAM533czjQvOkeSSdLKMvrsZLuvU+hvWOEZXa9Ox/YsuwhKU65eaTmP
 1WdEkYNkffCLg6pYG2rGt83RwQ==
X-Google-Smtp-Source: ABdhPJxjuSa0JYvSMSEVrXiEWbcExjQeE+qtDqRBswETP5961GvdlnAGlmNZBvOeP8DY2uHgaAAUZA==
X-Received: by 2002:adf:f251:: with SMTP id b17mr24358861wrp.557.1641390048863; 
 Wed, 05 Jan 2022 05:40:48 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id m5sm2575691wml.48.2022.01.05.05.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 05:40:48 -0800 (PST)
Message-ID: <5d0600a1-eb8c-8d69-cf9a-fee4fbca0c73@smile.fr>
Date: Wed, 5 Jan 2022 14:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
References: <2209e11a-bda9-5193-9b4d-20a5f0fa34e3@linatsea.fr>
 <20220105142924.4b11ed83@windsurf>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220105142924.4b11ed83@windsurf>
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAwNS8wMS8yMDIyIMOgIDE0OjI5LCBUaG9tYXMgUGV0YXp6b25pIGEgw6ljcml0
wqA6Cj4gSGVsbG8gVGhpZXJyeSwKPiAKPiBPbiBXZWQsIDUgSmFuIDIwMjIgMTA6NDY6NDYgKzAx
MDAKPiBUaGllcnJ5IEJ1bHRlbCA8dGhpZXJyeS5idWx0ZWxAbGluYXRzZWEuZnI+IHdyb3RlOgo+
IAo+PiBGb3IgYSBudW1iZXIgb2YgY29tcGFuaWVzLCBJIGNhbiBzZWUgYSBncm93aW5nIGludGVy
ZXN0IGluIGhhdmluZyByb3MyIAo+PiBzdXBwb3J0IGluIGJ1aWxkcm9vdC4KPj4gQ3VycmVudGx5
LCBwZW9wbGUgd2FudGluZyB0byBwcm90b3R5cGUgKG9yIG1ha2UgYSBwcm9kdWN0KSBhIHJvYm90
aWNzIAo+PiBhcHBsaWNhdGlvbnMsIGFyZSBzdHVjawo+PiB0byBlaXRoZXIgeW9jdG8sIG9yLCB3
b3JzZSwgdG8gYSBkZXNrdG9wLWxpa2UgZGlzdHJpYnV0aW9uLgoKV2UgYWxzbyBoYXZlIHNvbWUg
Y29tcGFuaWVzIGludGVyZXN0ZWQgYnkgUk9TMiBidXQgdGhleSBhcmUgdXNpbmcgbWV0YS1yb3Mg
WW9jdG8KbGF5ZXIuCgo+Pgo+PiBBbm90aGVyIHRvcGljIGlzIGNoYXJ0cyBkaXNwbGF5aW5nIGZv
ciBzYWlsaW5nLiBUaGUgbW9zdCBmYW1vdXMgCj4+IGFwcGxpY2F0aW9uIChtb3N0bHkgdXNlZAo+
PiBvbiByYXNwYmVycnkgYnkgc2FpbG9ycykgaXMgT3BlbkNwbiwgd2hpY2ggaXMgZ3JlYXQgYnV0
IHJlbGllcyBvbiB3eFdpZGdldHMuCj4+Cj4+IFdoZXJlYXMgSSBhbSBsb29raW5nIGZvciBhIHNw
b25zb3IgZm9yIGFkZGluZyByb3MyIHRvIGJ1aWxkcm9vdCwgCj4+IChiZWNhdXNlIGl0IGlzIGEg
cXVpdGUgc2lnbmlmaWNhbnQgd29yaywKPj4gdGhhdCBpbXBsaWVzIHRvIGFkZCBhIG5ldyBidWls
ZCBmcmFtZXdvcmspLCBJIGFtIHRoaW5raW5nIGFib3V0IHVzaW5nIG15IAo+PiAobGl0dGxlKSBm
cmVlIHRpbWUgZm9yIHd4V2lkZ2V0cyAoYW5kIE9wZW5DcG4gbGF0ZXIpLgo+PiBUaGVyZSBoYXMg
YmVlbiBhbiBhdHRlbXB0IGlzIHRoZSBwYXN0IAo+PiAoaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0
L3Nob3dfYnVnLmNnaT9pZD0yNjEpIGJ1dCBpdCBkb2VzIG5vdAo+PiBzZWVtIHRvIGhhdmUgbGVh
ZCB0byBhbnl0aGluZyBlbHNlIHNpbmNlIHRoYXQgdGltZS4KPj4KPj4gV2hhdCBhcmUgeW91ciB0
aG91Z2h0IGFib3V0IHRoZXNlIGJvdGggcGFja2FnZXMgPyBBbnkgaWRlYXMsIG9yIGxpbmtzIHRv
IAo+PiBzb21lIFdJUCBzdHVmZiA/Cj4gCj4gVGhlc2UgcGFja2FnZXMgd291bGQgY2VydGFpbmx5
IGJlIHZlcnkgd2VsY29tZS4gUk9TMiBlc3BlY2lhbGx5IG1ha2VzIGEKPiBsb3Qgb2Ygc2Vuc2Uu
Cj4gCj4gU29tZSBwcmlvciB3b3JrOgo+IAo+ICAgaHR0cHM6Ly9naXRodWIuY29tL21jaGFsYWlu
L2JyX3Jvcwo+ICAgaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3Qv
MjAxOS1NYXJjaC8yNDY0OTcuaHRtbAoKVGhpcyBpcyBmb3IgUk9TICh2MSksIHRoaXMgc2VyaWVz
IG11c3QgYmUgcmV3b3JrZWQgZm9yIFJPUzIuCgpNYXJjIGhhZCBubyB0aW1lIGZvciBjbGVhbmlu
ZyBhbmQgdXBzdHJlYW1pbmcgdGhpcyBzZXJpZXMgOi0vCgo+IAo+IEknbGwgYmUgaGFwcHkgdG8g
aGVscCBpbiB0aGUgcmV2aWV3IG9mIHN1Y2ggcGFja2FnZXMuCgpTYW1lIGhlcmUsIEknbGwgdHJ5
IHRvIGhlbHAuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4g
VGhvbWFzCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
