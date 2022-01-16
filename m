Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D7AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 12:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A872F4030D;
	Sun, 16 Jan 2022 12:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gLv6ur_Fz6KP; Sun, 16 Jan 2022 12:37:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC13A4030B;
	Sun, 16 Jan 2022 12:37:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A945F1BF573
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 12:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 805A740308
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 12:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNZw8EiS1TFq for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 12:37:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8081C4030C
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 12:37:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so16146949wme.4
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 04:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XoJ58pm0orcpSaVCKR8iCDAQppvwB678FMAqKpEjBKw=;
 b=nTEzOymHemNuxTRabFDC5VHw3XcTQ7WU/1r6+G1U9iASOidy/N/TECdXuA1ZwsNaMa
 uzDhEqlUWQGkTW/MTGggVa46oHzfBsD5VJEeKZXy9HLFPE5qg2zGSlIchIT7wF1+JPnR
 j/VBjvF+QxCAhGKvN5YHVDsndAymtfeg8fa3LLeHscHLN0Kk+zc9hH4CLQg0Lxrgdgps
 avCRLtadQ/eFEYEpQ97VkxIP0knVuDTeF2nzCDchsNZKxfCBu3QbN0n+0sxvc5bbl5a5
 FGEURZwwYbdFhqh9RTD4FhD7v15LGvfZp68bGSqEhk2faA+E6/igNs0mWYhNloAZGnz5
 atvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XoJ58pm0orcpSaVCKR8iCDAQppvwB678FMAqKpEjBKw=;
 b=7Wz3bQWtM68G31N5//TjOANGZsA3flHS+88wWON0wxXKnA8Odxf3f48xL8T+jD2yrl
 hRfnVw3EmdRG7WEY7bs5eNiS4o1zqRMN7VGEa98sDDRDQnMLm/xMVF014SigoBiP1pkF
 k2nIS7aWT0UMZN/o8JQU6jvLC3RS6ayVt6GGjeC5RnlPXT8h5DvIfO/qz0cKRd06KAnw
 LdV3qjV23zloShbuapDOSPKzBxU7YeVmKa2MPohACwJnZKwojkt9Wd6f01mlT+8Tffj8
 WU6G2CPuoEAXqsA25rCJIqtW/Z/CAeDEbN1RPYYnE7ONODu70+E0PLFPBQhdKcSkQiQo
 iTTA==
X-Gm-Message-State: AOAM532DTsXfW6yzMMeWUZ4jNEOyWnwMd2/GHJCLAgG6HxiGPFBkQYWG
 B6cm1A7unweF3Pg+4u0wsIIbKMnwuyA=
X-Google-Smtp-Source: ABdhPJz7XbLvEZFY1yOW28cz2idBvVis+hN9CkGXvlC8RS6+et9fXQQVx4MBLDurDAO3cldqSJxEmA==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr15316203wri.193.1642336668751; 
 Sun, 16 Jan 2022 04:37:48 -0800 (PST)
Received: from [192.168.1.43]
 (amontpellier-158-1-160-63.w92-145.abo.wanadoo.fr. [92.145.131.63])
 by smtp.gmail.com with ESMTPSA id u10sm13054860wrs.28.2022.01.16.04.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 04:37:48 -0800 (PST)
Message-ID: <6c222807-93f7-2186-8ca7-868b893abf55@gmail.com>
Date: Sun, 16 Jan 2022 13:37:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220115143344.12319-1-romain.naour@gmail.com>
 <20220115143344.12319-2-romain.naour@gmail.com>
 <20220115160517.GQ1945846@scaer>
 <737f135e-b936-a21c-8775-349d7db7fb88@gmail.com>
 <20220115202303.GA2216429@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220115202303.GA2216429@scaer>
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/boot-qemu-image.py:
 increase the timeout by 10
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

