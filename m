Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BBCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 21:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF9218442B;
	Tue, 29 Mar 2022 21:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aa6fuJad8WNZ; Tue, 29 Mar 2022 21:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6D8B84411;
	Tue, 29 Mar 2022 21:24:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C81E21BF41A
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 21:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3BC7419DA
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 21:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-Kth5_YXkGh for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 21:24:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C192419D8
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 21:24:05 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id e189so20308282oia.8
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 14:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ikms9LtPCxG7s0w8wMU2HkBd842Dm6UvG+zfEXTmkSI=;
 b=Q9keite5cCZn0KcW3SRBDKVsH63bHG4gvvIxPpKQysFOXbBrm/mJXn0WsxrAb4DZ1p
 m7zP5OVSCYIpm6UOB9zl5rH0Gfu63eohPc5QDaG3QGodAm4k8r/HGS+WqwawiQCYNmtP
 KDXrVt5AMuCz1sH0Amokx9TiKUodeGfj629mbH7a70WyDhOMYqexBqqveF7rHanKpTNV
 0eBfXpLtmXaT4ChxjajOZJAlp+KxbJ74cFOsiCXu4KmeLxB1HCtsnPCs28pvARXUlVdl
 YjA0TDwaDBMThYoXrKE1ea+y3BHZrKFK1r+Q3te7XUtGhsOuW3MNniMbV3/TyHRpgVAp
 xfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ikms9LtPCxG7s0w8wMU2HkBd842Dm6UvG+zfEXTmkSI=;
 b=5d33zahvhU57ugXin62AgCv9yZLI7COqaAm2dg8J/tYKR0oKo9ygCRlWnOYvVhPr5f
 d7vr9fkS1yGpDn39UpGxpY3j5FEdaeql168k4JOvdJErohDz4ZqsnJ0G8dr4qcYmmmaR
 189tzajGiKGXMd1Zk/vAAkmxEaxFqDsqYcf0vjeYU9OPPZQKMTdXM+wVuOI22VoXfH2b
 qWz9AzlOMf2aggn9uruu9Ruc7D/wuKKRzHjKpSXDVV3PL5/dJrwXNOfFbKazwdn+OHrG
 vFOlJPXOTfpPPktZJl+URg4NpDnaZl/9tFrHhdycVsxV3hpYT2G4IUSr6oT3ii6tNecm
 +uwg==
X-Gm-Message-State: AOAM533NP4DlRmkoZFMTDrAq1hcgQ0H0F084ze7MiaV3rGFSENkISxQv
 2WurGrNtRu5uURxwXVR0ZiVUZ9QB7l9mEeLC/RiNGM2ZuOk=
X-Google-Smtp-Source: ABdhPJzvYPsEsbMDf8XhMiYz5f5XjdPJdlKvIUgu4rQSrvBWksz6J4FlAooLWqhxnhetdTEtL2nPiOmAdVLxnIuGHZg=
X-Received: by 2002:aca:c182:0:b0:2ef:8fd4:7523 with SMTP id
 r124-20020acac182000000b002ef8fd47523mr570371oif.148.1648589044127; Tue, 29
 Mar 2022 14:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220315173231.1943484-1-fontaine.fabrice@gmail.com>
 <87czi4a63p.fsf@dell.be.48ers.dk>
