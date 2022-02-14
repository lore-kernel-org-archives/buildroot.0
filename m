Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B1BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 12:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EA59403F7;
	Mon, 14 Feb 2022 12:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVNw3uHUSKXv; Mon, 14 Feb 2022 12:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D4704015E;
	Mon, 14 Feb 2022 12:33:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 999451BF2A4
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 12:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87CD880B9D
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 12:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsitK-yrHDQo for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 12:33:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEDC880B8F
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:33:36 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id s24so17184742oic.6
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 04:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/jvj5r7HiyL1TDFk9OUFsBsZj0UOY0RQDtO2iC//PVQ=;
 b=ZgV9nCY/zZ5hoVspz595C8YdATWDnDcvfq5VXXKPQfBTao17Q3tNp8YVfpBb38Qplg
 N53vlOSpwzCC+mvEIYm+S0xYVV9Oj+G6MU57k7CcBRUiicXOFXcvtoDOHsD6F09cNScy
 +TXttHRGX8Zs47jknWfGwiaJNHUlGwDV9slvGP0bIoJ2rU7tfEecvmCh3zuUdLGcOpl6
 Y+osGRIsKSOvsTZ5tXzZjVfVEQqYT311GdAco6fsCyzNN5gl32QSt6EFjW8Jh9NbNXp6
 ylaP/q9gemOp6AoBHsyUq51Y9NFQFlkuzDqEJfp2bdqcd82KqUEiJDXCdOdo60qvnfR/
 L+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/jvj5r7HiyL1TDFk9OUFsBsZj0UOY0RQDtO2iC//PVQ=;
 b=76M5GI2PxSyXE+TKZBYCVZriMH+Ezj2I0dRqWxnpdRr76h8A7STVx+UBz6YmeiQyQS
 eEPUiFUlktYFZLzeDejYrl8RtyUE5VPvgFOqd9YU0+pHNZ4sig2+d39AStxMQ+dQnHeM
 iMRJIUKGUOIi5r1zp5rB5ecA+xbYZ5zh0YqLiTeX4EAWfyyOFDZa88Z4F2zSNQT/iTmN
 0Xkk3cR8RU10SST1OA33L7ypZ3fJgbBVm0/yWvvKONK2RReycrMHpzTZcpmZ2Ximw7X7
 YmLlyJvSzc1uBW9B4tl0hpSQNhvdLWMoQKd2OvU1BmPhaRPX+vHyV+xhkx6SVDm6bad/
 ldow==
X-Gm-Message-State: AOAM5307Gro/8+GKjHxVWgQnz2Rf/P/uapOdbbuhgF0qa3AsGAOnejbt
 gk58t+2SLPssX8vvItcbiwuYz/yg8PMRIda+WhinJZbmgC0=
X-Google-Smtp-Source: ABdhPJwygoGEd2pI8YP5Uor3sarPcGY0rS667WrNMt3Na5iX+jNgBJfu9W0OtGMH7EPp7ULC7F0l74Rj/bKfemoofW0=
X-Received: by 2002:a05:6808:1999:: with SMTP id
 bj25mr5358024oib.23.1644842015895; 
 Mon, 14 Feb 2022 04:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20220214110559.2176506-1-fontaine.fabrice@gmail.com>
 <20220214115902.GB38097@scaer>
