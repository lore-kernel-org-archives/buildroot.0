Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCA8C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75CB7607B5;
	Tue,  1 Feb 2022 22:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9AxH1kX9V6a; Tue,  1 Feb 2022 22:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA701607A3;
	Tue,  1 Feb 2022 22:08:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D36E1BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFC0F83027
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xc9FLvcIy425 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:06:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FAC482EF1
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:06:34 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id q8so21672542oiw.7
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/RXdYFnJMYC1HQWTPpBbGu4+smVr591SRJfnjIysNPk=;
 b=bGdOTNbLz+3u7ahTp2Qbp9rgNEMAkfQHP1QIybUEXu0D2udLI9blywz2kpmnCvQMMi
 9fZM+jPDqS3hRvfswflNLCAzmS9/W3viZUwKtvXSCPo0quOOF1bzr9H8SXGxPKmpf0Yp
 JSVdjjxfzC+XszIk08bkQKWA1GrHePhrD/yzEm1V9/zHTSQE2RFddx5JRvmqMxNlgUjU
 PWdY0SRFNHK4B/V2bK7JG6uCJM90go2lGUUlAqpLQO0PynMvpYwki67zs7QMdghr3esZ
 etvpjVJsafEtOX/j+1llthW8cA5/h58+Ej163mdnrOpL7sD5USd6EqU94JRoa7hwbhbt
 izug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/RXdYFnJMYC1HQWTPpBbGu4+smVr591SRJfnjIysNPk=;
 b=deQHJPSFdQYQdIHMG1z7zzRsm5vCuGcGjX5MnXa/ZEKvvAhIHbfz44qionzhKgpuOJ
 oVmVVJw0JXyhirtQSo+t1pKzcml/FFTuGTG+uC905QOkI6JoEwX+Q+O8AeMl+oAY9ZSq
 n3iDJ66Ba+Arw3yMQqOeOOpSw1PkfvqtwTWtZNxl2Q3Qcjb6g7ozYavYBMFr1JOYKhc8
 TKHCiNmh9OKVeOdUQAXAFCefw0quQbjtnY52yx8tsw9fV4JocDPuxZ+791qLlBjgFYkg
 j9JnVyjidPiCgIVsRNKxjHM4w9W+2Wmoy7dZwzuZUZtyFs7rrIM250PW+aJYcDCUUU5h
 KSeQ==
X-Gm-Message-State: AOAM533eyheflspwuULvppMzzBuNgfz6W9j1Z9nwu3OLhXExhYFlHSFw
 Om3TgneB1TCHG1W2llhdUO2hXeWnuZ9VrGKnYIc=
X-Google-Smtp-Source: ABdhPJw3+J4BM3M4YFWN/vwcycCnfw92/anEgIwIP489aM9D92g8WUhDlTCz3TC4RGi7jsv22iLVl2QnAC07OBHwJuo=
X-Received: by 2002:a05:6808:11c5:: with SMTP id
 p5mr2559241oiv.270.1643753193996; 
 Tue, 01 Feb 2022 14:06:33 -0800 (PST)
MIME-Version: 1.0
References: <168006d0-d098-07e2-7203-489d7573a3ec@mind.be>
 <CD04B430-5777-49D1-85BA-BB174708E3C8@benettiengineering.com>
