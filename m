Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0C8C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 08:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C961582C4D;
	Tue,  1 Feb 2022 08:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THjMsZrK6-e3; Tue,  1 Feb 2022 08:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 136D782BC3;
	Tue,  1 Feb 2022 08:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BDC61BF4D5
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 08:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37DFF82BC3
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 08:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fBZFLlUbenZ9 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 08:56:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D3A982B93
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 08:56:14 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id w7so20293064ioj.5
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 00:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1LJ0Aezwgf8QYclAtTUgFnVuxSkU1gHMwXKwSS41o3k=;
 b=Y7WrIAZ2zl3wy7VD5iouG/T8er/D9h8NTCsW/9LSbu72fRwokR5UUF0cBuScrnW9Bo
 s8EB2c12D+0ujR3leqYHJiboWWXYLcfEpVgodaliD3TwUGzgSfwujdxiGQHtWy5+4rfL
 YY23C3v+xHDzIwKgW8H2zqFuUEPtBaY/IjT1MCDjrua7ac+NMDuHVtpfjAXM6jlzZPnj
 QD/tc3p12RyTfGlGh3crkBIFIcAuNFo6y1d//FPnrGjyICmsDD3UnbuwErxm3hWZjbTy
 oml4aChEo/tW1HeQ0Gladd4TyrAWA7TOzXRuTtMTsViOlMuFgKw4dsIR8epjuKFBfQZi
 qSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1LJ0Aezwgf8QYclAtTUgFnVuxSkU1gHMwXKwSS41o3k=;
 b=KQFbJiWv7bNZNb8RqvoxaymKZLj/bx0cyF1h8IR5571OsnxT8xZ+qULxMLlw5sZP6B
 N3cBkXrgWrJ30yDaea/qAmqgjHubXm9gKtkTgNwJVvlVP4oI036Vn23XyMk2kAFnslTM
 tmvFXGh02the28UH7flVNSDwTdBPZmRwn8rIDpcBK3nU1agULTWQ04FPeWTQEHan6Otd
 CB7KXHR2nTRUwNSIe5fUyzuh0Xwpr++IvizoylHeHONLMCiPHNKc/1NKl9Tzm3p8iChj
 mSL7XHOYT0o14xiPDaSsXRlrn/Nbwf2sW2fbw4M/RNMi0qpl0Y/RUNJ608bNGfiCtdMJ
 8d8Q==
X-Gm-Message-State: AOAM532QgXp9aT6DaqxsvjSBVBMqt/A3R+ICFnnB1BpF8rE95BT0YG0s
 Jjrt1xwANAVQd1lSxYGVvaGsVbHKBGhJp3dGD9g=
X-Google-Smtp-Source: ABdhPJzVcDfev4cbfs2yaBSWwR5swGS+8pHw58inMWUxYQ3B9DCqFM8OVMwfuRhV+b91NJY21SQydzZur3z5mpJ6lwE=
X-Received: by 2002:a05:6602:2d4b:: with SMTP id
 d11mr12795413iow.50.1643705773242; 
 Tue, 01 Feb 2022 00:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20210303150451.7963-1-patrickdepinguin@gmail.com>
 <527fd8d5-6c7e-aa10-06ba-e634ba3c600d@mind.be>
In-Reply-To: <527fd8d5-6c7e-aa10-06ba-e634ba3c600d@mind.be>
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 1 Feb 2022 09:55:20 +0100
Message-ID: <CAAXf6LXAqh_K9dckvzs_hZxtJOvQcffOtLvhsU-JObR-ivRgEw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCHv2 1/2] utils/size-stats-compare: clarify
 meaning of variables in print_result
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RWwgbHVuLCAzMSBlbmUgMjAyMiBhIGxhcyAyMTozOCwgQXJub3V0IFZhbmRlY2FwcGVsbGUKKDxh
cm5vdXRAbWluZC5iZT4pIGVzY3JpYmnDszoKPgo+Cj4KPiBPbiAwMy8wMy8yMDIxIDE2OjA0LCBU
aG9tYXMgRGUgU2NoYW1waGVsZWlyZSB3cm90ZToKPiA+IEZyb206IFRob21hcyBEZSBTY2hhbXBo
ZWxlaXJlIDx0aG9tYXMuZGVfc2NoYW1waGVsZWlyZUBub2tpYS5jb20+Cj4gPgo+ID4gcHJpbnRf
cmVzdWx0IGlzIGp1Z2dsaW5nIHdpdGggZW50cnlbeF1beV0gd2hpY2ggaXMgbm90IHZlcnkgcmVh
ZGFibGUuCj4gPiBXaGlsZSBhIGJldHRlciBzb2x1dGlvbiB3b3VsZCBiZSB0byB1c2UgYSBjbGFz
cyBhbmQgcmVmZXJlbmNlIG5hbWVkCj4gPiBhdHRyaWJ1dGVzLCB0aGF0IHdvdWxkIHJlcXVpcmUg
c29tZSBiaWdnZXIgY2hhbmdlcyBpbiB0aGUgc2NyaXB0Lgo+ID4KPiA+IEluc3RlYWQsIG1ha2Ug
YSBtaW5pbWFsIGltcHJvdmVtZW50IGJ5IGFzc2lnbmluZyB0aGUgZW50cnlbeF1beV0gdmFsdWVz
IHRvCj4gPiBpbnRlcm1lZGlhdGUgdmFyaWFibGVzLiBTdG9yZSB0aGVtIGluIGEgZGljdCBmb3Ig
ZWFzeSB1c2FnZSBmcm9tIGEgZm9ybWF0Cj4gPiBzdHJpbmcuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIERlIFNjaGFtcGhlbGVpcmUgPHRob21hcy5kZV9zY2hhbXBoZWxlaXJlQG5va2lh
LmNvbT4KPgo+ICAgU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4KPiAgIEl0J3Mg
YSBiaXQgc2lsbHkgdGhhdCB0aGlzIGhhcyB0byB0YWtlIGEgeWVhciwgYnV0IGl0IGlzIHdoYXQg
aXQgaXMuLi4KCk5vIHdvcnJpZXMsIHRoYW5rcyBpbiBhbnkgY2FzZSEKCi9UaG9tYXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
