Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5661DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 21:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88CE460A8E;
	Tue, 23 Nov 2021 21:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDdMN-bhnV3I; Tue, 23 Nov 2021 21:42:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD6B860A88;
	Tue, 23 Nov 2021 21:42:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A66DB1BF47F
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 21:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95529402D3
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 21:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xahmfXUa7aKb for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 21:42:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87A5B402CB
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 21:42:17 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u18so372564wrg.5
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 13:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BgrHR6zdjq+AkTG1EIS/R4AurSFL/fHPkhThKeE36Sg=;
 b=ahFGDUDr/eDVCht1upxeZboxU5P1v2CxuuUVa2BwTqfAcNxGySezZb464zPzUGiI12
 8ReUEXED5Fg40lErZ5bbJ9UFQlcs/nX3/lR76lfEim+rxsPOccsAYtVI/Z7TwM4g2g9/
 OJhBpPGjnUiFUZKU758pscClZGW200UmCc9UCDogtlEHaqAt6O57WV+pYsrxJ2TQdTBY
 5C0XnPXUMnljDAq/ypx9GV0O3He1T0LUa5AcILvvs4L0viLjDd1XJ9pqcb6Yc/1Otci/
 RFRBXSgv8Tjgwz3zoPaktnkTX7Vhg1y6Njw4/m1hVCDi/IorODTf73s4tf4nQh4AtuS8
 GZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BgrHR6zdjq+AkTG1EIS/R4AurSFL/fHPkhThKeE36Sg=;
 b=AwsfZYoikPEBKQKMqt4F6Hv5zlHwhlr7ufmWswphgvcp8/CxbksEDDRiGK+NLVaVnT
 kV+oVsR7ChLovrd5e0kiPE4KTYvsuYrW+79omPJV181Rip9+CtM+ZreahznpgRHxScWi
 mw0ReZv8z89cESc1nmOGFy9hr4GIWaJrvB2znicqJdeDjjSfLE/h5DoVMMR1J1/CSB4l
 1e8q87JY4lwGlZUuE3eUmk6Bpzxb7qgT1T10U12hIOdt/DbdwO1oV2xtKeeVlSkIP4w2
 TUwQoh2NH70+ZQVGA7s1xNd3BHdKAKiAV/LWXhEW9Lxcs8uCUSspxt1iEFMrn7ts73AO
 hfxQ==
X-Gm-Message-State: AOAM531TMcKITDReSwxbWw3ffekYo+LHJqdB12l/UYU2cwn8C2kImbiW
 NjTK4plx2cE+i+7reTM4xOM=
X-Google-Smtp-Source: ABdhPJzkPthQNInu3H6UrRfxebUNVuy5BJ8JVo5r0s8OK8DDut890qq++C/6rnHEszfKdx0jteZZuw==
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr11435445wrw.434.1637703735849; 
 Tue, 23 Nov 2021 13:42:15 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id d1sm12516284wrz.92.2021.11.23.13.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 13:42:15 -0800 (PST)
Message-ID: <9f9392a7-855e-7632-bf5e-b15c495df5d6@gmail.com>
Date: Tue, 23 Nov 2021 22:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1637700992.git.yann.morin.1998@free.fr>
 <ca903288a1b6f678294d96d3e7024433156866f7.1637700992.git.yann.morin.1998@free.fr>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <ca903288a1b6f678294d96d3e7024433156866f7.1637700992.git.yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 2/2] support/docker: drop use of Docker hub,
 use Gitlab registry
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

SGVsbG8gWWFubiwKCkxlIDIzLzExLzIwMjEgw6AgMjE6NTYsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBOb3cgdGhhdCBvdXIgcGlwZWxpbmVzIGFyZSB1c2luZyB0aGUgRG9ja2VyIGltYWdl
IGZyb20gdGhlIEdpdGxhYgo+IHJlZ2lzdHJ5LCB0aGVyZSBpcyBubyBsb25nZXIgYW55IHJlYXNv
biB0byBwdXNoIHRoZSBpbWFnZSB0byB0aGUKPiBEb2NrZXIgaHViLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+IENjOiBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxl
IChFc3NlbnNpdW0vTWluZCkgPGFybm91dEBtaW5kLmJlPgo+IC0tLQo+ICBzdXBwb3J0L2RvY2tl
ci9Eb2NrZXJmaWxlIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvZG9ja2VyL0RvY2tlcmZp
bGUgYi9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlCj4gaW5kZXggNTc0NDVkNWNkMS4uYWQ4NzA0
ODczYyAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlCj4gKysrIGIvc3Vw
cG9ydC9kb2NrZXIvRG9ja2VyZmlsZQo+IEBAIC0xLDcgKzEsNyBAQAo+ICAjIFRoaXMgRG9ja2Vy
ZmlsZSBnZW5lcmF0ZXMgdGhlIGRvY2tlciBpbWFnZSB0aGF0IGdldHMgdXNlZCBieSBHaXRsYWIg
Q0kKPiAgIyBUbyBidWlsZCBpdCAoWVlZWU1NREQuSEhNTSBpcyB0aGUgY3VycmVudCBkYXRlIGFu
ZCB0aW1lIGluIFVUQyk6Cj4gLSMgICBkb2NrZXIgYnVpbGQgLXQgYnVpbGRyb290L2Jhc2U6WVlZ
WU1NREQuSEhNTSBzdXBwb3J0L2RvY2tlcgo+IC0jICAgZG9ja2VyIHB1c2ggYnVpbGRyb290L2Jh
c2U6WVlZWU1NREQuSEhNTQo+ICsjICAgZG9ja2VyIGJ1aWxkIC10IHJlZ2lzdHJ5LmdpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvYmFzZTpZWVlZTU1ERC5ISE1NIHN1cHBvcnQvZG9j
a2VyCj4gKyMgICBkb2NrZXIgcHVzaCByZWdpc3RyeS5naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290L2Jhc2U6WVlZWU1NREQuSEhNTQoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+ICAKPiAgIyBX
ZSB1c2UgYSBzcGVjaWZpYyB0YWcgZm9yIHRoZSBiYXNlIGltYWdlICphbmQqIHRoZSBjb3JyZXNw
b25kaW5nIGRhdGUKPiAgIyBmb3IgdGhlIHJlcG9zaXRvcnkuLCBzbyBkbyBub3QgZm9yZ2V0IHRv
IHVwZGF0ZSB0aGUgYXB0LXNvdXJjZXMubGlzdAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
