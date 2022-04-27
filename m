Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE88C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 20:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96F0640906;
	Wed, 27 Apr 2022 20:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OnQ5R6ZhSxOU; Wed, 27 Apr 2022 20:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84D3E40635;
	Wed, 27 Apr 2022 20:17:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 431651BF869
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E67C60E3E
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrxMX99vr64a for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 20:17:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F55860E2A
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 20:17:41 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id r1so3048795oie.4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 13:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=91xU47N+ew7Ed2NAORuVv3G60fv/jiepIAtCgPX/80s=;
 b=LibB+2jfxTkCsjD3zusSoCU84gHBkaa7dawSSyyI3feIBlsC4hsxkHOcovMwXYIlGp
 ecU5o48Fj3vWceR1GWBE+ASUo8zNSTuY0wv+YvbBIofiiIiUIwWZ15onBunQj3ngf2u5
 51MQ3jbQDYJ9YimxK6VDCjia/eq3mEtS+KjAG90OQtlriBuwkdoc34U18Tiib9baWbAJ
 g/iXjWCT2IQdXBAaGVR6ul3rWF+Osz3IOR9uiykptpWi9K97ysPWpPjwdqMX6JgyMkUw
 1K8A3yd8iRtN2/Sodn2yL23ea0/dePbqGymLHCnhmwQjKooO6jxga2MdeeD0FqHnJx/O
 ugyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=91xU47N+ew7Ed2NAORuVv3G60fv/jiepIAtCgPX/80s=;
 b=1w9wBp0kOeZ+j9jenPnvw+6cD5s+79II1kHgLMwrXx36CuGoxjUdI3sba5BNFkCGsN
 kE8EzjeCeqkMIHEx7lMorLe3jrnehuyR3SSoMG1DmhRieHPR2sYWTEbqKZLSwfbwDBk1
 VHb4tkQVGlUfnEJTnKmII2HGjEP0/DLlu59khVj/6gXDgySg0wG1KYG3aR9glbr5b781
 Yq38Sy9IpYloM82s0kHbFLl0Cy5foD0piOW+myJimVW/38wVSLeS3RqXvizPmldB1V/G
 Acz5gGG5kwGomBAbItwFMasw12/HjZSXjdd95YU8/zvQiNB/f3TciJ9gfYvqhl9Osrth
 Xb1g==
X-Gm-Message-State: AOAM533JmzvJ0D6SG7J6EmoB3Pd7uOwCasw7sG/YhzyW3//m+3GYCn1v
 7vV08AaEvR9pdeJxy9692JzD2Ihwv9nimsk0vqJ4rFsUY5A=
X-Google-Smtp-Source: ABdhPJzNcCX9eqircSZ7AK3JlN9tKcUvfguPOIOGYedQaShi+i6ThbCrJ9/o2LEV7317d4ObH/l9X0tskShNRKIg0CE=
X-Received: by 2002:a05:6808:1a09:b0:325:2f1e:1956 with SMTP id
 bk9-20020a0568081a0900b003252f1e1956mr8078560oib.228.1651090660246; Wed, 27
 Apr 2022 13:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220426212026.712081-1-fontaine.fabrice@gmail.com>
 <20220426235740.1b2543d1@windsurf>
