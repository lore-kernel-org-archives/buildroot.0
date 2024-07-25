Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A97C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBF8E60AAE;
	Thu, 25 Jul 2024 15:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFkQ6qXlC0jx; Thu, 25 Jul 2024 15:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7EBE60A6F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7EBE60A6F;
	Thu, 25 Jul 2024 15:17:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27FEF1BF357
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1533581E98
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MADVWP10NzwV for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:17:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD8F98186B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD8F98186B
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD8F98186B
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:17:19 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7093472356dso355331a34.0
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 08:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721920639; x=1722525439;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ciJpKM3pAzu/oDVcCQ8qJ4WoOmNtpb1q3Y2/hQ7OHWo=;
 b=ixDIEnlA7VVtd2mwQwiwKWQBJe+eCTbmFO7O80f8oDQGDSbqSnOJSqciOibm2tTcLt
 aXUFlDecobBKaKEPkvAozQpHW/GbkgMvCYhDGQN3kRt8EKo7SmMzfZl2RIT90fwBnl1Y
 xt7XAHLwTKi5b5T2Y+YO4qgiaKaQaQdCMzfRLPjWp275hJal5EHxUilo84bZVGnYB/07
 IHvCmPdaprss+kxo6zs/9HgEEzU78U1u4Cr5G/NAeXepsKtlbU0iroCFU0DO92nO1wZq
 6LJtaWAJ5u+baSmkfX4JGXXK3xdH6iB4Axl4yGDl/m1MzFu1yZowbqOVf7oZqHKC2NUp
 ZEyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDWpfiRg7h8BtBFm/VC+AEpVHDcj0aNmM6lNN97ixv5UsRVkLDlERYe5wl+ZUsNUpYqvLydmkP9SJgbEI6/LD+9uyf79zlpQ==
X-Gm-Message-State: AOJu0Yyg3XjIYmxSSeLOjaL06yZPGzyQwmofB2Wo2LJMRE4yOOtvgIwr
 YsAVqtsh7KGBdz9AXASPIdpkH+sGCm4WOc3sKbtXQyJz/c4vSK0VtU1doZepQKQ+ZlOCoBMwSNm
 if/kUBUhZvWuVdawKN4WGo6Nx1S8=
X-Google-Smtp-Source: AGHT+IF4Hsbw1YNUFqxNpfg2fh3hzH3bdZgu5ajPadWf+fFlQU5kltZnF0qPZvxU6YRKVr1g5ahq0NC10rSsjTy0jL8=
X-Received: by 2002:a05:6830:2587:b0:704:482e:216a with SMTP id
 46e09a7af769-7092e6eef2fmr3791023a34.14.1721920638496; Thu, 25 Jul 2024
 08:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240724-revert-output-gitignore-v1-0-510a2795884c@collins.com>
 <20240724-revert-output-gitignore-v1-1-510a2795884c@collins.com>
 <20240725075112.576a95cf@windsurf>
 <CADvTj4qxPTw_rGV1wLWn6hvFvJ7fL50V=_npzCnQ5qAOrFZkDg@mail.gmail.com>
 <D2YPL0DRBIDJ.1IXAMC2W0UE6C@collins.com>
In-Reply-To: <D2YPL0DRBIDJ.1IXAMC2W0UE6C@collins.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 25 Jul 2024 09:17:06 -0600
Message-ID: <CADvTj4r1uqYd=11iCxtgBdrRg4P64AYMvRn17b7P4__e9A0Nfg@mail.gmail.com>
To: Brandon Maier <brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721920639; x=1722525439; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ciJpKM3pAzu/oDVcCQ8qJ4WoOmNtpb1q3Y2/hQ7OHWo=;
 b=HTTQ5SmNhHql3m2OfjhdaSwQrAYb64xF54juUbzJPO6kQbVu4enEFzQwvXvORIPSlN
 oU5tj65GCPeiiZMx2TkwQdyjh50999Fen5zPTFMedk5HsgWdQ5P9kryTBE+TA9eW1N2D
 oUGX1X7uPT+0pM3Wu4rkF/6p6Xcp/4LP6Ne9BxA/i04cpf3onOVXXSummDVtQGy5wZg6
 NHRhhWHWkz20nmcREf4I0eupM5N+Yk48dvDozaRMB3aqgrcnPA24L41gtFsIin9YiMyT
 EpkdnYtl/hC4X6yXi160ZeauFmatdAUaYc3xqnWllVkBqppaF9hM47osEw3UPSKjAjVZ
 UpNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HTTQ5SmN
