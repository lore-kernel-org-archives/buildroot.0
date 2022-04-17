Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABAFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 05:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8B860ECD;
	Sun, 17 Apr 2022 05:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id On8DhGU6HVco; Sun, 17 Apr 2022 05:51:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A8D60ECC;
	Sun, 17 Apr 2022 05:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DCD91BF422
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 05:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0893F4063F
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 05:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILEgntpu6KVj for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 05:51:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E251B400D0
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 05:51:23 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id r13so21955097ejd.5
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 22:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+8hsrHodgimGNNJNJnqBjTIdjzPB/xvKc/FZ70OBCSY=;
 b=V8GRVg7haxGwRSUfJLofvuDMbm3CWiQkOAQ9rbBMYaNP7KVtqYF8T81KJtPPmc7zvt
 aKYvaJ16kDfTJfo1v2hYuYZjX3GEFD2nMNZGqA4YTJRB/DZ5NMCUCaAEKr7gevkBpQ5/
 NJzd8uBVoXcNWLsZk1riyOMaip1xwC63eMymwqFdhbPQ9iy0f6gdV3AsJyanQcGiZznq
 nUktMa+Aa0ai2LyyV8rIftIEEYsZ8H0BiTS6BwqZ7nkg5U9BLsZcMypMbY5xP6tZCRSl
 bIKKuDaBG3bxQM2bX5ERUzL7qHz8W5q2bRbVnComdVochkNCbiqQi4EeHDL/U4sNM0E0
 C7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+8hsrHodgimGNNJNJnqBjTIdjzPB/xvKc/FZ70OBCSY=;
 b=Ru40HeKVziAR7ThnkHwUI6GSLyG3Crp1YSZgrAEt/3NoNhnxiJOpEH+BIcJd4Difpp
 Z8RdiNDoTq+y4LwxdS45AfxIxl4zYpTBgp9fMUIIQWZp79G6OO89aOM62cHQt8LOi3y3
 9Zs53oKvPyUTguZ8eqClIGEVLKv+jr+azHsrAKPvppJAdX+OhPjqyLOQexujk53lqIR3
 2a19zgdOFsGwJ7K2RO/4jC4QL3udYgWg9PedYGHwEcQXwfQy9ZxLvuKUW9X49nNNKm/a
 NJHnF+61hgBXZs3SeJj5SIbvzQS7XoRVndrWqXp9dBH3VfI3mNZPxC4yIWez/Vqu67oZ
 pniA==
X-Gm-Message-State: AOAM533chcGlqNnKCoX1t5MNPGB1Y8SHwxubxcHmPtHLp476RO2dGo9D
 Q0I4+z9sf4QHUPh+LI3miFqXTbZar21RHV+zgDI=
X-Google-Smtp-Source: ABdhPJy8aQXKnN1yfHQtuRwsbV6MQmdx2XNDqTOHnyeYXu5Cz9IDcPFJPE4T76r2N6WW7BR7dGmTAxqy3TseGl7x3Bc=
X-Received: by 2002:a17:906:3ec7:b0:6d6:e52b:b with SMTP id
 d7-20020a1709063ec700b006d6e52b000bmr4763413ejj.521.1650174681787; Sat, 16
 Apr 2022 22:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220413063858.8491-1-jose.pekkarinen@unikie.com>
