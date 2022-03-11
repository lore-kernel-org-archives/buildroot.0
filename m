Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8B7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 10:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEED460D80;
	Fri, 11 Mar 2022 10:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZiHQy0guTUIQ; Fri, 11 Mar 2022 10:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E1CD60A9C;
	Fri, 11 Mar 2022 10:14:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3DA1BF392
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 10:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 091E660A9C
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 10:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xtwfrb6QIF3C for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 10:14:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 853C1605BE
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 10:14:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g3so10341542edu.1
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 02:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DsP2gpDkn1gWeGQHElbZ+6hdPAy1WR9Wmtugou8ZADo=;
 b=sgPu976hoZDE4k4eYFFjGcvTk1EKVQ5kamN9MonbjmPDDrL/iRLfQrxc1/NP/BT0AR
 8FvKMvk1XxeWGZQ2G6SsAWaiJqITvS6wGb+NsjKmuMRcZ5mxHXYtSATw3XotAPmF3hlN
 fJyzKK56TobZQHX+0jhSHdRLq6lcR1ma+gc+DQs2gtpykW9OVuAgvIecIEBOF8nCTMGt
 SOvneszHeSBfbCLN2QN+CrnFJe32/aNTDLI/raL4BaAiK9y9RUuj8UUUIjPexMSrVpd9
 W2X066eS7ysP+UUYDugBnzGSggN6XBYsDvBBT22ugS8Zr+IYmSHjGUa9FwhqDR5D07uc
 3e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DsP2gpDkn1gWeGQHElbZ+6hdPAy1WR9Wmtugou8ZADo=;
 b=hGLUynCStdSaGaaPYze1QBp5azGohEIOVbLOH9cIzkIWT46f3F3rx1UPplM168X8i/
 MgC31SbKtxNhtxVzPsS2vw1dp1j28iCnF1ywLBNM0tPy1HcpUILTi2RoTrqqziCM9Kqo
 5Ah67JwJ8ZwFGhgLzA4yeu3T7FI/Fzhhib2fWwFZ6mvuTalYqxS2GUpNPyOk01pbWPs1
 hbkcT5FvPpjeXEYFpflWFUTZ6wvZuUJjbdk24hg+Nh8oaVmGS28Sk388G/j9QPhPrqeN
 ust1JyQ5UdbPV3ckSZkJ0vWaX34LuXISU9sfo/r1uBivnoCnKMJNlP3aTJSIQNpfa4vk
 PS8A==
X-Gm-Message-State: AOAM532bXoi2oD9F3i91dH/EFosdzp3q36hQdo3Ca/JTWH0kc57lgMFE
 q9q82E/qA7fNdwGUt61f9OFilmNI5bPVV09ufSaKbg==
X-Google-Smtp-Source: ABdhPJysxB+BgGKErb6hUCFsW2YcpBvTndBpXyTnFB43Gedef18CCiJ0ecBAAqv6x9gnbjUKPfzKybEyIA2cjQgwlag=
X-Received: by 2002:a50:f68b:0:b0:415:a36c:5c0b with SMTP id
 d11-20020a50f68b000000b00415a36c5c0bmr8085689edn.272.1646993674495; Fri, 11
 Mar 2022 02:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20220310165735.1102802-1-clement.leger@bootlin.com>
 <20220311103246.471185ee@fixe.home>
In-Reply-To: <20220311103246.471185ee@fixe.home>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 11 Mar 2022 11:14:23 +0100
Message-ID: <CAN5uoS-dorBGy06L3XNLPuJzdYAEfHmE3zF3zt1yoWW4PseV3Q@mail.gmail.com>
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 0/7] boot/optee-os: support new optee-os
 3.16.0 build dependencies
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

