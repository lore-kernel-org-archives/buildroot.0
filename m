Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A51CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 09:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B5AE60ACB;
	Tue, 28 Dec 2021 09:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CsmrMK5wI_hW; Tue, 28 Dec 2021 09:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC6C60ABF;
	Tue, 28 Dec 2021 09:47:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A58461BF5A2
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 09:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91357403E0
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 09:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEa6PhNuO0hB for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 09:47:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F2334032E
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 09:47:43 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id bm14so71656703edb.5
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 01:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X/fDBNt1Z6tYyDQrmktgSTxI+Nck8NCUp5F4FTBUDeM=;
 b=ECG51/BhLI4QbpZ4x6+u7y58lrn+2OWOVtZECmGwDddhhMlG9JSL7OP9c4c3AmX1pF
 f6fnlP2seoZnMwjckW1GpjXKIMhl8lYhqm+zS9/AkFcZM1UUMQ31Z8pl5I09T5+3GIYE
 arnNz80e/CXWPp4I7hT4VBlo4OOLyjAXaYUqa9X01GtqjPx2Ln6TSROfyqoWoRbUVmgj
 C+JYkbypbryCRjv1nXG4lf7oftKk9nCm/voyWfzsj+ys2qKgw9zGLF1gKWfoZOvtNxKF
 Gw9VwaSsl0B3zgxz/s2L26gU0t2Z9gzfJC89ULG/KjzgX1RdwhAabGxK6XFb/YyIkDM2
 Bjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X/fDBNt1Z6tYyDQrmktgSTxI+Nck8NCUp5F4FTBUDeM=;
 b=L2FcnGBZca68Dv5nYtMi4WoTqF1OQQQzhT6SQPsEqW9uK75FIUyZDtVme9//Ob5IGU
 Do+FPLZ5pch/JaFs+slgq9OcNL5R7is4FLn1rIwRFOXtQOKjBRko94T6uhzWQdhHxtV6
 OT1K+MQZV1Wbtzdz9E0TXea2l5oBPSUNKeBVCpbNj+HzrR/DDrdJvHXipWvrq2Q3iCFy
 Uah7b7+B9g5ECdh/eUr/++05PkGGonI7DhMJmm7MaBKx2PvipuHuxnoi+KkIHM6Q3qop
 n4iFIGNHaP1rV/N3HbiZjmvqSl5sPl1BrhP1IDYS9h/zDx/H3b6b71ObUxag2SBQvqu8
 Veyg==
X-Gm-Message-State: AOAM533ze1BK889HohK1l1Hvi3zX/p2HP8CRT97RbY06gjtXmrB8rSfj
 7z5Acf/174AebzvfiaN7A9r53T5BeoLxn/rorI0=
X-Google-Smtp-Source: ABdhPJyOAbMuZb6SWnCIQg8O8gwmMY7cfV+IQMWRShZMRh1gKDbGbFnVpVfloVycZ41LmIt5iVTxo2WmZk97sFRaehk=
X-Received: by 2002:a05:6402:2813:: with SMTP id
 h19mr19984499ede.365.1640684861158; 
 Tue, 28 Dec 2021 01:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20211218231155.666025-1-fontaine.fabrice@gmail.com>
 <20211219091016.GE2603@scaer>
 <aab3aac5-1077-b8c7-ff22-8be756e73b61@benettiengineering.com>
