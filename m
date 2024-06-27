Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CED0C3064D
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 07:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A858E41A37;
	Thu, 27 Jun 2024 07:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9d_IuosVjLej; Thu, 27 Jun 2024 07:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCEFB40120
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCEFB40120;
	Thu, 27 Jun 2024 07:50:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 024DE1BF3D8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE9DD81F51
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVFEoZSEqXDw for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 07:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43F4081EE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43F4081EE0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43F4081EE0
 for <buildroot@busybox.net>; Thu, 27 Jun 2024 07:50:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.119]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOzOw-1rxUJm3Yaq-00OtNP; Thu, 27
 Jun 2024 09:50:30 +0200
Date: Thu, 27 Jun 2024 09:50:29 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240627095029.2d1fa5c0@gmx.net>
In-Reply-To: <ZnxsxFK_KDUDM652@landeda>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-5-ps.report@gmx.net>
 <ZnqUPBAcDbB7ND64@tl-lnx-nyma7486-2>
 <Znql0FCAPG8jP+Lx@tl-lnx-nyma7486-2>
 <20240626103623.7d7412c0@gmx.net> <ZnxsxFK_KDUDM652@landeda>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:PjnIUOgslRlCfCMQJbX9Ue8gkr80LVuIdqelY1pRyi6Kwe7wOUJ
 MPnI0SZr4+HDqLB6/WQte0uQLNqvDDpcNbJtqmAhv0gnkrmQ1LDl8jU7sdHiOFlIRG+fhhj
 f8RYt82G5GDgpqQrfkqjeffM8nN1eU6RCcCiVrnAdH9/bEkLDtAXvptdqnEBZ2FEqk/vuIb
 hceVs58NuxjgYNWqg3heA==
UI-OutboundReport: notjunk:1;M01:P0:04Yrab3ewY4=;rLeX2vRUDzJUDJns0IcT+PBPvAg
 EVVs5RmGBPcp/5KUpQwawo7qVLL0hKCGG+lfF51E+5YQSBROzfTHoT+tP/75ckqw4t7XvhLFf
 5ZKHQuZePEF/a7VvHbKoTEGsaPIOiRqfdG3W5Jaqka+wJFLcAWA89/cymdXrkzJZh0Z5zLyQO
 TarPIOOrdYm2doziIsKq8HSDcJNeO1FSw4XFdV0CQV4zJIEcYN4cKbOWj6dRzd3hj/f4Q+CNs
 I69amU/FguTKHWWmVhPlQRMr+DqUpL7O4rN8W7xps2ajdLWYVQjn3eFsC53peFgpZOTE4kPW0
 Ynnxn7dCoxOBi7tA5OZnKgUsiOK4RxhDHk+ukO7Qcyq+JG6LPnnmdL5K3+9FAPz3WB1BRIfh5
 rGt0VfEhMJ4CMO9wYacqXasH0aIMJ0W7ugj3eYS5hLd3GpA6BwJChwTNx9CpYzPnTZ5zIrBow
 r9ph4oEgJi+GY8kwDqSXE7pvBFS93d+GHOyizD9zf96z/AeViwdlOROeJn9SMA5ROy1SYuM7b
 hl4eaAmAycjFjmjNZlMMVJRWW5u94sXCYpeoPBqqteak5zhz4UhOZ/17vHkEUYZITVBH+TJ82
 4WiWDHMQ4kWe6mFvxTV0l/qAykb098W9+UFzVypmtB0k5XL4uDUT6UpvbKrXN6zc+KivOAkmb
 Qi/bE0yohdDc5b5GIWwfBPtfwTDX98eh3G59+gdgg8k4w74iB9sz1vTaCflKwrXhmMvzG0EJw
 CybIMRYBHIe0/I2P2bPAexz0OadRO+oFi+Y98HFiJhHznZG9Pa21ORFtbSaHjZ9R6xe89Wf8I
 KAkVFMPMcMQpVgVDdb17jY2ORU6R+P5f463Kv8IcJEHPg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719474631; x=1720079431; i=ps.report@gmx.net;
 bh=Qh7flk4KFn7vcIdnXZ6iIhhV+OZUlgMVNX06jQ3yibw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UgCQPDePY5tmJLuMXvp1ubCQD/S6FDbrH5R1MAqvz4ShKIaJbpd3AFG8bMTP1f48
 uCplzVIgiMIO350DRwW2XSpgrcS/dFdhFUUY8X9lpjJToJxLxGKWeRDQ4jpr/FoTz
 SFzpWk+SwF8yHqiurwBq1SADXcIP4njB7uj/jbtheaorMy2R1szaH+oX4Ao7eY1lJ
 BPMxW/sfMV/2KY1XIUEGDErIBgKC5CI4h+/Slgc6yBZzEAvfd+UlKTTgZUrwAV/gV
 DxRddgejJE4FOlt6U93Rb/utq2fD0oy2NByPQm1hGKGdFC8f+nQOJatY/ONN2BRz2
 PdU547p+EqlO/MPudw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=UgCQPDeP
