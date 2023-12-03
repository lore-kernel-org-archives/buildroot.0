Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C85C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC5D4156C;
	Sun,  3 Dec 2023 18:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC5D4156C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJbgs_uAQOvS; Sun,  3 Dec 2023 18:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A189141600;
	Sun,  3 Dec 2023 18:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A189141600
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9E501BF8C7
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFEAC6074C
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFEAC6074C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRSWr2nfFqXg for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:15:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 202FB60742
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 202FB60742
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-ul4RRkIUOsqCFpyVZQaxgg-1; Sun, 03 Dec 2023 13:15:30 -0500
X-MC-Unique: ul4RRkIUOsqCFpyVZQaxgg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a19a0e00b01so234963766b.1
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 10:15:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701627329; x=1702232129;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/6A+B4sjppCDFirltpVnbXaigINzd1ZGYdb57sCmRR0=;
 b=mzOdhqkgx3+pqMcZG4O5pBreLlMP5xfGI6E7ijI0PHzTFMGJKwUHskR9JV7BPc2m3r
 vHkHpS07/HIB+YDgbA1IbhuubwgB7UW/0vYK6SkFkDwogMMMnB7DgQHcIxc4V9PUy31S
 aQTDvbEfvUz/Ph7QOGI1OfZ3NL3fyjFJv0nzSVnXUi2rXbmo4sii7PtHdNpWSuptI5n4
 rDdqK04RPzkCJIZ4livoWFTuXk2OJtCHspgPflaMqQxYzd1ExwrdLgHF3l6OCmtx5eAj
 T49kmwN7u3vXTTlO38948Gr55guvma79RS8AKoCYsdZTn+NDa4bfGZG1BMid5WV1jw3L
 MZvA==
X-Gm-Message-State: AOJu0YwEQRdeZ49W3LOMjU5BSUxkeguOcCHiSeVjuX7lkzVJhv3Tijg5
 g2BSK00hwP5dr4VByE7bewt3a++PgXp7hCrqLWXX41sHdtXrXNLZoWMBzUnVamzPoLBXa6Jx/W9
 HK9xd7cYu3CsNr2voLmnQoi+8KuBrIrPre45chC1AJg==
X-Received: by 2002:a17:907:1384:b0:a19:a19b:78a3 with SMTP id
 vs4-20020a170907138400b00a19a19b78a3mr2241463ejb.102.1701627329294; 
 Sun, 03 Dec 2023 10:15:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGdquj2kKSnMas6RqBhnXvHGNdOFYtfrstMtepq2gD1E1TpANim7qy5u2SQY5NNnuBwVURcd7A3c/XmlLBSY8=
X-Received: by 2002:a17:907:1384:b0:a19:a19b:78a3 with SMTP id
 vs4-20020a170907138400b00a19a19b78a3mr2241460ejb.102.1701627328994; Sun, 03
 Dec 2023 10:15:28 -0800 (PST)
MIME-Version: 1.0
References: <20231123153131.1253841-1-aharivel@redhat.com>
In-Reply-To: <20231123153131.1253841-1-aharivel@redhat.com>
From: Anthony Harivel <aharivel@redhat.com>
Date: Sun, 3 Dec 2023 19:15:18 +0100
Message-ID: <CACUOEi-aBgm8e8LoEKbqtKYxzDb3ghNw5SiFt-K=7udVugqB8w@mail.gmail.com>
To: buildroot@buildroot.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1701627332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6A+B4sjppCDFirltpVnbXaigINzd1ZGYdb57sCmRR0=;
 b=JTVPyPlIrRqKqUnZhtgCsFkSITilvb8jvfBL9Tll9++QoqQ1Lg0TnGG1/lXaqbsssG6NT6
 aEem6M+N4SFbK1jAbOgz0tyDDFfII24Y+O47RXlyAT3NM1RTC1HDFshiBJsKDnFuEDqToi
 BDLSBCfb04sxcN+X08JXLGdWdkB79yA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JTVPyPlI
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: add an option to
 enable lscpu
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

