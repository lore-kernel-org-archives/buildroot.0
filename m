Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D402C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 15:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5220F82572;
	Sun, 25 Sep 2022 15:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5220F82572
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oj4PPlAMHjwX; Sun, 25 Sep 2022 15:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B7EF824CE;
	Sun, 25 Sep 2022 15:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B7EF824CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6FAE1BF36A
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 15:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80FD040395
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 15:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80FD040395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECopjk-zuGgG for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 15:17:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1EED4018A
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1EED4018A
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 15:17:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 c192-20020a1c35c9000000b003b51339d350so3634069wma.3
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=E5we8XFHNHnX2C+wWAWvnakMZXT1HmQUgnr481mxprw=;
 b=oy6R1WmL4yvwKt23VTkdUyOfHseNymF8dwgA6nUvwCSHBtsh5HY2ctUWWEzD5yBtc/
 hhgkK2KIzphXyyDi3orC9qe4lK27EdVGI5C2DNbyfYqS4X8L3buC29EDq+xhjNYBky5Z
 56ylQQP4YIrj/Muef9VOfCeVPzMJLcrJg6353r6TC3h3nEccnqiih4B2gyfh9R8bKfqW
 CwksHt8nc0j4YXDD65hSR6ZkVTNdM+6VTFfufkrdCMrIADpwPO3qIjnWWOajVsiKYavV
 196t3TkJerFJFvVku9vFiyd0uZtYc3biryGOruRlZqwxEcZ5zn88b5e0J1id29aHrAZD
 YHEw==
X-Gm-Message-State: ACrzQf21i66IfXS7c+l5G3DCF8leA0XLQSxNe5H2HS5IoHZGMMND7A1W
 8/HZXSKFASskpH3e1nFunyMaIit6pQ6Mq46rWqM=
X-Google-Smtp-Source: AMsMyM4GgQWF0k7giL+s0f/jnlq7Qwjg7PBMLdx1OXxSFemcOf7A5hgpumv7DOK1DldHKGeYaC9mwLzBz6idIWXajtU=
X-Received: by 2002:a1c:4b05:0:b0:3b4:90c1:e249 with SMTP id
 y5-20020a1c4b05000000b003b490c1e249mr19610385wma.201.1664119053663; Sun, 25
 Sep 2022 08:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
 <20220925102714.163869b8@windsurf>
In-Reply-To: <20220925102714.163869b8@windsurf>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Sun, 25 Sep 2022 18:17:22 +0300
Message-ID: <CA+U=DsrMnh-60tcZKk7r41h5kyuGR5Cni7S5D6pTA0UpR4oE7Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=E5we8XFHNHnX2C+wWAWvnakMZXT1HmQUgnr481mxprw=;
 b=WgFvhniH+zI/TZD6AOf/cZDb2EqLBWtfvMh/Op+j2V1s6VQb/X/gKacENlli3dgvRv
 0lTsSgc+BbOxv5gw4Jwyv5Ti3IPCXFt/asx3UedaBaB9hWrL7+KZC6PI59hQJj1LpdbY
 k2p3Ne48G1gG3NDHlJPQOZ1N0N5X9EMrB01W9JgupMDFQdPO4w7W2HoIN3O5pSevcvRS
 TwEDjohJvJKFIxwdzpDChzQlYmRAFmZZHh7Pd4NQBROoK41a86vAS96BLlNxh4df9o/v
 +2dNHGTplmtnDxZFU8fUlWnNktsJb+O7nKYbIOY8ISixwc+zCA6d3v1y76USl8KvizG5
 6a9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WgFvhniH