In-Reply-To: <20220426235740.1b2543d1@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Apr 2022 22:15:34 +0200
Message-ID: <CAPi7W83tNKtcnNyPGWQ5Gdi_UM42gM+SCV5chzJ7W06JFYTpdg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptodev-linux: needs
 CONFIG_CRYPTO_USER_API_AEAD
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWFyLiAyNiBhdnIuIDIwMjIgw6AgMjM6NTcsIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFR1ZSwgMjYgQXByIDIwMjIg
MjM6MjA6MjYgKzAyMDAKPiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiA+IENPTkZJR19DUllQVE9fVVNFUl9BUElfQUVBRCBpcyBuZWVkZWQg
dG8gZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQKPiA+IGZhaWx1cmU6Cj4gPgo+ID4gRVJST1I6IG1v
ZHBvc3Q6ICJjcnlwdG9fYWxsb2Nfc2tjaXBoZXIiIFsvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxk
L2luc3RhbmNlLTIvb3V0cHV0LTEvYnVpbGQvY3J5cHRvZGV2LWxpbnV4LTEuMTIvLi9jcnlwdG9k
ZXYua29dIHVuZGVmaW5lZCEKPiA+IEVSUk9SOiBtb2Rwb3N0OiAic2NhdHRlcndhbGtfbWFwX2Fu
ZF9jb3B5IiBbL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1
aWxkL2NyeXB0b2Rldi1saW51eC0xLjEyLy4vY3J5cHRvZGV2LmtvXSB1bmRlZmluZWQhCj4gPiBF
UlJPUjogbW9kcG9zdDogImNyeXB0b19haGFzaF9maW5hbCIgWy9ob21lL2F1dG9idWlsZC9hdXRv
YnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9idWlsZC9jcnlwdG9kZXYtbGludXgtMS4xMi8uL2Ny
eXB0b2Rldi5rb10gdW5kZWZpbmVkIQo+ID4gRVJST1I6IG1vZHBvc3Q6ICJjcnlwdG9fYWVhZF9l
bmNyeXB0IiBbL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1
aWxkL2NyeXB0b2Rldi1saW51eC0xLjEyLy4vY3J5cHRvZGV2LmtvXSB1bmRlZmluZWQhCj4gPiBF
UlJPUjogbW9kcG9zdDogImNyeXB0b19hZWFkX3NldGtleSIgWy9ob21lL2F1dG9idWlsZC9hdXRv
YnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9idWlsZC9jcnlwdG9kZXYtbGludXgtMS4xMi8uL2Ny
eXB0b2Rldi5rb10gdW5kZWZpbmVkIQo+ID4gRVJST1I6IG1vZHBvc3Q6ICJjcnlwdG9fc2tjaXBo
ZXJfZGVjcnlwdCIgWy9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQt
MS9idWlsZC9jcnlwdG9kZXYtbGludXgtMS4xMi8uL2NyeXB0b2Rldi5rb10gdW5kZWZpbmVkIQo+
ID4gRVJST1I6IG1vZHBvc3Q6ICJjcnlwdG9fZGVzdHJveV90Zm0iIFsvaG9tZS9hdXRvYnVpbGQv
YXV0b2J1aWxkL2luc3RhbmNlLTIvb3V0cHV0LTEvYnVpbGQvY3J5cHRvZGV2LWxpbnV4LTEuMTIv
Li9jcnlwdG9kZXYua29dIHVuZGVmaW5lZCEKPiA+IEVSUk9SOiBtb2Rwb3N0OiAiY3J5cHRvX3Nr
Y2lwaGVyX3NldGtleSIgWy9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRw
dXQtMS9idWlsZC9jcnlwdG9kZXYtbGludXgtMS4xMi8uL2NyeXB0b2Rldi5rb10gdW5kZWZpbmVk
IQo+ID4gRVJST1I6IG1vZHBvc3Q6ICJjcnlwdG9fYWVhZF9kZWNyeXB0IiBbL2hvbWUvYXV0b2J1
aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1aWxkL2NyeXB0b2Rldi1saW51eC0x
LjEyLy4vY3J5cHRvZGV2LmtvXSB1bmRlZmluZWQhCj4gPiBFUlJPUjogbW9kcG9zdDogImNyeXB0
b19hZWFkX3NldGF1dGhzaXplIiBbL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0y
L291dHB1dC0xL2J1aWxkL2NyeXB0b2Rldi1saW51eC0xLjEyLy4vY3J5cHRvZGV2LmtvXSB1bmRl
ZmluZWQhCj4KPiBBcmUgeW91IHN1cmUgb2YgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRoZXNl
IGZ1bmN0aW9ucyBhbmQKPiBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX0FFQUQgPwo+Cj4gY3J5cHRv
X2FlYWRfZW5jcnlwdCgpIGlzIGltcGxlbWVudGVkIGluIGNyeXB0by9hZWFkLmMsIHdoaWNoIGlz
IGJ1aWx0Cj4gd2hlbiBDT05GSUdfQ1JZUFRPX0FFQUQyPXkuCj4KPiBjcnlwdG9fc2tjaXBoZXJf
c2V0a2V5KCkgaXMgaW1wbGVtZW50ZWQgaW4gY3J5cHRvL3NrY2lwaGVyLmMsIHdoaWNoIGlzCj4g
YnVpbHQgd2hlbiBDT05GSUdfQ1JZUFRPX1NLQ0lQSEVSMj15Lgo+Cj4gQ1JZUFRPX1VTRVJfQVBJ
X0FFQUQgZW5hYmxlcyBhIHVzZXItc3BhY2UgaW50ZXJmYWNlLCBidXQgaGVyZSB3ZSdyZQo+IHRh
bGtpbmcgYWJvdXQgYSBrZXJuZWwtbGV2ZWwgaW50ZXJmYWNlLgo+Cj4gQ291bGQgeW91IGNsYXJp
Znk/CgpJJ20gZmFyIGZyb20gYmVpbmcgYSBrZXJuZWwgb3IgY3J5cHRvZGV2LWxpbnV4IGV4cGVy
dCBidXQgaGVyZSBpcyB3YXMKbXkgcmVhc29ubmluZzoKICAtIENPTkZJR19DUllQVE9fQUVBRDIg
YW5kIENPTkZJR19DUllQVE9fU0tDSVBIRVIyIGFyZSBoaWRkZW4gb3B0aW9ucwp0aGF0IGNhbid0
IGJlIGVuYWJsZWQgYnkgS0NPTkZJR19FTkFCTEVfT1BULgogIC0gRnJvbSBteSB1bmRlcnN0YW5k
aW5nIGNyeXB0b2Rldi1saW51eCBhbGxvd3MgInVzZXJzcGFjZQphcHBsaWNhdGlvbnMgdG8gdGFr
ZSBhZHZhbnRhZ2Ugb2YgaGFyZHdhcmUgYWNjZWxlcmF0b3JzIi4gU28sIEkKYXNzdW1lZCB0aGF0
IGNyeXB0b2Rldi1saW51eCBuZWVkZWQgc29tZSBzb3J0IG9mIHVzZXJzcGFjZSBBUEkgb24gdGhl
Cmtlcm5lbC4gSG93ZXZlciwgSSBkaWRuJ3QgZmluZCBhIGxvdCBvZiBpbmZvcm1hdGlvbiBhYm91
dCB0aGlzIHN1YmplY3QKb24gY3J5cHRvZGV2LWxpbnV4IHdlYnNpdGUuIEl0IHNlZW1zIHRoYXQg
c29tZSBwcm9qZWN0cyBwb2ludGVkIG91dAp0aGF0IENSWVBUT19VU0VSX0FQSV9BRUFEIHNob3Vs
ZCBiZSBlbmFibGVkIChlLmcuCmh0dHBzOi8vZ2l0aHViLmNvbS9zY2FsZXdheS9rZXJuZWwtdG9v
bHMvaXNzdWVzLzE0OCkuIEluZGVlZCwKQ1JZUFRPX1VTRVJfQVBJX0FFQUQgd2lsbCBzZWxlY3Qg
Q09ORklHX0NSWVBUT197QUVBRCxTS0NJUEhFUn0gKGFuZCBzbwpDT05GSUdfQ1JZUFRPX3tBRUFE
LFNLQ0lQSEVSfTIpLgoKSG93ZXZlciwgYXMgSSBzYWlkLCBJIGNvdWxkIGJlIHRvdGFsbHkgd3Jv
bmcsIHBlcmhhcHMgc2VsZWN0aW5nCkNSWVBUT19VU0VSX0FQSV9BRUFEIGlzIG5vdCBjb3JyZWN0
IChldmVuIGlmIGl0IGZpeGVzIHRoZSBidWlsZApmYWlsdXJlKS4KSG9wZWZ1bGx5LCBzb21lb25l
IHdpdGggbW9yZSBrbm93bGVkZ2Ugb2YgY3J5cHRvZGV2LWxpbnV4IHNob3VsZCBiZQphYmxlIHRv
IGZpbmQgdGhlIGNvcnJlY3QgZml4LgoKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKQmVzdCBSZWdh
cmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