Subject: Re: [Buildroot] [PATCH 1/2] Revert "Create a .gitignore file in the
 CANONICAL_O directory"
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
Cc: Bryan Brattlof <bb@ti.com>, Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBKdWwgMjUsIDIwMjQgYXQgOTowMeKAr0FNIEJyYW5kb24gTWFpZXIgPGJyYW5kb24u
bWFpZXJAY29sbGlucy5jb20+IHdyb3RlOgo+Cj4gSGkgVGhvbWFzLCBKYW1lcywKPgo+IE9uIFRo
dSBKdWwgMjUsIDIwMjQgYXQgNjowNCBBTSBVVEMsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+ID4g
T24gV2VkLCBKdWwgMjQsIDIwMjQgYXQgMTE6NTHigK9QTSBUaG9tYXMgUGV0YXp6b25pIHZpYSBi
dWlsZHJvb3QKPiA+IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IEhlbGxvIEJyYW5kb24sCj4gPiA+Cj4gPiA+IE9uIFdlZCwgMjQgSnVsIDIwMjQgMjE6MjM6MjAg
KzAwMDAKPiA+ID4gQnJhbmRvbiBNYWllciA8YnJhbmRvbi5tYWllckBjb2xsaW5zLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+ID4gVGhlIHBhY2thZ2VzICdweXRob24tanNvbnNjaGVtYS1zcGVjaWZp
Y2F0aW9ucycsICdweWRhbnRpYy1jb3JlJywgYW5kCj4gPiA+ID4gbGlrZWx5IG90aGVyIHBhY2th
Z2VzIGJhc2VkIG9uIFB5dGhvbiBtYXR1cmluIHNpbGVudGx5IHN0b3BwZWQKPiA+ID4gPiBpbnN0
YWxsaW5nIGZpbGVzIHRvIHRoZSBob3N0IGFuZCB0YXJnZXQgZGlyZWN0b3JpZXMgYWZ0ZXIgY29t
bWl0Cj4gPiA+ID4gYTE0Yzg2MmMwOC4KPiA+ID4gPgo+ID4gPiA+IEEgc2ltaWxhciBpc3N1ZSB3
YXMgcmVwb3J0ZWQgYnkgdGhlIENvbmRhIHByb2plY3RbMV0uIEl0IHNlZW1zIHNvbWUKPiA+ID4g
PiBidWlsZCB0b29scyBzY2FuIGZvciBnaXRpZ25vcmUgZmlsZXMgdG8gZGVjaWRlIHdoYXQgZmls
ZXMgdG8gYnVpbGQKPiA+ID4gPiBhbmQgaW5zdGFsbC4KPiA+ID4gPgo+ID4gPiA+IEkgYXR0ZW1w
dGVkIHZhcmlvdXMgY29tYmluYXRpb25zIG9mIGdpdGlnbm9yZSBwYXR0ZXJucyBpbmNsdWRpbmcK
PiA+ID4gPiBtaW1pY2tpbmcgdGhlIENvbmRhIHByb2plY3QncyBnaXRpZ25vcmVbMl0sIGJ1dCB0
aGUgb25seSB0aGluZyB0aGF0IGhhcwo+ID4gPiA+IHdvcmtlZCByZWxpYWJseSBpcyB0aGUgb3Jp
Z2luYWwgYC9vdXRwdXRgIGlnbm9yZSBpbiB0aGUgcm9vdCBCdWlsZHJvb3QKPiA+ID4gPiBkaXJl
Y3RvcnkuCj4gPiA+Cj4gPiA+IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLiBIb3dldmVyLCBp
dCdzIHJlYWxseSBtZXNzZWQgdXAuIFdoeSB3b3VsZAo+ID4gPiB0aGVzZSB0b29scyBiZSBib3Ro
ZXJlZCBieSBhIC5naXRpZ25vcmUgZmlsZT8gRG8geW91IGhhdmUgc29tZSBtb3JlCj4gPiA+IGRl
dGFpbHM/Cj4gPgo+ID4gU28gaXQncyB0aGUgZXhhY3Qgc2FtZSByZWFzb24gcmlwZ3JlcCBpcyBh
ZmZlY3RlZCBieSAuZ2l0aWdub3JlIGZpbGVzLAo+ID4gbWF0dXJpbiBhY3R1YWxseSB1c2VzIHRo
ZSBpZ25vcmUgY3JhdGUgZnJvbSB0aGUgcmlwZ3JlcCBwcm9qZWN0Ogo+ID4gaHR0cHM6Ly9jcmF0
ZXMuaW8vY3JhdGVzL2lnbm9yZQo+ID4KPiA+IE5vdGUgdGhhdCB0aGUgaWdub3JlIGNyYXRlIGRv
ZXNuJ3QgZW50aXJlbHkgY29ycmVjdGx5IHJlcGxpY2F0ZSBnaXQncwo+ID4gaWdub3JlIGxvZ2lj
IGFzIG90aGVyd2lzZSB0aGlzIHNob3VsZG4ndCBoYXZlIHRyaWdnZXJlZCBhbnkgaXNzdWVzLgo+
Cj4gSXQgZG9lcyBzZWVtIHRvIHJlcGxpY2F0ZSBnaXQncyBpZ25vcmUgbG9naWMgY29ycmVjdGx5
LiBUaGUgaXNzdWUgaXMKPiB0aGF0IHdlIGRvd25sb2FkIHB5dGhvbi1qc29uc2NoZW1hIGFzIGEg
dGFyYmFsbCB3aGljaCBkb2VzIG5vdCBpbmNsdWRlCj4gdGhlICcuZ2l0JyBkaXJlY3RvcnkuIFNv
IHdoZW4gYG1hdHVyaW5gIHRyaWVzIHRvIHVzZSBnaXRpZ25vcmUncywgaXQKPiBkb2VzIGRvIHdo
YXQgZ2l0IHdvdWxkIGRvLCBpdCBzZWFyY2hlcyB1cHdhcmRzIHVudGlsIGl0IGZpbmRzCj4gQnVp
bGRyb290J3MgJy5naXQnIGRpcmVjdG9yeSBhbmQgdHJlYXRzIGl0IGFzIHRoZSByZXBvLgoKSWYg
aXQgcmVwbGljYXRlZCBnaXQncyBpZ25vcmUgbG9naWMgY29ycmVjdGx5IGl0IHdvdWxkIGhhdmUg
YmVlbiBicm9rZW4KYmVmb3JlIHRoaXMgY2hhbmdlIGFscmVhZHkuIEFGQUlVIHdlJ3JlIGVzc2Vu
dGlhbGx5IHJlbHlpbmcgb24gYQpidWcgaW4gbWF0dXJpbnMgZ2l0IGlnbm9yZSBsb2dpYyBub3Qg
cGFyc2luZyB0aGUgYC9vdXRwdXRgIHBhdHRlcm4gaW4KYnVpbGRyb290J3MgZ2l0aWdub3JlLgoK
Pgo+IEl0IHNlZW1zIHRvIG1lIHRoZW4gdGhlIGZpeCBpcyBvbmUgb2YKPiAtIEJ1aWxkcm9vdCBu
ZWVkcyB0byBzd2l0Y2ggdG8gdXNpbmcgdGhlIGdpdCByZXBvIGRpcmVjdGx5CgpUaGlzIGlzIHRo
ZSB3cm9uZyBhcHByb2FjaCBJTU8uCgo+IC0gQnVpbGRyb290IG5lZWRzIHRvIGNyZWF0ZSBhbiBl
bXB0eSBnaXQgcmVwbyBpbiBidWlsZC9weXRob24tanNvbnNjaGVtYS8KClRoaXMgc2VlbXMgdG8g
YmUgcHJldHR5IGhhY2t5LCBidXQgbWlnaHQgYmUgYW4gb2sgd29ya2Fyb3VuZC4KCj4gLSBNYXR1
cmluIG5lZWRzIHRvIHN0b3Agc2VhcmNoaW5nIGZvciBnaXQgcmVwb3MgYXQgaXRzIHB5cHJvamVj
dAo+ICAgZGlyZWN0b3J5LCB3aGljaCBKYW1lcycgUHVsbCBSZXF1ZXN0IGlzIGRvaW5nCj4KPiBB
bmQgSSBhZ3JlZSBmaXhpbmcgaXQgaW4gTWF0dXJpbiBpcyB0aGUgY29ycmVjdCBwbGFjZS4gQXMg
dGhhdCB3aWxsIGFsc28KPiBmaXggaXQgZm9yIGFueW9uZSB1c2luZyB0aGUgdGFyYmFsbHMsIGxp
a2UgQ29uZGEuIFRob3VnaCBpdCBkb2VzIG1ha2UgbWUKPiBwYXJhbm9pZCBhYm91dCB3aGF0IG90
aGVyIGJ1aWxkIHRvb2xzIG91dCB0aGVyZSBtaWdodCBiZSBleHBlY3RpbmcgYSBnaXQKPiByZXBv
IGFuZCB0aGVuIHNpbGVudGx5IGZhbGxpbmcgYmFjayB0byB0aGUgQnVpbGRyb290IHJlcG8uLi4K
ClBvZXRyeSBoYWQgYSBzaW1pbGFyIGJ1ZyBJIGhhZCBmaXhlZCBhIGxpdHRsZSB3aGlsZSBhZ28s
IGJ1dCBpdCB3YXMgdXNpbmcKcmVhbCBnaXQgYW5kIG5vdCBzb21lIGN1c3RvbSBpZ25vcmUgbGli
cmFyeSBsaWtlIG1hdHVyaW4gZG9lcyBzbyB0aGUKZml4IHdhcyBhIGJpdCBzaW1wbGVyOgpodHRw
czovL2dpdGh1Yi5jb20vcHl0aG9uLXBvZXRyeS9wb2V0cnktY29yZS9wdWxsLzYxMQoKPgo+IFdo
YXQgd2FzIHN1cnByaXNpbmcgdG8gbWUgaXMgdGhhdCB0aGUgYC9vdXRwdXRgIHBhdHRlcm4gaW4g
QnVpbGRyb290J3MKPiByb290IGdpdGlnbm9yZSBkb2Vzbid0IGNhdXNlIHRoaXMgcHJvYmxlbS4g
VGhpcyBhcHBlYXJzIHRvIGJlIGEgYnVnIGluCj4gcmlwZ3JlcCdzIGxvZ2ljLCBhbmQgSSBmb3Vu
ZCB0aGlzIGxvbmcgdGhyZWFkIHRoYXQgc2VlbXMgcmVsYXRlZC4gU28gaWYKPiB0aGlzIGV2ZXIg
Z2V0cyBmaXhlZCB0aGVuIHRoZXNlIHBhY2thZ2VzIHdpbGwgYmUgYnJva2VuIGFnYWluLgoKVGhp
cyBpcyB3aGF0IEkgbWVhbiBieSBpdCBkb2Vzbid0IHJlcGxpY2F0ZSBnaXQncyBpZ25vcmUgbG9n
aWMgY29ycmVjdGx5LgoKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9CdXJudFN1c2hpL3JpcGdyZXAv
aXNzdWVzLzgyOQo+Cj4gPgo+ID4gPgo+ID4gPiBJIHRoaW5rIEknbSBnb2luZyB0byBhcHBseSB0
aGUgcmV2ZXJ0IHRvIGZpeCB0aGUgaW1tZWRpYXRlIGJ1aWxkCj4gPiA+IGlzc3VlcywgYnV0IEkg
d291bGQgcmVhbGx5IHJlYWxseSBsaWtlIHRvIGZpeCB0aGUgcmVhbCBwcm9ibGVtLCBhbmQKPiA+
ID4gYWxsb3cgdXMgdG8gZ2VuZXJhdGUgdGhpcyAuZ2l0aWdub3JlIGZpbGUgaW4gdGhlIG91dHB1
dCBkaXJlY3RvcnkuCj4gPgo+ID4gWWVhaCwgSSd2ZSBiZWVuIHdvcmtpbmcgb24gYSBmaXggYnV0
IGl0IGhhcyBzb21lIGlzc3VlcywgbWF5YmUKPiA+IHNvbWVvbmUgY2FuIGhlbHAgZml4IHRoZSB0
ZXN0czoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9QeU8zL21hdHVyaW4vcHVsbC8yMTU4Cj4KPiBU
aGFuayB5b3UgSmFtZXMgZm9yIGxvb2tpbmcgYXQgdGhpcyBzbyBxdWlja2x5LAo+IEJyYW5kb24K
Pgo+ID4KPiA+ID4KPiA+ID4gVGhvbWFzCj4gPiA+IC0tCj4gPiA+IFRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiA+ID4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiA+ID4gaHR0cHM6Ly9ib290bGluLmNvbQo+ID4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiA+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
