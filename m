Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555DFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 11:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 012E441522;
	Wed, 15 Jun 2022 11:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRp1P--lADeG; Wed, 15 Jun 2022 11:52:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92B06410A9;
	Wed, 15 Jun 2022 11:52:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC2231BF580
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 11:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B814B81B7B
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 11:52:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vc0gOmJcbQQG for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 11:52:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68470814B6
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 11:52:08 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id h187so15138132oif.4
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fAS44329ayZHO0TIoUriS08uZMbUHXEP8N28OqQYwi0=;
 b=WUXwJtKdMb9VltEeHW2HOkjo06ecNaed10qvzBY7YOBt75KLuAqsqlFiKam5FLbC2+
 xiR1YOF0GZXNMhvZixzGjL3jIxllloTM+WXdkqiTR/0OYKiNdWi8IR27yzv75pSc6swl
 yFS1LWmqZ+1tBZBo83me6zSB7p7fs/UfbfanS1f2PMgK5gD4CvrUovDLzHEEJf4Ob/D6
 6ijcIgeytPH+9sLM3KmYbx2kZbWbp+2Pk4RxCZqqAyoJE+tofRxC3cpUNvpCTii9nc6v
 95NlFWIlJ+ITAWlAfWGJ1i7g/BgSh2FPyLPV8XhvMthmdcqYwecEgIgzFZYabmR7xnO9
 AU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fAS44329ayZHO0TIoUriS08uZMbUHXEP8N28OqQYwi0=;
 b=P6TQRJWiRPdzwJxW+JjXaguXPMNOMCBznCQkxTUATaNvbugKXRmsu1xTO6VEApHipN
 iXmxHNeCkDQ5AoqmEbJoRReW6u++KfsXlUyv3Avf9A6gtQe/NhXGX8N5txNfi3pZaFGQ
 rsLR+2Amk03561TEaw40I07FV/qmSzWnvkFt+ettSqcL2BNMcVBrgkprHZMbSLnyRXw4
 IpEUWqUewqgSAjozVlE5hg8kobGZR4VmN3GnuyZYUyraTR36+hhHmt4dPFlQ8wewvhlC
 o0/UpmHC5scO+bEBJLFvGqonHNuVxMK1vHc/76EdhAjx65ixw5+zdoyIcPUBAYHAkfQ/
 hnxQ==
X-Gm-Message-State: AOAM533TTTX++/ARjjh28ExB2T7uW+bF/pG3Vvz0SK1U8j7oERLipLcM
 IrK8eDQYT7UEH6ayTRqEbEbBVExqn5NMS3PzuyU=
X-Google-Smtp-Source: ABdhPJwspuWJr8cZi7ZhHMq8Sy7TaTEvaO+oIb8chKXkheufQtsGWEc2Zn8mhoZmWFeJmUKmj0lWOpQQQ9FTE7uSVYQ=
X-Received: by 2002:a05:6808:d46:b0:32f:3447:edcf with SMTP id
 w6-20020a0568080d4600b0032f3447edcfmr4752504oik.148.1655293927435; Wed, 15
 Jun 2022 04:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220615074543.41437-1-dimi@tpm.dev>
 <20220615075028.41612-1-dimi@tpm.dev>
 <2c1f96f051686a661c0a6a1fbba07e40@tpm.dev>
 <CAPi7W82YatKcPLD7+rHDKhzngo_=cMnSG7GjV8bCebCb7iz2Cw@mail.gmail.com>
 <b747c1dffb31252f1567d80e88707f2f@tpm.dev>
