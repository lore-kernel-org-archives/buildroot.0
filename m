Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2115AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 05:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F1C460BF3;
	Mon, 10 Jan 2022 05:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMh7GCDy2YfA; Mon, 10 Jan 2022 05:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0A7860A8D;
	Mon, 10 Jan 2022 05:29:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 034471BF421
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 05:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2D0F405B3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 05:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfEg_t_bv501 for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 05:29:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D54E440122
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 05:29:41 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id q25so40321350edb.2
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 21:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dj0GaJDUGV5Jy0xOTRGXUvcTOVzC5DOxiClY+CVDEO8=;
 b=S6B2q1S85pRPbsg5zci3tw6GzBxTfKSlVY4L0jFk7O50JlSQ7h6M1i9PY4nY5W8THI
 WSTbsU+QJQq2RXSWq7cY5XASa8fpcTEqEEEkeqoMoM65qkzFLGgFwAgk7vlXUHZBY9lV
 znecRzdN9sU7oi6/Mpg2quCIobvtc0TL6XJ247F8EJiD6EmBdqR5Wi4Q1mZ/ucuO1SfU
 mPDJn++6br743crWRdtK22/veBhMxPyu7vEuiboVCqGdbkua3zmkyTNKHIeHnNYSZtJS
 J22AfHdZ4Klsnt+p1WKJ9dVVa/47aBGIqk0ARm6psjIpcNeOZsbetKwDNAKbl4aya7Fv
 rWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dj0GaJDUGV5Jy0xOTRGXUvcTOVzC5DOxiClY+CVDEO8=;
 b=aLwEAu8UHN09+LmnGEYSEar22xrafTVgqVpOWnL2a3Lh8dQmXVX7fxFb5bY8oCW8s/
 UShsUsNOL7t/ImyA9+EeXOWApCOendMel0uTOCV+JdcVewhS8QFtB1glguAyzVwxux+w
 MbrxFLgwn+3l1fVjrxn8pN8IaXpRBK7iZPBHg86XUR/gBqQ4jjHxZd/2GMXFBFA/Zfaa
 KSSb7Q4hIDGZ+ChcqqmcdCzq/c44osTQ3jo3ImM2Uv2u/a54vqMTUDa/gHoN5M3lBANu
 A/K3QRotbbBxBGwDvmh+M945ZSEPBnJ+btsv64s3f3fhIdr7DJ2eKfN2dLqLGTehTJzz
 fkvQ==
X-Gm-Message-State: AOAM533+fZd8279KyydDGuamvGzGEtfRaHaGLYqT4t+CrS5imWScb6OZ
 Cc3RE62NIAv980Jl+Zhawrj6wu4/1gfmpH7pVjsgQg==
X-Google-Smtp-Source: ABdhPJzHUzuhc1di1GAXQ4aFjQcirS2gghzzJwX4s6ppTGSljDAwjA8mGfXQ11iicAGcepaXhVYWglc36mezTrvujw0=
X-Received: by 2002:a50:e608:: with SMTP id y8mr72184593edm.39.1641792579986; 
 Sun, 09 Jan 2022 21:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20211213061551.4110-1-jose.pekkarinen@unikie.com>
 <20220105215908.1d8677b3@windsurf>