In-Reply-To: <aab3aac5-1077-b8c7-ff22-8be756e73b61@benettiengineering.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Dec 2021 10:46:50 +0100
Message-ID: <CAPi7W81m=9hUf3qyJ7FNNK5R6cc41A_FV8DXtxAKo6yfCpKwDg@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/imagemagick: host SVG support
 needs host gcc >= 4.9
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKTGUgbWFyLiAyOCBkw6ljLiAyMDIxIMOgIDEwOjQ0LCBHaXVsaW8gQmVuZXR0
aQo8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gYSDDqWNyaXQgOgo+Cj4g
SGkgRmFicmljZSwgWWFubiwKPgo+IE9uIDE5LzEyLzIxIDEwOjEwLCBZYW5uIEUuIE1PUklOIHdy
b3RlOgo+ID4gRmFicmljZSwgQWxsLAo+ID4KPiA+IE9uIDIwMjEtMTItMTkgMDA6MTEgKzAxMDAs
IEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+ID4+IGhvc3QgZ2NjID49IDQuOSBpcyBu
ZWVkZWQgc2luY2UgYnVtcCBvZiBoYXJmYnV6eiB0byB2ZXJzaW9uIDMuMS4yIGluCj4gPj4gY29t
bWl0IDY4NjE5MzNkMjIwMDZmYmU4Yzk2MWE0MTUwNmJlYWM4MjY4ODFmMzMgdG8gYXZvaWQgdGhl
IGZvbGxvd2luZwo+ID4+IGJ1aWxkIGZhaWx1cmU6Cj4gPj4KPiA+PiBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gLi4vc3JjL2hiLXNlcmlhbGl6ZS5oaDozNjowLAo+ID4+ICAgICAgICAgICAgICAgICAg
IGZyb20gLi4vc3JjL2hiLW1hY2hpbmVyeS5oaDozNywKPiA+PiAgICAgICAgICAgICAgICAgICBm
cm9tIC4uL3NyYy9oYi1jb21tb24uY2M6MzA6Cj4gPj4gLi4vc3JjL2hiLW1hcC5oaDo2NzoxODog
ZXJyb3I6ICdpc190cml2aWFsbHlfY29weWFibGUnIGlzIG5vdCBhIG1lbWJlciBvZiAnc3RkJwo+
ID4+ICAgICBzdGF0aWNfYXNzZXJ0IChzdGQ6OmlzX3RyaXZpYWxseV9jb3B5YWJsZTxLPjo6dmFs
dWUsICIiKTsKPiA+PiAgICAgICAgICAgICAgICAgICAgXgo+ID4KPiA+IEkgcmVwbGllZCB0byB0
aGUgd3JvbmcgbWFpbCBlYXJsaWVyLCBzbyBGVFIgSSdsbCBwYXN0ZSBpdCBhZ2FpbiBiZWxvdy4K
PiA+IFNvcnJ5IGZvciB0aGUgbm9pc2UuLi4KPiA+Cj4gPiBXaGVyZSBkaWQgeW91IHNlZSB0aGF0
IGdjYyA0LjkgaGFkIGl0PyBJIGxvb2tlZCBhdCB0aGUgZ2NjLTRfOV8wLXJlbGVhc2UKPiA+IHRh
ZyBpbiB0aGUgZ2NjIHRyZWUsIGFuZCBpdCBzdGF0ZXM6Cj4gPgo+ID4gICAgICAkIGdpdCBncmVw
IGlzX3RyaXZpYWxseV9jb3B5YWJsZQo+ID4gICAgICBbLi4uXQo+ID4gICAgICBsaWJzdGRjKyst
djMvaW5jbHVkZS9zdGQvdHlwZV90cmFpdHM6ICAvLyBpc190cml2aWFsbHlfY29weWFibGUKPiA+
IChzdGlsbCB1bmltcGxlbWVudGVkKQo+ID4KPiA+IFdoZXJlYXMgZ2NjIDUgaGFzIGEgcHJvcGVy
IGltcGxlbWVudGF0aW9uOgo+ID4KPiA+ICAgICAgJCBnaXQgZ3JlcCAtQTEgJ2lzX3RyaXZpYWxs
eV9jb3B5YWJsZScgbGlic3RkYysrLXYzL2luY2x1ZGUvc3RkL3R5cGVfdHJhaXRzCj4gPiAgICAg
IGxpYnN0ZGMrKy12My9pbmNsdWRlL3N0ZC90eXBlX3RyYWl0czogIC8vIGlzX3RyaXZpYWxseV9j
b3B5YWJsZQo+ID4gICAgICBsaWJzdGRjKystdjMvaW5jbHVkZS9zdGQvdHlwZV90cmFpdHMtICB0
ZW1wbGF0ZTx0eXBlbmFtZSBfVHA+Cj4gPiAgICAgIGxpYnN0ZGMrKy12My9pbmNsdWRlL3N0ZC90
eXBlX3RyYWl0czogICAgc3RydWN0IGlzX3RyaXZpYWxseV9jb3B5YWJsZQo+ID4gICAgICBsaWJz
dGRjKystdjMvaW5jbHVkZS9zdGQvdHlwZV90cmFpdHM6ICAgIDogcHVibGljIGludGVncmFsX2Nv
bnN0YW50PGJvb2wsIF9faXNfdHJpdmlhbGx5X2NvcHlhYmxlKF9UcCk+Cj4gPiAgICAgIGxpYnN0
ZGMrKy12My9pbmNsdWRlL3N0ZC90eXBlX3RyYWl0cy0gICAgeyB9Owo+ID4KPiA+IEkgc2VlIHRo
YXQgNjg2MTkzM2QyMjAwIChwYWNrYWdlL2hhcmZidXp6OiBidW1wIHRvIHZlcnNpb24gMy4xLjIp
IHN0YXRlZAo+ID4gdGhhdCB0aGUgcmVxdWlyZW1lbnQgb24gdGhlIGdjYyB2ZXJzaW9uIHdhcyBi
dW1wZWQgdG8gNC45IGZyb20gNC44LCBidXQKPiA+IEkgYW0gbm90IHN1cmUgaG93IHRoYXQgY2Fu
IGJlLi4uCj4KPiBJbmRlZWQgbm93IGl0IGNhbWUgb3V0IGdjYyA1IGlzIG5lZWRlZC4KPgo+ID4g
R2l1bGlvLCB3aGVyZSBkaWQgeW91IGdldCB0aGUgaW5mbyB0aGF0IGdjYyA0Ljkgd2FzIHJlcXVp
cmVkIChhbmQgbm90IGEKPiA+IGhpZ2hlciB2ZXJzaW9uKT8KPgo+IEhvbmVzdGx5IG9uIHRyaWFs
IGFuZCBlcnJvciB3aXRoIHRhcmdldCB0b29sY2hhaW4sIGJlY2F1c2Ugd2l0aCBoYXJmYnV6ego+
IDMuMS4yIGNhc2UgaXQgd2FzIG9ubHkgdGFyZ2V0IHJlbGF0ZWQuIEFuZCBub3cgSSBrbm93IEkg
bmVlZCB0byBjaGVjawo+IGxpYnN0ZGMrKyBnaXQgaW5zdGVhZCh0aGFuayB5b3UgZm9yIHBvaW50
aW5nIG1lKS4KPgo+IFNvIEkndmUgc2VudCB0aGUgcGF0Y2ggZm9yIGhhcmZidXp6IDMuMi4wIHdp
dGggYm90aCBob3N0IGFuZCB0YXJnZXQgZ2NjCj4gNSBkZXBlbmRlbmN5Ogo+IGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMTEyMjgwMDIyMjcu
MTU3NDctMS1naXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tLwo+Cj4gVGhhdCBz
aG91bGQgZml4IHRoZSBwcm9ibGVtLgpJIGFzc3VtZSB0aGF0IHlvdSdsbCBzZW5kIGEgdjMgb2Yg
dGhlIGFib3ZlIHBhdGNoIGFzIHRoZSB2MiBkb2Vzbid0CnVwZGF0ZSBpbWFnZW1hZ2ljay4gQW0g
SSByaWdodD8KPgo+IEJlc3QgcmVnYXJkcwo+IC0tCj4gR2l1bGlvIEJlbmV0dGkKPiBCZW5ldHRp
IEVuZ2luZWVyaW5nIHNhcwo+Cj4gPiBSZWdhcmRzLAo+ID4gWWFubiBFLiBNT1JJTi4KPiA+Cj4g
Pj4gRml4ZXM6Cj4gPj4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
Lzg5ZTExOTRjMTY1OWQ3ZTFhZjlkYjhmZmU1ZmVlZTc3MGM0NDhmNzYKPiA+Pgo+ID4+IFNpZ25l
ZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+
ID4+IC0tLQo+ID4+ICAgcGFja2FnZS9pbWFnZW1hZ2ljay9Db25maWcuaW4uaG9zdCB8IDQgKysr
Kwo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvaW1hZ2VtYWdpY2svQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL2ltYWdl
bWFnaWNrL0NvbmZpZy5pbi5ob3N0Cj4gPj4gaW5kZXggNjcxYjA5OTVkYy4uZmUwYWQ5YTc0OCAx
MDA2NDQKPiA+PiAtLS0gYS9wYWNrYWdlL2ltYWdlbWFnaWNrL0NvbmZpZy5pbi5ob3N0Cj4gPj4g
KysrIGIvcGFja2FnZS9pbWFnZW1hZ2ljay9Db25maWcuaW4uaG9zdAo+ID4+IEBAIC0xNyw2ICsx
Nyw3IEBAIGlmIEJSMl9QQUNLQUdFX0hPU1RfSU1BR0VNQUdJQ0sKPiA+PiAgIGNvbmZpZyBCUjJf
UEFDS0FHRV9IT1NUX0lNQUdFTUFHSUNLX1NWRwo+ID4+ICAgICAgYm9vbCAiU1ZHIHN1cHBvcnQi
Cj4gPj4gICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfQVJDSF9TVVBQT1JU
UyAjIGhvc3QtbGlicnN2Zwo+ID4+ICsgICAgZGVwZW5kcyBvbiBCUjJfSE9TVF9HQ0NfQVRfTEVB
U1RfNF85ICMgaG9zdC1wYW5nbyAtPiBob3N0LWhhcmZidXp6Cj4gPj4gICAgICBoZWxwCj4gPj4g
ICAgICAgIFNheSAneScgaGVyZSBpcyB5b3UgbmVlZCBJbWFnZU1hZ2ljayB0b29scyAobGlrZSBj
b252ZXJ0KQo+ID4+ICAgICAgICB0byBzdXBwb3J0IFNWRy4KPiA+PiBAQCAtMjQsNCArMjUsNyBA
QCBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9JTUFHRU1BR0lDS19TVkcKPiA+PiAgICAgICAgVGhp
cyBpcyBub3QgZW5hYmxlZCBieSBkZWZhdWx0LCBhcyBpdCBicmluZ3MgcXVpdGUgYSBmZXcKPiA+
PiAgICAgICAgZXh0cmEgZGVwZW5kZW5jaWVzLCBhbmQgdGh1cyBleHRyYSBidWlsZCB0aW1lLgo+
ID4+Cj4gPj4gK2NvbW1lbnQgIlNWRyBzdXBwb3J0IG5lZWRzIGEgdG9vbGNoYWluIHcvIGhvc3Qg
Z2NjID49IDQuOSIKPiA+PiArICAgIGRlcGVuZHMgb24gIUJSMl9IT1NUX0dDQ19BVF9MRUFTVF80
XzkKPiA+PiArCj4gPj4gICBlbmRpZgo+ID4+IC0tCj4gPj4gMi4zMy4wCj4gPj4KPiA+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiA+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4+IGh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ID4KPgpCZXN0
IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
