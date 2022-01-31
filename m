Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40125C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 12:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDA40408E5;
	Mon, 31 Jan 2022 12:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzBOLdGJpoGI; Mon, 31 Jan 2022 12:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2583940550;
	Mon, 31 Jan 2022 12:43:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4A11BF3A8
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 12:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47B3840550
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 12:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVVqtB66tDWS for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 12:43:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23AED404E7
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 12:43:27 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b13so26714690edn.0
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 04:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1kV/0aGPb+dSQhNmmYhGxCgjzPC+eqSxVd0RpPZ0kfU=;
 b=d3INGVYNVNv3eRspHxVwQnL0A575YVMC8pcvLof0qPaGvHkwVEQXn3dVpuMPwneoqT
 1VMEeNC1JX6zuV5lst/Mv2HcTP2/YMDvAaNOnKAYbMXVpiw7Srg8SObAMfsleQ3ZPL3/
 r8cOUJzTtYLS4t4O5lQ4GtaKuG7Ri4AnfW1fZnGG7yFe560i0JaNS6uVU8NlpnHUfIey
 E4HbsuSVfYu5LBQ2TqOxxV63HHEwztnBOmnYnIqwRlV4LfUzsEJDzkbOoWVRVP7uIeDu
 62Vp1J4587p8qe8d4hGrhfAYVKkh2hPjqeMNoVjG3TU0b/RN+Bgfu+Vtv9y+TYlUZKnZ
 gTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1kV/0aGPb+dSQhNmmYhGxCgjzPC+eqSxVd0RpPZ0kfU=;
 b=EyUau0xWLX6HAsptvs/HY4+qumjepib3+TS8DLPU4I6OsLb1f3Eern/jWFqtsRqFE7
 l2C7EW/54aFEbiq8UQz62trIW6oISiDYTekc/EORaRbYnJQhV6VIV2UMPQl0zJy8QS5I
 yjGfOM5aztkd53X85ZehZ+0gwpF+nEgoM25/kV6kVLmVhhT2wXL8efLP8WIIzbsV2Y7X
 XEAXZZ59YgkFLYqjbryPMG/szsCam9+rH9c3zFrACi2fNzrsKEnqH4R84olkMzb1S6mG
 y8duREC+90yCS2u/L5v7umPquvP3tg+xZDXjbdK1PbXm5pAvx7KoUnSpA2qB0PW4stZl
 BDsw==
X-Gm-Message-State: AOAM532bvN3s4gX9OvX2of6f0ojqsSOCzlPPLkSIahY7syEyC+6AVC/x
 HNcqz2P2mwGWaLEtvuK3NZ8BCoP3CHicc9wCCGY=
X-Google-Smtp-Source: ABdhPJy6x/UjSyVUbNkNgKOHDT7Y2hnXtQicXBw3zpVBl4TwBaj+vMDJiy9oBHvEoW2AsmUH+CBm1qMJNFD4vgHi7oI=
X-Received: by 2002:a05:6402:3596:: with SMTP id
 y22mr10174415edc.370.1643633005956; 
 Mon, 31 Jan 2022 04:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20220129111731.736265-1-peron.clem@gmail.com>
 <20220130181830.3170d14f@windsurf>
In-Reply-To: <20220130181830.3170d14f@windsurf>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 31 Jan 2022 13:43:14 +0100
Message-ID: <CAJiuCccTJVEYUByeZ3kTnzxAOEhm7QuVszx7XRVksiBoGjjC5A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/beelink_gs1: increase rootfs
 size to 120M
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gU3VuLCAzMCBKYW4gMjAyMiBhdCAxODoxOCwgVGhvbWFzIFBldGF6em9u
aQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIDI5IEph
biAyMDIyIDEyOjE3OjMwICswMTAwCj4gQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiA+IEZvciB0aGUgbW9tZW50IEJlZWxpbmsgR1MxIHVzZSBhIGRlZmF1
bHQgcm9vdGZzIHNpemUgb2YgNjBNLAo+ID4gd2hpY2ggaXMgYSBiaXQgbG93IGlmIHlvdSB3YW50
IHRvIGFkZCBzb21lIHBhY2thZ2VzIGxpa2UgYQo+ID4gZ3JhcGhpYyBzdGFjay4KPiA+Cj4gPiBJ
bmNyZWFzZSB0aGUgcm9vdGZzIHNpemUgdG8gMTIwTS4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogR2l1
bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgo+ID4g
LS0tCj4gPiAgY29uZmlncy9iZWVsaW5rX2dzMV9kZWZjb25maWcgfCAxICsKPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IEkgaGF2ZSBub3QgYXBwbGllZCB0aGlzIG9uZS4g
SW5kZWVkLCBhbnkgZGVmY29uZmlnIHRoYXQgdXNlcyB0aGUKPiBkZWZhdWx0IHJvb3RmcyBzaXpl
IG9mIDYwTSB3b3VsZCBoYXZlIHRoZSBwcm9ibGVtIG9mICJpZiBJIGFkZCBtb3JlCj4gcGFja2Fn
ZXMsIGl0IGRvZXNuJ3QgZml0IGluIHRoZSBpbWFnZSIuIFRoZSBkZWZjb25maWdzIGFyZSBtZWFu
dCB0byBiZQo+IG1pbmltYWwsIHNvIGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBpbmNyZWFzZSB0
aGUgc2l6ZSB0byAxMjBNIHRvCj4gYWNjb21tb2RhdGUgc29tZSBwb3NzaWJsZSBwYWNrYWdlIGFk
ZGl0aW9ucy4gTWF5YmUgZXZlbiAxMjBNIGlzIG5vdAo+IGdvaW5nIHRvIGJlIGVub3VnaCBkZXBl
bmRpbmcgb24gaG93IG1hbnkgcGFja2FnZXMgeW91IGFkZCAoYW5kIGhvdwo+IGxhcmdlIHRoZXkg
YXJlKS4KCk9rLApUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbgoKPgo+IFNvIEkndmUgbWFya2Vk
IHRoaXMgcGF0Y2ggYXMgUmVqZWN0ZWQuCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpv
bmksIENUTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcK
PiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
