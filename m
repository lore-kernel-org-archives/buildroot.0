Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84589C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 19:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF6A4405AE;
	Wed, 22 Dec 2021 19:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJM519CahNDk; Wed, 22 Dec 2021 19:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07982404CF;
	Wed, 22 Dec 2021 19:13:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAFEE1BF57C
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 19:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D982C60AA2
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 19:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXas9VafE-yC for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 19:13:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 093F760A9E
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 19:13:05 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id b19so5296472ljr.12
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 11:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7p/g0eEo1QqO7IDrKx5/Ko+V3GmKY0kphKwPqCRkbAI=;
 b=jOwFvO3NFWRRdS6zfatsek4l7ZPXBRlamk5iDJo1amlfVvMRa3yIEcgnU7XQ37K4VZ
 LtZFaWey+ofoci+QAS238wlNPB5nxzbFQPXoO2TsySZ1i6BHrYCcP9WG1sJxPmNmE6ow
 K0mOsdSEf+4SIb/F7XusYhPD2kXGckplU2NGhHsZ6Jx6BSq+yeby1ZflX0OcEQvxp/Ch
 aTqm3MJKTm7rDmWl21mYFM9J8vvCTkjs86FKJFgmlnO3aHLe9v9P5N3XqRhviP3urvkD
 iCzut1zJt284krdyzQ6m9q7aWy1KX4I87imjd6NlPn9Y/i/flR9VRbKjjeHHaHS4Y4h9
 x8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7p/g0eEo1QqO7IDrKx5/Ko+V3GmKY0kphKwPqCRkbAI=;
 b=B+o6XelLu/vbu5MbAvHb5mGzT2EaJsW9rOkI11Algx3XNQjdvR3zzGyPVsXuVwEczk
 Uu8kegeKrZbMEhQDmEOgvOQPQjRkiHFIPbYRqYInZq4GpakR+h1Ui8H6v67Nw9ZDaUF7
 Qm92gF9Xw0RHjm5xdEDaUeWA2D8uyqUE1+DdIRW9l9CumE2yYbH0U/RlXt3i2Fh4wzMz
 ihN4+Gasolf2crwdV6uZFGWxclmvI8mV/CRYgSq+IY4lvoKW3OVTdBOs+ThfannsRmho
 9/02vnn47PJWgh6YXFwt+OE8wqxm+npVwiDIWFzXhWY6UeVcXcBBhwuBylKr8Wy2BgR5
 /HLw==
X-Gm-Message-State: AOAM533y+ilDXnmRgJjrD9VA29pXJoA0soeepOcvKOThCEz0rQQk6FMX
 kqrS/fLi3zII68UwBxdU5Ww=
X-Google-Smtp-Source: ABdhPJzQ7tgw5zXHZdgblypUvd4ysApZT0WvXGXIqotGkxO7EuwefoqRyir7RGfdpIsXRTpbcHGOJg==
X-Received: by 2002:a05:651c:1a07:: with SMTP id
 by7mr3164760ljb.262.1640200383320; 
 Wed, 22 Dec 2021 11:13:03 -0800 (PST)
Received: from [10.0.196.136] ([98.128.186.122])
 by smtp.googlemail.com with ESMTPSA id u7sm263888lja.58.2021.12.22.11.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 11:13:02 -0800 (PST)
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20211222083515.1150267-1-troglobit@gmail.com>
 <20211222083515.1150267-2-troglobit@gmail.com>
 <bdbe868c-2ed5-1012-cc85-4c393fb7739d@mind.be>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <043b5661-5cd1-fdad-28ed-60ce645ab3d0@gmail.com>
