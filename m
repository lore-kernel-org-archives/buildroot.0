Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79C0C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 22:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D5C741759;
	Mon, 18 Dec 2023 22:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D5C741759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39c2iv7kY1bl; Mon, 18 Dec 2023 22:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09F5D4180B;
	Mon, 18 Dec 2023 22:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09F5D4180B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C723B1BF3D0
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 22:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACEAC4180B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 22:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACEAC4180B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id upMXz3XipOyt for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 22:09:43 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD6FE41759
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 22:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD6FE41759
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c68c1990dso43885835e9.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 14:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702937382; x=1703542182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=We92UELgyeAqmwDQLe87PDbB/0O94OyO2RL8Kn/vnYU=;
 b=gMy0gRbwP/1EpFh9OKvhEqRV82QwHOrAgXCQ5VHA4dLRwt6uP7HcxqHS3YwU5cZfrs
 JcgV87WA1EI1mmpIWmwhfpU3hZgMfAAoHoEcYKK4VNAzh13G3RrYXfW/crcPSMTMY1aa
 btW4+7tFxgNrB2Q0Fz8oCj8przStsDXPxOnJEXG15yQIGeIVBg/tuia1ZgCruAUYy6x6
 ntkNpQgaD48L6Owol/Sd8SLjnGKQA8AtGez4RZeFfCNUnuYxAeqPa9dAzeR4b7jp7Gu+
 e2msRzZLbzgLigiBv47OepHufhX7nijjAIvzuaa38zolxyy6wl6A7P4iyNpVJtL8X2IJ
 +yLQ==
X-Gm-Message-State: AOJu0YxnNkFW9BWoe3uJi7aK3buitleDxV3xuccUYeizy/xMj+mlt+NI
 gpgGRt2+N/Cnur4Y+4/40ir+kXvxJgAZzRslb7NZRQ==
X-Google-Smtp-Source: AGHT+IG4Cp4wAg+KS0JrPKff103/WyS3jRWx+yoaNJRqnCYwpLlJOCCR6x22lbku4yW4MKqBftovgxP0HOL2lDJSOLw=
X-Received: by 2002:a05:600c:548a:b0:40c:26a4:b2f5 with SMTP id
 iv10-20020a05600c548a00b0040c26a4b2f5mr5887287wmb.111.1702937381743; Mon, 18
 Dec 2023 14:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
 <ZYB_06OI-Kw5cC0Z@landeda>
 <CAHDQB6Oa1NHV0fO+kPBixsR-4zcCCH1f-fE-C+75Cb9pDJRcbg@mail.gmail.com>
 <ZYCDv03HW6cpkQFw@landeda>
 <CAHDQB6OUePQ7krOgzVv8zdYuqDATfH=HND_f6LAUq6jCOcwYEw@mail.gmail.com>
In-Reply-To: <CAHDQB6OUePQ7krOgzVv8zdYuqDATfH=HND_f6LAUq6jCOcwYEw@mail.gmail.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 18 Dec 2023 15:09:29 -0700
Message-ID: <CAHDQB6NdsCJmspYsevsSB+EVOOSeYyhc4U=jg=w=+1Gq++UypQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702937382; x=1703542182;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=We92UELgyeAqmwDQLe87PDbB/0O94OyO2RL8Kn/vnYU=;
 b=CbzFnrkwxjpbxN3uSUK+2b5yUOGs7c4I+edrmQYw8YTy6U+bNLy75faP/XLvuvEH+g
 Xfmccarwzdc6YBykN6XHK5FSdcNRO8SozfYh8Adayd2c7SjgO16BQnvyl12zvwPcUjy1
 EjGDOvXfWiqgXPxguU9UqUEqNkYT0XBGQ9SSg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CbzFnrkw
