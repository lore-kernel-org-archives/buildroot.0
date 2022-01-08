Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ED7C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78021607A3;
	Sat,  8 Jan 2022 17:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUkTQqUvLyQj; Sat,  8 Jan 2022 17:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 144A4607F9;
	Sat,  8 Jan 2022 17:17:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AC361BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 431BB4020A
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cuByImv-Rt2y for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:17:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1C8740201
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:17:03 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c71so23623566edf.6
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 09:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K3PSdESB2xzB93VBDubN++On+T6xFvNI9PJwplJzhU0=;
 b=JjVgHC7zFCvn5dRRudWij7Oq6ImjujGJeANaPbblryThFI6XIRBwb3SOYtVOIRiHbF
 iEEeu21rvBrVsOTvLBZt8Ht9ctzCdubXNtK4Cv+aINK+SPRslyJbzgyeJfGfatZFjLW5
 POGqM3XjRogIRVzwL2NxlT3pXZh3Wm3p4/Q/h2QualEKdWEZT/f5TmjhTgxVFYuDXiRr
 E0VGeEIpzSfuFLTQaEd3k8aVYm+UobvyHBKzPv2W+p4x1UpNtXWnUCC5dpZMCBbkihLq
 l3gDZyCTNWXKQ6Hg/9X3ZKxfVHX40G9aJs5ZaOd/L2I6aXAFwyRbFY06jSJYVDrY8TTJ
 Ae1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K3PSdESB2xzB93VBDubN++On+T6xFvNI9PJwplJzhU0=;
 b=y5AufGT7byLCJy74aPXDtf3JJt2ogyXXHaXtVksnTWOo9g+q9WOedPm9yvrgbXHW+4
 Y2HPT0/MF39+HiCMlSLVjP8/b5Z6Ynlv25Ifpv3egpXg0mIhvqV6JzZz5tzJYEZ2Qg+C
 rfkX1dSLx5MXShlVsKGkwrMLjTC3PlWFc8Qy61XTI535SB8+j5SAjGDkLhn9W0apMtKM
 m+1DwjwckfDH4HeGz3ECGB/JPmMyMruvV2mB1/5Dh1Mo3zcY7fPhgEBsh2zpBgX+FiEe
 pINht7fOyMlXBiWW9RvxwuK52PuJtOoDuDSyeTY9VxD25k3v7bzoHRfrdr77eF4DwpUv
 Y3HQ==
X-Gm-Message-State: AOAM531cXLQHg8GdcJ0KfkGLUt5JqZCBB1ziRhU3rB1IPluNUycvP4JZ
 qVybgwMse85U9HruINk/fcaXC57DaZScxGL065JQWjPUmC4=
X-Google-Smtp-Source: ABdhPJxBuKS346Y/J8V0ymnCky3fu/o4XHQbpcGccAICsqgtpnLpghQLdfPD1usdBriDwTYB8d9H0WUduW5bufQWIRQ=
X-Received: by 2002:a05:6402:2682:: with SMTP id
 w2mr66183825edd.393.1641662222239; 
 Sat, 08 Jan 2022 09:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
 <20211228164916.2beec0d6@windsurf>
 <CAPi7W80OfGF3AhM2h6mjtsUjLEnYEV4gteJ12GFq4edNysEV5A@mail.gmail.com>
 <20211228181447.2a42dc86@windsurf>
 <ed10db1b-6b39-344d-8c4b-aa0a6d085d40@gmail.com>
 <CAPi7W8094+7P-RRPafDfRgSCe94aqQUfoQ7z=WvGRFsj_wdpww@mail.gmail.com>
 <874k6egvrm.fsf@dell.be.48ers.dk>
 <CAPi7W80y_knjUqY1TuKsxbqvgPET08pS9vee07zM7HCm9w4qYg@mail.gmail.com>
 <87zgo6f9sa.fsf@dell.be.48ers.dk>