In-Reply-To: <87czi4a63p.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Mar 2022 23:22:30 +0200
Message-ID: <CAPi7W80X5dXac4HJ+8uafLWhqUKRW_j-+qT9KO69HJSRFzj2_w@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/grpc: fix build with libexecinfo
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
Cc: Robert Rose <robertroyrose@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWFyLiAyOSBtYXJzIDIwMjIgw6AgMjE6NTMsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiBGaXggdGhl
IGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHJhaXNlZCBvbiB1Y2xpYmMgYW5kIG11c2wgc2luY2Ug
dGhlCj4gID4gcmVpbnRyb2R1Y3Rpb24gb2YgdGhlIHBhY2thZ2UgaW4gY29tbWl0Cj4gID4gMTZm
Zjk0ODQ0NGMzOTc4ZDYzZjQ4MzM0NGEzZDkyZDk5NGM2NDMxMjoKPgo+IEh1aD8gVGhpcyBpcyB0
aGUgY29tbWl0IHdoZXJlIG9sYSB3YXMgcmVpbnRyb2R1Y2VkLCBidXQgdGhpcyBpcyBhCj4gZmFp
bHVyZSBpbiBncnBjIGFuZCB0aGUgY29uZmlnIGRvZXNuJ3QgZXZlbiBoYXZlIG9sYSBlbmFibGVk
PwoKSW5kZWVkLCBJIG1hZGUgYSBjb3B5IC8gcGFzdGUgZXJyb3IsIHRoZSBjb3JyZWN0IGNvbW1p
dCBtZXNzYWdlIHNob3VsZApoYXZlIGJlZW46CiJGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWls
dXJlIHJhaXNlZCBvbiB1Y2xpYmMgYW5kIG11c2wgc2luY2UgdGhlCmFkZGl0aW9uIG9mIGxpYmV4
ZWNpbmZvIHBhY2thZ2UgaW4gY29tbWl0CmVlYThiYTQ0NmMxMDcwMWEyNzM0MzI1NTIxMDhkODBm
YjIyMjRlZjQiCgo+Cj4gID4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0xL291
dHB1dC0xL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2MvYXJtLWJ1aWxkcm9v
dC1saW51eC11Y2xpYmNnbnVlYWJpLzEwLjMuMC8uLi8uLi8uLi8uLi9hcm0tYnVpbGRyb290LWxp
bnV4LXVjbGliY2dudWVhYmkvYmluL2xkOgo+ICA+IC9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQv
aW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L2FybS1idWlsZHJvb3QtbGludXgtdWNsaWJjZ251ZWFi
aS9zeXNyb290L3Vzci9saWIvbGliYWJzbF9zdGFja3RyYWNlLnNvLjIxMTEuMC4wOgo+ICA+IHVu
ZGVmaW5lZCByZWZlcmVuY2UgdG8gYGJhY2t0cmFjZScKPgo+ICA+IEZpeGVzOgo+ICA+ICAtIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzYzYWIyYmM4NmNhZDAzZDUyNTg0
OTJiMTdkMTcwNzA3ODc2MWQ5YjMKPgo+ICA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFp
bmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ICA+IC0tLQo+ICA+ICBwYWNrYWdlL2dy
cGMvZ3JwYy5tayB8IDggKysrKysrKy0KPiAgPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+Cj4gID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3JwYy9ncnBj
Lm1rIGIvcGFja2FnZS9ncnBjL2dycGMubWsKPiAgPiBpbmRleCAyM2I5MmYxNzUwLi45MTM4YjRl
YTU5IDEwMDY0NAo+ICA+IC0tLSBhL3BhY2thZ2UvZ3JwYy9ncnBjLm1rCj4gID4gKysrIGIvcGFj
a2FnZS9ncnBjL2dycGMubWsKPiAgPiBAQCAtMjEsNiArMjEsNyBAQCBIT1NUX0dSUENfREVQRU5E
RU5DSUVTID0gaG9zdC1wcm90b2J1Zgo+ICA+ICAjIHdoaWNoIGRvZXNuJ3QgZG8gdGhpcy4gIFRo
ZXNlIENBUkVTIHNldHRpbmdzIHRyaWNrIHRoZSBnUlBDIGNtYWtlIGNvZGUgaW50bwo+ICA+ICAj
IG5vdCBsb29raW5nIGZvciBjLWFyZXMgYXQgYWxsIGFuZCB5ZXQgc3RpbGwgbGlua2luZyB3aXRo
IHRoZSBsaWJyYXJ5Lgo+ICA+ICBHUlBDX0NPTkZfT1BUUyA9IFwKPiAgPiArICAgIC1EQ01BS0Vf
RVhFX0xJTktFUl9GTEFHUz0iJChHUlBDX0VYRV9MSU5LRVJfRkxBR1MpIiBcCj4gID4gICAgICAt
RGdSUENfQUJTTF9QUk9WSURFUj1wYWNrYWdlIFwKPiAgPiAgICAgIC1EX2dSUENfQ0FSRVNfTElC
UkFSSUVTPWNhcmVzIFwKPiAgPiAgICAgIC1EZ1JQQ19DQVJFU19QUk9WSURFUj1ub25lIFwKPiAg
PiBAQCAtMzYsMTAgKzM3LDE1IEBAIEdSUENfQ09ORl9PUFRTID0gXAo+ICA+ICAgICAgLURnUlBD
X0JVSUxEX0dSUENfUFlUSE9OX1BMVUdJTj1PRkYgXAo+ICA+ICAgICAgLURnUlBDX0JVSUxEX0dS
UENfUlVCWV9QTFVHSU49T0ZGCj4KPiAgPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJFWEVDSU5G
TykseSkKPiAgPiArR1JQQ19ERVBFTkRFTkNJRVMgKz0gbGliZXhlY2luZm8KPiAgPiArR1JQQ19F
WEVfTElOS0VSX0ZMQUdTICs9IC1sZXhlY2luZm8KPiAgPiArZW5kaWYKPiAgPiArCj4gID4gICMg
Z3JwYyBjYW4gdXNlIF9fYXRvbWljIGJ1aWx0aW5zLCBzbyB3ZSBuZWVkIHRvIGxpbmsgd2l0aAo+
ICA+ICAjIGxpYmF0b21pYyB3aGVuIGF2YWlsYWJsZQo+ICA+ICBpZmVxICgkKEJSMl9UT09MQ0hB
SU5fSEFTX0xJQkFUT01JQykseSkKPiAgPiAtR1JQQ19DT05GX09QVFMgKz0gLURDTUFLRV9FWEVf
TElOS0VSX0ZMQUdTPS1sYXRvbWljCj4gID4gK0dSUENfRVhFX0xJTktFUl9GTEFHUyArPSAtbGF0
b21pYwo+ICA+ICBlbmRpZgo+Cj4gID4gIEdSUENfQ0ZMQUdTID0gJChUQVJHRVRfQ0ZMQUdTKQo+
ICA+IC0tCj4KPiAgPiAyLjM1LjEKPgo+ICA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ICA+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPgo+IC0tCj4gQnllLCBQZXRlciBLb3JzZ2FhcmQKCkJl
c3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
