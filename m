Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C3AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 10:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AEB04000B;
	Thu, 17 Mar 2022 10:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnOmZbZS2xaV; Thu, 17 Mar 2022 10:17:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1DA84052B;
	Thu, 17 Mar 2022 10:17:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E3A11BF2CA
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 10:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C955612A4
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 10:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KKoEjAsJKewP for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 10:17:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BBA46129C
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 10:17:49 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id o83so5156562oif.0
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=atY/P3MUugywhoiWx3R8rVLQPJqMWdW7DQr08w1xOEk=;
 b=lvq/kHgwdJ90WVY2KH8jGLmMgAgzHpMAbmpJI96WCQEBZNj5vR7C6uJHpQ1TuZjfD6
 PlQNmOJbvVss7TzR9PMZhVyCRov0ueCTHMCp3ot9muR2JwGz9kpVEjSZNOSKNjLRnIY+
 KdXlvtSXOShO/xfkocRyWrNPA2lxFJNLPaO2apz+fsussrTuAx6hMX8ul2tv1WW4F0gD
 D3gelV4OLFRqfRfkEpOKgpOxsMFv7EWlOeu2tquW/NeIeRD3ZvkNtIjOpgfpmkxVHTxZ
 nvBNkbABQBN2EixNEGwPWFETHvtVxzQV6HVkrXC4e8t7F9zLXd3ypGqLuYYRo/xHZVi+
 a0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=atY/P3MUugywhoiWx3R8rVLQPJqMWdW7DQr08w1xOEk=;
 b=DXd9LrhfdefCt0qj8QCJRK34aGA4k7SRftYMtyFkd1vbjzZfTRGTdwtf5apu8NxzNa
 9qUz7/qrCL9phDpA6dIYG3hMpW6JedW129DtqqTg85vVscmwQgTA4cKBoyrjIwEg1XGT
 vcOZA+87kWObxvzNtezWkFSTjTt7GqKI9XZuWOBLSydmS4RV5Zj9EMsXLdSljLstHlut
 cpqOPhu4nHjXI/uQYsWvBd7TVyjcv+o1WxxXuW9LvY1+9SQ7LvrdM+TX/zZgxqrKVLED
 qO2NDdsbr72coW5nWIa9S+Q49jkLiubq4KE1ZLapYZQbPDG0wPUbqU5DdqHJDetjYmBq
 A3Sw==
X-Gm-Message-State: AOAM531+lB5zp+GLaOJbEBA15Z/yngCGi5GpnNrwJac9tMACSXsanfYP
 erOIEMH8z1XupBiHsJpKP9cVIwowDc1ab/nKoaAuTfNGMbs=
X-Google-Smtp-Source: ABdhPJweL7hJiQH42p/Sp25W5ST5o38VW5Aak6pnATh1/iKMcu83jZ2/BGGZJMf0959Zicg1GvCFVSCC4WbnjOgpTzQ=
X-Received: by 2002:aca:f1d5:0:b0:2ec:eaab:eb9b with SMTP id
 p204-20020acaf1d5000000b002eceaabeb9bmr1525250oih.228.1647512268248; Thu, 17
 Mar 2022 03:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220317095027.8939-1-bruno.seifert@3brain.com>
In-Reply-To: <20220317095027.8939-1-bruno.seifert@3brain.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 17 Mar 2022 11:17:37 +0100
Message-ID: <CAPi7W83ifYeJ-ip==t3P6-rsCXkfZrLD=zwS9ixi_LsC4myxEA@mail.gmail.com>
To: bruno seifert <bruno.seifert@3brain.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: update site link
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