In-Reply-To: <20220413063858.8491-1-jose.pekkarinen@unikie.com>
Date: Sun, 17 Apr 2022 07:51:09 +0200
Message-ID: <CAGm1_ku0Qndi3fxEiG_o6ky_gy7rXWB9BJm66Zi+aXaQvaaK6w@mail.gmail.com>
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Subject: Re: [Buildroot] [PATCH] package/wpa_supplicant: Add overrides
 configuration option
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Mika Joenpera <mika.joenpera@unikie.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSm9zw6ksCgp5b3UgYXJlIGFsbW9zdCB0aGVyZS4gU29tZSBuaXRwaWNrczoKCkRvbid0IHVz
ZSBhIGNhcGl0YWwgYWZ0ZXIgdGhlIHNlbWljb2xvbiBpbiB0aGUgdGl0bGUuCgpXaGVuIHlvdSBz
ZW5kIGFub3RoZXIgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggdXNlIHRoZSBmb2xsb3dpbmcgY29tbWFu
ZDoKCmdpdCBmb3JtYXQtcGF0Y2ggLTEgLXYzIC1vIG91dGdvaW5nCgpUaGlzIHdpbGwgYWRkIHRo
ZSAidjMiIHRhZyB0byB0aGUgcGF0Y2ggbmFtZS4gQXNsbyB3cml0ZSBhIGhpc3RvcnkKd2l0aCBj
aGFuZ2VzIGxpa2UgZGVzY3JpYmVkIGhlcmUgWzFdLgoKT24gV2VkLCBBcHIgMTMsIDIwMjIgYXQg
ODozOSBBTSBKb3PDqSBQZWtrYXJpbmVuCjxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4gd3Jv
dGU6Cj4KPiBGcm9tOiBNaWthIEpvZW5wZXJhIDxtaWthLmpvZW5wZXJhQHVuaWtpZS5jb20+Cj4K
PiBPdmVycmlkZXMgY29uZmlndXJhdGlvbiBwb3NzaWJpbGl0eSBlbmFibGVkIHRocm91Z2gKPiB3
cGFfc3VwcGxpY2FudCBjb25maWd1cmF0aW9uIGZpbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWth
IEpvZW5wZXJhIDxtaWthLmpvZW5wZXJhQHVuaWtpZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9z
w6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Cj4gLS0tCj4gIHBhY2th
Z2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluICAgICAgICAgfCAgNyArKysrKysrCj4gIHBhY2th
Z2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWsgfCAxMiArKysrKysrKysrKysKPiAg
MiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS93cGFfc3VwcGxpY2FudC9Db25maWcuaW4gYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L0NvbmZp
Zy5pbgo+IGluZGV4IDhmMDk1Y2RmMmQuLmJiNGI3ODQzM2UgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS93cGFfc3VwcGxpY2FudC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50
L0NvbmZpZy5pbgo+IEBAIC04NCw2ICs4NCwxMyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV1BBX1NV
UFBMSUNBTlRfTUVTSF9ORVRXT1JLSU5HCj4gICAgICAgICAgIEVuYWJsZSBzdXBwb3J0IGZvciBv
cGVuIGFuZCBzZWN1cmVkIG1lc2ggbmV0d29ya2luZwo+ICAgICAgICAgICAoSUVFRSA4MDIuMTFz
KQo+Cj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FOVF9PVkVSUklERVMKPiArICAg
ICAgIGJvb2wgIkVuYWJsZSBIVC9WSFQgb3ZlcnJpZGVzIgoKQ2hhbmdlIHRvICJFbmFibGUgSFQv
VkhUL0hFIG92ZXJyaWRlcyIKCj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIEVuYWJsZSB3cGFf
c3VwcGxpY2FudCBvdmVycmlkZXMgZm9yIEhUIGFuZCBWSFQgKGRpc2FibGUKClNhbWUgaGVyZToK
CkVuYWJsZSB3cGFfc3VwcGxpY2FudCBvdmVycmlkZXMgZm9yIEhULCBWSFQsIGFuZCBIRSAoZGlz
YWJsZQoKPiArICAgICAgICAgSFQvSFQ0MCwgbWFzayBNQ1MgcmF0ZXMsIGV0Yy4pIGluIHdwYV9z
dXBwbGljYW50Cj4gKyAgICAgICAgIGNvbmZpZ3VyYXRpb24gZmlsZS4KCldpdGggYWxsIHRoZXNl
IGNoYW5nZXMgYXBwbGllZCwgeW91IGNhbiBhZGQgbXkKClJldmlld2VkLWJ5OiBZZWdvciBZZWZy
ZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cgp0byB0aGUgdjMuCgpQbGVhc2UgdXNl
IC4vdXRpbHMvZ2V0LWRldmVsb3BlcnMgd2l0aCB5b3VyIDAwMDEtKi5wYXRjaCBmaWxlIHRvIGdl
dAphbGwgcmVsZXZhbnQgZGV2ZWxvcGVycyBpbnRvIENDIHdoZW4gc2VuZGluZyBhIHBhdGNoLgoK
WzFdIGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI3N1
Ym1pdHRpbmctcGF0Y2hlcwoKUmVnYXJkcywKWWVnb3IKCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9X
UEFfU1VQUExJQ0FOVF9BVVRPU0NBTgo+ICAgICAgICAgYm9vbCAiRW5hYmxlIGF1dG9zY2FuIgo+
ICAgICAgICAgaGVscAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9z
dXBwbGljYW50Lm1rIGIvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5tawo+
IGluZGV4IDNjMGIwYzFkZmMuLmQ4NTdiMzJiMTkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93cGFf
c3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5tawo+ICsrKyBiL3BhY2thZ2Uvd3BhX3N1cHBsaWNh
bnQvd3BhX3N1cHBsaWNhbnQubWsKPiBAQCAtMTEwLDYgKzExMCwxOCBAQCBlbHNlCj4gIFdQQV9T
VVBQTElDQU5UX0NPTkZJR19ESVNBQkxFICs9IENPTkZJR19NRVNICj4gIGVuZGlmCj4KPiAraWZl
cSAoJChCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FOVF9PVkVSUklERVMpLHkpCj4gK1dQQV9TVVBQ
TElDQU5UX0NPTkZJR19FTkFCTEUgKz0gXAo+ICsgICAgICAgQ09ORklHX0hUX09WRVJSSURFUyBc
Cj4gKyAgICAgICBDT05GSUdfVkhUX09WRVJSSURFUyBcCj4gKyAgICAgICBDT05GSUdfSEVfT1ZF
UlJJREVTCj4gK2Vsc2UKPiArV1BBX1NVUFBMSUNBTlRfQ09ORklHX0RJU0FCTEUgKz0gXAo+ICsg
ICAgICAgQ09ORklHX0hUX09WRVJSSURFUyBcCj4gKyAgICAgICBDT05GSUdfVkhUX09WRVJSSURF
UyBcCj4gKyAgICAgICBDT05GSUdfSEVfT1ZFUlJJREVTCj4gK2VuZGlmCj4gKwo+ICBpZmVxICgk
KEJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5UX0FVVE9TQ0FOKSx5KQo+ICBXUEFfU1VQUExJQ0FO
VF9DT05GSUdfRU5BQkxFICs9IFwKPiAgICAgICAgIENPTkZJR19BVVRPU0NBTl9FWFBPTkVOVElB
TCBcCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