In-Reply-To: <CD04B430-5777-49D1-85BA-BB174708E3C8@benettiengineering.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 1 Feb 2022 23:04:29 +0100
Message-ID: <CAPi7W831GohPjgdCFNWN=R+pY8ViVS70EqgRjLBJc9KJUYihog@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/efl: fix build failure with eeze
 disabled
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSBtYXIuIDEgZsOpdnIuIDIwMjIgw6AgMjM6MDIsIEdpdWxpbyBCZW5ldHRpCjxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBBcm5v
dXQsCj4KPiA+IElsIGdpb3JubyAxIGZlYiAyMDIyLCBhbGxlIG9yZSAyMjo1MywgQXJub3V0IFZh
bmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiBoYSBzY3JpdHRvOgo+ID4KPiA+IO+7vwo+ID4K
PiA+PiBPbiAyNC8wMS8yMDIyIDExOjA5LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiA+PiBFbHB1
dCBkZXBlbmRzIG9uIGVlemUsIHNvIGlmIHdlIGRpc2FibGUgZWV6ZSB3ZSBhbHNvIG5lZWQgdG8g
ZGlzYWJsZSBlbHB1dAo+ID4+IGJ5IHNldHRpbmcgdGhlIG9wdGlvbiAiaW5wdXQiIHRvIGZhbHNl
Lgo+ID4+IEZpeGVzOgo+ID4+IGh0dHBzOi8vYnVncy5idXN5Ym94Lm5ldC9zaG93X2J1Zy5jZ2k/
aWQ9MTQ1MzEKPiA+Cj4gPiBUaGVyZSBhcmUgdHdvIG90aGVyIHBhdGNoZXMgdGhhdCBzb21laG93
IGRlYWwgd2l0aCB0aGlzIGlzc3VlIFsxXVsyXSBpbiBhZGRpdGlvbiB0byB0aGlzIG9uZSBbM10u
Cj4gPgo+ID4gQ291bGQgc29tZW9uZSBjaG9vc2UgYmV0d2VlbiB0aGUgYW5kIG1hcmsgdGhlIHJl
c3QgYXMgU3VwZXJzZWRlZCBpbiBwYXRjaHdvcms/Cj4KPiBGYWJyaWNlIGNvbW1lbnRlZCBvbiBt
aW5lIHRoYXQgbWluZSB3YXMgYmV0dGVyLgo+IFRoZW4gdGhlIFJvbWFpbiBvbmUgY2FtZSBvdXQg
ZmV3IGRheXMgYWdvIGFuZCBJIGNhbiB0ZWxsIGhpcyBvbmUgaXMgYmV0dGVyLgo+Cj4gU28gSSB3
b3VsZCBnbyBmb3IgdGhlIFJvbWFpbiBwYXRjaC4KPgo+IEkgc2V0IG1pbmUgYXMgc3VwZXJzZWRl
ZCBhbmQgRmFicmljZSBjYW4gZG8gdGhlIGJlZm9yZS4KSSBhbHNvIHNldCBtaW5lIGFzIHN1cGVy
c2VkZWQuCj4KPiBCZXN0IHJlZ2FyZHMKPiBHaXVsaW8KPgo+ID4KPiA+Cj4gPiBSZWdhcmRzLAo+
ID4gQXJub3V0Cj4gPgo+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyMTEyMzAyMjE5MDQuMzA2NDAyMi0xLWZvbnRhaW5lLmZhYnJp
Y2VAZ21haWwuY29tLwo+ID4gWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyMjAxMjkyMjQ2NTEuMTI4MjI2My00LXJvbWFpbi5uYW91ckBn
bWFpbC5jb20vCj4gPiBbM10gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1
aWxkcm9vdC9wYXRjaC8yMDIyMDEyNDEwMDkyMC4zMDA1NTY0LTEtZ2l1bGlvLmJlbmV0dGlAYmVu
ZXR0aWVuZ2luZWVyaW5nLmNvbS8KPiA+Cj4gPgo+ID4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBC
ZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+ID4+IC0tLQo+
ID4+ICBwYWNrYWdlL2VmbC9lZmwubWsgfCAyICsrCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPiA+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9lZmwvZWZsLm1rIGIvcGFja2Fn
ZS9lZmwvZWZsLm1rCj4gPj4gaW5kZXggZWQwYThhY2MxZC4uYzkzOTYxNDc1ZCAxMDA2NDQKPiA+
PiAtLS0gYS9wYWNrYWdlL2VmbC9lZmwubWsKPiA+PiArKysgYi9wYWNrYWdlL2VmbC9lZmwubWsK
PiA+PiBAQCAtNjUsNiArNjUsOCBAQCBFRkxfREVQRU5ERU5DSUVTICs9IHVkZXYKPiA+PiAgRUZM
X0NPTkZfT1BUUyArPSAtRGVlemU9dHJ1ZQo+ID4+ICBlbHNlCj4gPj4gIEVGTF9DT05GX09QVFMg
Kz0gLURlZXplPWZhbHNlCj4gPj4gKyMgaW5wdXQoZWxwdXQpIHJlcXVpcmVzIGVlemUsIHNvIGRp
c2FibGUgaXQgYWNjb3JkaW5nbHkKPiA+PiArRUZMX0NPTkZfT1BUUyArPSAtRGlucHV0PWZhbHNl
Cj4gPj4gIGVuZGlmCj4gPj4gICAgaWZlcSAoJChCUjJfUEFDS0FHRV9FRkxfVVRJTF9MSU5VWF9M
SUJNT1VOVCkseSkKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cj4KQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
