Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A07EE4993
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 15:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D2CA4107A;
	Wed, 23 Aug 2023 15:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D2CA4107A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-J0B-dOlZJO; Wed, 23 Aug 2023 15:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1045D41173;
	Wed, 23 Aug 2023 15:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1045D41173
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA481BF263
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 15:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51AAA40C49
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 15:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51AAA40C49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXs1zYEMID6C for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 15:34:43 +0000 (UTC)
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C05F4410AC
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 15:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C05F4410AC
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-64f37b2dfa6so17138156d6.1
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 08:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692804881; x=1693409681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+yZmGGSnxEDzJbFlmV/lJFSEzsSv4bg8iJ/Mx6oUIto=;
 b=N07XWC0TJwfNsfikB0rr+RReGxdZqAvPnsKUViZKAP1kSHGKPta9ARrdcdO0P6WvDn
 SEyd3tJFRBxramKOWChUGJSpsUqtMgxd6z/lxuJd57hIVC/VQSVxMnFYwtE6E9eUxR7A
 D7V7XpspXGcPi2Ds7nChiN9aybSCgxoPtxBBqx3x7DAxl5xgJwGyQ5gHHOOUtaMyXEC2
 Xv0Wm9sTPz35YIv084+T+3PrT7Fc3wI6utRJVsfHYZ7xTLA17EVJ1jTo10aUyeEYVtru
 ccCMKFFNEz175D3ScB90L/lyeTy/kJTY+SlHkZMYFlSKZek5DXkGS1QNCpvpmytxIcLh
 inHA==
X-Gm-Message-State: AOJu0Yyb6liEaKm7WCTg0NotKocnniVyHUrN9YDz8Llbht68jqp2wlJa
 lsgc41ck4ZG7UKROTweyrqwCzi+MiEzGLT1PgCI=
X-Google-Smtp-Source: AGHT+IEGyBQRfVC68k6UwT8bHF/mn8eH0iMeIQSGBWfhbGOKyvvGApMkOeIHO/pL/sneIvSdBeibeB1+aMCAmhg5YQc=
X-Received: by 2002:a05:6214:d87:b0:62d:ddeb:3770 with SMTP id
 e7-20020a0562140d8700b0062dddeb3770mr14798667qve.0.1692804881410; Wed, 23 Aug
 2023 08:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223337.9402-1-kilian.zinnecker@mail.de>
 <20230821223337.9402-2-kilian.zinnecker@mail.de>
In-Reply-To: <20230821223337.9402-2-kilian.zinnecker@mail.de>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 23 Aug 2023 10:34:15 -0500
Message-ID: <CAOCHtYj+02YWQy7pTPwK=LH96fW4cRgPhXS0cE+CXHNmwZtL-A@mail.gmail.com>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692804881; x=1693409681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+yZmGGSnxEDzJbFlmV/lJFSEzsSv4bg8iJ/Mx6oUIto=;
 b=VdzfWeKsuStg2m88SGAZNvoz9EYRnafcayzMALQVbGHvEUnA6r+Dlayjw/Buuzbr1T
 Vrp5n8lshDAXIvqCql4VDDFkGXaRC+zy0oq+AOECeMhBupA7DRpydDtN29FOkM5cmkXm
 i79oSPijQKBuovOoBqKJsWwyeTLhzrJO2NYFRliqctLzRk1dnoF+ILjdYWgP/B85J8SY
 7czoGEuY6frtCTa1JWVKyV04QqQA618Ju7smtheclVQ/ub4H00woHczHSVeHKdu/A0EH
 Vh5sFSY3UQ8i9tCwf1Tqf1++z0WZg3bWKG7cbwdIrFspDfK0nUgEG3WjOpuE126h85Dz
 L1Qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VdzfWeKs