Subject: Re: [Buildroot] [PATCH v2 1/2]
 package/postgresql/postgresql.service: set locale for initdb to C
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U29ycnksIEdtYWlsIGRlZmF1bHRlZCB0byBIVE1MLgoKPiBPbiBNb24sIERlYyAxOCwgMjAyMyBh
dCAxMDozOeKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90
ZToKPiA+Cj4gPiBBZGFtLCBBbGwsCj4gPgo+ID4gW1BsZWFzZSwgZG8gbm90IHRvcC1wb3N0XQo+
ID4KT0sKPiA+IE9uIDIwMjMtMTItMTggMTA6MjggLTA3MDAsIEFkYW0gRHVza2V0dCBzcGFrZSB0
aHVzbHk6Cj4gPiA+IEkgZGlkbid0IGFkZCBQZXRlciBhcyB0aGUgcGF0Y2ggaXMgY29tcGxldGVs
eSBkaWZmZXJlbnQgdGhhbiB3aGF0IGhlIHNlbnQKPiA+ID4gYWxvbmcgd2l0aCBhIG1vcmUKPiA+
ID4gY29tcHJlaGVuc2l2ZSBleHBsYW5hdGlvbiBhcyB0byB3aGF0IGlzIGhhcHBlbmluZy4KPiA+
Cj4gPiBUaGVuIHlvdSBzaG91bGQgYWxzbyBoYXZlIGRyb3BwZWQgaGltIGFzIHRoZSBhdXRob3I7
IG5vdGUgaG93IHRoZSBmaXJzdAo+ID4gbGluZSBvZiB0aGUgcGF0Y2ggd2FzIHN0aWxsOgo+ID4K
PiA+ICAgICBGcm9tOiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Cj4gPgo+ID4g
Li4uIHdoaWNoIGdpdCB1c2VzIGFzIHRoZSBhdXRob3Igb2YgdGhlIHBhdGNoLgo+ID4KPiA+ID4g
SWYgeW91IHdhbnQgdG8gYWRkIFBldGVyCj4gPiA+IGFzIGEKPiA+ID4gY28tYXV0aG9yIHRoYXQg
aXMgbW9yZSB0aGFuIGZpbmUgYnkgbWUuCj4gPgo+ID4gSXQgaXMgbm90IGFib3V0IHdoYXQgSSB3
YW50LCBpdCBpcyBhYm91dCBrZWVwaW5nIGF1aHRvcnNoaXAgYW5kIFNvQiBpbgo+ID4gc3luYyBh
bmQgY29oZXJlbnQgd2l0aCB3aG8gYWN0dWFsbHkgZGlkIHdoYXQuCj4gPgo+ID4gU28gaWYgSSB1
bmRlcnN0YW5kIGNvcnJlY3RseTogeW91IGFyZSB0aGUgYXV0aG9yLCBzbyB5b3UgaGF2ZSB5b3Vy
IFNvQiwKPiA+IGFuZCBQZXRlciBpcyBhIGNvLWRldiBmb3IgY3JlZGl0cywgcmlnaHQ6IFllcy9O
byA/IDstKQpZZXMKPiA+Cj4gPiBJZiB5ZXMsIHRoZW4gY2FuIEkgZml4IHRoZSBhdXRob3JzaGlw
IGFuZCBhZGQgdGhlIENvLWRldmVsb3BlZC1ieSB0YWcKPiA+IGZvciBQZXRlcjogWWVzL05vPwo+
ID4KPiA+IElmIG5vIHRvIGVpdGhlciwgY2FuIHlvdSByZXNwaW4gYSBmaXhlZC11cCBwYXRjaCwg
cGxlYXNlPwo+ID4KPiBBZGFtCj4gPiBSZWdhcmRzLAo+ID4gWWFubiBFLiBNT1JJTi4KPiA+Cj4g
PiA+IEFkYW0gRHVza2V0dAo+ID4gPgo+ID4gPiBTZW5pb3IgRW1iZWRkZWQgU3lzdGVtcyBEZXZl
bG9wZXIKPiA+ID4KPiA+ID4gTS4gKzEyMDgtNTE1LTgxMDIKPiA+ID4KPiA+ID4gYWRhbS5kdXNr
ZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+ID4KPiA+ID4KPiA+ID4gQW1hcnVsYSBTb2x1dGlvbnMgQlYKPiA+
ID4KPiA+ID4gSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBOTAo+ID4g
Pgo+ID4gPiBULiArMzEgKDApODUgMTExIDkxNzAKPiA+ID4gaW5mb0BhbWFydWxhc29sdXRpb25z
LmNvbQo+ID4gPgo+ID4gPiB3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KPiA+ID4KPiA+ID4KPiA+
ID4KPiA+ID4gT24gTW9uLCBEZWMgMTgsIDIwMjMgYXQgMTA6MjLigK9BTSBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiA+ID4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gQWRh
bSwgUGV0ZXIsIEFsbCwKPiA+ID4gPgo+ID4gPiA+IE9uIDIwMjMtMTEtMDIgMTI6NDEgLTA2MDAs
IEFkYW0gRHVza2V0dCBzcGFrZSB0aHVzbHk6Cj4gPiA+ID4gPiBGcm9tOiBQZXRlciBTZWlkZXJl
ciA8cHMucmVwb3J0QGdteC5uZXQ+Cj4gPiA+ID4KPiA+ID4gPiBTbywgdGhpcyBwYXRjaCBpcyAi
RnJvbSBQZXRlciIsIGJ1dC4uLgo+ID4gPiA+Cj4gPiA+ID4gPiBTeXN0ZW1kIGNyZWF0ZXMgYSAv
ZXRjL2xvY2FsZS5jb25mIGZpbGUgd2l0aCBMQU5HPSJDLlVURi04Ii4gT24gYm9vdCwKPiA+ID4g
PiBzeXN0ZW1kCj4gPiA+ID4gPiByZWFkcyAvZXRjL2xvY2FsZS5jb25mIGFuZCBzZXRzIHRoZSBM
QU5HIGVudmlyb25tZW50IHZhcmlhYmxlLAo+ID4gPiA+ID4gKHNlZSB0aGUgbG9jYWxlX2NvbnRl
eHRfbG9hZF9jb25mIG1ldGhvZCBpbiBsb2NhbC1zZXR1cC5jLikKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBXaGVuIGluaXRkYi5jIGlzIGNhbGxlZCwgYSBjaGVjayBmb3IgdGhlIExBTkcgZW52aXJvbm1l
bnQgdmFyaWFibGUgaXMKPiA+ID4gPiBjYWxsZWQsCj4gPiA+ID4gPiBhbmQgaWYgaXQgaXMgc2V0
IHRvIHNvbWV0aGluZyBvdGhlciB0aGFuICJDIiBpbml0ZGIgYXR0ZW1wdHMgdG8gbG9hZCB0aGUK
PiA+ID4gPiA+IGNvcnJlc3BvbmRpbmcgTENfQ1RZUEUgZmlsZSBpbiAvdXNyL2xpYi9sb2NhbGUv
LiBJRTogSWYgTEFORyBpcyBzZXQgdG8KPiA+ID4gPiBDLlVURi04LAo+ID4gPiA+ID4gdGhlbiBp
bml0ZGIuYyBhdHRlbXB0cyB0byBsb2FkIC91c3IvbGliL2xvY2FsZS9DLlVURi04L0xDX0NUWVBF
Lgo+ID4gPiA+IEhvd2V2ZXIsIHRoZXNlCj4gPiA+ID4gPiBmaWxlcyBkbyBub3QgZXhpc3Qgb24g
YSBCdWlsZHJvb3Qgc3lzdGVtLCBhbmQgYXMgc3VjaCwgaW5pdGRiIHRocm93cyB0aGUKPiA+ID4g
PiA+IGZvbGxvd2luZyBlcnJvciBvbiBzdGFydHVwOgo+ID4gPiA+ID4KPiA+ID4gPiA+IGBgYAo+
ID4gPiA+ID4gaW5pdGRiOiBlcnJvcjogaW52YWxpZCBsb2NhbGUgc2V0dGluZ3M7IGNoZWNrIExB
TkcgYW5kIExDXyogZW52aXJvbm1lbnQKPiA+ID4gPiB2YXJpYWJsZXMKPiA+ID4gPiA+IHBnX2N0
bDogZGF0YWJhc2Ugc3lzdGVtIGluaXRpYWxpemF0aW9uIGZhaWxlZAo+ID4gPiA+ID4gYGBgCj4g
PiA+ID4gPgo+ID4gPiA+ID4gVG8gZml4IHRoaXMgaXNzdWUsIGFkZCAiRW52aXJvbm1lbnQ9TEFO
Rz1DIiB0byB0aGUgcGFja2FnZSBwcm92aWRlZAo+ID4gPiA+ID4gcG9zdGdyZXNxbC5zZXJ2aWNl
IGZpbGUgdG8gZm9yY2UgUG9zdGdyZXNxbCB0byB1c2UgdGhlIEMgbG9jYWxlLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IFRlc3RlZC1ieTogQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVsYXNv
bHV0aW9ucy5jb20+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0u
ZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+ID4gPgo+ID4gPiA+IC4uLiB0aGUgZmly
c3QgU29CIGlzIGJ5IEFkYW0sIGFuZCB0aGVyZSBpcyBubyBTb0IgYmUgUGV0ZXIuCj4gPiA+ID4K
PiA+ID4gPiBJbiB0aGlzIGNhc2UsIEkgdGhpbmsgSSB1bmRlcnN0YW5kIHRoYXQgQWRhbSB0b29r
IFBldGVyJ3MgcGF0Y2gsIGFuZAo+ID4gPiA+IHRvdGFsbHkgcmV3cm90ZSBpdCB3aXRoIGFuIGFs
dGVybmF0ZSBzb2x1dGlvbi4gSW4gc3VjaCBhIGNhc2UsIHRoZQo+ID4gPiA+IGN1c3RvbXMgaXMg
dG8gY2hhbmdlIHRoZSBhdXRob3JzaGlwIHRvIHRoZSBuZXcgYXV0aG9yLCBhbmQga2VlcCBhCj4g
PiA+ID4gQ28tZGV2ZWxvcGVkLWJ5IHRhZyB0byBrZWVwIGNyZWRpdHMgdG8gdGhlIGZpcnN0IGF1
dGhvci4KPiA+ID4gPgo+ID4gPiA+IFNvLCBpZiB5b3UgY2FuIGp1c3QgcmVwbHkgdG8gdGhpcyBt
YWlsIHN0YXRpbmcgSSBnb3QgdGhpbmdzIHJpZ2h0LCBJIGNhbgo+ID4gPiA+IGZpeCBhdXRob3Jz
aGlwIGFuZCB0YWdzIHdoZW4gYXBwbHlpbmcuIElmIEkgZ290IHRoaW5ncyB3cm9uZywgdGhlbgo+
ID4gPiA+IHBsZWFzZSByZXN1Ym1pdCB3aXRoIHByb3BlciB0YWdzIGFuZC9vciBhdXRob3JzaGlw
Lgo+ID4gPiA+Cj4gPiA+ID4gQWxzbywgaXQgZG9lcyBub3QgbWFrZSBtdWNoIHNlbnNlIHRoYXQg
dGhlIHN1Ym1pdHRlciBvZiBhIHBhdGNoIGFkZHMKPiA+ID4gPiB0aGVpciBvd24gVGVzdGVkLUJ5
IHRhZywgYXMgaXQgaXMgYWN0dWFsbHkgZXhwZWN0ZWQgdGhhdCB0aGUgc3VibWl0dGVyCj4gPiA+
ID4gZGlkIHRlc3Qgd2hhdCB0aGV5IHNlbnQuLi4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcyEgOi0p
Cj4gPiA+ID4KPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+IFlhbm4gRS4gTU9SSU4uCj4gPiA+ID4K
PiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gdjEgLT4gdjI6Cj4gPiA+ID4gPiAgIC0gR2V0IHRvIHRo
ZSByb290IGNhdXNlIG9mIHRoZSBwcm9ibGVtIGFuZCBwcm92aWRlIGEgYmV0dGVyCj4gPiA+ID4g
ZXhwbGluYXRpb24gb2YKPiA+ID4gPiA+ICAgICB3aGF0IGlzIGhhcHBlbmluZy4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiAgIC0gVXNlIEVudmlyb25tZW50PUxBTkc9QyBpc250ZWFkIG9mIC1vIC0tbG9j
YWxlPUMKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwu
c2VydmljZSB8IDQgKysrKwo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bv
c3RncmVzcWwuc2VydmljZQo+ID4gPiA+IGIvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwu
c2VydmljZQo+ID4gPiA+ID4gaW5kZXggNTM5ZWVhODk2NC4uYzQ3MGM3MTgxZSAxMDA2NDQKPiA+
ID4gPiA+IC0tLSBhL3BhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLnNlcnZpY2UKPiA+ID4g
PiA+ICsrKyBiL3BhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLnNlcnZpY2UKPiA+ID4gPiA+
IEBAIC0xNiw2ICsxNiwxMCBAQCBTdGFuZGFyZE91dHB1dD1zeXNsb2cKPiA+ID4gPiA+ICBTdGFu
ZGFyZEVycm9yPXN5c2xvZwo+ID4gPiA+ID4gIFN5c2xvZ0lkZW50aWZpZXI9cG9zdGdyZXMKPiA+
ID4gPiA+Cj4gPiA+ID4gPiArIyBPdmVyd3JpdGUgdGhlIExBTkcgdmFyaWFibGUgdG8gcHJldmVu
dCBzeXN0ZW1kIGZyb20gcGFzc2luZyB0aGUgTEFORwo+ID4gPiA+ID4gKyMgZW52aXJvbm1lbnQg
dmFyaWFibGUgc2V0IGluIC9ldGMvbG9jYWxlLmNvbmYuCj4gPiA+ID4gPiArRW52aXJvbm1lbnQ9
TEFORz1DCj4gPiA+ID4gPiArCj4gPiA+ID4gPiAgRXhlY1N0YXJ0UHJlPS9iaW4vc2ggLWMgImlm
IFsgISAtZiAvdmFyL2xpYi9wZ3NxbC9QR19WRVJTSU9OIF07IHRoZW4KPiA+ID4gPiAvdXNyL2Jp
bi9wZ19jdGwgaW5pdGRiIC1EIC92YXIvbGliL3Bnc3FsOyBmaSIKPiA+ID4gPiA+ICBFeGVjU3Rh
cnQ9L3Vzci9iaW4vcG9zdGdyZXMgLUQgL3Zhci9saWIvcGdzcWwKPiA+ID4gPiA+ICBFeGVjUmVs
b2FkPS91c3IvYmluL2tpbGwgLUhVUCAkTUFJTlBJRAo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIu
NDEuMAo+ID4gPiA+ID4KPiA+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gPiA+ID4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiA+ID4g
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gPiA+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPiA+ID4KPiA+ID4gPiAtLQo+ID4g
PiA+Cj4gPiA+ID4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiA+ID4gPiB8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycKPiA+
ID4gPiBjb25zcGlyYWN5OiB8Cj4gPiA+ID4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXwo+ID4gPiA+ICAgICAgfAo+ID4gPiA+
IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzCj4gPiA+ID4gbm8gIHwKPiA+ID4gPiB8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYKPiA+ID4gPiAg
Y29uc3BpcmFjeS4gIHwKPiA+ID4gPgo+ID4gPiA+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCj4g
PiA+ID4KPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+ID4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cj4gPgo+ID4KPiA+IC0tCj4gPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+
ID4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiA+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4g
PiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAg
ICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+ID4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5v
cmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiA+
ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