YnVtcCBlbWFpbC4KCk9uIFRodSwgTm92IDIzLCAyMDIzIGF0IDQ6MzHigK9QTSBBbnRob255IEhh
cml2ZWwgPGFoYXJpdmVsQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gbHNjcHUgZGlzcGxheXMgaW5m
b3JtYXRpb24gYWJvdXQgQ1BVIGFyY2hpdGVjdHVyZSBhbmQgbmVlZHMgdG8gYmUKPiBleHBsaWNp
dGx5IGVuYWJsZSBmb3IgY29tcGlsYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IEhh
cml2ZWwgPGFoYXJpdmVsQHJlZGhhdC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvdXRpbC1saW51eC9D
b25maWcuaW4gICAgIHwgOSArKysrKysrKy0KPiAgcGFja2FnZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgubWsgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3V0aWwtbGludXgvQ29uZmlnLmluIGIvcGFj
a2FnZS91dGlsLWxpbnV4L0NvbmZpZy5pbgo+IGluZGV4IGJlODc0OTRiMzVjZi4uM2ViMWIyZTFj
OWEzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvdXRpbC1saW51eC9Db25maWcuaW4KPiArKysgYi9w
YWNrYWdlL3V0aWwtbGludXgvQ29uZmlnLmluCj4gQEAgLTU4LDcgKzU4LDcgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX1VUSUxfTElOVVhfQklOQVJJRVMKPiAgICAgICAgICAgYmxrZGlzY2FyZCwgYmxr
aWQsIGJsb2NrZGV2LCBjaGNwdSwgY2hvb20sIGNvbCwgY29sY3J0LCBjb2xybSwKPiAgICAgICAg
ICAgY29sdW1uLCBjdHJsYWx0ZGVsLCBkbWVzZywgZmRpc2ssIGZpbmNvcmUsIGZpbmRmcywgZmlu
ZG1udCwKPiAgICAgICAgICAgZmxvY2ssIGZzZnJlZXplLCBmc3RyaW0sIGdldG9wdCwgaGV4ZHVt
cCwgaXBjbWssIGlzb3NpemUsCj4gLSAgICAgICAgIGxkYXR0YWNoLCBsb29rLCBsc2JsaywgbHNj
cHUsIGxzaXBjLCBsc2xvY2tzLCBsc25zLCBtY29va2llLAo+ICsgICAgICAgICBsZGF0dGFjaCwg
bG9vaywgbHNibGssIGxzaXBjLCBsc2xvY2tzLCBsc25zLCBtY29va2llLAo+ICAgICAgICAgICBt
a2ZzLCBta3N3YXAsIG5hbWVpLCBwcmxpbWl0LCByZWFkcHJvZmlsZSwgcmVuaWNlLCByZXYsCj4g
ICAgICAgICAgIHJ0Y3dha2UsIHNjcmlwdCwgc2NyaXB0bGl2ZSwgc2NyaXB0cmVwbGF5LCBzZXRh
cmNoLCBzZXRzaWQsCj4gICAgICAgICAgIHNmZGlzaywgc3dhcGxhYmVsLCBzd2Fwb2ZmLCBzd2Fw
b24sIHV1aWRnZW4sIHV1aWRwYXJzZSwKPiBAQCAtMjExLDYgKzIxMSwxMyBAQCBjb25maWcgQlIy
X1BBQ0tBR0VfVVRJTF9MSU5VWF9MT1NFVFVQCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIFNl
dCB1cCBhbmQgY29udHJvbCBsb29wIGRldmljZXMKPgo+ICtjb25maWcgQlIyX1BBQ0tBR0VfVVRJ
TF9MSU5VWF9MU0NQVQo+ICsgICAgICAgYm9vbCAibHNjcHUiCj4gKyAgICAgICBkZXBlbmRzIG9u
IEJSMl9VU0VfTU1VICMgbGlic21hcnRjb2xzCj4gKyAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0Vf
VVRJTF9MSU5VWF9MSUJTTUFSVENPTFMKPiArICAgICAgIGhlbHAKPiArICAgICAgICAgRGlzcGxh
eSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgQ1BVIGFyY2hpdGVjdHVyZQo+ICsKPiAgY29uZmlnIEJS
Ml9QQUNLQUdFX1VUSUxfTElOVVhfTFNGRAo+ICAgICAgICAgYm9vbCAibHNmZCIKPiAgICAgICAg
IGRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBsaWJzbWFydGNvbHMKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS91dGlsLWxpbnV4L3V0aWwtbGludXgubWsgYi9wYWNrYWdlL3V0aWwtbGludXgvdXRpbC1s
aW51eC5tawo+IGluZGV4IDcyMTI2YWRiMDA1Zi4uMzU0NmMwNzMzN2UwIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvdXRpbC1saW51eC91dGlsLWxpbnV4Lm1rCj4gKysrIGIvcGFja2FnZS91dGlsLWxp
bnV4L3V0aWwtbGludXgubWsKPiBAQCAtMTYxLDYgKzE2MSw3IEBAIFVUSUxfTElOVVhfQ09ORl9P
UFRTICs9IFwKPiAgICAgICAgICQoaWYgJChCUjJfUEFDS0FHRV9VVElMX0xJTlVYX0xPR0dFUiks
LS1lbmFibGUtbG9nZ2VyLC0tZGlzYWJsZS1sb2dnZXIpIFwKPiAgICAgICAgICQoaWYgJChCUjJf
UEFDS0FHRV9VVElMX0xJTlVYX0xPR0lOKSwtLWVuYWJsZS1sb2dpbiwtLWRpc2FibGUtbG9naW4p
IFwKPiAgICAgICAgICQoaWYgJChCUjJfUEFDS0FHRV9VVElMX0xJTlVYX0xPU0VUVVApLC0tZW5h
YmxlLWxvc2V0dXAsLS1kaXNhYmxlLWxvc2V0dXApIFwKPiArICAgICAgICQoaWYgJChCUjJfUEFD
S0FHRV9VVElMX0xJTlVYX0xTQ1BVKSwtLWVuYWJsZS1sc2NwdSwtLWRpc2FibGUtbHNjcHUpIFwK
PiAgICAgICAgICQoaWYgJChCUjJfUEFDS0FHRV9VVElMX0xJTlVYX0xTRkQpLC0tZW5hYmxlLWxz
ZmQsLS1kaXNhYmxlLWxzZmQpIFwKPiAgICAgICAgICQoaWYgJChCUjJfUEFDS0FHRV9VVElMX0xJ
TlVYX0xTTE9HSU5TKSwtLWVuYWJsZS1sc2xvZ2lucywtLWRpc2FibGUtbHNsb2dpbnMpIFwKPiAg
ICAgICAgICQoaWYgJChCUjJfUEFDS0FHRV9VVElMX0xJTlVYX0xTTUVNKSwtLWVuYWJsZS1sc21l
bSwtLWRpc2FibGUtbHNtZW0pIFwKPiAtLQo+IDIuNDIuMAo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