In-Reply-To: <20220214115902.GB38097@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Feb 2022 13:33:50 +0100
Message-ID: <CAPi7W80THZqjdaN2Lhuy9oHJt8zuw1K-coiM0YSV1u-i4u2Znw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: set
 BLUEZ5_UTILS_AUTORECONF
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
Cc: Marcin Bis <marcin@bis.org.pl>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCkxlIGx1bi4gMTQgZsOpdnIuIDIwMjIgw6AgMTI6NTksIFlhbm4gRS4gTU9SSU4gPHlh
bm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4KPiBGYWJyaWNlLCBBbGwsCj4KPiBP
biAyMDIyLTAyLTE0IDEyOjA1ICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToK
PiA+IENvbW1pdCA1NzJkMDhlZTRhNzMxYjIwM2IyZDNhYWY3MjBhNDhmNjIyNjA5MzcxIGZvcmdv
dCB0byBzZXQKPiA+IEJMVUVaNV9VVElMU19BVVRPUkVDT05GIHJlc3VsdGluZyBpbiB0aGUgZm9s
bG93aW5nIGJ1aWxkIGZhaWx1cmU6Cj4gPgo+ID4gL2hvbWUvcGVrby9hdXRvYnVpbGQvaW5zdGFu
Y2UtMC9vdXRwdXQtMS9ob3N0L29wdC9leHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL3NoNC1i
dWlsZHJvb3QtbGludXgtdWNsaWJjLzEwLjMuMC8uLi8uLi8uLi8uLi9zaDQtYnVpbGRyb290LWxp
bnV4LXVjbGliYy9iaW4vbGQ6IGdvYmV4L2dvYmV4LXBhY2tldC5vOiBpbiBmdW5jdGlvbiBgZ19v
YmV4X3BhY2tldF9zZXRfZGF0YSc6Cj4gPiBnb2JleC1wYWNrZXQuYzooLnRleHQrMHg2OTgpOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGB1dGlsX21lbWR1cCcKPiA+Cj4gPiBJdCBzaG91bGQgYmUg
bm90ZWQgdGhhdCBwcmV2aW91cyBjb21taXQgZGlkbid0IGZpeCBhbnkgYnVpbGQgZmFpbHVyZQo+
ID4gd2l0aCBsaWJnbGliID49IDIuNjkuIEl0IG9ubHkgZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJu
aW5nOgo+ID4KPiA+IHByb2ZpbGVzL2JhdHRlcnkvYmF0dGVyeS5jOiBJbiBmdW5jdGlvbiAncmVh
ZF9pbml0aWFsX2JhdHRlcnlfbGV2ZWxfY2InOgo+ID4gcHJvZmlsZXMvYmF0dGVyeS9iYXR0ZXJ5
LmM6MTYyOjI6IHdhcm5pbmc6ICdnX21lbWR1cCcgaXMgZGVwcmVjYXRlZCAoZGVjbGFyZWQgYXQg
L2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0wL291dHB1dC0xL2hvc3QvYmluLy4u
L2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFiaS9zeXNyb290L3Vzci9pbmNsdWRlL2dsaWItMi4w
L2dsaWIvZ3N0cmZ1bmNzLmg6MjU3KTogVXNlICdnX21lbWR1cDInIGluc3RlYWQgWy1XZGVwcmVj
YXRlZC1kZWNsYXJhdGlvbnNdCj4gPiAgIGJhdHQtPmluaXRpYWxfdmFsdWUgPSBnX21lbWR1cCh2
YWx1ZSwgbGVuZ3RoKTsKPiA+ICAgXgo+ID4KPiA+IFNvIGFuIG90aGVyIG9wdGlvbiB3b3VsZCBi
ZSB0byByZXZlcnQgdGhpcyBjb21taXQuCj4KPiBUaGF0IHdvdWxkIGhhdmUgYmVlbiBhIHBvc3Np
YmlsaXR5LCBpbmRlZWQsIGJ1dCBJIHdlbnQgZm9yIGtlZXBpbmcgaXQKPiBpbnN0ZWFkLgo+Cj4g
PiBUaGUgJ3JlYWwnIGJ1aWxkIGVycm9yIHRoYXQgcHJldmlvdXMgY29tbWl0IHRyaWVkIHRvIGZp
eCB3YXMgcmFpc2VkCj4gPiBiZWNhdXNlIHJhbmQgd2FzIHJlcGxhY2VkIGJ5IGdldHJhbmRvbSBz
aW5jZQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2JsdWV0b290aC9ibHVlei5n
aXQvbG9nLz9xdD1ncmVwJnE9Z2V0cmFuZG9tCj4gPiBidXQgZ2V0cmFuZG9tIGlzIG5vdCBhdmFp
bGFibGUgdW50aWwgZ2xpYmMgMi4yNToKPiA+Cj4gPiBwbHVnaW5zL2F1dG9wYWlyLmM6MjA6MjQ6
IGZhdGFsIGVycm9yOiBzeXMvcmFuZG9tLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiA+
ICAjaW5jbHVkZSA8c3lzL3JhbmRvbS5oPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgXgo+
Cj4gQnV0IHRoZW4gdGhpcyBwYXRjaCBvZiB5b3VycyBkb2VzIG5vdCBmaXggdGhpcyBvcmlnaW5h
bCBpc3N1ZSwgZG9lcyBpdD8KTm9wZSwgSSdtIHdvcmtpbmcgb24gaXQuCj4KPiA+IEZpeGVzOgo+
ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNDZmN2RiZmUxZDgw
Yzc2MjJkNjcwYmExYWM5NTdlOWU2MDc3ZWI5Zgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+Cj4gQXBwbGllZCB0byBt
YXN0ZXIgYW55d2F5LCB0aGFua3MuCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+
IC0tLQo+ID4gIHBhY2thZ2UvYmx1ZXo1X3V0aWxzL2JsdWV6NV91dGlscy5tayB8IDIgKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvYmx1ZXo1X3V0aWxzL2JsdWV6NV91dGlscy5tayBiL3BhY2thZ2UvYmx1ZXo1X3V0aWxz
L2JsdWV6NV91dGlscy5tawo+ID4gaW5kZXggNDlmNmVhYWMxMy4uN2MyNTYxYjg2NCAxMDA2NDQK
PiA+IC0tLSBhL3BhY2thZ2UvYmx1ZXo1X3V0aWxzL2JsdWV6NV91dGlscy5tawo+ID4gKysrIGIv
cGFja2FnZS9ibHVlejVfdXRpbHMvYmx1ZXo1X3V0aWxzLm1rCj4gPiBAQCAtMTMsNiArMTMsOCBA
QCBCTFVFWjVfVVRJTFNfTElDRU5TRSA9IEdQTC0yLjArLCBMR1BMLTIuMSsKPiA+ICBCTFVFWjVf
VVRJTFNfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy5MSUIKPiA+ICBCTFVFWjVfVVRJ
TFNfQ1BFX0lEX1ZFTkRPUiA9IGJsdWV6Cj4gPiAgQkxVRVo1X1VUSUxTX0NQRV9JRF9QUk9EVUNU
ID0gYmx1ZXoKPiA+ICsjIFdlJ3JlIHBhdGNoaW5nIE1ha2VmaWxlLmFtCj4gPiArQkxVRVo1X1VU
SUxTX0FVVE9SRUNPTkYgPSBZRVMKPiA+Cj4gPiAgQkxVRVo1X1VUSUxTX0RFUEVOREVOQ0lFUyA9
IFwKPiA+ICAgICAgICQoaWYgJChCUjJfUEFDS0FHRV9CTFVFWjVfVVRJTFNfSEVBREVSUyksYmx1
ZXo1X3V0aWxzLWhlYWRlcnMpIFwKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
LyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAw
NTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAg
ICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1h
LWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3ku
ICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
