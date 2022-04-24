Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962C6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 18:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3819181AC4;
	Sun, 24 Apr 2022 18:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-jHEw5W1M5Q; Sun, 24 Apr 2022 18:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B19F813CF;
	Sun, 24 Apr 2022 18:10:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 504601BF316
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 18:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D0E4813CF
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 18:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFzKUUZrfKsi for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 18:10:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24F0F81389
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 18:10:21 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id 12so14808227oix.12
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 11:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vvItrxLkBBy9VCkvAaiMn0oSoYi3vouGPoFOEY8pwAk=;
 b=QZjS+7F8S+Jb4be/ws2FwYMelaEmQKaIcDzCuYuyNqxXAzNU6lMGB2M5LNrGrgSdto
 m2mANhCG5A7Bi4oKiS7qrCcmOSd/OrOGnhXfbMt+LuuGcC8vMTWXcZIlmHwj5a+pifOp
 3jgyuCGYLceFqF+gqlexKBgaGCM8Xd2XFpYapu6OAKt5rLt7tqmepqGcsqnjxwkLVu4B
 HRG+gTlCKlGkCGLA7y6ZQ1JUr1qEKn/kXXf3upiK8qE90+B2MUPnFnsBheefTrFu1mjB
 sXzqrGu5U2ncILiH/vOBlhCzsANrweLEuyzmR5WjV9MqHh9OxnhJroFUN01g9WYhDtUp
 Z62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vvItrxLkBBy9VCkvAaiMn0oSoYi3vouGPoFOEY8pwAk=;
 b=HMz+ad2DavjEJOv0ZxA5vHTGbGBtu2wnOiQ63MFutXmq/jMhaHyj9hhfZUp1Ve0W+f
 NqyR1OYw9kpO6lxuCINSLGk7dMp4fJQRv5ObPm6ea+4uXkVDcUwp3ioChRz5eQCBDCC8
 x43Ddw865J/NT4l1m1T+OnffO7rfK6ZVPDWyI9G27D9Lor8eF3XINEyaUIj0B8DZ4pV/
 AH1zKA1OBUMUiLMqdB/FlnazCwXNuS6R0cNYMt1w2f1hBSQQBSOTHGBClMt7dsJgwtMt
 ph+Gzb/kzejDAIxC7HAnVIsS/x8KGC2ZcOHI9aueifYIuGzL0EjNRwZQNqrqZajZyd9u
 2OjQ==
X-Gm-Message-State: AOAM532h5HBCN2rSnXlQf1knjuifqnWH4ECvdQsgDCq1jNpvR4WFU3Zy
 6S90VZLlJ3eUK4WYsJDSu+zSORQjfSzUxANVBFY9z+qE
X-Google-Smtp-Source: ABdhPJy1dNnyAm6DpKq+M2hYWGOghIacLRlXyYNFytTmLQHSXr/m+2g1UsTDmVP1pfnRNZyqxiCe6ch2Zyz9PtaJxVQ=
X-Received: by 2002:a05:6808:1a09:b0:325:2f1e:1956 with SMTP id
 bk9-20020a0568081a0900b003252f1e1956mr843571oib.228.1650823821045; Sun, 24
 Apr 2022 11:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220424171355.3174629-1-fontaine.fabrice@gmail.com>
 <20220424173926.GY2730@scaer>
In-Reply-To: <20220424173926.GY2730@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Apr 2022 20:08:15 +0200
Message-ID: <CAPi7W83x8mv9nbdHD2y=uxxuPD6Mt0oJyMvm4QuXwc41G7gacA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/pamtester: fix build without C++
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

WWFubiwKCkxlIGRpbS4gMjQgYXZyLiAyMDIyIMOgIDE5OjM5LCBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+Cj4gT24g
MjAyMi0wNC0yNCAxOToxMyArMDIwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4g
PiBSdW4gYXV0b3JlY29uZiB0byBhdm9pZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0
aG91dCBDKys6Cj4gPgo+ID4gY29uZmlndXJlOiBlcnJvcjogQysrIHByZXByb2Nlc3NvciAiL2xp
Yi9jcHAiIGZhaWxzIHNhbml0eSBjaGVjawo+ID4KPiA+IEZpeGVzOgo+ID4gIC0gaHR0cDovL2F1
dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYzAwMGFmZjY1OWRhMDI0YjZlZWY0MmJjYTgy
NGJkZWE3YjU1NDFjMgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9wYW10ZXN0ZXIv
cGFtdGVzdGVyLm1rIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wYW10ZXN0ZXIvcGFtdGVzdGVyLm1rIGIvcGFj
a2FnZS9wYW10ZXN0ZXIvcGFtdGVzdGVyLm1rCj4gPiBpbmRleCBiMDllNGQxY2MwLi4yZDhmMTMx
N2NhIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9wYW10ZXN0ZXIvcGFtdGVzdGVyLm1rCj4gPiAr
KysgYi9wYWNrYWdlL3BhbXRlc3Rlci9wYW10ZXN0ZXIubWsKPiA+IEBAIC05LDUgKzksNyBAQCBQ
QU1URVNURVJfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQuc291cmNlZm9yZ2UubmV0L3Byb2plY3Qv
cGFtdGVzdGVyL3BhbXRlc3Rlci8kKAo+ID4gIFBBTVRFU1RFUl9ERVBFTkRFTkNJRVMgPSBsaW51
eC1wYW0KPiA+ICBQQU1URVNURVJfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ID4gIFBBTVRFU1RF
Ul9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ID4gKyMgRml4IGJ1aWxkIGZhaWx1cmUgd2l0aG91
dCBDKysKPiA+ICtQQU1URVNURVJfQVVUT1JFQ09ORiA9IFlFUwo+Cj4gV2h5IGRvZXMgYXV0b3Jl
Y29uZmlndXJpbmcgZml4IHRoZSBpc3N1ZT8KCkkgZGlkbid0IGRpZyB0b28gbXVjaCBpbnRvIGl0
IGJ1dCBpdCByZW1vdmVzIHRob3NlIHdyb25nIENYWENQUCB0ZXN0cwpmcm9tIHRoZSBjb25maWd1
cmUgZmlsZS4KCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+ICAkKGV2YWwgJChh
dXRvdG9vbHMtcGFja2FnZSkpCj4gPiAtLQo+ID4gMi4zNS4xCj4gPgo+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgo+IC0tCj4gLi0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2
IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAg
ICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdB
SU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
