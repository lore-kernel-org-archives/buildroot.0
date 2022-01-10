Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA02C433FE
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BB868132B;
	Mon, 10 Jan 2022 07:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvT18o4_7zcz; Mon, 10 Jan 2022 07:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFDD581313;
	Mon, 10 Jan 2022 07:46:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7231BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8102660C01
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRjPf3WVZgyq for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:46:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9383E6080B
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:46:25 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id m4so8480234edb.10
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9GeeXf3sHuhEaK+SL0TLPSrdSULMkvSk3cjFbsUDyfI=;
 b=SXPpE2sQHVDZm0mynegiOwFUQCrbRgrHw4qSuA+ZDw0QqnbU839T8qATsOG1/NH6fw
 iNKcaURZOEXmIaJtfAI3yej4CjKhLgxiwRSL+mRgBtHTAEHCpkbAfib7tVVeYxWsq5lC
 bfiOj2LkAKUsyIGQb4bDIilkYcZUnVOnYXSVMzvLa12tD5nBwpiG+qHwdYjOxn1kFVIe
 oBPhlaEVVGR6esdNbRfBdaNCyJv4L1/06eL1wf97X3xBzdr6V35NuFG8YjcYb9PD/9im
 2/fFmosEO474qx3H84ufioDZM/A0vo98NXTzcliUpSWjHtTqkawpLFMOaU1M4X3z9utH
 XQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9GeeXf3sHuhEaK+SL0TLPSrdSULMkvSk3cjFbsUDyfI=;
 b=LSjNH1hbNvbBXjVgJMF3CA0hjWJq8E3wbXHvC/pBXVPDjPVskTdt38YmwLImnqOASx
 sVzFjQ7+2liErPz7S4jZojuz/zMX9TJpiXwLBcbsumqY8YLsumDZmDcaPHBojkaI07k8
 sZjRysajWRgOO57i/V9PsYF6eZHCza58gEXNtQ3d6xmh44gCz9oe779MESoSHGj8OYQ8
 c+V32Zl7r9ofo76TWIl77Uj/rJOtpa8GWB9tUsfBT8C2lTSKfG8gKHzcMjIeBBWTkH3w
 baeJDP854W4T6Q4gpuxFKPhWn+wn9xpotDaPg7P5UMsbb9HgOeML2eRTbdHNVfizOqmS
 f7Dg==
X-Gm-Message-State: AOAM532xdzXTe/1f54t/KhbgUqILXbab32gcimsuCFqkNX+fGJ58AQX3
 ZSvnHHbkawgP+FolhufyzaXCQpFjdlvXJrcejLPpjAUyo/A=
X-Google-Smtp-Source: ABdhPJz8q61yqwd2Yva7tcFe11ZAsfmHAXXzyfFHYJe9iafkk5Me2DEqDJB3HR7OVV//D6tkUJE6IPmHqFWMFtavP3M=
X-Received: by 2002:a17:907:6ea6:: with SMTP id
 sh38mr370937ejc.7.1641800783773; 
 Sun, 09 Jan 2022 23:46:23 -0800 (PST)
MIME-Version: 1.0
References: <20220104204126.3631293-1-fontaine.fabrice@gmail.com>
 <db9bca01-8c19-1e3a-309a-32201e7bc76c@mind.be>
In-Reply-To: <db9bca01-8c19-1e3a-309a-32201e7bc76c@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Jan 2022 08:45:05 +0100
Message-ID: <CAPi7W80QXfaA5iTk5e2_deLChHSTPp8dO1rrhsuLE9ouJ5+cvw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/gensio: add avahi optional
 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbHVuLiAxMCBqYW52LiAyMDIyIMOgIDA4OjEzLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJu
b3V0QG1pbmQuYmU+IGEgw6ljcml0IDoKPgo+Cj4KPiBPbiAwNC8wMS8yMDIyIDIxOjQxLCBGYWJy
aWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4gYXZhaGktY2xpZW50IGlzIGFuIG9wdGlvbmFsIGRlcGVu
ZGVuY3kgd2hpY2ggaXMgZW5hYmxlZCBieSBkZWZhdWx0IHNpbmNlCj4gPiB2ZXJzaW9uIDIuMi4w
IGFuZAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2NtaW55YXJkL2dlbnNpby9jb21taXQvNWFiMTE3
Yzk3NDNmZDQ3MTlmNjEwY2Y5ZjFiYTQ1MDIzY2MyNWQ3Ywo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4g
PiAgIHBhY2thZ2UvZ2Vuc2lvL2dlbnNpby5tayB8IDEgKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nZW5zaW8vZ2Vuc2lv
Lm1rIGIvcGFja2FnZS9nZW5zaW8vZ2Vuc2lvLm1rCj4gPiBpbmRleCAzODlkZTFlMjYzLi5iNDkz
NmQ1ZjIxIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9nZW5zaW8vZ2Vuc2lvLm1rCj4gPiArKysg
Yi9wYWNrYWdlL2dlbnNpby9nZW5zaW8ubWsKPiA+IEBAIC05LDYgKzksNyBAQCBHRU5TSU9fU0lU
RSA9IGh0dHA6Ly9kb3dubG9hZHMuc291cmNlZm9yZ2UubmV0L3Byb2plY3Qvc2VyMm5ldC9zZXIy
bmV0Cj4gPiAgIEdFTlNJT19MSUNFTlNFID0gTEdQTC0yLjErIChsaWJyYXJ5KSwgR1BMLTIuMCsg
KHRvb2xzKQo+ID4gICBHRU5TSU9fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcuTElCIENPUFlJTkcK
PiA+ICAgR0VOU0lPX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4gK0dFTlNJT19ERVBFTkRFTkNJ
RVMgPSAkKGlmICQoQlIyX1BBQ0tBR0VfQVZBSElfREFFTU9OKSxhdmFoaSkKPgo+ICAgSW4gdGhl
IGNvbW1pdCBtZXNzYWdlIHlvdSB0YWxrIGFib3V0IGF2YWhpLWNsaWVudCwgYnV0IGhlcmUgaXQn
cyBhdmFoaS1kYWVtb24uCj4gVGhhdCBsb29rcyBhIGJpdCB3ZWlyZC4uLiBDYW4geW91IGV4cGxh
aW4/CiBhdmFoaS1jbGllbnQgbmVlZHMgYXZhaGktZGFlbW9uIGFuZCBkYnVzIGJ1dCBwZXJoYXBz
IHdlIHNob3VsZCBhZGQgYQpCUjJfUEFDS0FHRV9BVkFISV9MSUJBVkFISV9DTElFTlQgaGlkZGVu
IG9wdGlvbi4KPgo+ICAgUmVnYXJkcywKPiAgIEFybm91dAo+Cj4gPiAgIEdFTlNJT19DT05GX09Q
VFMgPSBcCj4gPiAgICAgICAtLXdpdGhvdXQtb3BlbmlwbWkgXAo+ID4gICAgICAgLS13aXRob3V0
LXN3aWcgXAo+ID4KQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