In-Reply-To: <b747c1dffb31252f1567d80e88707f2f@tpm.dev>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 15 Jun 2022 13:51:55 +0200
Message-ID: <CAPi7W81C3a3vp11D8+6=tWjdjodTfnuZzmM4drxoTEa54KC2vA@mail.gmail.com>
To: Dimi Tomov <dimi@tpm.dev>
Subject: Re: [Buildroot] [PATCH v4 1/1] package/wolftpm: Add config options
 for TPM 2.0 extra capabilities
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiAxNSBqdWluIDIwMjIgw6AgMTI6NTcsIERpbWkgVG9tb3YgPGRpbWlAdHBtLmRldj4g
YSDDqWNyaXQgOgo+Cj4gSGkgRmFicmljZSwKPgo+IFRoYW5rIHlvdSBmb3IgdGhpcyBpbnB1dC4K
Pgo+IFdoYXQgZG8geW91IG1lYW4gYnkgc3VwZXJzZWRlZD8gSSBhbSB1c2luZyAtLWluLXJlcGx5
LXRvLiBIb3cgYXJlIHlvdQo+IHR5cGljYWxseSBzZW5kaW5nIGZvbGxvdy11cCBwYXRjaCB2ZXJz
aW9ucz8KCkknbSBub3QgdXNpbmcgLS1pbi1yZXBseS10by4KSSdtIG1hbnVhbGx5IGNoYW5naW5n
IHRoZSBzdGF0dXMgaW4KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxk
cm9vdC4KCkkgYXNzdW1lIHRoYXQgdGhlcmUgaXMgYW4gaXNzdWUgd2l0aCB0aGUgSUQgdGhhdCB5
b3UgcHJvdmlkZSB0bwotLWluLXJlcGx5LXRvIGFzIGJ1aWxkcm9vdCBtYW51YWwgc3BlY2lmaWVz
IHRoYXQgIllvdSBjYW4gYWxzbyBhZGQgdGhlCi0taW4tcmVwbHktdG8gPG1lc3NhZ2UtaWQ+IG9w
dGlvbiB3aGVuIHN1Ym1pdHRpbmcgYSBwYXRjaCB0byB0aGUKbWFpbGluZyBsaXN0LiBUaGUgaWQg
b2YgdGhlIG1haWwgdG8gcmVwbHkgdG8gY2FuIGJlIGZvdW5kIHVuZGVyIHRoZQoiTWVzc2FnZSBJ
ZCIgdGFnIG9uIHBhdGNod29yay4gVGhlIGFkdmFudGFnZSBvZiBpbi1yZXBseS10byBpcyB0aGF0
CnBhdGNod29yayB3aWxsIGF1dG9tYXRpY2FsbHkgbWFyayB0aGUgcHJldmlvdXMgdmVyc2lvbiBv
ZiB0aGUgcGF0Y2ggYXMKc3VwZXJzZWRlZC4iCmJ1dCBwcmV2aW91cyBpdGVyYXRpb25zIG9mIHlv
dXIgcGF0Y2ggYXJlIHN0aWxsIHNldCBhcyBOZXcgaW4gcGF0Y2h3b3JrOgpodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNjE1MDczMDUzLjQw
MzQ3LTEtZGltaUB0cG0uZGV2LwoKPgo+IEkgdGhvdWdodCB3ZSBhcmUgdXNpbmcgODAgY2hhcnMg
cGVyIGxpbmUgbGltaXQsIEkgd2lsbCB1cGRhdGUgdGhlIHBhdGNoCj4gd2l0aCA3MiBjaGFycyBw
ZXIgbGluZSBsaW1pdC4KCmhlbHAgdGV4dCBtdXN0IGJlIGxvd2VyIHRoYW4gNzIgY2hhcnMgaW4g
Q29uZmlnLmluLgoKCj4KPiBSZWdhcmRzLAo+Cj4gRGltaQo+Cj4gT24gMjAyMi0wNi0xNSAxMToz
NCBBTSwgRmFicmljZSBGb250YWluZSB3cm90ZToKPiA+IEhpIERpbWksCj4gPgo+ID4gTGUgbWVy
LiAxNSBqdWluIDIwMjIgw6AgMDk6NTMsIERpbWkgVG9tb3YgPGRpbWlAdHBtLmRldj4gYSDDqWNy
aXQgOgo+ID4+Cj4gPj4gSGkgVGhvbWFzLAo+ID4+Cj4gPj4gVGhpcyBwYXRjaCBhZGRzIG5ldyBw
YWNrYWdlIG9wdGlvbnMgdGhhdCBlbmFibGUgZXh0cmEgVFBNIDIuMAo+ID4+IGNhcGFiaWxpdGll
cy4KPiA+Pgo+ID4+IHBzOiBQbGVhc2UgZXhjdXNlIHRoZSBleHRyYSB2ZXJzaW9ucywgaXQgc2Vl
bXMgSSBhbSBzdGlsbCBzbGVlcHkgdGhpcwo+ID4+IG1vcm5pbmcuCj4gPj4KPiA+PiBUaGFua3Ms
Cj4gPj4gRGltaQo+ID4+IC0tCj4gPj4gRm91bmRlciBvZiBUUE0uZGV2Cj4gPj4KPiA+PiBPbiAy
MDIyLTA2LTE1IDEwOjUwIEFNLCBEaW1pIFRvbW92IHdyb3RlOgo+ID4+ID4gRnJvbTogRGltaXRh
ciBUb21vdiA8ZGltaUB0cG0uZGV2Pgo+ID4+ID4KPiA+PiA+IFNvbWUgVFBNIDIuMCBjaGlwcyBv
ZmZlciBleHRyYSBjYXBhYmlsaXRpZXMuIFRoaXMgcGF0Y2ggYWRkcyBhZGRpdGlvbmFsCj4gPj4g
PiBjb25maWd1cmF0aW9uIG9wdGlvbnMgdG8gdGhlIHdvbGZ0cG0gcGFja2FnZSwgc28gc3VjaCBj
YXBhYmlsaXRpZXMgY2FuCj4gPj4gPiBiZSBhdmFpbGFibGUgdG8gdGhlIHVzZXIuIEZvciBleGFt
cGxlLCB0aGUgU1RNaWNyb2VsZWN0cm9uaWNzIFNUMzMgYW5kCj4gPj4gPiBOdXZvdG9uIE5QQ1Q3
NTAgYm90aCBvZmZlciBzZWN1cmUgR1BJTy4gRHVlIHRvIGNoaXAgZGlmZmVyZW5jZXMsCj4gPj4g
PiB3b2xmVFBNCj4gPj4gPiByZXF1aXJlcyBleHBsaWNpdCBjb25maWd1cmF0aW9uIG9wdGlvbnMg
dG8gZW5hYmxlIHRoZSBleHRyYQo+ID4+ID4gY2FwYWJpbGl0aWVzLgo+ID4+ID4KPiA+PiA+IFNp
Z25lZC1vZmYtYnk6IERpbWl0YXIgVG9tb3YgPGRpbWlAdHBtLmRldj4KPiA+PiA+IC0tLQo+ID4+
ID4gQ2hhbmdlcyB2MyAtPiB2NDoKPiA+PiA+IC0gRml4IGNvbW1pdCBtZXNzYWdlLiBGb3Igc29t
ZSByZWFzb24gdGhlIHVwZGF0ZSB3YXMgbm90IGluY2x1ZGVkIGluCj4gPj4gPiBwYXRjaCB2My4K
PiA+PiA+IENoYW5nZXMgdjIgLT4gdjM6Cj4gPj4gPiAtIEJldHRlciBjb21taXQgbWVzc2FnZQo+
ID4+ID4gQ2hhbmdlcyB2MSAtPiB2MjoKPiA+PiA+IC0gUmVtb3ZlIGEgbm90IG5lZWRlZCBwYWNr
YWdlIGRlc2NyaXB0aW9uIGNoYW5nZQo+ID4KPiA+IFlvdSBzaG91bGQgc2V0IHByZXZpb3VzIGl0
ZXJhdGlvbnMgYXMgc3VwZXJzZWRlZCBpbiBwYXRjaHdvcms6Cj4gPiBodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvCj4gPgo+ID4+ID4gLS0tCj4gPj4g
PiAgcGFja2FnZS93b2xmdHBtL0NvbmZpZy5pbiAgfCAxMiArKysrKysrKysrKysKPiA+PiA+ICBw
YWNrYWdlL3dvbGZ0cG0vd29sZnRwbS5tayB8IDEyICsrKysrKysrKysrKwo+ID4+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+ID4+ID4KPiA+PiA+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3dvbGZ0cG0vQ29uZmlnLmluIGIvcGFja2FnZS93b2xmdHBtL0NvbmZpZy5pbgo+ID4+
ID4gaW5kZXggMGI5NjRjM2Q3ZS4uMzAyN2I3ZTMzZCAxMDA2NDQKPiA+PiA+IC0tLSBhL3BhY2th
Z2Uvd29sZnRwbS9Db25maWcuaW4KPiA+PiA+ICsrKyBiL3BhY2thZ2Uvd29sZnRwbS9Db25maWcu
aW4KPiA+PiA+IEBAIC0yMyw2ICsyMywxOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV09MRlRQTV9X
T0xGQ1JZUFQKPiA+PiA+ICAgICAgICAgZW5jcnlwdGlvbi4gRGlzYWJsaW5nIHRoaXMgb3B0aW9u
IGlzIG5vdCByZWNvbW1lbmRlZCBhcyBpdAo+ID4+ID4gICAgICAgICBjb3VsZCBjcmVhdGUgYSBz
ZWN1cml0eSBicmVhY2ggaW4gbW9zdCBlbnZpcm9ubWVudHMuCj4gPj4gPgo+ID4+ID4gK2NvbmZp
ZyBCUjJfUEFDS0FHRV9XT0xGVFBNX1NUMzMKPiA+PiA+ICsgICAgIGJvb2wgInN0MzMiCj4gPj4g
PiArICAgICBkZWZhdWx0IG4KPiA+PiA+ICsgICAgIGhlbHAKPiA+PiA+ICsgICAgICAgRW5hYmxl
IHN1cHBvcnQgb2YgVFBNIDIuMCBleHRyYSBmdW5jdGlvbmFsaXR5IG9mZmVyZWQgYnkgdGhlCj4g
Pj4gPiBTVE1pY3JvZWxlY3Ryb25pY3MgU1QzMyBjaGlwLgo+ID4KPiA+IFRoaXMgbGluZSBpcyB0
b28gbG9uZyAoaXQgc2hvdWxkIGJlIHdyYXBwZWQgdG8gNzIgY2hhcmFjdGVycykuCj4gPiBtYWtl
IGNoZWNrLXBhY2thZ2Ugd2lsbCB3YXJuIHlvdSBhYm91dCBpdAo+ID4KPiA+PiA+ICsKPiA+PiA+
ICtjb25maWcgQlIyX1BBQ0tBR0VfV09MRlRQTV9OVVZPVE9OCj4gPj4gPiArICAgICBib29sICJu
cGN0NzUwIgo+ID4+ID4gKyAgICAgZGVmYXVsdCBuCj4gPj4gPiArICAgICBoZWxwCj4gPj4gPiAr
ICAgICAgIEVuYWJsZSBzdXBwb3J0IG9mIFRQTSAyLjAgZXh0cmEgZnVuY3Rpb25hbGl0eSBvZmZl
cmVkIGJ5IHRoZQo+ID4+ID4gTnV2b3RvbiBOUENUNzUwIGNoaXAuCj4gPgo+ID4gVGhpcyBsaW5l
IGlzIGFsc28gdG9vIGxvbmcuCj4gPgo+ID4+ID4gKwo+ID4+ID4gIGNvbW1lbnQgIndvbGZDcnlw
dCBob29rcyBuZWVkIGEgdG9vbGNoYWluIHcvIHRocmVhZHMsIGR5bmFtaWMgbGlicmFyeSIKPiA+
PiA+ICAgICAgIGRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgfHwgQlIyX1NU
QVRJQ19MSUJTCj4gPj4gPgo+ID4+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd29sZnRwbS93b2xm
dHBtLm1rIGIvcGFja2FnZS93b2xmdHBtL3dvbGZ0cG0ubWsKPiA+PiA+IGluZGV4IGE0YTllZGNl
ODUuLmQwNDIzY2QwNmIgMTAwNjQ0Cj4gPj4gPiAtLS0gYS9wYWNrYWdlL3dvbGZ0cG0vd29sZnRw
bS5tawo+ID4+ID4gKysrIGIvcGFja2FnZS93b2xmdHBtL3dvbGZ0cG0ubWsKPiA+PiA+IEBAIC0z
NSw0ICszNSwxNiBAQCBlbHNlCj4gPj4gPiAgV09MRlRQTV9DT05GX09QVFMgKz0gLS1kaXNhYmxl
LXdvbGZjcnlwdAo+ID4+ID4gIGVuZGlmCj4gPj4gPgo+ID4+ID4gK2lmZXEgKCQoQlIyX1BBQ0tB
R0VfV09MRlRQTV9TVDMzKSx5KQo+ID4+ID4gK1dPTEZUUE1fQ09ORl9PUFRTICs9IC0tZW5hYmxl
LXN0MzMKPiA+PiA+ICtlbHNlCj4gPj4gPiArV09MRlRQTV9DT05GX09QVFMgKz0gLS1kaXNhYmxl
LXN0MzMKPiA+PiA+ICtlbmRpZgo+ID4+ID4gKwo+ID4+ID4gK2lmZXEgKCQoQlIyX1BBQ0tBR0Vf
V09MRlRQTV9OUENUNzUwKSx5KQo+ID4+ID4gK1dPTEZUUE1fQ09ORl9PUFRTICs9IC0tZW5hYmxl
LW51dm90b24KPiA+PiA+ICtlbHNlCj4gPj4gPiArV09MRlRQTV9DT05GX09QVFMgKz0gLS1kaXNh
YmxlLW51dm90b24KPiA+PiA+ICtlbmRpZgo+ID4+ID4gKwo+ID4+ID4gICQoZXZhbCAkKGF1dG90
b29scy1wYWNrYWdlKSkKPiA+Cj4gPiBCZXN0IFJlZ2FyZHMsCj4gPgo+ID4gRmFicmljZQo+Cj4g
LS0KPiBGb3VuZGVyIG9mIFRQTS5kZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
