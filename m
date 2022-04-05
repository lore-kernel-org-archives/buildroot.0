Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F96C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 06:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B834098D;
	Tue,  5 Apr 2022 06:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34Kei9sr4yjd; Tue,  5 Apr 2022 06:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A392C40943;
	Tue,  5 Apr 2022 06:21:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26C231BF345
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 06:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14B2E60BD3
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 06:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syyFiFpUkmJn for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 06:20:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96AB360B00
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 06:20:55 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id e4so12444390oif.2
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 23:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D/iaB1WGjDZKgsOQHYJQjDPD3TjPOrtX6O11jXeXH6Q=;
 b=pUUmE601DKgS+RUhLDQjKMtpbiyKkProWbS10cxrDWN7ot3otxn8y9gYaTcwUc/y/z
 Ofb2aMvF1nQFj8FPOnpihXStwMgIbIgO3kuxUzujfAJeFUw3hYcRW8Rsa+E/Pv2nni0A
 JALfAB/dfBSTnJMOJ2aIamOpcNgIz//pX/tqOLNtKBdslNod7PW9yV58jQY8qzQUy+3V
 Qyxqb04n4O3joqUOSb6eydY/k6j77kyk8Lx4EyRgWdNV6W0YEPdcXlipp/abLl6x+SUM
 vAr2dBSJt0Vl4oaiC8qlzd7zVc9fOYkCy8LoCKduPeD5/FYZf4mRutZqSS36FkZFqT4z
 Ujcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D/iaB1WGjDZKgsOQHYJQjDPD3TjPOrtX6O11jXeXH6Q=;
 b=MipsN8426m7IQWMtry9ZKs4UINPc0fEfQxVBQd1qO6aQycCnQo/Q8fGcNTP7QeZD9n
 zmDPNrxf8Zb8PYWjQSPLndYZzpdJyepCVIJiP7fVeBuPiE5h8RiY7iknGm1BOs36ejaf
 PI5x+WYpBPKhdzt3cdsQ+Y0lOljr/p/0QjibPJac+Xs/JWGDyOsWz+BYcFnhc7nASqEF
 yeJpCiJBP/muoRBr1VXkF7CdbasI0cpfP++c0BH4q8ErexkyICIvLU8egBx/1WFHccCQ
 OUVRopNQ9RYc98T/bVpPmYOTdUROLJCwpDDAi9Dl2uc8ysLzEVsmqhGcEy6mvBFQDG86
 CtAg==
X-Gm-Message-State: AOAM5334NOIK2zWVEuEJYvJF8hPilRps3rHxQGMdhUQWaDBAfJjt25K1
 p9d08QVV97NIaJ/Yi6mvHtsjntr3i4FplUcvcZA/+KxEZmI=
X-Google-Smtp-Source: ABdhPJzh5FROrN4wfkrzWbmRP0/ZkfuvYHhnoE2lT4vCb+DqNUwEoF9x7s21TehF0Z/NhFn+9roGQYpWKjgm6073G38=
X-Received: by 2002:aca:f1d5:0:b0:2ec:eaab:eb9b with SMTP id
 p204-20020acaf1d5000000b002eceaabeb9bmr805192oih.228.1649139654534; Mon, 04
 Apr 2022 23:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <DU0P251MB0779CD19DBCAA7F149788B41E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
