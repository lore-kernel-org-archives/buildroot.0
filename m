Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74254C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BAFF411F4;
	Fri, 10 Dec 2021 14:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efX9WkJxSfrD; Fri, 10 Dec 2021 14:18:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DD99411F6;
	Fri, 10 Dec 2021 14:18:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A42441BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 923966143E
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fzq3Ucsp_u5i for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:18:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2185660A97
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:18:19 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id e3so30907784edu.4
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 06:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cgpod9TRLySPKVfP3PU8emG2kIso7XcgwHFNv6iIHkk=;
 b=Mto/W9Hm+OD45xajhkhXqwLC8lTJ7YG+SeAH3Xt4ZIadUxS6hxNLtvhzik0cuepQp/
 KIqlkeLr6qRVPk9icMx5na1HgoCwks3hBBpwlnJI0hnrrq35M3iFSA7RBKpZ46BDnX2J
 vfSwepT44u/zGuKbpfMvR8kNnC3/9Y0KEroVY0q4y45JJzdTrmdpnKjUqQMw2UyYJmS8
 rOkoSPPLtQ7RQaxH7MRW88uebys0ElduazqzC+vZwThC7noePtH180Ty9JSE1wdfbCp5
 kRGsbK1RRad4k+scxaQKFlKiPtSk6Q0aO/7R312P+laStakHprR3Mop50dpEuhIAp/xD
 /bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cgpod9TRLySPKVfP3PU8emG2kIso7XcgwHFNv6iIHkk=;
 b=AUUynVYm0ufHdBAx4bn5bNp/EsF5wfB55ysr98U2Jp/qNXL6b+vbAQaPli/5490av5
 aXGZzeEwUVqKeu/gr5AI7hP09xsGWLgJSowG4R0UXEa2ojerAiIMmidAfzdoiC04D+Kf
 hk+AWQGPdAKdBZqZYSJFe2oY4edGKtUFAi1NM4c+1vNv+rjBPb5iA8hBp+m+JGg1l0uC
 x2DvARCrS7sMHknKAj03GPMFAgF1Fb4iyP3tE8FgAXhV+5RpcsrVWsL4LGzsY1WgKFTW
 shO77m7M2jarEGfZR1Km6QAW7pbp8PyhZD2vM7tGjCL8r81y6GihZjvcQUCivNbbXNxp
 MwGw==
X-Gm-Message-State: AOAM533XSDFK4dqnkwJO/VcaK2Pqp1vaXZ5Ub1tQOrnA0Wnej5Ho+b88
 QIJCX8aWyzs+SfwIXIRdGYyia7DSHgCH05ctOeqO+w==
X-Google-Smtp-Source: ABdhPJzo/wFapV+sWNbqWJ3fILfYydZL4CMQCUE5hcC7r6TwBwDdL0jScw6ncRuXAentHwM9CLCEB+XwHCBmCe6oVMo=
X-Received: by 2002:a17:907:7b98:: with SMTP id
 ne24mr25785389ejc.14.1639145897363; 
 Fri, 10 Dec 2021 06:18:17 -0800 (PST)
MIME-Version: 1.0
References: <CAJPV9Mpjwh+_H7vVKjqcQcROrw+daU+jW+d=n0Dw5Dev-E2DVQ@mail.gmail.com>
 <6A91F3BC-692E-43F9-98DA-24A98044F162@benettiengineering.com>
