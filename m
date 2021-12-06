Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DBBC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 20:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EF2C82690;
	Mon,  6 Dec 2021 20:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9e2H3MQCMsW; Mon,  6 Dec 2021 20:40:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADB96823CB;
	Mon,  6 Dec 2021 20:40:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B74611BF37C
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 20:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4AE482423
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 20:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lki9ZU7qEVzv for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 20:40:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE0B280F4B
 for <buildroot@busybox.net>; Mon,  6 Dec 2021 20:40:25 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x6so47922438edr.5
 for <buildroot@busybox.net>; Mon, 06 Dec 2021 12:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2nlg84Mdanvmj0oB/ba85oIyxw2fPUNN6iSxTQZWbIg=;
 b=gl7mA/bpXnFTgSlU83YgUAH+5RbsuC5cZpH9TBNeGI1pj6cV6WQvYVdH87tP2Ty8to
 ncFtbd0qWuyrEPJ39BanaPWYSjkg1Q6yHbGHnKJPQ0+Zsm+CdZkakC5uIm+8cFqc09Rk
 cPko2xt7HMfYvDPc7svzy0LlO4Cm3X2uUHkPbBKT11Dyq1rz6z0ZPf/OhOaFijLrBf9b
 chlJU1lcdBbJ2Vu333aixeVIJ8dlMmYtAvOqojA387aVa9vZNU/uWz+JICwTyQwsKA4z
 0n5bsEO6AfVp4/lX2bVGgCLLLa8tXSNktCzKxTByUnsX4Lm8hmp3wFeTqEeiawViDAec
 x4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2nlg84Mdanvmj0oB/ba85oIyxw2fPUNN6iSxTQZWbIg=;
 b=xGaptiCeSn1vwhvaPo8B/HCw2B1Ww4CpFbTka/umlPthf3uihlS7A30JlAR2FYGLoX
 /50Ld6yrdNim8B2gWob9OzSziJ1IiRevvgneSDg2WflLZUuugNYFs0hqDK/liswhLrcK
 GPoPWqydaAP9jJ2YMt3hraD9pN5RDRvxkwNsUS7aIxsgB3uU8DQ2/50NuWa8q/1L0x8+
 smkt2fA7wG92i7s1Xo9WPP0OIRrY7TahgEJh+mbKFwGsaYW2bJmm0pAAPOjetZSM12gR
 gj3qE8VIET7sD9WUuRP3WyHqYrVYcazVLxpBn54fM0qjYsEPYlabOhOlM79FVFdmwktt
 88kQ==
X-Gm-Message-State: AOAM533qQQU6ksrWLL4ncfEVsd3EaRgI56sZl4ZVPaAdY5Sdqr6syNeV
 SOdmackLPRdBkMxF99mUPZgR6g==
X-Google-Smtp-Source: ABdhPJznzFopFiOBiiOHoEbUVEfFXyuwJiK4hMYLlhrZ/RWm16GOggZt4+rRHuap4m6Wm/h1DJ54Mw==
X-Received: by 2002:a17:907:6ea8:: with SMTP id
 sh40mr47464253ejc.53.1638823223859; 
 Mon, 06 Dec 2021 12:40:23 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id mp9sm7278637ejc.106.2021.12.06.12.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 12:40:23 -0800 (PST)
Message-ID: <821b1c54-17b5-1cb5-f0e6-e8d26a3668c4@mind.be>
Date: Mon, 6 Dec 2021 21:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Guillaume Bres <guillaume.bressaix@gmail.com>
References: <20211205204720.2831-1-guillaume.bressaix@gmail.com>
 <1e21be4a-2465-e5c9-f775-0430cd3b0cf1@mind.be>
 <CAJe0E3fN-kd=q0wus32=XSdZW5i=PPvSJ1Kaxw=KA_THrAWFRA@mail.gmail.com>
 <760f07ee-35ec-090e-237a-9f1501f0ff93@mind.be>
 <CAJe0E3ez=k1Ay7tVWNH2mqJ0YS0rGHw8+2of5sBQtyEJUwX1Zg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAJe0E3ez=k1Ay7tVWNH2mqJ0YS0rGHw8+2of5sBQtyEJUwX1Zg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pybind: fix upgrade to
 version 2.6.1
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
Cc: buildroot@busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8xMi8yMDIxIDIwOjI3LCBHdWlsbGF1bWUgQnJlcyB3cm90ZToKPiBBcm5vdXQsCj4g
SSBhbSBzdWJtaXR0aW5nIGEgcmV2aXNlZCB2ZXJzaW9uIG9mIHRoZXNlIHBhdGNoZXMsIHBsZWFz
ZSBkaXNjYXJkIHYxCj4gCj4gID5XaGF0IHdhcyBpdCBmb3IgdGhlbj8gV2FzIGl0IGFscmVhZHkg
Zm9yIHNjaXB5Pwo+IHllcAoKICBCeSB0aGUgd2F5LCBhcmUgeW91IGF3YXJlIHRoYXQgdGhlcmUn
cyBhbiBleGlzdGluZyBwYXRjaCBzZXJpZXMgWzFdIGZvciBhZGRpbmcgCnNjaXB5PwoKICBSZWdh
cmRzLAogIEFybm91dAoKClsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
YnVpbGRyb290L2xpc3QvP3Nlcmllcz0xNjg5OTIKCj4gCj4gID7CoMKgV2FzIGl0IGp1c3QgYnkg
YWNjaWRlbnQgdGhhdCB5b3Ugc3VibWl0dGVkIGEgdGFyZ2V0IHZlcnNpb24gaW5zdGVhZCBvZiBh
IAo+IGhvc3QgdmVyc2lvbj8KPiBJIGRvbid0IHJlYWxseSBrbm93IHdoeSBJIGRpZCBzbywgYnV0
IGF0IHRoZSB0aW1lIEkgZGVjaWRlZCBJIHdvdWxkIHVubG9jayB0aGUgCj4gaG9zdC1wa2cgdmVy
c2lvbiBpbiB0aGUgc2NpcHkgcGF0Y2ggdGhhdCByZXF1aXJlcyBpdC4KPiBBY3R1YWxseSBpdCBz
dGlsbCBoYXMgdG8gYmUgZG9uZSBiZWNhdXNlIHdlIG1pZ2h0IGZpeCB0aGUgcGtnIHRvZGF5LCBi
dXQgdGhhdCAKPiB3b24ndCBiZSBlbm91Z2ggZm9yIGZ1dHVyZSBkZXBlbmRlbmNpZXMKW3NuaXBd
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
