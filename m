Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA2DE748F3
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 09:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FE5E83C71;
	Sun,  1 Oct 2023 09:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FE5E83C71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0aBCO9X4KFA; Sun,  1 Oct 2023 09:26:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D644083C73;
	Sun,  1 Oct 2023 09:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D644083C73
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A43C61BF32E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BFB3416CE
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BFB3416CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1HOSDSuVzCxz for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 09:26:03 +0000 (UTC)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27BA7414E2
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 09:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27BA7414E2
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-41997112ff0so1390621cf.0
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 02:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696152362; x=1696757162;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GecuigZltqh3bTA0bkUqxlt83EXBFMHSqiS7RL+RqNU=;
 b=V7InOJy/3Y55KwBBC8U5p6ySeQcGXikr7lrm0wQVh/yA9bXBZP2t5LgIe5AbNiEI2z
 +G98YQRPGcFk5QGQVJxtcETpEv0HqURaxeO2FSUVbAHQSUvNek8tAFBmt5PIz1H7cCWA
 yJ+Qf1DvbaoanYWdob0MMt8miInONQNAn8/PAj8oEWHXIgJtorC2lz6VLyGIqvVV61Ww
 k82OS7pBsSSTGcx1elub3Lxveh1ieqpncrAYjKOfbZyJzYeegJrKFhS56CWIGsitMA0q
 IN9kiprVo+34rXnv1FokudjcR6AzhBtAmI6Gm5ST6OwQkq7N6Gl0EETgJnXPXJ37wW5D
 LJzQ==
X-Gm-Message-State: AOJu0Yw/QfXdk6Vq9sgo6fMXB48ukvr7mSf09+s7gBfbJywdNjGd8lli
 blAd+dykGySobYBYxHGGgz/bCITL9p4aZR233/24bmWrqpreYQ==
X-Google-Smtp-Source: AGHT+IEahYjlva91NwK5bNm6GzYVlg+j8+TxrHsanMfXRmhcUc3pyXgTUVtS6UwQCEepyIR+Gc7Yamg3BZvgedtJTkg=
X-Received: by 2002:a05:622a:342:b0:418:1aed:ad5f with SMTP id
 r2-20020a05622a034200b004181aedad5fmr10189954qtw.7.1696152361852; Sun, 01 Oct
 2023 02:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230930221727.1458825-1-arnout@mind.be>
 <CADvTj4qkFQXKXQp_brP2RJ-0KZCMd6U44xEuPY6pYLRtpaOFrA@mail.gmail.com>
 <4ea102e8-0fb6-b158-c96a-b1d9d6004925@mind.be>
 <CADvTj4r8Wnn1x2=f=VMpou6v0TyNi6=4O51zx80zdnc+WAOc-g@mail.gmail.com>
In-Reply-To: <CADvTj4r8Wnn1x2=f=VMpou6v0TyNi6=4O51zx80zdnc+WAOc-g@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 1 Oct 2023 03:25:49 -0600
Message-ID: <CADvTj4qbB82Kft5vCNpoNbfKar5PM7WfAgB2mJwRV1UmCy4M-g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696152362; x=1696757162; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GecuigZltqh3bTA0bkUqxlt83EXBFMHSqiS7RL+RqNU=;
 b=k/iiwl1vJtgX/EvyDKCmYOJlkbHZI6luIk3thGsFneDMPIvAMi9DRfiptWB29Sdxjz
 qNAU2hiZHsoyHtUHxwru62jTBaO4RqimPMOJpycF47Xddc0riwRIOJZ7Qd+LEueMaMZ1
 rIM3qfLbGVKhmm2G7lZpaIFmA8+MJkX37WwGYfdXPCE0NaHTUJ2Ppucl8Rs04+ZrgclR
 n9VlaKcT8prDORqrifnYuc8XSAZtXVPyqVNZECnztjxw3WtU82hvE0Yhuv946kZNFPIn
 n7cT/PwT18xI07PFFNErSPz0yqqRSaeleZP0vDXBaxt2azIwNWQG4YS6F8gRKCsmnBh6
 ANkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k/iiwl1v
Subject: Re: [Buildroot] package/pkg-python.mk: refactor setup-type variables
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
Cc: "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBPY3QgMSwgMjAyMyBhdCAyOjQx4oCvQU0gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCBPY3QgMSwgMjAyMyBhdCAyOjIx
4oCvQU0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKPiA+Cj4g
PiA+IFdlIGNhbiBwcm9iYWJseSBkcm9wIGRpc3R1dGlscyBzZXR1cCB0eXBlIGFzIHdlbGwgYXMg
d2Ugc2hvdWxkIGJlIGFibGUgdG8KPiA+ID4gaW5zdGVhZCBqdXN0IHVzZSBzZXR1cHRvb2xzIGZv
ciBhbnkgcGFja2FnZXMgdXNpbmcgdGhhdC4KPiA+Cj4gPiAgIFRoYXQncyBhIGJpdCBhIGxvbmdl
ci10ZXJtIHByb2plY3QuCj4KPiBJIG9ubHkgc2VlIDQgcGFja2FnZXMgc3RpbGwgdXNpbmcgZGlz
dHV0aWxzIHN0aWxsIHNvIGFzc3VtaW5nIHRoZXkgd29yayBvayB1bmRlcgo+IHNldHVwdG9vbHMg
dGhpcyBtYXkgYWN0dWFsbHkgYmUgcXVpdGUgc2ltcGxlLgo+Cj4gSSdsbCB0cnkgYW5kIHRlc3Qg
aWYgdGhvc2UgYnVpbGQgdW5kZXIgc2V0dXB0b29scyBhbmQgbWlncmF0ZSB0aGVtIGlmIHRoZXkg
ZG8uCj4KClllYWgsIHRoZXkgYWxsIHNlZW0gdG8gYnVpbGQgZmluZSB1bmRlciBzZXR1cHRvb2xz
LCBJIHNlbnQgcGF0Y2hlcwptaWdyYXRpbmcgdGhvc2UKc28gd2Ugc2hvdWxkIGJlIGdvb2QgdG8g
cmVtb3ZlIG91ciBkaXN0dXRpbHMgaW5mcmFzdHJ1Y3R1cmUgYW55IHRpbWUgYWZ0ZXIgdGhvc2UK
YXJlIG1lcmdlZCBJIHRoaW5rLgoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2J1aWxkcm9vdC9wYXRjaC8yMDIzMTAwMTA5MTYxNi4xNzcxNzI1LTEtamFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbS8KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC8yMDIzMTAwMTA5MTgwMi4xNzcxOTY4LTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bS8KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDIzMTAwMTA5MTk0My4xNzcyNDQxLTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIzMTAwMTA5
MjEwOS4xNzcyNjU4LTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