Subject: Re: [Buildroot] [PATCH 00/13] package/nodejs: rework cross-building
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
Cc: fontaine.fabrice@gmail.com, aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBTZXAgMjUsIDIwMjIgYXQgMTE6MjcgQU0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBBbGV4YW5kcnUsCj4KPiBP
biBUdWUsICA5IEF1ZyAyMDIyIDEwOjU2OjUxICswMzAwCj4gQWxleGFuZHJ1IEFyZGVsZWFuIDxh
cmRlbGVhbmFsZXhAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gQWxleGFuZHJ1IEFyZGVsZWFuICgx
Myk6Cj4gPiAgIHBhY2thZ2UvbGlidXY6IGFkZCBob3N0LWJ1aWxkCj4gPiAgIHBhY2thZ2Uvbmdo
dHRwMjogYWRkIGhvc3QtYnVpbGQKPiA+ICAgbm9kZWpzOiByZW1vdmUgdjgtcWVtdS13cmFwcGVy
IHN0dWZmCj4gPiAgIG5vZGVqczogZml4ICdEdXBsaWNhdGUgdjggdGFyZ2V0IGVycm9ycyB3aGVu
IGNyb3NzLWNvbXBpbGluZycgZXJyb3IKPiA+ICAgcGFja2FnZS9ub2RlanM6IGFkZCBob3N0LXtj
LWFyZXMsbGlidXYsbmdodHRwMn0gdG8gZGVwcwo+ID4gICBwYWNrYWdlL25vZGVqczogcHJvdmlk
ZSB7Q0MsQ1hYLENGTEFHUyxDWFhGTEFHUyxMREZMQUdTfV9ob3N0IGVudiB2YXJzCj4gPiAgICAg
dG8gdGFyZ2V0LWJ1aWxkCj4gPiAgIHBhY2thZ2Uvbm9kZWpzOiBkb24ndCBpbnN0YWxsIG5vZGVq
cyBob3N0LXRvb2xzCj4gPiAgIHBhY2thZ2Uvbm9kZWpzOiByZW5hbWUgTERGTEFHUy5ob3N0IC0+
IExERkxBR1Mgb3B0Cj4gPiAgIHBhY2thZ2Uvbm9kZWpzOiBpbXBvc2UgZGVwIG9uIGlhMzIgbGli
cy9jb21waWxlciBpZiB0YXJnZXQgYXJjaCBub3QgNjQKPiA+ICAgICBiaXRzCj4gPiAgIHBhY2th
Z2Uvbm9kZWpzOiBhZGQgaG9zdC16bGliIGRlcGVkZW5jeSB0byB0YXJnZXQgcGFja2FnZQo+ID4g
ICBwYWNrYWdlL25vZGVqczogZml4IEFSTSBidWlsZCB3aXRoIFZGUDMgaW5zdHJ1Y3Rpb24KPiA+
ICAgcGFja2FnZS9ub2RlanM6IGFkZCBhIGhhY2sgdG8gY3Jvc3MtY29tcGlsZSAzMi1iaXQgdGFy
Z2V0cyBvbiB4NjQKPiA+ICAgICBob3N0cwo+ID4gICBwYWNrYWdlL25vZGVqczogYnVpbGQgaG9z
dC1ub2RlanMgb25seSBpZiB3ZSdyZSBpbnN0YWxsaW5nIG1vZHVsZXMKPiA+ICAgICB3aXRoIE5Q
TQo+Cj4gU28gSSBmaW5hbGx5IHRvb2sgc29tZSB0aW1lIHRvIGxvb2sgaW50byB0aGlzLCBhbmQg
bWFuYWdlZCB0byBnZXQKPiBOb2RlSlMgdG8gYnVpbGQsIGJ1dCBrZWVwaW5nIHRoZSBRZW11IGxv
Z2ljLiBIZXJlIGlzIHdoYXQgSSBoYXZlIHB1c2hlZAo+IHRvIHRoZSBCdWlsZHJvb3QgR2l0IHJl
cG86Cj4KPiAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Nv
bW1pdC9mODVlMmNmYzZlNTg3ZDUwYjg2ZjQ5YjI4NDY5ZWFlNThhMmVhMmM3Cj4KPiAgIEp1c3Qg
cmVudW1iZXJpbmcgYW4gZXhpc3RpbmcgcGF0Y2gKPgo+ICAgaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzU3MDhjNWIwNGYwOWY0OWE5OWMyYzlkN2Ex
ODk0ZDI0YmNlNmEzZTcKPgo+ICAgWW91ciBwYXRjaCB0byBmaXggdGhlIGR1cGxpY2F0ZSB2OCB0
YXJnZXQgZXJyb3IsIGp1c3Qgc2xpZ2h0bHkKPiAgIGltcHJvdmVkIGJ5IG1lLgo+Cj4gICBodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvY2YwZGRjODk3
MDVhZjk4OTM5M2IxNjAxYmJmNTdkNTY3YTlhMWIxMwo+Cj4gICBBIHBhdGNoIGZyb20gbWUgd2hp
Y2ggaXMgZml4aW5nIHRoZSBpc3N1ZSB3aXRoIHRoZSBRZW11IGFwcHJvYWNoLgo+ICAgQmFzaWNh
bGx5LCBzaW5jZSB0aGUgYnVtcCBmcm9tIDE0LnggdG8gMTYueCwgb25lIGNhbGwgdG8gYSB0b29s
IHRoYXQKPiAgIHNob3VsZCBiZSBydW4gdW5kZXIgUWVtdSB3YXMgbm90IGRvbmUgdGhyb3VnaCB0
aGUgd3JhcHBlciwgY2F1c2luZwo+ICAgdGhlIGJ1aWxkIGZhaWx1cmUuIFdpdGggdGhpcyBmaXhl
ZCwgTm9kZUpTIGJ1aWxkcyBqdXN0IGZpbmUgd2l0aCB0aGUKPiAgIGN1cnJlbnQgYXBwcm9hY2gu
Cj4KPiAgIEV2ZW4gdGhvdWdoIEkgZGlzbGlrZSBoYXZpbmcgdG8gYnVpbGQgUWVtdSwgaXQgaXMg
d2hhdCBPcGVuRW1iZWRkZWQKPiAgIGlzIGFsc28gZG9pbmcgdG8gYnVpbGQgTm9kZUpTLCBhbmQg
d2UgZG9uJ3QgaGF2ZSBtdWNoIGNob2ljZSBhcyB3ZQo+ICAgbmVlZCB0aG9zZSB0b29scyB0byBo
YXZlIHRoZSBzYW1lIGJpdG5lc3MgYXMgdGhlIHRhcmdldC4KPgo+ICAgaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2VjNTU4OTYxMWFkNzk2NjRiYzVi
ZjIzOGNjNzg2YTY1NDU4ZjNjOTMKPgo+ICAgWW91ciBwYXRjaCB0byBub3QgaW5zdGFsbCB0aGUg
ZXh0cmEgdG9vbHMgb2YgaG9zdC1ub2RlanMsIGFzIHRoZXkgYXJlCj4gICBubyBsb25nZXIgbmVl
ZGVkOiB3ZSB1c2UgdGhlIHRhcmdldCB0b29scywgYW5kIHJ1biB0aGVtIHVuZGVyIFFlbXUuCj4K
PiAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8x
ZmFjYjA5Yjk0YmY4MDZiMzAxODY4NTM5MTg1YzBmZjlkZGZmZWUyCj4KPiAgIFlvdXIgcGF0Y2gg
dG8gbm8gbG9uZ2VyIGJ1aWxkIGhvc3Qtbm9kZWpzIGFzIGEgZGVwZW5kZW5jeSBvZiBub2RlanMs
Cj4gICB1bmxlc3Mgc29tZSBleHRyYSBOUE0gbW9kdWxlcyBuZWVkIHRvIGJlIGluc3RhbGxlZCwg
aW4gd2hpY2ggY2FzZSBucG0KPiAgIGlzIG5lZWRlZC4KPgo+IFNvIGhlcmUsIE5vZGVKUyBub3cg
YnVpbGRzL3J1bnMgZmluZS4gQ291bGQgeW91IGNoZWNrIG9uIHlvdXIgc2lkZSBpZgo+IHRoYXQg
YWxzbyBzb2x2ZXMgeW91ciBwcm9ibGVtcz8KCkhleSwKCkknbGwgdGFrZSBhIGxvb2suCkFwb2xv
Z2llcyBmb3IgZ29pbmcgc2lsZW50IG9uIHRoaXMuIEkgbmVlZCB0byBzY2FsZSBkb3duIG15IHdv
cmsgbWF5YmUuCgpGdW5ueSBzdG9yeSAob3IuLi4gbWF5YmUgbm90IHNvIGZ1bm55KSwgdGhlIHBy
b2plY3Qgc3dpdGNoZWQgdG8gQU9TUCwKd2hpY2ggaXMgwq9cXyjjg4QpXy/CryAgKG5ldyB0byBt
ZSkuCgpJbiB0aGUgb2xkIGNvbnRleHQgKHdoZW4gd2Ugd2VyZSB1c2luZyBCUiksIHdlIHdlcmUg
YmFzaW5nIHNvbWUgd29yawpvbiB0b3Agb2YgUlBpNC4KQW5kIHdoZW4gSSBzZW50IHRoZSBpbml0
aWFsIHNldCB1cHN0cmVhbSwgSSB3YXMgdGVzdGluZy92YWxpZGF0aW5nCndpdGggUlBpNCAoMzIg
JiA2NCBiaXQgYnVpbGRzKSBkaXJlY3RseSBvbiB0aGUgQlIgdXBzdHJlYW0vbWFzdGVyCnRyZWUu
CmkuZS4gaSB3YXMgdXNpbmcgInJhc3BiZXJyeXBpNHtfNjR9X2RlZmNvbmZpZyIgKyBtYW51YWxs
eSBlbmFibGluZwpub2RlanMgKGFuZCB1c2luZyB0aGUgZXh0ZXJuYWwgTGluYXJvIEFSTSB0b29s
Y2hhaW5zIHRvIGdhaW4gc29tZQpzcGVlZCkuCgpJJ2xsIGRvIHNvbWUgYnVpbGRzIHdpdGggdGhl
c2UgMiBjb25maWd1cmF0aW9ucyBhbmQgY29tZSBiYWNrLgoKVGhhbmtzCkFsZXhhbmRydQoKPgo+
IEJlc3QgcmVnYXJkcywKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3du
ZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
