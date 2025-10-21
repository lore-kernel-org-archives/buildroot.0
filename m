Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E50CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 08:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CE9E4050C;
	Tue, 21 Oct 2025 08:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKzH9P7IDsTi; Tue, 21 Oct 2025 08:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AAC240510
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AAC240510;
	Tue, 21 Oct 2025 08:02:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 004FB70A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D791A40510
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTstbxxaRxYK for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 08:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a31; helo=mail-vk1-xa31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0AEF4050C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0AEF4050C
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0AEF4050C
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:02:50 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-54a8f6a2d80so1891723e0c.3
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 01:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761033769; x=1761638569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ioaUYpEo3xGkEn8ouFFb2s1JCCzoGMagOV8maRoNJJo=;
 b=t4/l3XasnFMSq1DFl5yDS3dYil+mZc4eBVDNj+5pId94bZp/LJoXP8xDKS4gnaW4hE
 6esb/BWonC+Oh3SPHf4iP7rJhdYUy0UyUehU/StyAm1fvlsOjbk76kfE0TtAr9vUHjsW
 zjIESigrT7XmFNRaef17c5XLZHENLXdg9SF4lkuVfYWHAiIoDUX50H/X2IxMEzvvPZBf
 oJ2qTKifKn9tUUxrGmggm2H746ZhB+8jKV7dFW2BWsAQ4sUfq3rJ7rMMm8xWqE4wOxLU
 c8n479PLqejmvVQOyMdADUEqA0A57icA+k1onyAWOE3d4JY7nAvbHoCOz+6PuJKwx8Mc
 mVnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv7l6nuwJFlOKBMgWMB4zM3f7YjPeiQCOzThBHj+xvt0vO9hzQQBm/aEEqh9/GOclDpB8NYk+kZA4=@buildroot.org
X-Gm-Message-State: AOJu0YyP8AgHR2J/EVWDuK36CuUEqqUM2VvWEsktSSvS0zXC8jRnDD5l
 b0w+TzmAmymjwmqfTi95fAtmybfipDS9ZMCtpput3jjI04ypRVegQWyECK/cuabwXZw6Qqsq1qx
 HS4YtB5SEuWVmO3IrVuPZlLojerb4a8g=
X-Gm-Gg: ASbGncsJ5TrUmsyNm5Nlq7AE60y6bRo6raeuxuk678zhJADKfGmfjt8Mu9XGQoweqm2
 vOTjTlmNqRQ6RPbGQX41uguYARj7EKWr+obQulhfMEDNL672CUmYdUsLZjqyNAOvsAYvRzfyFSi
 p/D/VYd7V6EyDj/Dlu6tslbd8dTHIUAzRbaVpFpg/QjW76ZsGR36RNTv8VTkLIq+zrpx95Ng9pm
 r4HBquU+9OoaT62rAXYgpTYdBsFwMP5lzy5NXH/tQJOQGs2RgRJC8HRwt/u1Q==
X-Google-Smtp-Source: AGHT+IG7NaurYAZzeDT7xEb77w+KmADLvWveQGB17DJ/t4w01lSvfShEwMlRBFjU6kjvo7wUGim8lyZ9EO+k5MJsY5A=
X-Received: by 2002:a05:6122:904:b0:544:8d16:4541 with SMTP id
 71dfb90a1353d-5564eec2f1emr3675301e0c.7.1761033769504; Tue, 21 Oct 2025
 01:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251020225424.98853-1-james.hilliard1@gmail.com>
 <aPcNRwNOMOrNTLUB@yd-6wlzhs3>
 <CA+h8R2rkGCQeJbEvR6wHRX8q5s1D2EP2OXk9ieMr326TqTofaw@mail.gmail.com>
 <aPcb5J8rX6TuKsW2@yd-6wlzhs3>
 <CADvTj4p0B68BCMy60mmQf71DKhHq1vYGQpxFtEEou_PZXuTdew@mail.gmail.com>
 <aPcrvYrBo+D90ALa@yd-6wlzhs3>