In-Reply-To: <6A91F3BC-692E-43F9-98DA-24A98044F162@benettiengineering.com>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Fri, 10 Dec 2021 16:18:06 +0200
Message-ID: <CAJPV9MqFywG7hqry3R3OkqORgBp5vDCsS1S_iuUfU+mgw6NCww@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/3] package/opensc: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBEZWMgMTAsIDIwMjEgYXQgNDoxMCBQTSBHaXVsaW8gQmVuZXR0aQo8Z2l1bGlvLmJl
bmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4KPiBIaSBKb3PDqSwKPgo+IEls
IGdpb3JubyAxMCBkaWMgMjAyMSwgYWxsZSBvcmUgMTI6MDMsIEpvc8OpIFBla2thcmluZW4gPGpv
c2UucGVra2FyaW5lbkB1bmlraWUuY29tPiBoYSBzY3JpdHRvOgo+Cj4g77u/Cj4KPgo+IE9uIEZy
aSwgRGVjIDEwLCAyMDIxIGF0IDEyOjI5IFBNIEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0
aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPj4KPj4gSGkgSm9zw6ksCj4+Cj4+IHBs
ZWFzZSB1c2UgcGxhaW4tdGV4dCwKPgo+Cj4gU29ycnksIGdvb2dsZSB0aGluZ3ksIG5vdCBzdXJl
IEkgY2FuIGZpeCBpdCA6XAo+Cj4KPiBVc2UgYW4gZS1tYWlsIGNsaWVudCB3aGVyZSB5b3UgY2Fu
IHNldCBzdWNoIHNldHRpbmcuIEnigJltIG9uIG1vYmlsZSBub3cgYW5kIG1heWJlIG15IGFuc3dl
ciB3aWxsIGJlIGEgaHRtbC4gSXQgaGFwcGVucyBzb21ldGltZXMuCj4KPgo+Pgo+PiBPbiAxMC8x
Mi8yMSAwNzoyMCwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPj4gPgo+PiA+ICAgICBIaSwKPj4g
Pgo+PiA+ICAgICBBbnkgY29tbWVudHMgaW4gdGhlIGZvbGxvd2luZyBwYXRjaHNldD8KPj4gPgo+
PiA+ICAgICBUaGFua3MhCj4+ID4KPj4gPiAgICAgSm9zw6kKPj4gPgo+PiA+Cj4+ID4gT24gRnJp
LCBEZWMgMywgMjAyMSBhdCAxMDozNyBBTSBKb3PDqSBQZWtrYXJpbmVuCj4+Cj4+IE9ubHkgMSB3
ZWVrIGhhcyBwYXNzZWQsIGJhY2tsb2cgaXMgcHJldHR5IGJpZyg0NzggcGF0Y2hlcyBhdCB0aGUg
bW9tZW50KQo+Cj4KPiBTb3JyeSwgSSB3YXMgZm9sbG93aW5nIGxpbnV4IGtlcm5lbCBndWlkYW5j
ZXMKPgo+IG9mIHRoZSBydWxlIG9mIDF3LCBJJ2xsIGJlIG1vcmUgcGF0aWVudCBuZXh0IHRpbWUu
Cj4KPgo+IEkgaG9uZXN0bHkgc2VudCBwYXRjaGVzIHRoYXQgc3RheWVkIHNpdHRpbmcgdGhlcmUg
Zm9yIGV2ZW4gbW9udGhzIGluIExpbnV4IE1MLiBJIGRvbuKAmXQga25vdyB0aGlzIHJ1bGUgb2Yg
dGhlIDEgd2VlaywgYnV0IG1heWJlIEnigJltIG5vdCBhd2FyZS4KPgo+Cj4+Cj4+ID4gPGpvc2Uu
cGVra2FyaW5lbkB1bmlraWUuY29tIDxtYWlsdG86am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+
PiB3cm90ZToKPj4gPgo+PiA+ICAgICBUaGUgcGF0Y2ggd2lsbCBhZGQgYSBiYXNpYyBvcGVuc2Mg
cGFja2FnZSB0byBidWlsZAo+PiA+ICAgICBvbiBidWlsZHJvb3QuCj4+Cj4+IFRoaXMgY29tbWl0
IGxvZyBpcyBub3Qgc3VmZmljaWVudC4gQ2FuIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sgYXQgb3Ro
ZXIKPj4gY29tbWl0IGxvZyBvbiB3aGlsZSBhZGRpbmcgYSAibmV3IHBhY2thZ2UiPyBUcnkgdG8g
aW1pdGF0ZSwgdGhhdCdzIGEKPj4gZ29vZCBzdGFydGluZyBwb2ludC4KPgo+Cj4gTW9zdCBJIHNl
ZSBoYXZlIGVtcHR5IGNvbW1lbnQuIE1pbmQgdG8gZWxhYm9yYXRlCj4KPiB3aGF0IGlzIG1pc3Np
bmc/Cj4KPgo+IFNvcnJ5LCBoZXJlIHRoZSBwcm9ibGVtIGlzIGhvdyB0aGUgY29tbWl0IGxvZyBp
cyB3cml0dGVuLiBQaWNrIG9uZSBvZiB0aGUgbGF0ZXN0IG5ldyBwYWNrYWdlIGFkZGluZyBhbmQg
aW1pdGF0ZSBpdC4KPgo+IFVzdWFsbHkgdGhlIGNvbW1pdCBsb2cgaXMgd3JpdHRlbiB3aXRoIHRo
ZSBpbmZpbml0ZSB2ZXJicy4gU28gc29tZXRoaW5nIGxpa2U6Cj4g4oCcVGhpcyBwYXRjaCBhZGRz
IG9wZW5zYyBwYWNrYWdl4oCdCj4KPiBhbmQgcHJvYmFibHkgdGhhdOKAmXMgZW5vdWdoLgo+IFlv
dSBkb27igJl0IG5lZWQgdG8gc3BlY2lmeSDigJx0byBidWlsZCBvbiBCdWlsZHJvb3TigJ0gYmVj
YXVzZSB0aGlzIHBhdGNoIHdpbGwgYmUgYXBwbGllZCB0byBpdCBzbyBpdOKAmXMgaW1wbGljaXQu
Cj4KPgo+PiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2th
cmluZW5AdW5pa2llLmNvbQo+PiA+ICAgICA8bWFpbHRvOmpvc2UucGVra2FyaW5lbkB1bmlraWUu
Y29tPj4KPj4KPj4gVGhpcyBeXl4gU29CIGhhcyBhIHN0cmFuZ2UgZm9ybWF0LCBob3cgZGlkIHlv
dSBwcm9kdWNlIHRoZSBwYXRjaD8KPj4gQWxzbyBob3cgZGlkIHlvdSBzZXQgdGhlIHVzZXIuZW1h
aWwgaW4gZ2l0Pwo+Cj4KPiBJdCBpcyBwcm9wZXJseSBzZXQsIHNvIGVpdGhlciBnaXQgc2VuZC1l
bWFpbCBvciBnb29nbGUgYWRkZWQKPgo+IHRoYXQgZXh0cmEgZmVhdXJlLgo+Cj4KPiBJIGRvbuKA
mXQgdGhpbmsgaXTigJlzIGdvb2dsZSBtYWlsIGNsaWVudCwgaXQgc2VlbXMgbGlrZSB5b3XigJl2
ZSBzZXR1cCB0aGUgdXNlci5lLW1haWwgd3JvbmcuCj4gVHJ5IHRvIGNoZWNrIHdpdGg6Cj4gIyBn
aXQgY29uZmlnIHVzZXIubWFpbAoKICAgIEhpLAoKICAgIEknbSBhZnJhaWQgaXQgaXMgZ29vZ2xl
LCBzZWUgaGVyZToKCiQgZ2l0IGNvbmZpZyB1c2VyLmVtYWlsCmpvc2UucGVra2FyaW5lbkB1bmlr
aWUuY29tCgogICAgTG9va3MgZmluZS4KCiAgICBCZXN0IHJlZ2FyZHMuCgogICAgSm9zw6kuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
