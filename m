Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7ADCCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 05:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D955606BD;
	Tue, 21 Oct 2025 05:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7MHlLnQ468a; Tue, 21 Oct 2025 05:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B693606BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B693606BF;
	Tue, 21 Oct 2025 05:49:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D2E370A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C1A0606BF
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuXAN_qF9W3b for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 05:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a31; helo=mail-vk1-xa31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FDEA606BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FDEA606BD
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FDEA606BD
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:49:52 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-54bc6356624so5269856e0c.1
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761025791; x=1761630591;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X/GeP2coC0EGOIcdqJ+4OfB/+ZPEBB4MI+b633vf6v4=;
 b=lrkXUe72+5i2zSeYdyEdyC2c55UJJ18tv0H/bw/hj8W+fOjWSk65Mx0FPQXL/XpSbV
 XienvltAV1mDLck+80YMgekx0L49mmZD2JtkrMatkQg//9oDF9CLIgZOn+adUwULr3qC
 fSE501lJa2m7cCHqZHNBCDMVpWAx8Mj594T07JXl9MbnHlXMs/gcTIx/3iCi5KUBBjIV
 siXUe4IDpN/arQsF/qekCsXfmsV9gbyfZl31WtkahPRf07VXxgb3vTHZJfuUC+8YFD05
 ygGN3kGU5E0hNJ48V+FBg5F0MTNGcQI0zSACt58NrqBfX6xIsOS/IQoSg74Qleya4JxH
 /mvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL7IAldPlEgBVWLie33Vx+DgvxpBx2KxptSCwBWb6lwHCnU2JUtGixx4jVFrTtiHBRPse84dIhv6k=@buildroot.org
X-Gm-Message-State: AOJu0YyAC99vcNcfCubOckO7l/h3gkG/b1Cq3ovpng7qlhUz+G/lgHho
 UC1FlynZd7gAltRX9+o5k0yxUlBA3HDmHVoTzAhpZ93Jt5QNRIjI8IiPlyhSFaLqAXf6MLHIbqu
 oD9IkMhTOtkBsiaeBzvuv0EgsUKPoTvVctluh
X-Gm-Gg: ASbGnctCS2pjsCvqdEeeTHvD2Hz9JrStMUTs8lOqsVzZL+qq/xvRmfzdQygdK0giHJs
 UZGBMlnwjHIOPoYXCwfB7fF/yWuV42huXP7+SB3rzKfhW7ShDxmms0P//1ApRs23oZWvZ66tPH0
 18Ajw1LFp3CsQMRBbaiCw7wmUz5xwDXSdCv9NbEWOA71/EfzP/j6LOjsRbwQrEMWJFMDZSSGEzK
 z9IxVyTRYPANX8JuzZoL+uy5b92UtBDa8VWMLrmS5vMIx/C2QMypcHZH5cDpw==
X-Google-Smtp-Source: AGHT+IHiQyJjaH4inisjq6a6IhVA3qGEgXcBfS2+TAJkR7XMR2JQ0/Z7p4oswPWK3uEHB4w2EgD77KFEP03gKu+bizQ=
X-Received: by 2002:a05:6122:7c9:b0:556:3485:925e with SMTP id
 71dfb90a1353d-5564ebecdb5mr4857814e0c.0.1761025791015; Mon, 20 Oct 2025
 22:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251020225424.98853-1-james.hilliard1@gmail.com>
 <aPcNRwNOMOrNTLUB@yd-6wlzhs3>
 <CA+h8R2rkGCQeJbEvR6wHRX8q5s1D2EP2OXk9ieMr326TqTofaw@mail.gmail.com>
 <aPcb5J8rX6TuKsW2@yd-6wlzhs3>