In-Reply-To: <DU0P251MB0779CD19DBCAA7F149788B41E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 5 Apr 2022 08:19:08 +0200
Message-ID: <CAPi7W83fzfin6_1KXV8BTy=AmcguoAK86mm4bFRrviFHBKmPbw@mail.gmail.com>
To: Tim Hammer <Tim.Hammer@orolia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGVhciBUaW0sCgpMZSBtYXIuIDUgYXZyLiAyMDIyIMOgIDA1OjU0LCBUaW0gSGFtbWVyIDxUaW0u
SGFtbWVyQG9yb2xpYS5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFN1biwgQXByIDAzLCAyMDIyIGF0
IDEyOjAzOjE4UE0gKzAyMDAsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gPiBVc2UgaW50ZXJu
YWwgYmluZCBhcyBkaGNwIGRvZXNuJ3QgYnVpbGQgc2luY2UgYnVtcCBvZiBiaW5kIHRvIHZlcnNp
b24KPiA+IDkuMTYuMjYgaW4gY29tbWl0IDhhZGVhZWM4YWZhY2JjNjgwZWRlYmFlOTE1MjRmNjE0
NDkyNmFjOTIgYW5kIHVwc3RyZWFtCj4gPiBkb2Vzbid0IHBsYW4gdG8gZml4IGl0IGFueSB0aW1l
IHNvb246Cj4gPiBodHRwczovL2dpdGxhYi5pc2Mub3JnL2lzYy1wcm9qZWN0cy9kaGNwLy0vaXNz
dWVzLzIzMyNub3RlXzI3Njg4Mwo+ID4KPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNs
dWRlcy9kaGNwZC5oOjkxLAo+ID4gICAgICAgICAgICAgICAgICBmcm9tIGN0cmFjZS5jOjI5Ogo+
ID4gLi4vaW5jbHVkZXMvb21hcGlwL2lzY2xpYi5oOjUxOjEwOiBmYXRhbCBlcnJvcjogaXNjL2Jv
b2xlYW4uaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ID4gICAgNTEgfCAjaW5jbHVkZSA8
aXNjL2Jvb2xlYW4uaD4KPiA+ICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+Cj4gPgo+
ID4gRml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9k
MThiMDA2ZGNlN2I0NjYzMWNlOGY0YzcyZmI5N2ViODYxOTkzOTM5Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+ICBwYWNrYWdlL2RoY3AvQ29uZmlnLmluIHwgIDEgLQo+ID4gIHBhY2thZ2UvZGhjcC9k
aGNwLm1rICAgfCAxOSArKysrKysrKysrKysrKysrLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2RoY3AvQ29uZmlnLmluIGIvcGFja2FnZS9kaGNwL0NvbmZpZy5pbgo+ID4gaW5kZXggNTE1
MDQwYzYxMi4uZTA3MDZlZmFmYiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvZGhjcC9Db25maWcu
aW4KPiA+ICsrKyBiL3BhY2thZ2UvZGhjcC9Db25maWcuaW4KPiA+IEBAIC0zLDcgKzMsNiBAQCBj
b25maWcgQlIyX1BBQ0tBR0VfREhDUAo+ID4gICAgICAgIyBmb3JrKCkKPiA+ICAgICAgIGRlcGVu
ZHMgb24gQlIyX1VTRV9NTVUKPiA+ICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfQlVTWUJP
WF9TSE9XX09USEVSUwo+ID4gLSAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0JJTkQKPiA+ICAgICAg
IGhlbHAKPiA+ICAgICAgICAgREhDUCByZWxheSBhZ2VudCBmcm9tIHRoZSBJU0MgREhDUCBkaXN0
cmlidXRpb24uCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZGhjcC9kaGNwLm1rIGIvcGFj
a2FnZS9kaGNwL2RoY3AubWsKPiA+IGluZGV4IDE4NzY1YTM2MzkuLmYxZTNjMjJmMWMgMTAwNjQ0
Cj4gPiAtLS0gYS9wYWNrYWdlL2RoY3AvZGhjcC5tawo+ID4gKysrIGIvcGFja2FnZS9kaGNwL2Ro
Y3AubWsKPiA+IEBAIC05LDggKzksMTAgQEAgREhDUF9TSVRFID0gaHR0cHM6Ly9mdHAuaXNjLm9y
Zy9pc2MvZGhjcC8kKERIQ1BfVkVSU0lPTikKPiA+ICBESENQX0lOU1RBTExfU1RBR0lORyA9IFlF
Uwo+ID4gIERIQ1BfTElDRU5TRSA9IE1QTC0yLjAKPiA+ICBESENQX0xJQ0VOU0VfRklMRVMgPSBM
SUNFTlNFCj4gPiAtREhDUF9ERVBFTkRFTkNJRVMgPSBiaW5kIGhvc3QtZ2F3awo+ID4gK0RIQ1Bf
REVQRU5ERU5DSUVTID0gaG9zdC1nYXdrCj4gPiAgREhDUF9DUEVfSURfVkVORE9SID0gaXNjCj4g
PiArIyBpbnRlcm5hbCBiaW5kIGRvZXMgbm90IHN1cHBvcnQgcGFyYWxsZWwgYnVpbGRzLgo+ID4g
K0RIQ1BfTUFLRSA9ICQoTUFLRTEpCj4gPgo+ID4gICMgdXNlIGxpYnRvb2wtZW5hYmxlZCBjb25m
aWd1cmUuYWMKPiA+ICBkZWZpbmUgREhDUF9MSUJUT09MX0FVVE9SRUNPTkYKPiA+IEBAIC0yMSwx
MSArMjMsMTIgQEAgREhDUF9DT05GX0VOViA9IFwKPiA+ICAgICAgIENQUEZMQUdTPSctRF9QQVRI
X0RIQ1BEX0NPTkY9XCIvZXRjL2RoY3AvZGhjcGQuY29uZlwiIFwKPiA+ICAgICAgICAgICAgICAg
LURfUEFUSF9ESENMSUVOVF9DT05GPVwiL2V0Yy9kaGNwL2RoY2xpZW50LmNvbmZcIicgXAo+ID4g
ICAgICAgQ0ZMQUdTPSckKFRBUkdFVF9DRkxBR1MpIC1ESVNDX0NIRUNLX05PTkU9MScKPiA+ICtE
SENQX0JJTkRfRVhUUkFfQ09ORklHID0gQlVJTERfQ0M9JyQoVEFSR0VUX0NDKScKPiA+Cj4KPiBU
aGUgb25seSBwbGFjZSBCVUlMRF9DQyBpcyB1c2VkIGluIHRoZSBidW5kbGVkIGJpbmQtOS4xMSBp
cyB0byBidWlsZCBsaWIvZG5zL2dlbiwgd2hpY2ggbmVlZHMgdG8gcnVuIG9uIHRoZSBob3N0Lgo+
IFNvIHRoaXMgc2hvdWxkIGJlIHRoZSBob3N0IGNvbXBpbGVyLCBub3QgdGhlIHRhcmdldC4KPiBJ
IGRvIG5vdCBrbm93IHRoZSBiZXN0L2NvcnJlY3Qgd2F5IHRvIGluZGljYXRlIHRoaXMuIFRvIGdl
dCBwYXN0IHRoZSBpc3N1ZSBJIGNoYW5nZWQgaXQgdG8gJy91c3IvYmluL2djYycuLi4KClRoYW5r
cyBmb3Igc3BvdHRpbmcgdGhpcywgSSBiYXNpY2FsbHkgY29weS9wYXN0ZWQgd2hhdCB3YXMgZG9u
ZSBpbiBiaW5kLm1rLgpUaGUgY29ycmVjdCB3YXkgdG8gZG8gdGhpcyBpcyB0byB1c2UgJChIT1NU
X0NDKSBpbnN0ZWFkIG9mICQoVEFSR0VUX0NDKS4KCkhvd2V2ZXIsIEkgYXNzdW1lIHRoYXQgQlVJ
TERfQ0MgYW5kIEJVSUxEX0NGTEFHUyBpbiBiaW5kLm1rIHNob3VsZAphbHNvIGJlIHVwZGF0ZWQ/
CgpDb3VsZCB5b3Ugc2VuZCB0aG9zZSB0d28gcGF0Y2hlcyAoZGhjcCBhbmQgYmluZCkgdG8gdGhl
IGJ1aWxkcm9vdAptYWlsaW5nIG9yIGRvIHlvdSBwcmVmZXIgdGhhdCBJIHNlbmQgdGhlbT8KCj4K
PiAuVGltCj4gVGltIEQuIEhhbW1lcgo+IHRpbS5oYW1tZXJAb3JvbGlhLmNvbQo+Cj4gPiAgREhD
UF9DT05GX0VOViArPSBhY19jdl9wcm9nX0FXSz0kKEhPU1RfRElSKS9iaW4vZ2F3awo+ID4KPiA+
ICBESENQX0NPTkZfT1BUUyA9IFwKPiA+IC0gICAgIC0td2l0aC1saWJiaW5kPSQoU1RBR0lOR19E
SVIpL3VzciBcCj4gPiArICAgICAtLXdpdGgtYmluZC1leHRyYS1jb25maWc9IiQoREhDUF9CSU5E
X0VYVFJBX0NPTkZJRykiIFwKPiA+ICAgICAgIC0td2l0aC1yYW5kb21kZXY9L2Rldi9yYW5kb20g
XAo+ID4gICAgICAgLS13aXRoLXNydi1sZWFzZS1maWxlPS92YXIvbGliL2RoY3AvZGhjcGQubGVh
c2VzIFwKPiA+ICAgICAgIC0td2l0aC1zcnY2LWxlYXNlLWZpbGU9L3Zhci9saWIvZGhjcC9kaGNw
ZDYubGVhc2VzIFwKPiA+IEBAIC0zOCw4ICs0MSwxOCBAQCBESENQX0NPTkZfT1BUUyA9IFwKPiA+
ICAgICAgIC0td2l0aC1yZWxheS1waWQtZmlsZT0vdmFyL3J1bi9kaGNyZWxheS5waWQgXAo+ID4g
ICAgICAgLS13aXRoLXJlbGF5Ni1waWQtZmlsZT0vdmFyL3J1bi9kaGNyZWxheTYucGlkCj4gPgo+
ID4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfWkxJQikseSkKPiA+ICtESENQX0JJTkRfRVhUUkFfQ09O
RklHICs9IC0td2l0aC16bGliCj4gPiArREhDUF9ERVBFTkRFTkNJRVMgKz0gemxpYgo+ID4gK2Vs
c2UKPiA+ICtESENQX0JJTkRfRVhUUkFfQ09ORklHICs9IC0td2l0aG91dC16bGliCj4gPiArZW5k
aWYKPiA+ICsKPiA+ICtpZmVxICgkKEJSMl9UT09MQ0hBSU5fSEFTX0xJQkFUT01JQykseSkKPiA+
ICtESENQX0NPTkZfRU5WICs9IExJQlM9LWxhdG9taWMKPiA+ICtlbmRpZgo+ID4gKwo+ID4gIGlm
ZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQo+ID4gLURIQ1BfQ09ORl9FTlYgKz0gTElCUz0iYCQo
U1RBR0lOR19ESVIpL3Vzci9iaW4vYmluZDktY29uZmlnIC0tbGlicyBiaW5kOWAiCj4gPiAgREhD
UF9DT05GX09QVFMgKz0gLS1kaXNhYmxlLWxpYnRvb2wKPiA+ICBlbHNlCj4gPiAgREhDUF9QT1NU
X0VYVFJBQ1RfSE9PS1MgKz0gREhDUF9MSUJUT09MX0FVVE9SRUNPTkYKPiA+IC0tCj4gPiAyLjM1
LjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo+CgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