In-Reply-To: <aPcrvYrBo+D90ALa@yd-6wlzhs3>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 21 Oct 2025 02:02:36 -0600
X-Gm-Features: AS18NWBHA57ZR2hIYkgYcZw53mgiuH1_63-2ow5twg2Tz1LyT4K_sTMTaJFoksU
Message-ID: <CADvTj4oMW4FiPqVmqyQS6ypbotFyM3VS5H-mW247rS4ovhUo1A@mail.gmail.com>
To: yann.morin@orange.com
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761033769; x=1761638569; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ioaUYpEo3xGkEn8ouFFb2s1JCCzoGMagOV8maRoNJJo=;
 b=M6XJmFxyIVQWnSqNTwuDw8DsL2C1We9gcfc+2yfNMSwk4lQAtU76nh4VFNaiIynH6c
 PEqBTgvzIFcvYLjF+1nXkXjxngaPD/LVvHBVhE9mqD35JmOWW39aI9gbD+/HTepyapSs
 6TXlX7bYLQdPcOj4OMbcvi6RtNFGL0CNwtSUe0UwDkSJwioFp2d4ppqp2D75akcoJ/Vy
 rXdW89vz114rk3wrBc6Z9ydhkm2VeRrGDWuX9LhoPjBqL7LQ4QeUju1J0M+/YpIvapcw
 2zhgYGJhadbiLVh7GF6or3QO43vNM26SXx8OfwXzvxbxzP/yDXKIbdkVYrmcAI5Xdnrh
 anbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M6XJmFxy
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-golang.mk: make GOPROXY
 configurable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