Subject: Re: [Buildroot] [PATCH v2 5/5] package/xz: convert to cmake build
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net, yann.morin@orange.com,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCk9uIFdlZCwgMjYgSnVuIDIwMjQgMjE6MzI6MjAgKzAyMDAsICJZYW5uIEUu
IE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgoKPiBQZXRlciwgQWxsLAo+
IAo+IChUbyBhdm9pZCBjb25mdXNpb246IFlhbm5AaG9tZSBzcGVha2luZyBoZXJlKQo+IAo+IE9u
IDIwMjQtMDYtMjYgMTA6MzYgKzAyMDAsIFBldGVyIFNlaWRlcmVyIHZpYSBidWlsZHJvb3Qgc3Bh
a2UgdGh1c2x5Ogo+ID4gT24gVHVlLCAyNSBKdW4gMjAyNCAxMzoxMToxMiArMDIwMCwgeWFubi5t
b3JpbkBvcmFuZ2UuY29tIHdyb3RlOiAgCj4gPiA+IE9uIDIwMjQtMDYtMjUgMTE6NTYgKzAyMDAs
IE1PUklOIFlhbm4gSU5OT1YvSVQtUyBzcGFrZSB0aHVzbHk6ICAKPiA+ID4gPiBPbiAyMDI0LTA2
LTEyIDE1OjU3ICswMjAwLCBQZXRlciBTZWlkZXJlciB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNs
eTogIAo+ID4gPiA+ID4gQ29udmVydCB0byBjbWFrZSBidWlsZCB3aXRoIHRoZSBmb2xsb3dpbmcg
YXV0b2NvbmYgb3B0aW9ucyB3aXRob3V0Cj4gPiA+ID4gPiBkaXJlY3QgZXF1aXZhbGVudCBjbWFr
ZSBvcHRpb246ICAKPiA+ID4KPiA+ID4gVGhlIGF1dG90b29scyBidWlsZCBzeXN0ZW0gaXMgc3Rp
bGwgb3BlcmF0aW9uYWwsIGFuZCBzdGlsbCB3b3Jrcy4gU28sCj4gPiA+IHdoYXQgd2FzIHRoZSBy
YXRpb25hbGUgYmVoaW5kIHRoYXQgY2hhbmdlPwo+ID4gPgo+ID4gPiBXYXMgdGhhdCBhIGRlZmVu
Y2UgYWdhaW5zdCBhbm90aGVyIGJhY2tkb29yaW5nIGF0dGVtcHQ/IElmIHNvLCBJIHRoaW5rCj4g
PiA+IGl0IHNob3VsZCBoYXZlIGJlZW4gc3RhdGVkIGNsZWFybHkgaW4gdGhlIGNvbW1pdCBsb2cu
IEFsc28sIHdlIGNhbiBiZSBhcwo+ID4gPiBwYXJhbm9pZCBhcyB3ZSB3YW50LCBidXQgaXQgaXMg
cG9zc2libGUgdG8gaW5qZWN0IGEgc2ltaWxhciBiYWNrZG9vcgo+ID4gPiBpbiBjbWFrZSBhcyB3
YXMgaW5qZWN0ZWQgaW4gYXV0b3Rvb2xzLCBzbyBzd2l0Y2hpbmcgdG8gY21ha2UganVzdCBmb3IK
PiA+ID4gdGhpcyByZWFzb24gaXMgbm90IHJhbGx5IHN1ZmZpY2llbnQuLi4gIAo+ID4gCj4gPiBO
bywgYXMgdGhlIGZpcnN0IHN1Z2dlc3Rpb24gKFsxXSwgbWFya2VkIGFzIFJGQyAtIG1pc3NlZCB0
aGUgUkZDIG1hcmtpbmcgaW4KPiA+IHBhdGNoIHNldCB2ZXJzaW9uIHYyKSBwcmVkYXRlcyB0aGUg
YmFja2Rvb3IgZGV0ZWN0aW9uIChidXQgbWlncmF0aW5nIGF3YXkgZnJvbQo+ID4gYXV0b2NvbmYv
YXV0b21ha2Ugd2FzIGRpc2N1c3NlcyBhcyBvbmUgbWVhc3VyZSBmb3IgYmFja2Rvb3IgYXZvaWRh
bmNlKSwKPiA+IG15IG1vdGl2YXRpb24gd2FzIHRoZSBmb2xsb3dpbmcgcGFzc2FnZSBmcm9tIHRo
ZSBORVdTIGZpbGUgKFsyXSk6Cj4gPiAKPiA+ICAgICAgICAgLSBUaGUgQ01ha2UtYmFzZWQgYnVp
bGQgaXMgbm93IGNsb3NlIHRvIGZlYXR1cmUgcGFyaXR5IHdpdGggdGhlCj4gPiAgICAgICAgICAg
QXV0b3Rvb2xzLWJhc2VkIGJ1aWxkLiBNb3N0IGltcG9ydGFudGx5IGEgZmV3IHRlc3RzIGFyZW4n
dAo+ID4gICAgICAgICAgIHJ1biB5ZXQuIFRlc3RpbmcgdGhlIENNYWtlLWJhc2VkIGJ1aWxkIG9u
IGRpZmZlcmVudCBvcGVyYXRpbmcKPiA+ICAgICAgICAgICBzeXN0ZW1zIHdvdWxkIGJlIHdlbGNv
bWUgbm93LiBTZWUgdGhlIGNvbW1lbnQgYXQgdGhlIHRvcCBvZgo+ID4gICAgICAgICAgIENNYWtl
TGlzdHMudHh0Lgo+ID4gCj4gPiBBbmQgdGhlIGFtb3VudCBvZiB3b3JrIGRvbmUgZm9yIHRoZSBj
bWFrZSBidWlsZCBzeXN0ZW0gc2VlbXMgdG8gaGludAo+ID4gdGhhdCB4eiBpcyBtb3ZpbmcgYXdh
eSBmcm9tIGF1dG9jb25mL2F1dG9tYWtlIHRvd2FyZHMgdGhlIGNtYWtlIHN5c3RlbS4uLiAgCj4g
Cj4gTm90ZSB0aGF0IHRoZXJlIGlzIGFsc28gc29tZSBlZmZvcnQgdG93YXJkIGEgbWVzb24tYmFz
ZWQgYnVpbGRzeXN0ZW06Cj4gICAgIGh0dHBzOi8vZ2l0aHViLmNvbS90dWthYW5pLXByb2plY3Qv
eHovcHVsbC8xMjAKPiAKPiA+ID4gTm90ZTogdGhlIGlzc3VlIEkgaGl0IGNhbiBiZSBzb2x2ZWQg
YnkgcGFzc2luZyBFTkFCTEVfTkxTPU9GRiBpbiB0aGUKPiA+ID4gaG9zdCB2YXJpYW50OyB3ZSBk
b24ndCByZWFsbHkgcmVxdWlyZSB0cmFuc2xhdGlvbnMsIHNvIHdlIGNhbgo+ID4gPiB1bmNvbmRp
dGlvbmFsbHkgdHVybiBpdCBvZmYuICAKPiA+IAo+ID4gU2VlbXMgbXkgaW50ZXJtZWRpYXRlIHN0
ZXAgZnJvbSAncGFja2FnZS94ejogZGV0ZXJtaW5lIGFsbCBhdXRvY29uZiBvcHRpb25zJwo+ID4g
YW5kICctLWVuYWJsZS1ubHMnIHVuY29uZGl0aW9uYWxseSBmb3IgdGhlIGhvc3QgdmFyaWFudCB3
YXMgd3JvbmcuLi4sICAKPiAKPiBBbHNvLCBmb3JjaWJseSBzZXR0aW5nIEJVSUxEX1NIQVJFRF9M
SUJTPU9GRiBmb3IgdGhlIHRhcmdldCBpcyBwcm9iYWJseQo+IHdyb25nLiBBbmQgdXNpbmcgdGhl
IHRhcmdldCBvcHRpb25zIGZvciB0aGUgaG9zdCBpcyBlcXVpdmFsZW50bHkgdmVyeQo+IHdyb25n
Lgo+IAo+ID4gY2FyZSB0byBzZW5kIGEgcGF0Y2ggKGFzIHlvdSBjYW4gcmVwcm9kdWNlIHRoZSBm
YWlsdXJlKT8gIAo+IAo+IFlhbm5Ad29yayBwcm92aWRlZCBhIHZlcnkgc2lucGxlIHdheSB0byBy
ZXByb2R1Y2UgdGhlIGlzc3VlOgo+IAo+ICAgICAkIC4vdXRpbHMvZG9ja2VyLXJ1bgo+ICAgICAo
ZG9ja2VyKSAkIG1ha2UgZGVmY29uZmlnCj4gICAgIChkb2NrZXIpICQgbWFrZSBob3N0LXh6CgpV
cHMsIHNlZW1zIEkgd2FzIHRvIHF1aWNrIHJlYWRpbmcgeW91ciBmaXJzdCBlLW1haWwgKGFuZCBz
a2lwcGVkCnRoaXMgbGluZXMpLi4uCgo+IAo+IFNvIHlvdSBjb3VsZCBhdCBsZWFzdCB0cnkgdGhh
dCB0byByZXByb2R1Y2Ugb24geW91ciBzaWRlLgoKRmFpbHMgb24gbXkgc2lkZSAodXNpbmcgcG9k
bWFuIGludGVhZCBvZiBkb2NrZXIpOgoKCT4+PiBob3N0LXBrZ2NvbmYgMS42LjMgRG93bmxvYWRp
bmcKCW1rZGlyOiBjYW5ub3QgY3JlYXRlIGRpcmVjdG9yeSDigJgvcGtnY29uZuKAmTogUGVybWlz
c2lvbiBkZW5pZWQKCj4gCj4gSGUgYWxzbyBwcm92aWRlZCBhIHN1Z2dlc3Rpb24gdG8gdHVybiBO
TFM9T0ZGLCBidXQgdGhhdCB3YXMgc3Vwb3NlZGx5Cj4gbm90IG5lZWRlZCBpbiB5b3VyIGNhc2Us
IHNvIHRoZXJlIGlzIHNvbWV0aGluZyB0byBpbnZlc3RpZ2F0ZS4KPiAKPiBXaGVuIG1haW50YWlu
ZXJzIGFwcGx5IHBhdGNoZXMsIHRoZXkgYWNjZXB0IHRoYXQgaXQgbWF5IGJyZWFrIHNvbWV0aGlu
Zwo+IGRvd24gdGhlIGxpbmUsIHNvIGl0IGlzIG5vdCBhIHByb2JsZW0gdGhhdCBhIHBhdGNoIGhh
ZCBpc3N1ZXM7IHRoZXkKPiBndWVzcyB0aGUgY29udHJpYnV0b3IgdGVzdGVkIGFzIGJlc3QgYXMg
dGhleSBjb3VsZCwgYW5kIHRoZQo+IHJldmlld2VyLWNvbW1pdHRlciBkbyB0aGVpciBiZXN0IGFz
IHdlbGwsIHNvIGl0IHdhcyBnb29kIHRvIGJlIGFwcGxpZWQuCj4gCj4gSG93ZXZlciwgd2hlbiBt
YWludGFpbmVycyBhcHBseSBwYXRjaGVzLCB0aGV5IGFsc28gZXhwZWN0IGNvbnRyaWJ1dG9ycwo+
IHRvIG93biB0aGVpciBjaGFuZ2VzLCBhbmQgdGhhdCB0aGV5IGFyZSBwcm8tYWN0aXZlIGluIHRy
eWluZyB0byBmaXgKPiB0aGVpciBjaGFuZ2UgdGhhdCBjYXVzZWQgdGhlIGJyZWFrYWdlLCB3aXRo
b3V0IHN3aW5naW5nIHRoZSBlZmZvcnQgdG8KPiBzb21lb25lIGVsc2Ugd2l0aG91dCBhdCBsZWFz
dCB0cnlpbmcgdG8gcmVwcm9kdWNlIGFuZCBpbnZlc3RpZ2F0ZSBvbgo+IHRoZWlyIHNpZGUuIEFm
dGVyIGFsbCwgdGhlIGNvbnRyaWJ1dG9yIGlzIGluIHRoZSBiZXN0IHBvc2l0aW9uIHRvCj4gaW52
ZXN0aWdhdGU6IHRoZXkga25vdyB0aGUgcHVycG9zZSBvZiB0aGUgY2hhbmdlLCBhbmQgdGhleSBo
YXZlIHRoZQo+IGtub3dsZWRnZSBvZiB0aGUgdGVzdHMgdGhleSBkaWQsIHNvIHRoZXkga25vdyB3
aGVyZSB0byBsb29rIGF0Lgo+IAo+IElmIG1haW50YWluZXJzIGNhbid0IHJlbHkgb24gdGhhdCBl
eHBlY3RhdGlvbiwgdGhlbiB0aGV5IGNhbiBnZXQgdmVyeQo+IGNoaWxseSBhYm91dCBhcHBseWlu
ZyBwYXRjaGVzIGFzIHRoZXkga25vdyBhbnkgYnJlYWthZ2UgbWlnaHQgbm90IGJlCj4gYWN0ZWQg
dXBvbiwgYW5kIHRoYXQgdGhlIGJ1cmRlbiBvZiBmaXhpbmcgaXQgd2lsbCBwaWxlIHVwb24gdGhl
bSB0bwo+IGluY3JlYXNlIHRoZSBleGlzdGluZyBsb2FkLi4uCj4gCj4gQWdhaW4sIGl0IGlzIG5v
dCBhIHByb2JsZW0gdGhhdCB0aGUgcGF0Y2ggYnJva2Ugc29tZXRoaW5nOyB3aXRob3V0Cj4gdHJ5
aW5nLCB3ZSBjYW4ga25vdy4gVGhlcmUgaXMgYWJzb2x1dGVseSBubyBibGFtZSBvbiB5b3UgYXQg
YWxsIGZvciB0aGF0Cj4gcGF0Y2ghIFdlIGFyZSB2ZXJ5IGhhcHB5IGZvciB5b3VyIGNvbnRyaWJ1
dGlvbnMhIDotKQo+IAo+IFN0aWxsLCB0aGlzIGNhcmVsZXNzbmVzcyBpbiBoYW5kbGluZyBhIGJy
ZWFrYWdlIGlzIGEgYml0IGRpc2Fwb2ludGluZy4uLgo+IAo+IEFueXdheSwgSSBoYXZlIG5vdyBy
ZXZlcnRlZCB0aGF0IHBhdGNoLCBhcyBpdCB3YXMgZXhwb3NpbmcgYW5vdGhlciBpc3N1ZQo+IHdp
dGggaG9zdC1weXRob24zIChodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS9pc3N1ZXMvNSkKClllcywgcmV2ZXJ0aW5nIHRoZSBwYXRjaCBzZWVtcyB0byBiZSB0aGUg
YmVzdCBzb2x1dGlvbiBmb3IgdGhlIG1vbWVudC4uLgoKTWF5YmUgYWx0aG91Z2ggcmV2ZXJ0aW5n
ICdwYWNrYWdlL3h6OiBleHBsaWNpdGx5IHNwZWNpZnkgYWxsIGF1dG9jb25mIG9wdGlvbnMnCihh
bmQgJ3BhY2thZ2UveHo6IGVuYWJsZSB5ZWFyMjAzOCBvcHRpb24nKSBhcyBJIHVzZWQgdGhlIHNh
bWUKJ0hPU1RfWFpfQ09ORl9PUFRTID0gJChYWl9DT05GX09QVFMpLi4uJyBwYXR0ZXJuIGhlcmU/
CgpSZWdhcmRzLApQZXRlcgoKPiAKPiBXaGVuIHRoZSBjbWFrZSBidWlsZHN5c3RlbSBpcyBvZmZp
Y2lhbCwgdGhlbiBkbyBub3QgaGVzaXRhdGUgdG8gcmVzdWJtaXQKPiBhbiBpbXByb3ZlZCBwYXRj
aCwgYmFzZWQgb24gdGhlIGNvbW1pdCB0aGF0IHdhcyBpbml0aWFsbHkgYXBwbGllZC4gSWYKPiB5
b3UgaGl0IGEgcm9hZC1ibG9jaywgZG8gbm90IGhlc2l0YXRlIHRvIGFzayBmb3IgZnVydGhlciBo
ZWxwLCBvZgo+IGNvdXJzZSEKPiAKPiBUaGFuayB5b3UhCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUu
IE1PUklOLgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
