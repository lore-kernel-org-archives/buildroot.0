Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DCBC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 17:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2438403AC;
	Mon,  3 Jun 2024 17:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHWhUusra2i2; Mon,  3 Jun 2024 17:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79AAF403C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79AAF403C5;
	Mon,  3 Jun 2024 17:49:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F412C1BF232
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECC4381AC1
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogjuTXlOeTc1 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 17:49:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA5E6819BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA5E6819BE
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA5E6819BE
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 17:48:59 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-43fdd85a284so1256291cf.0
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 10:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717436938; x=1718041738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CS3AfixP/VFjkbiRRp3Cc1ei0y289e0U9g3vRSdA+Lg=;
 b=eDgKWB9voXvyS5ZXyOmR9FQez9zKFrsCHETADXSXmTlojrtoxU4g1+T6Qjd3l5pV2a
 bYuFk/LjNmd8M/hqya7YQA8Pseb1eGrWxO7P1SxRug6EFOT41dhBQhgVpDl3q8toq5kv
 BwQxtucY68PBIrInWXr+TFCFzvSctiNWTQvcs2NKrlLkM01bRX6rPluIawpzXl4NTBl7
 4fbf3XSS386evaIX3X1Mc0XZIDCO/CIJbz+pQoOa9qkEoOQl8YoI594eRaQZcSR15fKz
 E3pMs9A6Pl0rILfHEJW3vijL2PJORbG8bornfnl++AcaKJFK4Y9y8wo69sRs+9PrV840
 9t5A==
X-Gm-Message-State: AOJu0YzaDr8AD+Jicb2hTDWgUktbZYGlOteqEtIs2Z8V9rRUtzmBI7S2
 yjjSZpDYW0UHgHXTuig5a8LExr/WMP0dENiO48KfjpdPlrLiIkv9vAYQaEF+rI8Yp2nm8Ehq9hv
 O8CVhm/imjZO53LhRE6tPJJ4q6u1cEg==
X-Google-Smtp-Source: AGHT+IGOKF01tYaNaL8jkFzIgjfMy6w2ErhiDhOpe63eUgp6JtFFlMYnyXQ1lL0ZnSAfZuA8Mdp82jTGunB/7OjoIu8=
X-Received: by 2002:ac8:7e90:0:b0:43e:26ab:4fc1 with SMTP id
 d75a77b69052e-43ff52ae117mr102539561cf.42.1717436938582; Mon, 03 Jun 2024
 10:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717360788.git.yann.morin.1998@free.fr>
 <1f9ee4bc875b559abde9a4746ab55fa4ca62dc85.1717360788.git.yann.morin.1998@free.fr>
 <CADvTj4qfHg9=mC_OweMCpfNNBDMweBreqDo_bT=t=m339oLBWQ@mail.gmail.com>
 <Zlzg8I5r7cd8yTz5@landeda>
 <CADvTj4rhK6KUZ-q-w65ZDGJZyh2fs2DnHXM-mxzMv3LS9GOQYA@mail.gmail.com>
 <Zl2uhKujEDzv2Gur@landeda>
In-Reply-To: <Zl2uhKujEDzv2Gur@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Jun 2024 11:48:46 -0600
Message-ID: <CADvTj4qyfvGUCbfMj=uWSxcJkBH7LBs-hcdv4Z3_Ax6FtYTnNg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717436938; x=1718041738; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CS3AfixP/VFjkbiRRp3Cc1ei0y289e0U9g3vRSdA+Lg=;
 b=fvE+XxxlQ8KEfgxGJ6rg+A+Q4H1I1JfQTg9S4Z6H+wWyuVjER2vWq9kEF1s61k4rM4
 6L+CO/Zbe55a/CwB0stbcdCnTkmNG3YHbeyBs81KsOKhX1S3/lTYjrULoLPjqTl4eggJ
 hbx3b2ACMHfoKMwcES7xdNwP1Ww0H2ddJKUJE/W/fTZdmZgaclTVCCiyguAMAoYpJgqd
 R/XwB6rF+5GFyVvGpQt2YIfBQwmtk20ltAYVovPA2H22yY7a6vzYVTLEDqVOH5rToKE/
 iJno6pcItKziyDCf0VarYLpGKXbS46puSCAOhEoPy7G8M8pExsTYan1cPSVaFeY8cb0I
 359A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fvE+Xxxl