SGVsbG8gQ2xlbWVudCwKCk9uIEZyaSwgMTEgTWFyIDIwMjIgYXQgMTA6MzQsIENsw6ltZW50IEzD
qWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBMZSBUaHUsIDEwIE1h
ciAyMDIyIDE3OjU3OjI4ICswMTAwLAo+IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBi
b290bGluLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPiBOZXdlciB2ZXJzaW9ucyBvZiBvcHRlZS1vcyAo
Pj0gMy4xNi4wKSB1c2VzIHB5dGhvbi1jcnlwdG9ncmFwaHkgaW5zdGVhZAo+ID4gb2YgcHl0aG9u
LXB5Y3J5cHRvZG9tZXggdG8gYnVpbGQuIFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCB0byBidWls
ZAo+ID4gaG9zdC1weXRob24tY3J5cHRvZ3JhcGh5IGFuZCB1c2VzIGl0IGluIG9wdGVlLW9zIHBh
Y2thZ2UgdG8gYnVpbGQgdGhlCj4gPiAzLjE2LjAgdmVyc2lvbi4gQWxzbyBidW1wIG9wdGVlLWNs
aWVudCwgb3B0ZWUtYmVuY2htYXJrLCBvcHRlZS1leGFtcGxlcwo+ID4gYW5kIG9wdGVlLXRlc3Qg
d2hpY2ggbmVlc3MgdG8gYmUgYWxpZ25lZCB3aXRoIG9wdGVlLW9zIHZlcnNpb24uCj4gPgo+ID4g
LS0tLQo+ID4KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAtIEJ1bXAgb3B0ZWUtY2xpZW50LCBvcHRl
ZS1iZW5jaG1hcmssIG9wdGVlLWV4YW1wbGVzIGFuZCBvcHRlZS10ZXN0Cj4gPgo+ID4gQ2zDqW1l
bnQgTMOpZ2VyICg0KToKPiA+ICAgcGFja2FnZS9weXRob24tY3J5cHRvZ3JhcGh5OiBlbmFibGUg
aG9zdCBwYWNrYWdlCj4gPiAgIGJvb3Qvb3B0ZWUtb3M6IGFkZCBzdXBwb3J0IHRvIGJ1aWxkIHdp
dGggcHl0aG9uLWNyeXB0b2dyYXBoeQo+ID4gICBib290L29wdGVlLW9zOiBidW1wIHRvIHZlcnNp
b24gMy4xNi4wCj4gPiAgIHBhY2thZ2Uvb3B0ZWUtdGVzdDogYnVtcCB0byB2ZXJzaW9uIDMuMTYu
MAo+ID4KPiA+IEV0aWVubmUgQ2FycmllcmUgKDMpOgo+ID4gICBwYWNrYWdlL29wdGVlLWV4YW1w
bGVzOiBidW1wIHRvIHZlcnNpb24gMy4xNi4wCj4gPiAgIHBhY2thZ2Uvb3B0ZWUtY2xpZW50OiBi
dW1wIHRvIHZlcnNpb24gMy4xNi4wCj4gPiAgIHBhY2thZ2Uvb3B0ZWUtYmVuY2htYXJrOiBidW1w
IHRvIHZlcnNpb24gMy4xNi4wCj4gPgo+ID4gIGJvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKystLQo+ID4gIGJvb3Qvb3B0ZWUt
b3Mvb3B0ZWUtb3MuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICBib290
L29wdGVlLW9zL29wdGVlLW9zLm1rICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysr
Ky0KPiA+ICBwYWNrYWdlL29wdGVlLWJlbmNobWFyay9vcHRlZS1iZW5jaG1hcmsuaGFzaCAgICAg
ICB8ICA0ICsrLS0KPiA+ICBwYWNrYWdlL29wdGVlLWJlbmNobWFyay9vcHRlZS1iZW5jaG1hcmsu
bWsgICAgICAgICB8ICAyICstCj4gPiAgcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50
Lmhhc2ggICAgICAgICAgICAgfCAgNCArKy0tCj4gPiAgcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0
ZWUtY2xpZW50Lm1rICAgICAgICAgICAgICAgfCAgMiArLQo+ID4gIHBhY2thZ2Uvb3B0ZWUtZXhh
bXBsZXMvb3B0ZWUtZXhhbXBsZXMuaGFzaCAgICAgICAgIHwgIDQgKystLQo+ID4gIHBhY2thZ2Uv
b3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMubWsgICAgICAgICAgIHwgIDIgKy0KPiA+ICBw
YWNrYWdlL29wdGVlLXRlc3Qvb3B0ZWUtdGVzdC5oYXNoICAgICAgICAgICAgICAgICB8ICA0ICsr
LS0KPiA+ICBwYWNrYWdlL29wdGVlLXRlc3Qvb3B0ZWUtdGVzdC5tayAgICAgICAgICAgICAgICAg
ICB8ICAyICstCj4gPiAgcGFja2FnZS9weXRob24tY3J5cHRvZ3JhcGh5L3B5dGhvbi1jcnlwdG9n
cmFwaHkubWsgfCAgNyArKysrKysrCj4gPiAgMTIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9u
cygrKSwgMTYgZGVsZXRpb25zKC0pCj4gPgo+Cj4gU2FkbHksIEkgdXNlZCBjb21taXRzIGZyb20g
RXRpZW5uZSBDYXJyaWVyZSBhcyBpbml0aWFsIGNvbW1pdHMgbWVzc2FnZXMKPiAodXNpbmcgLWMp
LiBJIGRpZCBub3Qgbm90aWNlZCBpdCByZXVzZWQgdGhlIG9yaWdpbmFsIGNvbW1pdCBhdXRob3Iu
Cj4gSSB3aWxsIHJlc2VuZCBhIFYzIHdpdGggYXV0aG9yc2hpcCBmaXhlZCBwcm9wZXJseS4gU29y
cnkgZm9yIHRoZQo+IGluY29udmVuaWVuY2UuCj4KCgpBY2tlZC1ieTogRXRpZW5uZSBDYXJyaWVy
ZSA8ZXRpZW5uZS5jYXJyaWVyZUBsaW5hcm8ub3JnPiBmb3IgdGhlIHdob2xlCnNlcmllcyB3aXRo
IG9ubHkgYSBjb21tZW50IG9uIHBhdGNoIDMvNy4gWW91IGZvcmdvdCB0byB1cGRhdGUgdGhlIHVy
bAppbiB0aGUgaW5saW5lIGNvbW1lbnQgb2Ygb3B0ZWUtb3MuaGFzaCBmb3IgdGhhdCBwYWNrYWdl
IG9ubHkuCgpSZWdhcmRzLApldGllbm5lCgo+IC0tCj4gQ2zDqW1lbnQgTMOpZ2VyLAo+IEVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXIgYXQgQm9vdGxpbgo+IGh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