SGVsbG8sCgpMZSBqZXUuIDE3IG1hcnMgMjAyMiDDoCAxMDo1MSwgYnJ1bm8gc2VpZmVydCA8YnJ1
bm8uc2VpZmVydEAzYnJhaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBleHBhdCBpcyBjdXJyZW50bHkg
aW4gdGhlIHByb2Nlc3Mgb2YgY2hhbmdpbmcgdGhlIGZpbGUgaG9zdGluZyBzaXRlIGZyb20KPiBz
b3VyY2Vmb3JnZSB0byBnaXRodWIuIFRoaXMgYWRqdXN0cyB0aGUgc2l0ZSBVUkwgdG8gdGhlIG5l
dyBnaXRodWIKPiBsb2NhdGlvbi4gT2xkIHZlcnNpb25zIGFyZSBhbHJlYWR5IG5vdCBhdmFpbGFi
bGUgb24gc291cmNlZm9yZ2UgYW55bW9yZS4KPgo+IFNpZ25lZC1vZmYtYnk6IGJydW5vIHNlaWZl
cnQgPGJydW5vLnNlaWZlcnRAM2JyYWluLmNvbT4KPiAtLS0KPiBCYWNrcG9ydCB0bzogYWxsIHZl
cnNpb25zCj4gSSB0aGluayB0aGUgaGFzaGVzIGRvbid0IG5lZWQgdG8gYmUgY2hhbmdlZCwgYnV0
IHNvbWVvbmUgd2hvIGFjdHVhbGx5Cj4ga25vd3Mgc3R1ZmYgc2hvdWxkIGNvbmZpcm0gdGhhdC4K
CkluZGVlZCwgdGhlIGhhc2ggaXMgdGhlIHNhbWUuCgo+IEZlZWwgZnJlZSB0byBhZGp1c3QgdGhl
IG5hbWUgYW5kIHN5bnRheC4gSSd2ZSBqdXN0IHN0YXJ0ZWQgd29ya2luZyBhIG1vbnRoIGEgZ28g
YW5kIHJlYWxseSBkb24ndCBrbm93IHdoYXQgSSdtIGRvaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTog
YnJ1bm8gc2VpZmVydCA8YnJ1bm8uc2VpZmVydEAzYnJhaW4uY29tPgo+IC0tLQo+ICBwYWNrYWdl
L2V4cGF0L2V4cGF0Lm1rIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXhwYXQvZXhwYXQubWsg
Yi9wYWNrYWdlL2V4cGF0L2V4cGF0Lm1rCj4gaW5kZXggYjI5YjBlMWQyNi4uM2RiYTkyMDA4MyAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2V4cGF0L2V4cGF0Lm1rCj4gKysrIGIvcGFja2FnZS9leHBh
dC9leHBhdC5tawo+IEBAIC01LDcgKzUsOCBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
Cj4gIEVYUEFUX1ZFUlNJT04gPSAyLjQuNwo+IC1FWFBBVF9TSVRFID0gaHR0cDovL2Rvd25sb2Fk
cy5zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdC9leHBhdC9leHBhdC8kKEVYUEFUX1ZFUlNJT04pCj4g
K0VYUEFUX1ZFUlNJT05fVE9fVVJMID0gJChzdWJzdCAuLF8sJChFWFBBVF9WRVJTSU9OKSkKPiAr
RVhQQVRfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJleHBhdC9saWJleHBhdC9yZWxlYXNl
cy9kb3dubG9hZC9SXyQoRVhQQVRfVkVSU0lPTl9UT19VUkwpCgpBIHNpbmdsZSBsaW5lciB3b3Vs
ZCBiZSBiZXR0ZXI6CkVYUEFUX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGli
ZXhwYXQvcmVsZWFzZXMvZG93bmxvYWQvUl8kKHN1YnN0Ci4sXywkKEVYUEFUX1ZFUlNJT04pKQoK
SG93ZXZlciwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB3ZSBoYXZlIHRvIHVwZGF0ZSB0aGUgVVJM
IG5vdz8KQ2FuJ3Qgd2Ugd2FpdCBmb3IgdGhlIG5leHQgZXhwYXQgYnVtcD8KCj4gIEVYUEFUX1NP
VVJDRSA9IGV4cGF0LSQoRVhQQVRfVkVSU0lPTikudGFyLnh6Cj4gIEVYUEFUX0lOU1RBTExfU1RB
R0lORyA9IFlFUwo+ICBFWFBBVF9ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYKPiAtLQo+IDIu
MjUuMQo+Cj4KPiAtLQo+Cj4gM0JyYWluIEFHCj4gRWluc2llZGxlcnN0cmFzc2UgMzAKPiA4ODIw
IFfDpGRlbnN3aWwKPiBTd2l0emVybGFuZAo+ICs0MSA4MSAzMjIgNzAgODYKPgo+IHd3dy4zYnJh
aW4uY29tIDxodHRwczovL3d3dy4zYnJhaW4uY29tLz4KPgo+ICA8aHR0cHM6Ly90d2l0dGVyLmNv
bS8zYnJhaW4+Cj4gIDxodHRwczovL3d3dy5saW5rZWRpbi5jb20vY29tcGFueS8zYnJhaW4vPgo+
IDxodHRwczovL3d3dy55b3V0dWJlLmNvbS9jaGFubmVsL1VDTFNGaHcyc2FmN1JkWnQzRW1tdnRf
UT4KPiA8aHR0cHM6Ly9nb28uZ2wvbWFwcy82ZEE3ZmI1amU5NEw0UHlmNj4KPgo+Cj4KPgo+Cj4K
Pgo+CkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