SGVsbG8gWWFubiwgQWxsLAoKTGUgMTUvMDEvMjAyMiDDoCAyMToyMywgWWFubiBFLiBNT1JJTiBh
IMOpY3JpdMKgOgo+IFJvbWFpbiwgQWxsLAo+IAo+IE9uIDIwMjItMDEtMTUgMjA6MjggKzAxMDAs
IFJvbWFpbiBOYW91ciBzcGFrZSB0aHVzbHk6Cj4+IExlIDE1LzAxLzIwMjIgw6AgMTc6MDUsIFlh
bm4gRS4gTU9SSU4gYSDDqWNyaXTCoDoKPj4+IE9uIDIwMjItMDEtMTUgMTU6MzMgKzAxMDAsIFJv
bWFpbiBOYW91ciBzcGFrZSB0aHVzbHk6Cj4+Pj4gQXMgZm9yIHRoZSBCdWlsZHJvb3QgdGVzdHN1
aXRlLCBtdWx0aXBseSBldmVyeSBlbXVsYXRvciB0aW1lb3V0IGJ5IDEwCj4+Pj4gdG8gYXZvaWQg
c3BvcmFkaWMgZmFpbHVyZXMgaW4gZWxhc3RpYyBydW5uZXJzLgo+Pj4+Cj4+Pj4gcWVtdV9hcm1f
dmV4cHJlc3NfdHpfZGVmY29uZmlnIHRlc3RlZCBsb2NhbGx5IHdpdGggc3VjZXNzLgo+Pj4+Cj4+
Pj4gRml4ZXM6Cj4+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy8xOTcwMDg0MDQ2Cj4+PiBBcmUgeW91IHN1cmUgaW5jcmVhc2luZyB0aGUgdGltZW91
dCB3aWxsIGZpeCB0aGlzIGZhaWx1cmU/IFRoZQo+Pj4gYnVpbGQtcnVuLmxvZyBjb250YWlucyBh
bm90aGVyIGVycm9yOgo+IFstLVNOSVAtLV0KPj4+ICAgICBFUlJPUjogcmVzZXJ2aW5nIGZkdCBt
ZW1vcnkgcmVnaW9uIGZhaWxlZCAoYWRkcj03ZmUwMDAwMCBzaXplPTIwMDAwMCkKPj4+ICAgICAg
ICBVc2luZyBEZXZpY2UgVHJlZSBpbiBwbGFjZSBhdCA0MDAwMDAwMCwgZW5kIDQwMDA1MWY3Cj4+
PiBTbywgdG8gbWUsIHRoaXMgaXMgbm90IGEgdGltZW91dCBpc3N1ZSwgYnV0IGFuIGFjdHVhbCBi
b290IGlzc3VlLgo+Pgo+PiBUaGUgc3lzdGVtIHN0b3AgaW4gdGhlIG1pZGRsZSBvZiBvcHRlZSBz
dGFydHVwCj4+IG9wdGVlOiBkeW5hbWljIHNoYXJlZCBtZW1vcnkgaXMgZW5hYmxlZAo+IAo+IEkg
d2FzIHZlcnkgY29uZnVzZWQgYnkgdGhlIGFib3ZlLiBJbmRlZWQsIHRoZSBsb2cgZmlsZSBJIGRv
d25sYWRlZAo+IGVhcmxlciByZWFsbHkgc3RvcHBlZCBhdCB0aGUgZXJyb3IgbWVzc2FnZSBJIHBh
c3RlZC4gSSBhbSBzdXJlIG9mIHRoYXQsCj4gYXMgSSBzdGlsbCBoYWQgaXQgaW4gbXkgfi90bXAg
ZGlyZWN0b3J5LCBzbyBJIGNvdWxkIHJlYWxseSBkb3VibGUtY2hlY2suCj4gCj4gQnV0IG5vdyBJ
IGRvd25sb2FkZWQgaXQgYWdhaW4sIGFuZCBpbmRlZWQsIHRoZXJlIGFyZSBtdWNoIG1vcmUgdHJh
Y2VzLAo+IHVwIHRvIHRoYXQgb3B0ZWUgaXNzdWUgeW91IHBvaW50IGVkIGF0Lgo+IAo+IFRoaXMg
aXMgYSByZWFsbHkgd2VpcmQgc2l0dWF0aW9uLCB0aGF0IHRoZSBkb3dubG9hZCBJIGhhZCB3YXMg
b25seQo+IHBhcnRpYWwuLi4KCndlaXJkIGluZWVkLgoKPiAKPj4gQWxzbywgSSBnb3QgdGhlIHNh
bWUgZXJyb3IgbWVzc2FnZSB3aGlsZSB0ZXN0aW5nIGxvY2FsbHkuCj4gCj4gQnV0IHRlc3Rpbmcg
bG9jYWxseSBzaG91bGQgbm90IGhhdmUgdGhlIHNhbWUgaW1wYWN0IG9uIGJvb3QgdGltZSwgd291
bGQKPiBpdD8gVGhlIGJvb3QgdGltZXMgb3V0IG9uIHRoZSBlbGVhc3RpYyBydW5uZXJzIGJlY2F1
c2UgdGhleSBhcmUgdG9vIHNsb3cKPiAoYW5kIG1hbnkgY29uZ3RhaW5lcnMgY29udGVuZCBmb3Ig
dGhlIENQVSB0aGVyZSkuIEJ1dCBsb2NhbGx5LCBpdCBpcwo+IHJlYWxseSBzdXJwcmlzaW5nIHRo
YXQgeW91IGhpdCB0aGUgZXhhY3Qgc2FtZSB0aW1lb3V0IGlzc3VlLCBhbmQgdGhlCj4gZXhhY3Qg
c2FtZSBwb2ludCBpbiB0aGUgYm9vdCBzZXF1ZW5jZS4uLgoKSSdtIG5vdCBhYmxlIHRvIHJlcHJv
ZHVjZSB0aGUgdGltZW91dCBsb2NhbGx5IGJ1dCBieSBsb29raW5nIGF0IHRoZSB0aW1lb3V0Cm11
bHRpcGxpZXIgdXNlZCBmb3IgdGhlIEJ1aWxkcm9vdCB0ZXN0c3VpdGUgSSB3b3VsZCBzYXkgdGhh
dCBhIHNwb3JhZGljIGZhaWx1cmVzLgoKSSByZXN0YXJ0ZWQgdGhlIGpvYiBpbiBnaXRsYWIgYW5k
IHRoaXMgdGltZSBpdCBzdWNjZWVkZWQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS9qb2JzLzE5NzkxMDg2NTAKCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+
IEFueXdheSwgY2FuIHlvdSByZXNlbmQgeW91ciBwYXRjaCwgYXMgSSBtYXJrZWQgaXQgcmVqZWN0
ZWQgaW4gcGF0Y2h3b3JrLAo+IHBsZWFzZT8KPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4u
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
