Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A66C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC63781D88;
	Wed, 23 Feb 2022 20:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2feAVs0oaj_e; Wed, 23 Feb 2022 20:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FEFA813CF;
	Wed, 23 Feb 2022 20:10:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F30FB1BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1208813CF
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyYKoXR5fnAd for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:10:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FFA9813A9
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:10:18 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 j3-20020a9d7683000000b005aeed94f4e9so9384894otl.6
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tKgJN2OB/4RF4JEqVoELBbd7qV5rUQ38VQZ2jx6iLCA=;
 b=FlcUUCIibrY19MDw/wJKFqQ6Bz7yano5S+ahk0H0tCrAsl0QyY86OaL3QwKZvuNScu
 gc4can7BAs3eb6iHr9gPpfViF+6DEjL0V7XT2xZ5MI5NBDoARq+Yr0m918YwkYHkfetV
 15iedRuy4asJXTe1oWBSFS67qwRbHWZ10YTV4jE39aNYuD08cV3/nvflwHKEohfRV3iG
 M6MacEnNbMbqMcQ3qrXU1j51De1Mf0lL78GP2dcoDyok26xStNdqPPon/0kipxp9egH+
 F10mNXBvzx1Fo7CmRx7CIYZhHZ5xL2eJLRaN+itlJAgMAjesqOeoA14UxweqMmsJr50G
 HEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tKgJN2OB/4RF4JEqVoELBbd7qV5rUQ38VQZ2jx6iLCA=;
 b=Cgtx2Nck/iCoKAnZi/xZcN5kCmVaCicZvGRBFzWbyWgGJj9pgf9bZxvHOgvjBI62Iy
 v56sxP4vrsmPmZBF0W/sE11SoLSzySAPA4i7O+fHTtzZbnyJMs9C0bLN/8RFn+Yl6Tdd
 oe/+EoDoEOTF+9tCqHjGAa5pPqjj6TS0k5ipgzXCc1RRtzeA0qrYHxiOoleAo4/SUK3e
 vJmKOtRPxRQtRh+swTDht3RBd1nEW05hIZb3nsTCQuwqes4J2UdWyEvx6uZMmtMOiXWS
 SdOo8hJqCO/xG4u3QO8yMZQB9lhPqxve/4o6M0CqVb52LnmxXjwP6Ydzl3BooDIwImLP
 rOgw==
X-Gm-Message-State: AOAM532JEbQi/faT6JnQHOA8YGnKn4Q9WVc8g5N6BH7PjmJVeZXYfZEf
 nUrc5ow1NTyqNguKA2oGoyQ2cOa1epY1AOY7Sd1KqQ/bWUE=
X-Google-Smtp-Source: ABdhPJwADLVDspeTDAi/9V5N3+ZN/Pegtg55PyL+1wAj32vP9aJ5g/SoLkQyGtkjxzvUKV5lBXAQjcMSSMwMCEkwQ7g=
X-Received: by 2002:a9d:ecc:0:b0:5ad:526f:4f5d with SMTP id
 70-20020a9d0ecc000000b005ad526f4f5dmr510261otj.114.1645647016637; Wed, 23 Feb
 2022 12:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20220214212301.4142823-1-fontaine.fabrice@gmail.com>
 <d8ca7ab8-3aa3-20aa-c39a-10fc2e4466af@mind.be>
