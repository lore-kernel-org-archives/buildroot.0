Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2BBC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 10:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D5281521;
	Sun,  9 Jan 2022 10:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5hTre47wF40; Sun,  9 Jan 2022 10:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF0B8174F;
	Sun,  9 Jan 2022 10:46:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E31E11BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2CC240319
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24uk4yBFn5xr for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 10:46:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BC8D402CA
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 10:46:11 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k30so3485194wrd.9
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 02:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h576DoEi8EhonmU/cTzKvuWnk1gs8gL5aem8TfAdJfc=;
 b=5z6gAIo/tnvCKHIdnfqSvB7Br7ff3hb7I6PXVg7/ivUSrvjvpoaJiJDqlnMEM0hVJG
 JhnCm/K971pn9EBvAVp98RPArElxdZ2zQ6dUOZ8xNwxcfnyvfRoNUFmanTMY3LOVrJU2
 bV9kV9jDCq3eStFSVIcSPyHwYbkI6HO3NKDzyE3H7tQMb23xqQ4tJs6n6LAAZl8njiTM
 Bqh4wuSHwAYTyR7VE2BrT8FF+WxjpQ+S5lx60WwF6ROaca5ctxzBc12FyXjw5gsJa/kr
 VX3xHJBSGwMgPWbyZHjUdTR8OsYXbJ/cdKzOiqQbSQKKwltDjVjCdwv8pQEoitOMqzu9
 aVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h576DoEi8EhonmU/cTzKvuWnk1gs8gL5aem8TfAdJfc=;
 b=Rb/3sSkv8idqZUV0OlhCsNvTeZr1IMKBHczEevouaqnaOnvEoEINxe/iIiXqrobpF5
 V33pqeHRlG5vDrbgpwfpd6Sg9ZS4mhqlcaHByJZgENc8LaKYsswKImF27tWlaUtBfeDx
 ib1hW21sTmW9K0H+iPnRtPEYSA0YxHPbm+rufBWRsKsoAVUgI4gjzbfRQU1eSrJ6fMR/
 QNsRs3q5mnQP4k5g3YqjCqe6px8Zd4DOVDNwBEdHpakDSjHInXQBaFt8jiY67lj5Sdr+
 WBKFGdjJax0IdZZflfH5ywsknplCWr0PxFuntwyZpT0vyfErs929dQ5Lk76mRaYx2DPQ
 j5hQ==
X-Gm-Message-State: AOAM530y6zF60jW550EUp0JjCZp+4owrmnxbivOyxAi0Yp4yGCP/AtQU
 SgnChFhE6/29wZlkH5A2tQC/ew==
X-Google-Smtp-Source: ABdhPJwp3YPPjmRp6SsKv8SMTWHYu9gTWaktwUA7eB57RvDvnaWiWrSZ5Zoaz97p/vqrbAhcLP28bA==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr3602109wrv.514.1641725169582; 
 Sun, 09 Jan 2022 02:46:09 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id k10sm3847215wrz.113.2022.01.09.02.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 02:46:08 -0800 (PST)
Message-ID: <43cb4bd6-d40d-5a58-051a-75c9f4b1e1c2@smile.fr>
Date: Sun, 9 Jan 2022 11:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220109080124.2271241-1-thomas.petazzoni@bootlin.com>
 <20220109080124.2271241-2-thomas.petazzoni@bootlin.com>
 <20220109103607.GK1881783@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220109103607.GK1881783@scaer>
Subject: Re: [Buildroot] [PATCH 2/2] arch/Config.in.x86: add support for
 x86-64-v2, x86-64-v3, x86-64-v4
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

