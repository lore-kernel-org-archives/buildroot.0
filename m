Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3AFC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 19:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CE0F4156E;
	Wed,  2 Feb 2022 19:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AkotIIJDeGkE; Wed,  2 Feb 2022 19:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 802E8410B6;
	Wed,  2 Feb 2022 19:39:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E17AB1BF364
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 19:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF5AF410B6
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 19:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVRx1ertfgR4 for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 19:39:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D662B40909
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 19:39:32 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 x52-20020a05683040b400b0059ea92202daso437139ott.7
 for <buildroot@buildroot.org>; Wed, 02 Feb 2022 11:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2w5EXpzRgOdUA0Ash9qCrRJkzQfw7Y8W7CNBmLUQm3c=;
 b=GaYb7TJj9teofZ9xKHt8E3SL/ujnzelGm61XK6KGHfm5HxY8F1D0HVZvkGoCSWLcoN
 +FPMF5Rn4vA77AxPHrwWmp2y5K1Q1q4yG9YB9RfeGjbQ4OD/FCoZJnXgT80L+yBXcfn1
 Yn23rhmUrXV6l4qrggTqCkMLWSAZ/OnMBWYvfBtgajlcRgQ11j+wY/JVRMSN5Bf8oVSe
 tGTmMH0jRZ7DstRrXmqFpwVyCqpuLavvW6hl5gfoDUq3yrbMoNxV+VBQizi6wUv4nsq1
 6tsTTJoAcdpPp/ys/D1I5J40bNgeFIhG8Bsc4930mMJPWmaXxdg+MEHbT9DqUXYJKxHI
 Re+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2w5EXpzRgOdUA0Ash9qCrRJkzQfw7Y8W7CNBmLUQm3c=;
 b=ULz4qx/nEgXGyqFTnTzL077TdVutiwwSVhqLEWA2DNIdUV8ZUxh6QviLShOX6L8U8r
 kh4CiCK+LkOL0xps0QSzXmMmdEtAG2FmLsK+NmkPe+zZygOGwnH2sBA26kuysIFPgsCV
 SjdnBC1KqIsJ7FlaJ1+Vgn6f7REPt0GoAhnrnubbWkBJ5/vOpxWtmkI5Kp7CTEMezhqu
 zrIiNZ5RRcrwMrkcdqGvI/4h8LbVhmE3otFNUdADwENSal9rKPxJnnJBW8lIDIV/rKdL
 2Ppdc9emhKLx9HnQCLrtzi60fhvHwECf74c2j6LGMtaJPYxNyJECBnaFKa/nxsdgLMIh
 x3tQ==
X-Gm-Message-State: AOAM533WJNtPRLGzpNaLc8sm1iIwxKzKzaqNTGdApNxlJMGXScB7SoVW
 qXH61VxTliP/VxKHtD8s+/wErKiGNZd2HW0wZgg=
X-Google-Smtp-Source: ABdhPJxHsjKzI71d3IhD+mqWwM7OQLc49dLZGgKM5qS0KfhMnJeq/NocJaIHEUlAnxGvZ+bt+oN0wwz+rCP3f/IwSTk=
X-Received: by 2002:a05:6830:450:: with SMTP id
 d16mr18498159otc.151.1643830771633; 
 Wed, 02 Feb 2022 11:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20220131015937.4113728-1-james.hilliard1@gmail.com>
 <20220131104553.715b97ce@windsurf>
 <731c2ec5-e693-f2d4-5f48-0eaf376c57d1@smile.fr>
In-Reply-To: <731c2ec5-e693-f2d4-5f48-0eaf376c57d1@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 2 Feb 2022 12:39:20 -0700
Message-ID: <CADvTj4q9ea12wJk3FfpRdwKVhvLDGrBa9HW89rA2tfPQhX+NRg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package:{clang, lld,
 llvm}: bump to version 11.1.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Romain Naour <romain.naour@gmail.com>,
 Matthew Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKYW4gMzEsIDIwMjIgYXQgNDozNiBBTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBIZWxsbyBKYW1lcywgVGhvbWFzLCBBbGwsCj4KPiBMZSAz
MS8wMS8yMDIyIMOgIDEwOjQ1LCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3QgYSDDqWNy
aXQgOgo+ID4gT24gU3VuLCAzMCBKYW4gMjAyMiAxODo1OTozNyAtMDcwMAo+ID4gSmFtZXMgSGls
bGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+PiBUaGlzIGFw
cGVhcnMgdG8gYmUgdGhlIGxhdGVzdCB2ZXJzaW9uIHRoYXQgaGFzIGEgd29ya2luZyBsbGQgYnVp
bGQuCj4gPj4KPiA+PiBWZXJzaW9uIDEyLjAuMCBhbmQgbmV3ZXIgaGF2ZSBicm9rZW4gbGxkIHN0
YW5kLWFsb25lIGJ1aWxkczoKPiA+PiBodHRwczovL2J1Z3MubGx2bS5vcmcvc2hvd19idWcuY2dp
P2lkPTQ5MjI4Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+Cj4gPiBJcyB0aGlzIHJlYWxseSBlbm91Z2g/IEkgcmVt
ZW1iZXIgc2VlaW5nIHBhdGNoZXMgYSBsb25nIHRpbWUgYWdvIGRvaW5nCj4gPiBidW1wcyBvbiBM
TFZNL0NsYW5nIGFuZCB0aGF0IHdhcyBtdWNoIG1vcmUgaW52b2x2ZWQsIHdoaWNoIEkgdGhpbmsK
PiA+IGV4cGxhaW5zIHdoeSB3ZSdyZSBzdGlsbCBhdCB2ZXJzaW9uIDkueC4KPiA+Cj4gPiBSb21h
aW4sIGFueSBjb21tZW50cyBvbiB0aGlzPwo+Cj4gQWRkaW5nIE1hdHQgaW4gQ2M6Cj4KPiBJSVJD
LCB0aGVyZSBpcyBhbiBpc3N1ZSB3aXRoIGxpYmNsYyBwYWNrYWdlIHdoaWNoIGlzIHBhcnQgb2Yg
dGhlIGxsdm0gcHJvamVjdC4KPgo+IER1ZSB0byB0aGUgZ2FwIGJldHdlZW4gdGhlIHR3byB2ZXJz
aW9uLCBhbGwgQ01ha2Ugb3B0aW9ucyBtdXN0IGJlIHJldmlld2VkIChsb25nCj4gYW5kIGJvcmlu
ZyB0YXNrIEkgYWdyZWUpLgoKT2gsIEkgZ3Vlc3MgdGhlcmUgd2FzIGFscmVhZHkgYSBzZXJpZXMg
aGVyZSB3aXRoIG1vcmUgY2hhbmdlczoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9MjMzNDMxJnN1Ym1pdHRlcj0mc3RhdGU9KiZxPSZh
cmNoaXZlPWJvdGgmZGVsZWdhdGU9Cgo+Cj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+Cj4gPgo+
ID4gVGhvbWFzCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