In-Reply-To: <aPcb5J8rX6TuKsW2@yd-6wlzhs3>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Oct 2025 23:49:39 -0600
X-Gm-Features: AS18NWAjUu9bOMesqA6-XY8QRBhyUj1YinFpPFHS60wdmVoVkQMS6qtvrD3a0tY
Message-ID: <CADvTj4p0B68BCMy60mmQf71DKhHq1vYGQpxFtEEou_PZXuTdew@mail.gmail.com>
To: yann.morin@orange.com
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761025791; x=1761630591; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X/GeP2coC0EGOIcdqJ+4OfB/+ZPEBB4MI+b633vf6v4=;
 b=IkgfDKim265kguv5ztUK/QMGKP56AI7cJidlRGuY23+QWTPfTvPojPkK5zEHD+ZFSN
 aoiglqJJtnoeGvgA+4dQGWNOWzYbKNqgbVKuN8TORGhEHrpfb1yMGDceKBPC25eCOtyQ
 eMNGtaS9rBFI6dnkSL6Bm3mqjCvgyUHwAE2MeWH2OIqZxwkc7nkK6iDagvoJ6AFtdyFJ
 ETiXuzNa33tasCaCOt4w8cudKxbKpQUQC3bHRZ4WlHehjEqMFApugQ+7tMP+alPCcJla
 GGd2QpX3j6+7FdhXb4e2DcEhPc9U4JrR8qmZv+rMvIpNbTwfdh8n+5SWGueedpGGSTsm
 qtLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IkgfDKim
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMTE6MzbigK9QTSA8eWFubi5tb3JpbkBvcmFuZ2UuY29t
PiB3cm90ZToKPgo+IENocmlzdGlhbiwgQWxsLAo+Cj4gT24gMjAyNS0xMC0yMCAyMjowOSAtMDcw
MCwgQ2hyaXN0aWFuIFN0ZXdhcnQgc3Bha2UgdGh1c2x5Ogo+ID4gT24gTW9uLCBPY3QgMjAsIDIw
MjUgYXQgOTozNOKAr1BNIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+IHdyb3RlOgo+ID4gPiA+IC0g
QXZvaWQgcGFja2FnZSBicmVha2FnZXMgZHVlIHRvIG1pc3NpbmcgbW9kdWxlIHNvdXJjZXMKPiA+
ID4gSG93IGNhbiBzb3VyY2VzIGJlIG1pc3Npbmcgd2hlbiBmZXRjaGVkICJkaXJlY3QibHk/Cj4g
PiBXZSBoYWQgc2l0dWF0aW9ucyB3aGVyZSBHaXQgdGFncyB3ZXJlIGZvcmNlLXB1c2hlZCBwb3N0
LWZhY3RvIGNhdXNpbmcgYnJlYWthZ2VzLgo+Cj4gQnV0IHRoZW4gdXNpbmcgYSBnb3Byb3h5IGNv
dWxkIGFsc28gY2F1c2UgYnJlYWthZ2UgaWYgYSByZXZlcnNlCj4gZGVwZW5kZW5jeSB1c2VkICJk
aXJlY3QiIHRvIGZldGNoIHNvdXJjZXMgZnJvbSB1cHN0cmVhbSBhZnRlciB0aGV5Cj4gZm9yY2Ut
cHVzaGVkIHRoZSBnaXQgdGFnLCBubz8KClVwc3RyZWFtIHBhY2thZ2Ugc3VtIGZpbGVzIGFyZSBi
YXNpY2FsbHkgYWx3YXlzIGdlbmVyYXRlZCBmcm9tCnRoZSBjYWNoaW5nIGdvcHJveHkgc291cmNl
cywgbm90IGRpcmVjdCBzb3VyY2VzLCBzbyBJIGRvbid0IHRoaW5rCnN1Y2ggYSBzY2VuYXJpbyB3
b3VsZCBiZSBjb21tb24uCgo+IEZvciBleGFtcGxlLCBjb25zaWRlciB0aGUgZm9sbG93aW5nIHRp
bWVsaW5lOgo+ICAgKiBwYWNrYWdlIEEgdGFncyB2MQo+ICAgKiBwYWNrYWdlIEIgdXNlcyBBLXYx
Cj4gICAqIHNvbWVvbmUgZ3JhYnMgcGFja2FnZSBCIGFuZCB2ZW5kb3JzIGl0IHVzaW5nIGdvcHJv
eHkgPT4gZ29wcm94eQo+ICAgICBjYWNoZXMgQS12MQo+ICAgKiBwYWNrYWdlIEEgZm9yY2UtcHVz
aGVzIHYxIChsZXQncyBjYWxsIGl0IHYxwrQpCj4gICAqIHBhY2thZ2UgQyB1c2VzIEEtdjHCtCBu
b3QgdXNpbmcgYSBnb3Byb3h5IChvciBhIGRpZmZlcmVudCBvbmUhKQo+ICAgKiBzb21lb25lIGdy
YWJzIHBhY2thZ2UgQyBhbmQgdmVuZG9ycyBpdCB1c2luZyBnb3Byb3h5ID0+IGdldHMgdGhlCj4g
ICAgIHdyb25nIHNvdXJjZXMuLi4KPgo+IEFuZCBhIGdvIHBhY2thZ2UgdXBzdHJlYW0gZm9yY2Ut
cHVzaGluZyBhIHRhZyBpcyBub3QgZGlmZmVyZW50IGZvcgo+IHVzIEJ1aWxkcm9vdCB0aGFuIGEg
bm9uLWdvIHBhY2thZ2UgdXBzdHJlYW0gZm9yY2UtcHVzaGluZyBhIHRhZzogaW4gYW55Cj4gY2Fz
ZSwgd2UgZW5kIHVwIGV4cGVjdGluZyBhIHNwZWNpZmljIGhhc2ggZm9yIGEgdGFyYmFsbCwgYnV0
IHRoYXQncyBub3QKPiB3aGF0IHdlIGdvdCwgYW5kIHdlIGNhbid0IGJsaW5kbHkgdXBkYXRlIG91
ciAuaGFzaCBmaWxlIGJlY2F1c2Ugb2xkZXIKPiB2ZXJzaW9ucyB3b3VsZCBiZSBjYWNoZWQgb24g
cy5iLm8uIChvciB0aGUgb3RoZXIgd2F5IGFyb3VuZCBmb3Igb2xkZXIKPiBidWlsZHJvb3QgdmVy
c2lvbnMpLiBUaGUgb25seSBzbG9naHQgZGlmZmVyZW5jZSBpcyB0aGF0IGluIG9uZSBjYXNlLCB3
ZQo+IEJ1aWxkcm9vdCBhcmUgZG9pbmcgdGhlIGhhc2ggY2hlY2ssIHdoaWxlIGluIHRoZSBvdGhl
ciwgdGhlIGdvIHRvb2xpbmcKPiBkb2VzIHRoZSBjaGVjay4uLgoKVGhlIGlzc3VlIGlzIHRoYXQg
aXQncyBleHBlY3RlZCBieSB1cHN0cmVhbSBnbyBwYWNrYWdlcyB0aGF0IGFsbApoYXNoZXMgYXJl
IGZvciBjYWNoZWQgZ29wcm94eSBzb3VyY2VzLCBub3QgZGlyZWN0IHNvdXJjZXMuIFNvCmRpcmVj
dCBzb3VyY2VzIGJyZWFraW5nIHdvdWxkbid0IGV2ZW4gYmUgY29uc2lkZXJlZCBhbiBpc3N1ZQpi
eSBhbiB1cHN0cmVhbSBwYWNrYWdlIGFzIHRoZXkgYWx3YXlzIHVzZSBjYWNoZWQgc291cmNlcy4K
Cj4gU28sIHVzaW5nIGEgZ29wcm94eSBpcyBub3QgYSBzaWx2ZXIgYnVsbGV0OiBvbiBhdmVyYWdl
IGl0IHdvdWxkCj4gaW50cm9kdWNlIGFzIG1hbnkgaGFzaCBpc3N1ZXMgYXMgaXQgd291bGQgc29s
dmUuLi4KCkFjdHVhbGx5IGl0IGRvZXNuJ3QgY2F1c2UgbW9yZSBicmVha2FnZSBiZWNhdXNlIGJh
c2ljYWxseSBhbGwgZ28KcGFja2FnZSB1cHN0cmVhbXMgYnVpbGQgdXNpbmcgdGhlIGdvcHJveHkg
ZW5hYmxlZCwgZGlyZWN0IG9ubHkKaXMgYmFzaWNhbGx5IG5ldmVyIHVzZWQgYnkgdXBzdHJlYW0g
cHJvamVjdHMgc2luY2UgdGhhdCdzIG5vdCB0aGUKZ28gdG9vbGNoYWluIGRlZmF1bHQuCgo+Cj4g
Wy0tU05JUC0tXQo+ID4gRldJVyBJJ3ZlIG92ZXJyaWRkZW4gaXQgdG8gImRpcmVjdCIgaW4gbXkg
b3duIEJ1aWxkcm9vdCBicmFuY2ggYXMgSQo+ID4gc3RpbGwgcHJlZmVyIGZyb20tR2l0IHNvdXJj
ZXMuCj4KPiBZZXMsIEkgYmVsaWV2ZSB0aGlzIHNob3VsZCBiZSB0aGUgZGVmYXVsdC4gVXNpbmcg
YSBub24tZGlyZWN0IGdvcHJveHkKPiBjb3VsZCBiZSBpbnRlcmVzdGluZyBpbiBjb21wYW55IG5l
dHdvcmtzIHRoYXQgaGF2ZSB0aGVpcmUgb3duIGludGVybmFsCj4gZ29wcm94eSB0aGF0IGFjdHVh
bHkgcHJveGllcyB0byB0aGUgb3V0dGVyIGludGVybmV0IHRoYXQgaXMgb3RoZXJ3aXNlCj4gZmls
dGVyZWQuCgpUaGlzIHdpbGwgYnJlYWsgcGFja2FnZSBkb3dubG9hZHMsIHBhY2thZ2UgZG93bmxv
YWRzIGVzc2VudGlhbGx5CmFsd2F5cyB3b3JrIHdpdGggdGhlIGNhY2hpbmcgZ29wcm94eSBiZWNh
dXNlIHRoYXQncyB3aGF0IHRoZSBnbwplY29zeXN0ZW0gZGVjaWRlZCBvbiBmb3IgdGhlaXIgZGVm
YXVsdC4gT3ZlcnJpZGluZyB0aGUgZ29sYW5nIGRlZmF1bHQKY2F1c2VzIGEgbG90IG9mIGJyZWFr
YWdlIGJlY2F1c2Ugb2YgdGhpcy4KCj4gPiA+ID4gLSBCZXR0ZXIgYWxpZ25tZW50IHdpdGggdXBz
dHJlYW0gR28gdG9vbGNoYWluIGRlZmF1bHRzCj4gPiA+ID4gLSBGYXN0ZXIgZG93bmxvYWRzIHZp
YSB0aGUgcHJveHkgY29tcGFyZWQgdG8gZGlyZWN0IEdpdCBjbG9uZXMKPiA+ID4gPiAtIE1haW50
YWlucyByZXByb2R1Y2libGUgYnVpbGRzIHRocm91Z2ggR28ncyBtb2R1bGUgY2hlY2tzdW0gdmFs
aWRhdGlvbgo+ID4gPgo+ID4gPiBJbiB0aGUgcGFzdCwgd2Ugb2JzZXJ2ZWQgdGhlIHJldmVyc2U6
IHRoZSBnb3Byb3h5IGhhZCBhIHN0YWxlIHZlcnNpb24KPiA+ID4gdGhhdCB3YXMgbm90IG1hdGNo
aW5nIHRoZSB1cHN0cmVhbSBvbmUsIHNvIHdoZW4gd2UgdHJpZWQgdG8gdmVuZG9yIGEKPiA+ID4g
cGFja2FnZSwgdGhlIGhhc2hlcyB3b3VsZCBub3QgbWF0Y2guIFVzaW5nICJkaXJlY3QiIGZpeGVk
IHRoZSBpc3N1ZQo+ID4gPiAoc29ycnksIEkgY2FuJ3QgcmVtZW1iZXIgd2hhdCBwYWNrYWdlIHRo
YXQgd2FzLi4uKQo+ID4gSSB0aGluayBpdCB3YXMgdGhlIG90aGVyIHdheSBhcm91bmQsIEdPUFJP
WFkgaGFkIHRoZSBzdGFsZSB2ZXJzaW9uIHllcywKPiA+IC4uLiBidXQgdGhlIGRvd25zdHJlYW0g
ZGVwZW5kZW5jaWVzIG9mIHNhaWQgcGFja2FnZSBhbHNvIGV4cGVjdGVkIHRoZQo+ID4gc3RhbGUg
dmVyc2lvbi4KPgo+IEFoLCBJIGRvIHJlbWVtYmVyIGFub3RoZXIgY2FzZSwgd2hlcmUgdGhlIGdv
cHJveHkgaGFkIGEgbmV3ZXIgdmVyc2lvbiwKPiBidXQgdGhlIHJldmVyc2UgZGVwZW5kZW5jaWVz
IGV4cGVjdGVkIHRoZSBzdGFsZSBvbmUuIEJ1dCBteSBtZW1vcnkgaXMgYQo+IGJpdCBmdXp6eSBh
Ym91dCB0aGF0Li4uCj4KPiBJbiB0aGUgZW5kLCBpdCBzaG93cyB0aGF0IHVzaW5nIGEgZ29wcm94
eSBpcyBub3QgYSBtYWdpYyBidWxsZXQgdG8gc29sdmUKPiB2ZW5kb3Jpbmcgd2hlbiB1cHN0cmVh
bSBhbmQgdGhlIGdvcHJveHkgZGlzYWdyZWUgb24gdGhlIGNvbnRlbnQgb2YgYQo+IHZlcnNpb24u
Li4KClRoYXQncyBub3QgdHJ1ZSBkdWUgdG8gYWxsIHBhY2thZ2VzIGV4cGVjdGluZyB0aGUgY2Fj
aGVkIGdvcHJveHkgc291cmNlcwp0byBiZSB2YWxpZC4gRnJvbSBteSB1bmRlcnN0YW5kaW5nIEdP
UFJPWFk9ZGlyZWN0IGlzIHNpbXBseSBub3QKcmVsaWFibGUgZW5vdWdoIGZvciBnbyBwcm9qZWN0
cyB3aXRoIGxhcmdlciBkZXBlbmRlbmN5IHRyZWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
