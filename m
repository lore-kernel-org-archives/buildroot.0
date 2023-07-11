Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6430DEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 10:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D19B74015D;
	Tue, 11 Jul 2023 10:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D19B74015D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahDUCxiCcHDt; Tue, 11 Jul 2023 10:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B684D4094D;
	Tue, 11 Jul 2023 10:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B684D4094D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45C651BF3F9
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 10:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F77581E85
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 10:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F77581E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yS9AJU1AX7En for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 10:50:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E34A81E75
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E34A81E75
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 10:50:36 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3a04e5baffcso4556702b6e.3
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 03:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689072636; x=1691664636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOe7eif1JlcC3YZ6mU+JPGNZXngbaiGtD/UMbe3KzUU=;
 b=kxg2NRWG94VJ9DEUJXynWb5uRAJOAnDdk1qBlEQT0I+qEP3/crfg3Bfy8uMg39VV5b
 pfdVBiNNmsq4m336GxnXaOBoESzQZIO4lLdjlSUYklvdCk0N+6baZgUUns/Z44wK1d+C
 fNp8seHEDr1gcwqznbFs9mFmtXXRq6LVXRMpzGzvQVvMZctkYLHXcUOHGLL51BpC7gKC
 5VO0S705jjVVxDbO9egfnlrDm0/tfJscnLrMRJBhW2nC7voqa9DYA7BjxSXZfSfxNy9u
 rx+Sr6u90EydHwKtTbzXNCHKCSYMYDNheYVyqMMeMwZNX2E2DFd6pYzq6vj+todE5gbR
 5yzA==
X-Gm-Message-State: ABy/qLZL7P4I+7l3GyoCM+yZ1/Ua54zEBVFNpgK1t506k3vo+A4GmOe2
 flP3uyBd5x0q0GyosjYV6jMB2YUja5+7YijLC1pV7NE4Bl4=
X-Google-Smtp-Source: APBJJlFfkaNoH57+tVEwLuVIOIJccEJdrqUCBt8gPDk+piKIcU5X4qEDTu3r8OvUhqAhJsQQ0Aq3Meh26A+1YFBQCVM=
X-Received: by 2002:a05:6870:46aa:b0:1b0:233e:406d with SMTP id
 a42-20020a05687046aa00b001b0233e406dmr17390445oap.23.1689072635975; Tue, 11
 Jul 2023 03:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230627072640.2437216-1-james.hilliard1@gmail.com>
 <20230627072640.2437216-2-james.hilliard1@gmail.com>
 <20230710200146.33aa4362@windsurf>
 <CADvTj4ruzjfhJ-Ns9rPYhrW4oGWGqCkf66gUjTT+DR+DB8C3Xw@mail.gmail.com>
 <20230711093249.73674060@windsurf>
 <CADvTj4r7QRpW3NaYQc+_iZ5Y1WnzBeMQsptvtrtTudDc47X12w@mail.gmail.com>
 <20230711100053.1d9d3671@windsurf>
 <CADvTj4p1kQLf9J=s_xqHVZVeSwHUVVMBSMHPJsA-JT2oHHNCrQ@mail.gmail.com>
 <20230711115458.34cc38a9@windsurf>
In-Reply-To: <20230711115458.34cc38a9@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Jul 2023 04:50:23 -0600
Message-ID: <CADvTj4pt0RjvYoF3Wvxa7QsPbNJQre7J3Vb8sp6ckvR86Yrvsw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689072636; x=1691664636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOe7eif1JlcC3YZ6mU+JPGNZXngbaiGtD/UMbe3KzUU=;
 b=b7F9ERZAUnskvu40JM3lA72mPKT1Bqlmnqt3B3G7M4Mu9HgIoEDjlUgasrPzKBOOdu
 WUvHPhPz2wVTB1ACULgmk7XXK9HgkQorsOHdPqw3RUvEVQ5T/DK3w9mcd460wKExwR+l
 n1SWpCBBkWbNAgw3CvCd09jmP+pQiRfqXb4dx0wt2Lbyzz5s2Ut22Qqw9NtnqAJJ5S71
 CCzZjx1agbIDUkkJeed2EiZ1dNAvo5TlS45q10KYjbHe90CPA92W/5+3cP3kk5hYpBeP
 65oQ01wu5S/P9d1r6fuw298Lqfz+xoB6jnUA0bOOpZTI863tVyqQ4z/UqiHMbmyDeGJA
 a+sQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=b7F9ERZA