In-Reply-To: <d8ca7ab8-3aa3-20aa-c39a-10fc2e4466af@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 23 Feb 2022 21:10:04 +0100
Message-ID: <CAPi7W8137WxHg1zdwe0mOX2jZKuRiDmxEFR+gRSO9f2RF+ZhNA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/ghostscript: disable tesseract
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiAyMyBmw6l2ci4gMjAyMiDDoCAyMTowNSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFy
bm91dEBtaW5kLmJlPiBhIMOpY3JpdCA6Cj4KPgo+Cj4gT24gMTQvMDIvMjAyMiAyMjoyMywgRmFi
cmljZSBGb250YWluZSB3cm90ZToKPiA+IGdob3N0c2NyaXB0IGVtYmVkcyBhIGxvY2FsIGNvcHkg
b2YgdGVzc2VyYWN0LW9jciB3aGljaCBpcyBlbmFibGVkIGJ5Cj4gPiBkZWZhdWx0IHNpbmNlIHZl
cnNpb24gOS41My4wIGFuZAo+ID4gaHR0cHM6Ly9naXQuZ2hvc3RzY3JpcHQuY29tLz9wPWdob3N0
cGRsLmdpdDthPWNvbW1pdDtoPTczMjJlZjg3NTQ2YzU1YjI5MDU2YzFkOTZkOGJkYmI3ZjNiYTUz
ZWYKPiA+Cj4gPiBTaW5jZSB2ZXJzaW9uIDkuNTUuMCBhbmQKPiA+IGh0dHBzOi8vZ2l0Lmdob3N0
c2NyaXB0LmNvbS8/cD1naG9zdHBkbC5naXQ7YT1jb21taXQ7aD01NDU5ZjdhY2ExZGVkM2I3Y2Y5
NmMzMzlhMjQxOWY0MThhYTQwNmM3LAo+ID4gZ2hvc3RzY3JpcHQgZXhwZWN0cyB0aGF0IHRlc3Nl
cmFjdCBpcyBkaXNhYmxlZCBpZiB0aHJlYWRzIGFyZSBub3QKPiA+IGF2YWlsYWJsZSByZXN1bHRp
bmcgaW4gdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHNpbmNlIGNvbW1pdAo+ID4gN2E0OTQ0
NTY5Y2U4M2IwYjdiMGNhYmQ2ZThhYTE4NGI4Y2I3MmEyMjoKPiA+Cj4gPiBjb25maWd1cmU6IGVy
cm9yOiBUaHJlYWRpbmcgZGlzYWJsZWQgb3Igbm90IGF2YWlsYWJsZS4gVGVzc2VyYWN0IE9DUiBy
ZWxpZXMgb24gdGhyZWFkaW5nLiBSZXJ1biBjb25maWd1cmUgd2l0aCAiLS13aXRob3V0LXRlc3Nl
cmFjdCIgdG8gZXhjbHVkZSBPQ1IgZnJvbSB0aGUgYnVpbGQKPiA+Cj4gPiBTbyBkaXNhYmxlIHRl
c3NlcmFjdCBhcyB0aGVyZSBpcyBubyB3YXkgdG8gdGVsbCBnaG9zdHNjcmlwdCB0byB1c2UgYQo+
ID4gc3lzdGVtIHByb3ZpZGVkIHRlc3NlcmFjdC1vY3IgcGFja2FnZQo+Cj4gICBJIHVuZGVyc3Rh
bmQgdGhhdCB2MSBvZiB0aGlzIHBhdGNoIHdhcyBub3QgT0sgZm9yIHRoYXQgcmVhc29uLiBIb3dl
dmVyLCB3ZQo+IGNhbid0IHdlIGtlZXAgb24gdXNpbmcgdGhlIGJ1bmRsZWQgdGVzc2VyYWN0IGlu
IGEgYnVpbGQgd2l0aCB0aHJlYWRzPwoKV2h5IG5vdCwgSSdsbCBzZW5kIGEgdjMuCgo+Cj4gICBS
ZWdhcmRzLAo+ICAgQXJub3V0Cj4KPiA+Cj4gPiBGaXhlczoKPiA+ICAgLSBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9mZDM1YTQ3YjJhNzdjZjU3YzI0M2VjMWM4ODgwMmI1
M2RkY2E4ZjUyCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgdjEgLT4gdjI6Cj4gPiAg
IC0gVW5jb25kaXRpb25hbGx5IGRpc2FibGUgdGVzc2VyYWN0Cj4gPgo+ID4gICBwYWNrYWdlL2do
b3N0c2NyaXB0L2dob3N0c2NyaXB0Lm1rIHwgMSArCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dob3N0c2NyaXB0L2dob3N0
c2NyaXB0Lm1rIGIvcGFja2FnZS9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC5tawo+ID4gaW5kZXgg
MjRhMGM0ODlhOC4uYjJlNWZlMTZiYiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvZ2hvc3RzY3Jp
cHQvZ2hvc3RzY3JpcHQubWsKPiA+ICsrKyBiL3BhY2thZ2UvZ2hvc3RzY3JpcHQvZ2hvc3RzY3Jp
cHQubWsKPiA+IEBAIC00NCw2ICs0NCw3IEBAIEdIT1NUU0NSSVBUX0NPTkZfT1BUUyA9IFwKPiA+
ICAgICAgIC0tZGlzYWJsZS1ndGsgXAo+ID4gICAgICAgLS13aXRob3V0LWxpYnBhcGVyIFwKPiA+
ICAgICAgIC0td2l0aG91dC1wZGYgXAo+ID4gKyAgICAgLS13aXRob3V0LXRlc3NlcmFjdCBcCj4g
PiAgICAgICAtLXdpdGgtc3lzdGVtLWxpYnRpZmYKPiA+Cj4gPiAgIGlmZXEgKCQoQlIyX1BBQ0tB
R0VfSkJJRzJERUMpLHkpCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
