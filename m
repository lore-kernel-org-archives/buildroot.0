Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F91DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 23:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8DBC40908;
	Sun, 30 Jan 2022 23:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfDlHldphGlO; Sun, 30 Jan 2022 23:27:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC25840909;
	Sun, 30 Jan 2022 23:27:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11D8E1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 23:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F065383F83
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 23:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GciYWXzgJcrD for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 23:27:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 183A783F7E
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 23:27:24 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so16592998pjj.4
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 15:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VmRlmzpzWPs4kBpgvAi9yX+7WPt8iQxroTeajjFwaeE=;
 b=W5dvGHXrUvIpN00x1o85yl8fHuZiMiMxwifZGo6gfYJE7cpAryhqvkzKNuJouRVULE
 83ivZHm0hJ1kiC8w9r3oimO7UnvzLD/ruEqLSj3BayaH82jfaPM2b+fMLP56L+ewkeAC
 a7RWO0MngJrQHAF0G4+SPE9pzUVeX9SKJbFhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VmRlmzpzWPs4kBpgvAi9yX+7WPt8iQxroTeajjFwaeE=;
 b=RAFPjobvecm7bm86OYosAsmjqQjyP/qOkZMEI499qfYfPod5+Ie+pUl9CwWBT/oTwK
 kDReQ430W0Qzn3Elb9NgMnuL9cXw73Bd7zQbfq/xP2KqMVHnNQMthHLDGMTePhf33Xwj
 eKZXQHao+nONV/gbi2ZyJLiZEfgy/xO3I/3P5jxi/Ga/lNRk6bJ8NkgLyPuA0J5X09za
 zkZKvWZBk8a2StvY4sn1mz2DC8fbBgQjPfyWT0FtZ2h4nVo8WFHnnzJWbgzteqr4yG03
 G7o+H7Qiv/RjjlBbGt0AQV9QgCnBfmG2uPDTy51HTE9wbt5OwOAsRALF7eHH51oOQaxB
 gP4w==
X-Gm-Message-State: AOAM531GwTzersdBSAEm8jUwpEoeTkrkPy2gZwcF9JKQjwampyIdFchp
 lec/esZvYmY43k45ESqompaM8Bg7MZW9Alaydeq+S7dlvgo=
X-Google-Smtp-Source: ABdhPJxrZSZsPno/r+N6mL7NvheBu0wjD4/jX8QPMmcTDgL/PL81YwCrSy1pPcdALkpZZrqD/pM9s67RX8qgCyfU93M=
X-Received: by 2002:a17:90b:1c8a:: with SMTP id
 oo10mr5428271pjb.59.1643585244366; 
 Sun, 30 Jan 2022 15:27:24 -0800 (PST)
MIME-Version: 1.0
References: <CAOf5uwkHPx7rh5H7=zeFpkNMSj47=0vMfPO0P8oSZKnwhh8q9A@mail.gmail.com>
 <6D05417C-EE4C-4145-BDB2-5CD9AC5A39A5@benettiengineering.com>
 <db57ab75-3fa3-40e7-f280-817147d20f75@benettiengineering.com>
In-Reply-To: <db57ab75-3fa3-40e7-f280-817147d20f75@benettiengineering.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 31 Jan 2022 00:27:12 +0100
Message-ID: <CAOf5uwn+fbgvm=YuzUC=ejsLBYTE-64s0d8BzGxOMY8J+r=r_A@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] board: Add support for iMX8MN BSH SMM S2 PRO
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvCgpPbiBTYXQsIEphbiAyOSwgMjAyMiBhdCA4OjQ2IFBNIEdpdWxpbyBCZW5ldHRp
CjxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPgo+IEhpIE1p
Y2hhZWwsCj4KPiBPbiAyOS8wMS8yMiAxNDo1NCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4gW1NO
SVBdCj4KPiA+Pj4gSGF2ZSB5b3UgZ2l2ZW4gYSBnbyB3aXRoIGxhdGVzdCBCdWlsZHJvb3QgZG9j
a2VyIHRvIGNoZWNrIGlmIHVib290Cj4gPj4+IG5lZWRzIGxpYmZkdHB5LCBweXRob24zIGV0Yy4/
Cj4gPj4+IEl04oCZcyBoaWdobHkgcHJvYmFibGUgaXQgbmVlZHMgdGhlbS4KPiA+Pgo+ID4+IFN1
Z2dlc3Rpb24sIHNob3VsZCBiZSBnaXZlbiB0byB0aGUgb3RoZXIgbmV3ZXN0IGJvYXJkIHRoYXQg
d2FzIGFkZGVkLgo+ID4KPiA+IENvcnJlY3QsIEnigJltIGdvaW5nIHRvIGNoZWNrIG15IGxhdGVz
dCBib2FyZCByZXZpZXdzIGFib3V0IHRoaXMKPgo+IEkndmUgcG9pbnRlZCB0aGVtIHRiaAo+Cj4g
Pj4gSSB0aGluayB0aGF0IHlvdSBhcmUgdGFsa2luZyBhYm91dAo+ID4+IGhvc3QtdG9vbHMgaGVy
ZS4KPiA+Cj4gPiBZZXMKPiA+Cj4gPj4gUGxlYXNlIHBvaW50IG1lIHRvIHRoaXMgYnVpbGRyb290
IGRvY2tlcgo+ID4KPiA+IGh0dHBzOi8vaHViLmRvY2tlci5jb20vci9idWlsZHJvb3QvYmFzZS90
YWdzCj4gPiA8aHR0cHM6Ly9odWIuZG9ja2VyLmNvbS9yL2J1aWxkcm9vdC9iYXNlL3RhZ3M+Cj4g
PiAjIGRvY2tlciBwdWxsIGJ1aWxkcm9vdC9iYXNlOjIwMjExMTIwLjE5MjUKPgo+IFRoaXMgaXMg
bm90IGNvcnJlY3QsIHNvcnJ5LCBJJ3ZlIGp1c3QgZ2l2ZW4gYSB0cnkgYW5kIGl0IGJ1aWxkcwo+
IGNvcnJlY3RseSBldmVuIGlmIGl0IGZhaWxzIHdpdGggZ2l0bGFiIENJLgo+IFlvdSBoYXZlIHRv
IHVzZSB0aGlzIGRvY2tlcjoKPiBkb2NrZXIgcHVsbCBidWlsZHJvb3QvYmFzZToyMDIxMDkyMi4y
MjAwCj4KCkkgd2lsbCByZXNlbmQuIEkgZm91bmQgc29tZSB3cm9uZyBhcnRpZmFjdHMgYW5kIEkg
bmVlZCB0byB0ZXN0IGl0IGFnYWluCgpNaWNoYWVsCgo+IEJlc3QgcmVnYXJkcyEKPiAtLQo+IEdp
dWxpbyBCZW5ldHRpCj4gQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCgoKLS0gCk1pY2hhZWwgTmF6
emFyZW5vIFRyaW1hcmNoaQpDby1Gb3VuZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmljZXIKTS4g
KzM5IDM0NyA5MTMgMjE3MAptaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KCkFtYXJ1bGEgU29sdXRpb25zIEJWCkpvb3AgR2Vlc2lu
a3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKVC4gKzMxICgwKTg1IDExMSA5MTcyCmlu
Zm9AYW1hcnVsYXNvbHV0aW9ucy5jb20Kd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