T24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgMTI6NDTigK9BTSA8eWFubi5tb3JpbkBvcmFuZ2UuY29t
PiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI1LTEwLTIwIDIzOjQ5IC0wNjAwLCBK
YW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBPbiBNb24sIE9jdCAyMCwgMjAyNSBhdCAx
MTozNuKAr1BNIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+IHdyb3RlOgo+IFstLVNOSVAtLV0KPiA+
IFRoZSBpc3N1ZSBpcyB0aGF0IGl0J3MgZXhwZWN0ZWQgYnkgdXBzdHJlYW0gZ28gcGFja2FnZXMg
dGhhdCBhbGwKPiA+IGhhc2hlcyBhcmUgZm9yIGNhY2hlZCBnb3Byb3h5IHNvdXJjZXMsIG5vdCBk
aXJlY3Qgc291cmNlcy4gU28KPiA+IGRpcmVjdCBzb3VyY2VzIGJyZWFraW5nIHdvdWxkbid0IGV2
ZW4gYmUgY29uc2lkZXJlZCBhbiBpc3N1ZQo+ID4gYnkgYW4gdXBzdHJlYW0gcGFja2FnZSBhcyB0
aGV5IGFsd2F5cyB1c2UgY2FjaGVkIHNvdXJjZXMuCj4KPiBBY3R1YWxseSwgc29tZSBkbyBjYXJl
Ogo+Cj4gICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9lbGFzdGljL2JlYXRzL2lzc3Vlcy8zNjk0OQoK
V2VsbCB5ZXMsIHRoYXQgYnJva2UgYmVjYXVzZSB5b3Ugc2V0IEdPUFJPWFk9ZGlyZWN0LCBwYWNr
YWdlcwppbiBnZW5lcmFsIGRvIG5vdCB0ZXN0IHRoYXQgY29uZmlndXJhdGlvbiBhdCBhbGwsIHRo
ZXkgYWxsIGV4cGVjdCB0aGUKY2FjaGluZyBwcm94eS4KCj4KPiA+ID4gWy0tU05JUC0tXQo+ID4g
PiA+IEZXSVcgSSd2ZSBvdmVycmlkZGVuIGl0IHRvICJkaXJlY3QiIGluIG15IG93biBCdWlsZHJv
b3QgYnJhbmNoIGFzIEkKPiA+ID4gPiBzdGlsbCBwcmVmZXIgZnJvbS1HaXQgc291cmNlcy4KPiA+
ID4gWWVzLCBJIGJlbGlldmUgdGhpcyBzaG91bGQgYmUgdGhlIGRlZmF1bHQuCj4gPiBUaGlzIHdp
bGwgYnJlYWsgcGFja2FnZSBkb3dubG9hZHMsIHBhY2thZ2UgZG93bmxvYWRzIGVzc2VudGlhbGx5
Cj4gPiBhbHdheXMgd29yayB3aXRoIHRoZSBjYWNoaW5nIGdvcHJveHkgYmVjYXVzZSB0aGF0J3Mg
d2hhdCB0aGUgZ28KPiA+IGVjb3N5c3RlbSBkZWNpZGVkIG9uIGZvciB0aGVpciBkZWZhdWx0LiBP
dmVycmlkaW5nIHRoZSBnb2xhbmcgZGVmYXVsdAo+ID4gY2F1c2VzIGEgbG90IG9mIGJyZWFrYWdl
IGJlY2F1c2Ugb2YgdGhpcy4KPgo+IFN0YXRpbmcgImEgbG90IiBpcyBhIGJpdCBvZiBhbiBleGFn
ZXJhdGlvbjogaW4gdGhlIG1hbnkgeWVhcnMgd2UgaGF2ZQo+IGhhZCB0aGUgZ28gdmVuZG9yaW5n
IGluIEJ1aWxkcm9vdCwgdGFpbHNjYWxlIGlzIHRoZSBmaXJzdCB0aGF0IGlzCj4gcmVwb3J0ZWQg
dG8gYmUgY2F1c2luZyBhbiBhY3R1YWwgaXNzdWUgKEkgcmVtZW1iZXIgc29tZSBwcmV2aW91cyBp
c3N1ZXMKPiB0aGF0IHdlcmUgZXZlbnR1YWxseSByZXNvbHZlZCBvbmUgd2F5IG9yIHRoZSBvdGhl
ciwgYnV0IG5vdCBieSB1c2luZyBhCj4gcHJveHkpLgoKSXQncyBub3QgdGhlIGZpcnN0LCB3ZSd2
ZSBoYWQgcGFja2FnZXMgYmxvY2tlZCBmcm9tIGJlaW5nIG1lcmdlZApyZXBlYXRlZGx5IGR1ZSB0
byB1c2luZyBhIG5vbi1zdGFuZGFyZCBHT1BST1hZPWRpcmVjdCBjb25maWcsCmZvciBleGFtcGxl
IG5ldGJpcmQgaXMgYWxzbyBicm9rZW4gYnkgdGhpcyBjb25maWcuCgo+IFNwZWFraW5nIG9mIHRo
YXQ6IGRvIGFsbCB0aGUgZ28gcGFja2FnZXMgd2UgaGF2ZSBpbiBCdWlsZHJvb3Qgc3RpbGwKPiBk
b3dubG9hZCBPSyB3aXRoIHRoaXMgY2hhbmdlIGFuZCB3aXRob3V0IHVzaW5nIHMuYi5vIChhbmQg
b2YgY291cnNlCj4gd2l0aG91dCBhIGxvY2FsIGRsLyk/CgpJIGRpZG4ndCBub3RpY2UgYW55IHdp
dGggaXNzdWVzLCBpdCB3b3VsZCBiZSByYXRoZXIgc3VycHJpc2luZyBpZiB1c2luZyB0aGUKY2Fj
aGluZyBwcm94eSBicm9rZSBhIHBhY2thZ2Ugc2luY2UgdGhlIGNhY2hpbmcgcHJveHkgaXMgdGhl
IGRlZmF1bHQKZm9yIHRoZSBnb2xhbmcgdG9vbGNoYWluLCByZW1lbWJlciBub2JvZHkgdXNlcyBH
T1BST1hZPWRpcmVjdAppbiBwcmFjdGljZSBmb3IgdXBzdHJlYW0gZ28gcHJvamVjdHMuCgo+IFst
LVNOSVAtLV0KPiA+ID4gSW4gdGhlIGVuZCwgaXQgc2hvd3MgdGhhdCB1c2luZyBhIGdvcHJveHkg
aXMgbm90IGEgbWFnaWMgYnVsbGV0IHRvIHNvbHZlCj4gPiA+IHZlbmRvcmluZyB3aGVuIHVwc3Ry
ZWFtIGFuZCB0aGUgZ29wcm94eSBkaXNhZ3JlZSBvbiB0aGUgY29udGVudCBvZiBhCj4gPiA+IHZl
cnNpb24uLi4KPiA+IFRoYXQncyBub3QgdHJ1ZSBkdWUgdG8gYWxsIHBhY2thZ2VzIGV4cGVjdGlu
ZyB0aGUgY2FjaGVkIGdvcHJveHkgc291cmNlcwo+ID4gdG8gYmUgdmFsaWQuIEZyb20gbXkgdW5k
ZXJzdGFuZGluZyBHT1BST1hZPWRpcmVjdCBpcyBzaW1wbHkgbm90Cj4gPiByZWxpYWJsZSBlbm91
Z2ggZm9yIGdvIHByb2plY3RzIHdpdGggbGFyZ2VyIGRlcGVuZGVuY3kgdHJlZXMuCj4KPiBUaGF0
J3MgdW5mb3J0dW5hdGUsIGFuZCBhZGRzIGEgbGF5ZXIgb2YgdW5jZXJ0YWludHkgaW4gdGhlIG1p
eCwgYWxsb3dpbmcKPiBmb3Igc3VwcGx5LWNoYWluIGF0dGFja3Mgw6AtbGEgTlBNIG9yIFB5UGkg
dG8gYmUgbWFkZSBhZ2FpbnN0IGEgZ29wcm94eS4KCkl0J3Mgbm90IGFuIGlzc3VlLCBhdCBsZWFz
dCBpdCBjYW4ndCByZWFsbHkgaW50cm9kdWNlIG5ldyBzZWN1cml0eSBpc3N1ZXMsCndlIGFscmVh
ZHkgdHJ1c3QgdGhlIGNoZWNrc3VtIGZpbGVzIGZvciBnbyBwYWNrYWdlcywgdGhpcyBtZXJlbHkK
ZW5zdXJlcyB3ZSBoYXZlIHRoZSBjb3JyZWN0IGRvd25sb2FkIGxvY2F0aW9uIGZvciB0aG9zZSBn
byBwYWNrYWdlCmRlcGVuZGVuY2llcy4gQWxsIGRlcGVuZGVuY2llcyBhcmUgaGFzaGVkIHNvIGlm
IHZhbGlkYXRpb24gcGFzc2VzCnRoZW4gd2Uga25vdyB3ZSBoYXZlIHRoZSBleHBlY3RlZCBkZXBl
bmRlbmNpZXMgcmVnYXJkbGVzcyBvZgp3aGVyZSB0aGV5IHdlcmUgZG93bmxvYWRlZCBmcm9tLiBU
aGlzIG1heSBiZSBhbiBpc3N1ZSBmb3IKdXBzdHJlYW0gcHJvamVjdHMsIGJ1dCBpdCdzIG5vdCBh
biBpc3N1ZSBmb3IgZG93bnN0cmVhbSBwYWNrYWdlcnMKc2luY2Ugd2UgdHJ1c3QgdGhlIHVwc3Ry
ZWFtIHN1bSBmaWxlcyBmb3IgdmVuZG9yaW5nIGRlcHMgYW5kIHRob3NlCnN1bSBmaWxlcyBhcmUg
aW4gdGhlIHBhY2thZ2UgcmVwb3NpdG9yaWVzLi4KCj4KPiAtLQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18KPiAuLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS06ICAgICAgIF8gICAgOi0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8ICAgIF9fLyApICAgfCAvIlwg
QVNDSUkgUklCQk9OIHwKPiB8ICAgICAgICAgICAgICAgICB8IFNvZnR3YXJlICBEZXNpZ25lciB8
ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKPiB8ICszMyA2MzguNDExLjI0NSAnLS0t
LS0tLS0tLS0tLS0tLS0tLS06IChfICAgIGAtLSwgfCAgWCAgQUdBSU5TVCAgICAgIHwKPiB8IHlh
bm4ubW9yaW4gKGF0KSBvcmFuZ2UuY29tICAgICAgICAgICB8Xz0iICAgICwtLScgfCAvIFwgSFRN
TCBNQUlMICAgIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS06X19f
X19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IENlIG1lc3NhZ2UgZXQgc2VzIHBpZWNlcyBq
b2ludGVzIHBldXZlbnQgY29udGVuaXIgZGVzIGluZm9ybWF0aW9ucyBjb25maWRlbnRpZWxsZXMg
b3UgcHJpdmlsZWdpZWVzIGV0IG5lIGRvaXZlbnQgZG9uYwo+IHBhcyBldHJlIGRpZmZ1c2VzLCBl
eHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2ZXogcmVjdSBj
ZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVyCj4gYSBsJ2V4cGVkaXRl
dXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1lc3Nh
Z2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwKPiBPcmFu
Z2UgZGVjbGluZSB0b3V0ZSByZXNwb25zYWJpbGl0ZSBzaSBjZSBtZXNzYWdlIGEgZXRlIGFsdGVy
ZSwgZGVmb3JtZSBvdSBmYWxzaWZpZS4gTWVyY2kuCj4KPiBUaGlzIG1lc3NhZ2UgYW5kIGl0cyBh
dHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1h
dGlvbiB0aGF0IG1heSBiZSBwcm90ZWN0ZWQgYnkgbGF3Owo+IHRoZXkgc2hvdWxkIG5vdCBiZSBk
aXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLgo+IElmIHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNl
bmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzLgo+IEFzIGVt
YWlscyBtYXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlzIG5vdCBsaWFibGUgZm9yIG1lc3NhZ2VzIHRo
YXQgaGF2ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2VkIG9yIGZhbHNpZmllZC4KPiBUaGFuayB5b3Uu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