Date: Wed, 22 Dec 2021 20:13:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bdbe868c-2ed5-1012-cc85-4c393fb7739d@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v2 1/2] package/makedevs: allow recursive on
 directory with symlinks
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
Cc: Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTIvMjIvMjEgMzowNiBQTSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gT24gMjIv
MTIvMjAyMSAwOTozNSwgSm9hY2hpbSBXaWJlcmcgd3JvdGU6Cj4+IFdoZW4gdXNpbmcgQlIyX1JP
T1RGU19ERVZJQ0VfVEFCTEUgdG8gY2hhbmdlIG93bmVyc2hpcCBvZiAvZXRjLCBsaWtlIHNvOgo+
PiDCoMKgIC9ldGPCoMKgwqDCoMKgwqDCoCBywqAgLTEgcm9vdMKgwqDCoMKgIHdoZWVswqDCoMKg
wqAgLSAtIC0gLSAtCj4+IG1ha2RldnMgZmFpbHMgZHVlIHRvIGl0IHRyeWluZyB0byBjaG93bigp
IGEgc3ltbGluazoKPj4gwqDCoCBtYWtlZGV2czogY2hvd24gZmFpbGVkIGZvcgo+PiAvc3JjL215
TGludXgvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy9leHQyL3RhcmdldC9ldGMvbXRhYjogTm8g
c3VjaAo+PiBmaWxlIG9yIGRpcmVjdG9yeQo+IAo+ICBUaGUgcHJvYmxlbSBpcyBhY3R1YWxseSBh
ICpkYW5nbGluZyogc3ltbGluaywgbm90IGEgc3ltbGluayBwZXIgc2UuCgpPdWNoLCB5b3UncmUg
Y29tcGxldGVseSByaWdodCEgIFRoZSB2MSBwYXRjaCB3YXMgbXVjaCBtb3JlIG9uIHBvaW50LCBJ
CnNob3VsZCBrbm93IGJldHRlciB0aGFuIHJlbHlpbmcgb24gc3RyYW5nZXJzIGluIElSQyBjaGF0
IHJvb21zIDstKQoKPj4gwqAgLcKgwqDCoCBpZiAoY2hvd24oZnBhdGgsIHJlY3Vyc2l2ZV91aWQs
IHJlY3Vyc2l2ZV9naWQpID09IC0xKSB7Cj4+ICvCoMKgwqAgaWYgKGxjaG93bihmcGF0aCwgcmVj
dXJzaXZlX3VpZCwgcmVjdXJzaXZlX2dpZCkgPT0gLTEpIHsKPiDCoEluIHRoaXMgdjIgeW91IGNo
YW5nZSB0aGUgY2hvd24sIGJ1dCB0aGUgY2htb2QgYmVsb3cgc3RpbGwgcmVtYWlucy4KPiBEb2Vz
bid0IGl0IGhhdmUgdGhlIHNhbWUgcHJvYmxlbSB3aXRoIGEgZGFuZ2xpbmcgc3ltbGluaz8KCklu
ZGVlZCBpdCBkb2VzLiAgU2VlbXMgSSBkaWRuJ3QgdGVzdCB0aGF0IGNhc2UgcHJvcGVybHkuICBJ
LmUuLCB3b3JrZWQKZmluZSBpbiBteSBwYXJ0aWN1bGFyIHVzZS1jYXNlLiAgSSd2ZSBkb25lIGEg
c2VwYXJhdGUgdGVzdCBwcm9ncmFtIHRvCnZlcmlmeSwgYW5kIHdlIG5lZWQgc29tZXRoaW5nIHNp
bWlsYXIgdG8gdGhpcyBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZQpiYl9yZWN1cnNpdmUoKSBmdW5j
dGlvbjoKCglpZiAodHlwZSA9PSBGVFdfU0wpIHsKCQlpZiAoYWNjZXNzKGZwYXRoLCBGX09LKSkg
ewoJCQl3YXJuKCJza2lwcGluZyAlcywgZGFuZ2xpbmcgc3ltbGluayIsIGZwYXRoKTsKCQkJcmV0
dXJuIDA7CgkJfQoJfQoKVGhhbmtzIGZvciB0aGUgYXdlc29tZSBmZWVkYmFjaywgSSdsbCBnZXQg
cmlnaHQgb24gYSB2MyEKCgpCZXN0IHJlZ2FyZHMKIC9Kb2FjaGltCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