Subject: Re: [Buildroot] [PATCH 14/16] package/pkg-cargo: add support for
 unlocked packages
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

T24gTW9uLCBKdW4gMywgMjAyNCBhdCA1OjUy4oCvQU0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gSmFtZXMsIEFsbCwKPgo+IE9uIDIwMjQtMDYtMDIg
MTU6MjUgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+IE9uIFN1biwgSnVu
IDIsIDIwMjQgYXQgMzoxNeKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPiB3cm90ZToKPiA+ID4gT24gMjAyNC0wNi0wMiAxNDo1MyAtMDYwMCwgSmFtZXMgSGlsbGlh
cmQgc3Bha2UgdGh1c2x5Ogo+ID4gPiA+IE9uIFN1biwgSnVuIDIsIDIwMjQgYXQgMjo0MuKAr1BN
IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiBbLS1TTklQ
LS1dCj4gPiA+ID4gPiArV2hlbiBhIHBhY2thZ2Ugc291cmNlIHRyZWUgY29udGFpbnMgYSArQ2Fy
Z28ubG9jaysgZmlsZSwgdGhlIHBhY2thZ2UgaGFzCj4gPiA+ID4gPiArYmVlbiBfbG9ja2VkXzog
Y2FyZ28gZGlkIHN0b3JlIHRoZSB2ZXJzaW9ucyBmb3IgdGhlIGNvbXBsZXRlIGRlcGVuZGVuY3kK
PiA+ID4gPiA+ICtjaGFpbiBpbiB0aGUgK0NhcmdvLmxvY2srIGZpbGU7IHRoYXQgaXMgdGhlbiBy
ZXVzZWQgYnkgY2FyZ28gZHVyaW5nIHRoZQo+ID4gPiA+ID4gK3ZlbmRvcmluZywgd2hpY2ggeWll
bGRzIGEgcmVwcm9kdWNpYmxlIGRlcGVuZGVuY3kgY2hhaW4sIGFuZCB0aHVzIGEKPiA+ID4gPiA+
ICtyZXByb2R1Y2libGUgdGFyYmFsbDsgdGhlcmVmb3JlLCBpdCBpcyBwb3NzaWJsZSB0byBjb21w
dXRlIGEgaGFzaCBmb3IKPiA+ID4gPiA+ICt0aGF0IGFyY2hpdmUuIElmIGEgcGFja2FnZSB3YXMg
aG93ZXZlciBub3QgbG9ja2VkLCB0aGVuIHRoZSB2ZXJzaW9ucyBmb3IKPiA+ID4gPiA+ICt0aGUg
ZGVwZW5kZW5jaWVzIGFyZSB1bmtub3duLCB0aGUgZGVwZW5kZW5jeSBjaGFpbiBpcyBub3QgcmVw
cm9kdWNpYmxlLAo+ID4gPiA+ID4gK2FuZCB0aGUgYXJjaGl2ZSBpcyB0aGVuIG5vdCByZXByb2R1
Y2libGUsIHdoaWNoIGltcGxpZXMgdGhlcmUgY2FuIGJlIG5vCj4gPiA+ID4gPiAraGFzaCBmb3Ig
dGhhdCBhcmNoaXZlLgo+ID4gPiA+IEhtbSwgZm9yIHRoZXNlIGNhc2VzIHNob3VsZG4ndCB3ZSBn
ZW5lcmF0ZSBhbmQgY29tbWl0IHRoZSBsb2NrZmlsZSB0bwo+ID4gPiA+IHRoZSBidWlsZHJvb3Qg
cGFja2FnZSBzbyB0aGF0IHdlIGNhbiB0aGVuIGdlbmVyYXRlIGEgZGV0ZXJtaW5pc3RpYyBhcmNo
aXZlCj4gPiA+ID4gYW5kIGFyY2hpdmUgaGFzaD8KPiBbLS1TTklQLS1dCj4gPiBZZWFoLCBzb21l
dGhpbmcgYWxvbmcgdGhvc2UgbGluZXMsIG9uZSB0aGluZyB0aGF0IG1pZ2h0IGJlIGEgYml0IHRy
aWNreSBpcwo+ID4gdGhhdCB3ZSBwcm9iYWJseSBuZWVkIHRvIGluY29ycG9yYXRlIHRoZSBDYXJn
by5sb2NrIGZpbGUgaGFzaCBvciBzb21ldGhpbmcKPiA+IGxpa2UgdGhhdCBpbiB0aGUgYXJjaGl2
ZSBuYW1lLCBzbyB0aGF0IHdheSBpZiB0aGUgQ2FyZ28ubG9jayBmaWxlIG5lZWRzIHRvIGJlCj4g
PiByZWdlbmVyYXRlZCB0aGUgYXJjaGl2ZSBuYW1lIHdpbGwgYWxzbyBiZSBhcHByb3ByaWF0ZWx5
IGNoYW5nZWQgYXQgdGhlIHNhbWUKPiA+IHRpbWUuCj4KPiBIbW1tLi4uIEluZGVlZCwgdGhpcyB3
b3VsZCBjYXVzZSBxdWl0ZSBzb21lIGdyaWVmIGlmIHdlIHdvdWxkIGNoYW5nZSB0aGUKPiBDYXJn
by5sb2NrLi4uCj4KPiBIb3dldmVyLCBJIGRvbid0IHNlZSBhbiBlYXN5IHNvbHV0aW9uIHRvIHRo
aXMgaXNzdWUuLi4gOi0vCj4KPiBXZWxsLCBJIGRvIGhhdmUgYW4gaWRlYSwgYW5kIGl0IHdvdWxk
IGRlZmluaXRlbHkgd29yaywgYnV0IGl0IHdvdWxkIGJlCj4gKmV4Y2Vzc2l2ZWx5KiB1Z2x5Li4u
IEknbGwgdHJ5IHRvIGltcGxlbWVudCBpdCwgYnV0IGFzIGFuIGFkZGl0aW9uYWwKPiBjaGFuZ2Ug
b24tdG9wIG9mIHRoZSBleGlzdGluZyBzZXJpZXMsIGJlY2F1c2UgSSBhbSBub3Qgc3VyZSBpdCB3
b3VsZCBicgo+IG1lYW5pbmdmdWwgaW4gdGhlIGVuZC4uLiBMZXQncyBzZWUuLi4KClByb2JhYmx5
IGl0IHdvdWxkIGJlIGdvb2QgZW5vdWdoIHRvIHNheSB0YWtlIHRoZSBmaXJzdCA3IGNoYXJhY3Rl
cnMgb2YgdGhlCnNoYTI1NiBoYXNoKHNhbWUgbGVuZ3RoIGFzIGEgZ2l0IHNob3J0aGFzaCkgb2Yg
dGhlIENhcmdvLmxvY2sgZmlsZSBhbmQKaW5jb3Jwb3JhdGUgdGhhdCBpbnRvIHRoZSBhcmNoaXZl
IGZpbGVuYW1lIGFwcGVuZGVkIHRvIHRoZSBwYWNrYWdlIHZlcnNpb24uCgo+Cj4gUmVnYXJkcywK
PiBZYW5uIEUuIE1PUklOLgo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwg
LyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