In-Reply-To: <20220105215908.1d8677b3@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 10 Jan 2022 07:29:04 +0200
Message-ID: <CAJPV9Mp6UsY+9wy7NKNFg6KqdU6HLvqNOWteg3m45RNhd=MTyg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/opensc: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKYW4gNSwgMjAyMiBhdCAxMDo1OSBQTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIEpvc8OpLAo+Cj4gT24gTW9u
LCAxMyBEZWMgMjAyMSAwODoxNTo1MSArMDIwMAo+IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVr
a2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKPgo+ID4gVGhlIHBhdGNoIHdpbGwgYWRkIG9wZW5z
YyBwYWNrYWdlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2Uu
cGVra2FyaW5lbkB1bmlraWUuY29tPgo+Cj4gSSdtIGFmcmFpZCB0aGF0IHdoZW4gSSByZWFkIHRo
ZSBmZWVkYmFjayBmcm9tIHVwc3RyZWFtIGluIHlvdXIgcGF0Y2hlcywKPiBzYXlpbmcgdGhhdCB0
aGV5IGludHJvZHVjZSBtZW1vcnkgbGVha3MgKGFuZCBpbmRlZWQgdGhleSBkbyksIEknbSBub3QK
PiByZWFsbHkga2VlbiBvbiBtZXJnaW5nIHRoaXMuCj4KPiBIb3dldmVyLCBJIHNhdyB5b3UgdG9s
ZCB1cHN0cmVhbToKPgo+ICAgSXQgaXMgYSBiaXQgb2YgYSBjaGlrZW4gYW5kIGVnZyBwcm9ibGVt
LiBCdWlsZHJvb3Qgd2FudHMgbWUgdG8KPiAgIHVwc3RyZWFtIHRoZSBwYXRjaGVzIGJlZm9yZSB0
aGUgcGFja2FnZSB3b3VsZCBiZSBhY2Nlc2libGUgdG8geW91LAo+ICAgeW91IHdhbnQgbWUgdG8g
Z2l2ZSBhIHRlc3RpbmcgY2FzZSB0aGF0IGRvZXNuJ3QgY29tZSBlYXN5IHdpdGhvdXQKPiAgIHVw
c3RyZWFtaW5nIHRoZSBwYWNrYWdlLgo+Cj4gVGhpcyBpcyBub3QgdG90YWxseSBjb3JyZWN0IGZv
ciB0d28gcmVhc29uOgo+Cj4gICogd2UgZG9uJ3QgcmVxdWlyZSBwYXRjaGVzIHRvIGJlIGFjY2Vw
dGVkIHVwc3RyZWFtLCBleGNlcHQgaWYgd2UgaGF2ZQo+ICAgIHNlcmlvdXMgZG91YnRzIGFib3V0
IHRoZSBwYXRjaGVzLgo+Cj4gICogdGhlIHBhY2thZ2UgZG9lc24ndCBoYXZlIHRvIGJlIGFjY2Vw
dGVkIGluIEJ1aWxkcm9vdCB1cHN0cmVhbSB0bwo+ICAgIHByb3ZpZGUgYW4gZWFzeSB3YXkgZm9y
IHRoZSBvcGVuc2MgZGV2ZWxvcGVycyB0byByZXByb2R1Y2UgdGhlCj4gICAgaXNzdWUuIFlvdSBj
YW4gcHJvdmlkZSBhIEJ1aWxkcm9vdCBicmFuY2ggb24gYSBwdWJsaWMgR2l0Cj4gICAgcmVwb3Np
dG9yeSwgd2l0aCB0aGUgb3BlbnNjIHBhY2thZ2UsIGFuZCBhIHZlcnkgc2ltcGxlCj4gICAgb3Bl
bnNjX2RlbW9fZGVmY29uZmlnIGluIGNvbmZpZ3MvIHRoYXQgdXNlcyBzb21lIGV4dGVybmFsIHRv
b2xjaGFpbgo+ICAgIGFuZCBidWlsZHMganVzdCBvcGVuc2MgdG8gZGVtb25zdHJhdGUgdGhlIGJ1
aWxkIGZhaWx1cmUuIFRoZW4gZm9yCj4gICAgdGhlIG9wZW5zYyBwZW9wbGUsIHJlcHJvZHVjaW5n
IGlzIGFzIGVhc3kgYXM6Cj4KPiAgICBnaXQgY2xvbmUgLWIgPHlvdXJicmFuY2g+IGdpdDovL3lv
dXIucmVwb3NpdG9yeS5jb20KPiAgICBjZCBidWlsZHJvb3QvCj4gICAgbWFrZSBvcGVuc2NfZGVt
b19kZWZjb25maWcKPiAgICBtYWtlCj4KPiBDb3VsZCB5b3UgcmVzb2x2ZSB0aGUgcmVtYWluaW5n
IGlzc3VlcyBhbmQgc2VuZCBhbiB1cGRhdGVkIHBhdGNoPyBBbHNvLAo+IHBsZWFzZSByZW1lbWJl
ciB0byBhZGQgYSB2ZXJzaW9uIHRvIHlvdXIgcGF0Y2hlcyB3aGVuIHN1Ym1pdHRpbmcsIGl0Cj4g
cmVhbGx5IG1ha2VzIHRoaW5ncyBlYXNpZXIuCj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBUaG9tYXMK
PiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8v
Ym9vdGxpbi5jb20KCiAgICBBY2shIFRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzIQoKICAgIEpvc8Op
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