SGVsbG8gVGhvbWFzLCBZYW5uLAoKTGUgMDkvMDEvMjAyMiDDoCAxMTozNiwgWWFubiBFLiBNT1JJ
TiBhIMOpY3JpdMKgOgo+IFRob21hcywgQWxsLAo+IAo+IE9uIDIwMjItMDEtMDkgMDk6MDEgKzAx
MDAsIFRob21hcyBQZXRhenpvbmkgc3Bha2UgdGh1c2x5Ogo+PiBJbiB0aGUgZmFjZSBvZiB0aGUg
dmFzdCBhbW91bnQgb2YgeDg2LTY0IENQVSBhcmNoaXRlY3R1cmUgdmFyaWFudHMsCj4+IExpbnV4
IGRpc3RyaWJ1dGlvbnMgaGF2ZSB3b3JrZWQgdG9nZXRoZXIgdG8gZGVmaW5lICJtaWNyby1hcmNo
aXRlY3R1cmUKPj4gbGV2ZWxzIiBpbiB0aGUgeDg2LTY0IHBzQUJJLCBjYWxsZWQgeDg2LTY0LXYy
LCB4ODYtNjQtdjMgYW5kCj4+IHg4Ni02NC12NC4gVGhleSBzdGFuZGFyZGl6ZSBhIHNldCBvZiBD
UFUgZmVhdHVyZXMsIGFuZCBHQ0Mgc2luY2UgaXRzCj4+IHZlcnNpb24gMTEueCBoYXMgc3VwcG9y
dCBmb3IgdGhlc2UgbWljcm8tYXJjaGl0ZWN0dXJlIGxldmVscyBhcwo+PiAtbWFyY2g9IG9wdGlv
bnMuCj4+Cj4+IEl0IG1ha2VzIHNlbnNlIHRvIHN1cHBvcnQgdGhlbSBpbiBCdWlsZHJvb3QsIGVz
cGVjaWFsbHkgZm9yIHRob3NlIHdobwo+PiB3YW50IHRvIGJ1aWxkIHRvb2xjaGFpbnMgdGhhdCBh
aW0gYXQgdGFyZ2V0aW5nIGEgcmVhc29uYWJseSBicm9hZAo+PiBmYW1pbHkgb2YgeDg2LTY0IHBy
b2Nlc3NvcnMuCj4gCj4gQXMgZm9yIHg4Ni02NCwgSSd2ZSBhZGRlZCBhIGRlcGVuZGVuY3kgb24g
QlIyX3g4Nl82NC4KPiAKPj4gTW9yZSBkZXRhaWxzOgo+Pgo+PiAgaHR0cHM6Ly9naXRsYWIuY29t
L3g4Ni1wc0FCSXMveDg2LTY0LUFCSS8tL2Jsb2IvbWFzdGVyL3g4Ni02NC1BQkkvbG93LWxldmVs
LXN5cy1pbmZvLnRleAo+PiAgaHR0cHM6Ly9kZXZlbG9wZXJzLnJlZGhhdC5jb20vYmxvZy8yMDIx
LzAxLzA1L2J1aWxkaW5nLXJlZC1oYXQtZW50ZXJwcmlzZS1saW51eC05LWZvci10aGUteDg2LTY0
LXYyLW1pY3JvYXJjaGl0ZWN0dXJlLWxldmVsCj4+ICBodHRwczovL3d3dy5waG9yb25peC5jb20v
c2Nhbi5waHA/cGFnZT1uZXdzX2l0ZW0mcHg9R0NDLTExLXg4Ni02NC1GZWF0dXJlLUxldmVscwo+
IAo+IEkndmUgYWRkZWQgYSBVUkwgdG8gdGhlIHVwc3RyZWFtIGNvbW1pdCB0b28uCgpTb3JyeSBJ
J20gbGF0ZSwgYnV0IEkgaGFkIGEgbG9vayBhdCB0aGlzIHNlcmllcyB0byB1c2UgeDg2LTY0LXYz
IGFuZCB4ODYtNjQtdjQKZm9yIFFlbXUgcnVudGltZSB0ZXN0aW5nLgoKVGhlcmUgYXJlIHNvbWUg
bGltaXRhdGlvbiB3aXRoIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgUWVtdSAoNi4yLjApOgoKIk5v
dGUgdGhhdCBUQ0cgaXMgbm90IGNhcGFibGUgb2Ygc3VwcG9ydGluZyB0aGUgMiBuZXdlc3QgQUJJ
IGxldmVscwpjdXJyZW50bHk6CgoqIHg4Ni02NC1hYmkzOgoKICBDUFVJRC4wMUg6RUNYLmZtYSBb
Yml0IDEyXQogIENQVUlELjAxSDpFQ1guYXZ4IFtiaXQgMjhdCiAgQ1BVSUQuMDFIOkVDWC5mMTZj
IFtiaXQgMjldCiAgQ1BVSUQuMDdIOkVCWC5hdngyIFtiaXQgNV0KCiogeDg2LTY0LWFiaTQ6Cgog
IENQVUlELjAxSDpFQ1gucGNpZCBbYml0IDE3XQogIENQVUlELjAxSDpFQ1gueDJhcGljIFtiaXQg
MjFdCiAgQ1BVSUQuMDFIOkVDWC50c2MtZGVhZGxpbmUgW2JpdCAyNF0KICBDUFVJRC4wN0g6RUJY
LmludnBjaWQgW2JpdCAxMF0KICBDUFVJRC4wN0g6RUJYLmF2eDUxMmYgW2JpdCAxNl0KICBDUFVJ
RC4wN0g6RUJYLmF2eDUxMmRxIFtiaXQgMTddCiAgQ1BVSUQuMDdIOkVCWC5yZHNlZWQgW2JpdCAx
OF0KICBDUFVJRC4wN0g6RUJYLmF2eDUxMmNkIFtiaXQgMjhdCiAgQ1BVSUQuMDdIOkVCWC5hdng1
MTJidyBbYml0IDMwXQogIENQVUlELjA3SDpFQlguYXZ4NTEydmwgW2JpdCAzMV0KICBDUFVJRC44
MDAwMDAwMUg6RUNYLjNkbm93cHJlZmV0Y2ggW2JpdCA4XQogIENQVUlELjBESDpFQVgueHNhdmVj
IFtiaXQgMV0iCgpodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwv
MjAyMS0wMi9tc2cwMDE3MC5odG1sCgpJIHdhbnRlZCB0byByZXBseSB0byBhZGQgdGhpcyBpbmZv
IGluIHRoZSBjb21taXQgbG9nLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+PiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+
IAo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1P
UklOLgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