Subject: Re: [Buildroot] [PATCH v1 1/2] package/xuantie-bins: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBBdWcgMjEsIDIwMjMgYXQgNTozM+KAr1BNIEtpbGlhbiBaaW5uZWNrZXIKPGtpbGlh
bi56aW5uZWNrZXJAbWFpbC5kZT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGFkZHMgYSBwYWNrYWdl
IGZvciBYdWFudGllIGJpbmFyeSBibG9icy4gVGhlc2UgYmluYXJpZXMKPiBhcmUgdXNlZCBmb3Ig
dGhlIEJlYWdsZVYtQWhlYWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLaWxpYW4gWmlubmVja2VyIDxr
aWxpYW4uemlubmVja2VyQG1haWwuZGU+Cj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA1ICsrKy0tCj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKPiAgcGFja2FnZS94dWFudGllLWJpbnMvQ29uZmlnLmluICAgICAgIHwg
IDYgKysrKysrCj4gIHBhY2thZ2UveHVhbnRpZS1iaW5zL3h1YW50aWUtYmlucy5tayB8IDI3ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3h1YW50
aWUtYmlucy9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UveHVhbnRpZS1i
aW5zL3h1YW50aWUtYmlucy5tawo+Cj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9Q
RVJTCj4gaW5kZXggOWI1MDBmMzcwMS4uNWVjYzJkM2FkZiAxMDA2NDQKPiAtLS0gYS9ERVZFTE9Q
RVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0xODI3LDkgKzE4MjcsMTAgQEAgTjogICAgICAg
S2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtQGlkZWFzb25ib2FyZC5jb20+Cj4gIEY6ICAg
ICBwYWNrYWdlL2xpYmNhbWVyYS8KPgo+ICBOOiAgICAgS2lsaWFuIFppbm5lY2tlciA8a2lsaWFu
Lnppbm5lY2tlckBtYWlsLmRlPgo+IC1GOiAgICAgcGFja2FnZS9yb2NrY2hpcC1ya2Jpbi8KPiAt
RjogICAgIGNvbmZpZ3Mvcm9jazViX2RlZmNvbmZpZwo+ICBGOiAgICAgYm9hcmQvcmFkeGEvcm9j
azViLwo+ICtGOiAgICAgY29uZmlncy9yb2NrNWJfZGVmY29uZmlnCj4gK0Y6ICAgICBwYWNrYWdl
L3JvY2tjaGlwLXJrYmluLwo+ICtGOiAgICAgcGFja2FnZS94dWFudGllLWJpbnMvCj4KPiAgTjog
ICAgIEtsYXVzIEhlaW5yaWNoIEtpd2kgPGtsYXVzQGxpbnV4LnZuZXQuaWJtLmNvbT4KPiAgRjog
ICAgIHBhY2thZ2Uvd3F5LXplbmhlaS8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4g
Yi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDU0Y2RkYzM5MTQuLjJjMTUzOGM0MDQgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBA
IC02NDQsNiArNjQ0LDcgQEAgZW5kbWVudQo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3dpcGUv
Q29uZmlnLmluIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3hvcnJpc28vQ29uZmlnLmluIgo+
ICAgICAgICAgc291cmNlICJwYWNrYWdlL3hyODE5LXhyYWRpby9Db25maWcuaW4iCj4gKyAgICAg
ICBzb3VyY2UgInBhY2thZ2UveHVhbnRpZS1iaW5zL0NvbmZpZy5pbiIKPiAgZW5kbWVudQo+Cj4g
IG1lbnUgIkludGVycHJldGVyIGxhbmd1YWdlcyBhbmQgc2NyaXB0aW5nIgo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3h1YW50aWUtYmlucy9Db25maWcuaW4gYi9wYWNrYWdlL3h1YW50aWUtYmlucy9D
b25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmE2OWNh
ZmRmYzEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS94dWFudGllLWJpbnMvQ29uZmln
LmluCj4gQEAgLTAsMCArMSw2IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9YVUFOVElFX0JJTlMK
PiArICAgICAgIGJvb2wgInh1YW50aWUtYmlucyIKPiArICAgICAgIGRlcGVuZHMgb24gQlIyX3Jp
c2N2Cj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIFRoaXMgcGFja2FnZSBwcm92aWRlcyBiaW5h
cnkgYmxvYnMsIG5lZWRlZCBmb3IgdGhlCj4gKyAgICAgICAgICBCZWFnbGVWLUFoZWFkJ3MgU29D
IChUSDE1MjApLgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3h1YW50aWUtYmlucy94dWFudGllLWJp
bnMubWsgYi9wYWNrYWdlL3h1YW50aWUtYmlucy94dWFudGllLWJpbnMubWsKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmY1N2M5Y2IyZGQKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS94dWFudGllLWJpbnMveHVhbnRpZS1iaW5zLm1rCj4gQEAgLTAsMCAr
MSwyNyBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgeHVhbnRpZS1iaW5z
Cj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK1hVQU5USUVfQklOU19WRVJT
SU9OID0gNjA0ZDg2ZjZlYjI2MWFiOWU1M2U5ODc4NTJlM2FhMzk3YjRiMTZhZAo+ICtYVUFOVElF
X0JJTlNfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9iZWFnbGVib2FyZC94dWFudGllLXVidW50
dS5naXQKCk9oLCB0aGlzIG1pZ2h0IGJlIHRvbyBmYXN0IG1vdmluZyBvZiBhIGdpdCByZXBvIGZv
ciB0aGlzIHBhY2thZ2UuLgpJJ3ZlIGNyZWF0ZWQgYSBuZXcgcmVwbyBmb3IganVzdCB0aGUgZmly
bXdhcmU6CgpodHRwczovL2dpdC5iZWFnbGVib2FyZC5vcmcvYmVhZ2xldi1haGVhZC9maXJtd2Fy
ZQoKU2luY2Ugd2UgZG9uJ3QgaGF2ZSBhIHNvdXJjZS9jaGFuZ2Vsb2csIFZlcnNpb25zIHdpbGwg
YmUgaW4gZGlmZmVyZW50CmRpcmVjdG9yaWVzIGJhc2VkIG9uIHRoZSBTREsgcmVsZWFzZSAoMS4x
LjIpIHRvZGF5OgoKaHR0cHM6Ly9naXQuYmVhZ2xlYm9hcmQub3JnL2JlYWdsZXYtYWhlYWQvZmly
bXdhcmUvLS90cmVlL21haW4vbGlnaHQvMS4xLjIKCkkndmUgYWxzbyBhZGRlZCBhbGwgdGhlIG90
aGVyIGJvYXJkcyBmcm9tIHRoZSByZXBvLCB0aGUgYGxpZ2h0LWxwaTRhYAppcyBmb3IgdGhlIGh0
dHBzOi8vc2lwZWVkLmNvbS9saWNoZWVwaTRhCgpSZWdhcmRzLAoKLS0gClJvYmVydCBOZWxzb24K
aHR0cHM6Ly9yY24tZWUuY29tLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