In-Reply-To: <87zgo6f9sa.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 8 Jan 2022 18:15:46 +0100
Message-ID: <CAPi7W83EtcjmXsa++4J6cyVK7muHf84Ckq2G_gGYDA_AUBJ+Uw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgc2FtLiA4IGphbnYuIDIwMjIgw6AgMTc6NTQsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiBIaSwKPiAg
PiBMZSBzYW0uIDggamFudi4gMjAyMiDDoCAxNToxNCwgUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBr
b3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6Cj4gID4+Cj4gID4+ID4+Pj4+ICJGYWJyaWNlIiA9PSBG
YWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JpdGVzOgo+ICA+
Pgo+ICA+PiBIaSwKPiAgPj4KPiAgPj4gPiBJbmRlZWQsIHRoaXMgaXMgYWxzbyBhbiBhbHRlcm5h
dGl2ZSwgZXZlbiBpZiBJIHRoaW5rIHRoYXQgYWRkaW5nCj4gID4+ID4gbWJlZHRsczMgd291bGQg
YmUgYSBncmVhdCBhZGRpdGlvbi4KPiAgPj4gPiBGb3IgZXhhbXBsZSwgbGliY3VybCBzdXBwb3J0
cyBtYmVkdHMgMy4wIHNpbmNlIGl0cyB2ZXJzaW9uIDcuNzkgYW5kCj4gID4+ID4gaHR0cHM6Ly9n
aXRodWIuY29tL2N1cmwvY3VybC9jb21taXQvM2YxMjYxMzhiZTNjNDU5YTI3OTRkMzVmODE3MGU5
MmU2NWE1MGRhZC4KPiAgPj4gPiBPdGhlcndpc2UsIGFzIHJlcXVlc3RlZCBieSBUaG9tYXMsIEkg
c2VudCBhbiBlbWFpbCB0byBtYmVkdGxzIG1haWxpbmcKPiAgPj4gPiBsaXN0Ogo+ICA+PiA+IGh0
dHBzOi8vbGlzdHMudHJ1c3RlZGZpcm13YXJlLm9yZy9hcmNoaXZlcy9saXN0L21iZWQtdGxzQGxp
c3RzLnRydXN0ZWRmaXJtd2FyZS5vcmcvdGhyZWFkL0hFSENOUVpUQk9aVjU2UlRHUlRHU1FRUk1F
V1lKUEdJLwo+ICA+Pgo+ICA+PiBXaGF0IGlzIHRoZSBwbGFuIGZyb20gdXBzdHJlYW0gcmVnYXJk
aW5nIG1iZWR0bHMgMi54PyBXaWxsIGl0IGJlCj4gID4+IG1haW50YWluZWQgaW4gcGFyYWxsZWwg
d2l0aCAzLnggZm9yIHNvbWUgdGltZSAoYW5kIGZvciBob3cgbG9uZz8pIG9yIGlzCj4gID4+IGl0
IGVmZmVjdGl2ZWx5IEVPTCBhbHJlYWR5Pwo+ICA+IDIuMTYueCBpcyBFT0wgc2luY2UgRGVjZW1i
ZXIgMjAyMToKPiAgPiBodHRwczovL3Rscy5tYmVkLm9yZy90ZWNoLXVwZGF0ZXMvYmxvZy9hbm5v
dW5jaW5nLWx0cy1icmFuY2gtbWJlZHRscy0yLjE2Cj4gID4gVGhlIG5leHQgTFRTIGJyYW5jaCBp
cyAyLjI4IHdoaWNoIHdpbGwgYmUgbWFpbnRhaW5lZCB1bnRpbCBlbmQgb2YKPiAgPiAyMDI0OiBo
dHRwczovL2dpdGh1Yi5jb20vQVJNbWJlZC9tYmVkdGxzL2Jsb2IvZGV2ZWxvcG1lbnQvQlJBTkNI
RVMubWQKPgo+IE9rLCBzbyB3ZSBzaG91bGQgaWRlYWxseSBtb3ZlIG91ciBtYmVkdGxzIHZlcnNp
b24gdG8gMi4yOC54IGJlZm9yZQo+IDIwMjIuMDIuIFdoYXQgYWJvdXQgMy54LCBpcyB0aGF0IGFs
c28gYSBMVFMgb3IgaXMgdGhhdCBjb25zaWRlcmVkIGEKPiBub3QteWV0LXN0YWJsZSBkZXZlbG9w
bWVudCB2ZXJzaW9uPwo+Cj4gRm9yIHRoZSBxdWVzdGlvbiBpZiB3ZSBuZWVkIHRvIG1haW50YWlu
IGJvdGggMi4yOC54IGFuZCAzLnggaW4KPiBwYXJhbGxlbCBJIGd1ZXNzIGl0IHJlYWxseSBkZXBl
bmRzIG9uIGlmIHRoZSBwYWNrYWdlcyB3ZSBoYXZlIGRlcGVuZGluZwo+IG9uIG1iZWR0bHMgKEUu
Ry4gYmN0b29sYm94LCBibXg3LCBtb25ncmVsMiwgc2hhZG93c29ja3MtbGliZXYpIGNhbiAoYmUK
PiBwYXRjaGVkIHRvKSB3b3JrIHdpdGggbWJlZHRscyAzLnggb3Igbm90PwpJdCBpcyByZWFsbHkg
dW5saWtlbHkgdGhhdCBhbGwgdGhlc2UgcGFja2FnZXMgd2lsbCBiZSBwYXRjaGVkIHRvIHdvcmsK
d2l0aCBtYmVkdGxzIDMueC4KVG8gbXkga25vd2xlZGdlLCBvbmx5IGhpYXdhdGhhIGFuZCBjdXJs
IGhhdmUgYmVlbiBwYXRjaGVkIHRvIHN1cHBvcnQKbWJlZHRscyAzLnguCmFuZCBpdCBzaG91bGQg
YmUgbm90ZWQgdGhhdCBjdXJsIHN1cHBvcnRzIG1iZWR0bHMgMi54IGFuZCAzLng6Cmh0dHBzOi8v
Z2l0aHViLmNvbS9jdXJsL2N1cmwvY29tbWl0LzNmMTI2MTM4YmUzYzQ1OWEyNzk0ZDM1ZjgxNzBl
OTJlNjVhNTBkYWQKbGlnaHR0cGQgaXMgdHJ5aW5nIHRvIG1pZ3JhdGUgYnV0IGhhcyBhIGxvdCBv
ZiBpc3N1ZXM6Cmh0dHBzOi8vZ2l0aHViLmNvbS9BUk1tYmVkL21iZWR0bHMvaXNzdWVzLzUzMzEK
Pgo+IElmIHRoZXkgY2FuIChvciBhcmUgbm8gbG9uZ2VyIG1haW50YWluZWQgdXBzdHJlYW0pLCB0
aGVuIEkgd291bGQgcHJlZmVyCj4gdG8gb25seSBzdXBwb3J0IG1iZWR0bHMgMy54IGdvaW5nIGZv
cndhcmQuIElmIG9uIHRoZSBvdGhlciBoYW5kIG1iZWR0bHMKPiAzLnggaXNuJ3QgcmVhbGx5IHN0
YWJsZSB5ZXQgYW5kIG9ubHkgbmVlZGVkIGZvciBoaWF3YXRoYSwgdGhlbiBpbmRlZWQgd2UKPiBz
aG91bGQgcGVyaGFwcyBqdXN0IHBvc3Rwb25lIGl0IGEgYml0IGFuZCB1c2UgdGhlIGludGVybmFs
IG1iZWR0bHMgY29weQo+IGluIGhpYXdhdGhhIG9yIGRvd25ncmFkZSAvIGRyb3AgVExTIHN1cHBv
cnQuCjMueCBpcyBtb3JlICJzZWN1cmUiIGJlY2F1c2UgbWFueSBvYnNvbGV0ZSBjcnlwdG9ncmFw
aGljIG1lY2hhbmlzbXMgYW5kClRMUyBwcm90b2NvbCB2ZXJzaW9ucyBhbmQgb3B0aW9ucyBoYXZl
IGJlZW4gcmVtb3ZlZC4gSG93ZXZlciwgaXQgaXMgcHJvYmFibHkKb2sgdG8gcG9zdHBvbmUgdGhl
IGFkZGl0aW9uIG9mIG1iZWR0bHMgMy54IHVudGlsIG1vcmUgcGFja2FnZXMgc3VwcG9ydCBpdC4K
Ckl0IHNob3VsZCBiZSBub3RlZCB0aGF0IHdlJ2xsIGhhdmUgdGhlIHNhbWUgaXNzdWUvcXVlc3Rp
b24gd2l0aCBvcGVuc3NsIDMueCAuLi4KPgo+IC0tCj4gQnllLCBQZXRlciBLb3JzZ2FhcmQKQmVz
dCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