Subject: Re: [Buildroot] [PATCH 2/2] package/python-terminaltables: fix
 build backend
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMzo1NeKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAxMSBKdWwgMjAyMyAw
Mzo0MzoyNiAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gVGhpcyBzZXJpZXMgY2FuIGJlIHJldmlld2VkIGVudGlyZWx5IGluZGVw
ZW5kZW50bHkgb2YgdGhlIG90aGVyIG9uZSwgSQo+ID4gd2VudCBhaGVhZCBhbmQgbWFya2VkIHRo
ZSBmaW5hbCBwZXA1MTcgc2V0dXB0b29scyBtaWdyYXRpb24gcGF0Y2ggYXMKPiA+IGRlZmVycmVk
IGZvciBub3cgc28gdGhhdCB0aGVyZSBhcmVuJ3QgZGVwZW5kZW5jeSBvcmRlcmluZyBpc3N1ZXMg
b3IKPiA+IGNvbmZ1c2lvbiByZWdhcmRpbmcgdGhlIHJlbGF0aW9uIG9mIHRoaXMgc2VyaWVzIHRv
IHRoZSBvdGhlciBvbmUuCj4KPiBUaGlzIGlzIGEgYmFkIGlkZWEsIHdoaWNoIGNhdXNlcyBldmVu
IG1vcmUgY29uZnVzaW9uLCBhcyB3ZSBkb24ndAo+IHVuZGVyc3RhbmQgKndoeSogeW91J3JlIG1h
a2luZyB0aG9zZSBjaGFuZ2VzLgoKVGhlIGJ1aWxkIHN5c3RlbSBpcyBzdXBwb3NlZCB0byBiZSBw
b2V0cnkvcG9ldHJ5LWNvcmUsIG5vdCBzZXR1cHRvb2xzLCBwb2V0cnkKaXMgdGhlIGNvcnJlY3Qg
YmFja2VuZCBzcGVjaWZpZWQgaW4gdGhlIHB5cHJvamVjdC50b21sLCB0aGUgc2Rpc3QgaGFzCmEg
c2V0dXB0b29scwpzaGltIGZvciBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBhcHBhcmVudGx5LCB0
aGlzIHNoaW0gaXNuJ3QgZXZlbiBjaGVja2VkIGludG8KdmVyc2lvbiBjb250cm9sIGZvciB0aGUg
cHJvamVjdCBzbyB3ZSBzaG91bGRuJ3QgYmUgdXNpbmcgaXQgYXMgaXQncwpub3QgcmVhbGx5IHRo
ZQpjb3JyZWN0IHdheSB0byBiZSBidWlsZGluZyBhIHBvZXRyeSBiYXNlZCBwYWNrYWdlLgoKaHR0
cHM6Ly9naXRodWIuY29tL21hdHRoZXdkZWFubWFydGluL3Rlcm1pbmFsdGFibGVzL2Jsb2IvdjMu
MS4xMC9weXByb2plY3QudG9tbCNMNjQtTDY2Cgo+Cj4gQ291bGQgeW91IGluc3RlYWQgZG8gd2hh
dCB3ZSBzdWdnZXN0LCBpLmUgcmVzZW5kIG9uZSBzaW5nbGUgZnVsbCBzZXJpZXMKPiB0aGF0IGlu
Y2x1ZGUgYWxsIGNoYW5nZXMsIGluY2x1ZGluZyB0aGUgZmluYWwgY2hhbmdlIG9mIHRoZSBQRVA1
MTcKPiBzZXR1cHRvb2xzIG1pZ3JhdGlvbiwgdG9nZXRoZXIgd2l0aCBhIGNvdmVyIGxldHRlcj8K
CkkgbWVhbiwgdGhpcyBpcyBqdXN0IGEgYnVnIHRoYXQgZGlkbid0IGdldCBub3RpY2VkIGVhcmxp
ZXIsIEkganVzdCBoYWRuJ3QgY2F1Z2h0Cml0IGJlZm9yZSBJIGRpZCBteSBwZXA1MTcgbWlncmF0
aW9uLCB0aGUgZml4IGlzIHRoZSBzYW1lIHdoZXRoZXIgb3Igbm90CnRoZSBwZXA1MTcgcGF0Y2gg
aXMgbWVyZ2VkLgoKSWYgSSBoYWQgY2F1Z2h0IHRoZXNlIGJ1Z3MgYmVmb3JlIHNlbmRpbmcgdGhl
IHNldHVwdG9vbHMgcGVwNTE3IG1pZ3JhdGlvbgpzZXJpZXMgSSB3b3VsZCBoYXZlIGRlZmVycmVk
IHRoZSBmaW5hbCBtaWdyYXRpb24gcGF0Y2ggdGhlcmUgdG8gYXZvaWQgdGhpcwpzb3J0IG9mIGNv
bmZ1c2lvbi4KCj4KPiBJJ3ZlIGFscmVhZHkgYXNrZWQgdGhpcyBpbiAzIHNlcGFyYXRlIGUtbWFp
bHMsIGJ1dCB5b3UgaW5zaXN0IG9uIG5vdAo+IGRvaW5nIHdoYXQgaXMgcmVxdWVzdGVkIHRvIGdl
dCB5b3VyIGNoYW5nZXMgaW50ZWdyYXRlZCA6LS8KCkkndmUgc2VudCBhIGJ1bmNoIG9mIHBhdGNo
ZXMgdGhhdCBlZmZlY3RpdmVseSBkbyB0aGUgc2FtZSB0aGluZyBhcyB0aGlzIG9uZQp3aGljaCBo
YXZlIGJlZW4gbWVyZ2VkIGluZGVwZW5kZW50bHksIHNvIG90aGVyIHRoYW4gdGhlIGRlcGVuZGVu
Y3kKb3JkZXJpbmcgSSBkb24ndCBzZWUgaG93IHRoaXMgaXMgcmVsYXRlZCB0byB0aGUgc2V0dXB0
b29scyBwZXA1MTcgbWlncmF0aW9uCnBhdGNoLiBUbyBtZSBpdCBzZWVtcyB0aGF0IEkgYWNjaWRl
bnRhbGx5IGNyZWF0ZWQgYSBidW5jaCBvZiB1bm5lY2Vzc2FyeQpjb25mdXNpb24gYnkgc2VuZGlu
ZyBteSBzZXR1cHRvb2xzIHBlcDUxNyBtaWdyYXRpb24gcGF0Y2ggdG9vIGVhcmx5IHdoZW4KSSBz
aG91bGQgaGF2ZSBqdXN0IHdhaXRlZCB1bnRpbCBkZXBlbmRlbmN5IGZpeGVzIGxpa2UgdGhpcyB3
ZXJlIG1lcmdlZC4KCkknbSBraW5kIG9mIHB1c2hpbmcgYmFjayBhIGJpdCBoZXJlIHNpbmNlIG1h
a2luZyBhIGdpYW50IHBhdGNoIHNlcmllcyB3b3VsZApqdXN0IGVuZCB1cCBtYWtpbmcgcmV2aWV3
aW5nL3JlYmFzaW5nIGEgbG90IG1vcmUgY29uZnVzaW5nIElNTy4KCklmIHRoaXMgd2FzIGEgY2hh
bmdlIHRoYXQgY291bGRuJ3QgYmUganVzdGlmaWVkIGluZGVwZW5kZW50bHkgSSB3b3VsZCBhZ3Jl
ZQp0aGF0IGl0IHNob3VsZCBiZSBpbiBhIHNlcmllcyB3aXRoIG90aGVycy4KCkkgdGhpbmsgdGhl
cmUgYWxzbyBtaWdodCBiZSBzb21ldGhpbmcgd3Jvbmcgd2l0aCBob3cgSSdtIG1hbmFnaW5nIG15
CnBhdGNoIHNlcmllcyB3aXRoIGdpdCBhcyB0aGV5IHNlZW0gdG8gYmUgc2lnbmlmaWNhbnRseSBl
YXNpZXIgZm9yIG90aGVycyB0bwptYW5hZ2UuIEV2ZXJ5IHRpbWUgSSBkZWFsIHdpdGggYSBsYXJn
ZSBzZXJpZXMgaXQgZmVlbHMgbGlrZSBpdCdzIGEgbG90IGhhcmRlcgp0aGFuIGl0IHNob3VsZCBi
ZS4KCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8s
IEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFp
bmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
