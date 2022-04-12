Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBC9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AE8782B3E;
	Tue, 12 Apr 2022 18:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ni2c3cF7pPNA; Tue, 12 Apr 2022 18:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65F9F82B94;
	Tue, 12 Apr 2022 18:19:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCB921BF82D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC63282A95
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dw5jF_LPLZzR for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:19:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F20B182A53
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:19:19 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id t21so19847883oie.11
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fJHWCLS+4yrEtUi5UdBYrDmEq3hr9sg8GDqLFnnrqF8=;
 b=PWodpMfXKZzNxxR/0nOkk7a8dBXbIFV2MnfU0ch+8vPlGBpXAEtrG4jgGYthdO0He2
 IH7iG+Ed7aYdk6mu2Sw3u+GkJb+Mz8sR3Ww0OpB8U71Kpwv2RlySoKrJcxbXY60iLdE7
 dELymJduvC0mfjnudyT75AvU2dzWzwTXVVDXpYdjuwMyh2gVwR0xo7TzBYU6ns1zStA3
 qBhcoKKra1JcYFDPXFYxphMH4ZM5hudDfbuBgVQKmB9KFdWEcoLHyeMf8FcRmeDfDZ2W
 jklw0gVKrVSMjmYGqJfK0CVJsHeN4hB8zcSUcfjOkOORO/FTo6NKc/dws8unDGmw0Owf
 UX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fJHWCLS+4yrEtUi5UdBYrDmEq3hr9sg8GDqLFnnrqF8=;
 b=abOvIbUBFlcZCm5G/DIM2LzS6iXlX3nScbexD2NEBrq9crHD/knm3d+6kz7maLFR0x
 LJLi9dF6IXAFkTTkifLZNYVbWvyL4zKUQxj6Jsaa9kgvgqtJIwHg7KKQWzxLe+IivFGR
 3KqlwmrwK9qwr7AsT3Bse14OS3InehibOw1gca0AnB7QnzAl8XSgq+mVBoCbogoVxppm
 9vGbNAsVVTarcjWYmpBwiQCxGQ5e4tDXzTUlNY5eEThhHiwnXRIpdxNtqKMYKpf79UJU
 w6dYflwYrzIlsPnG0sIoSyxHPtjgzbG4n2SEVAzDL2kB/QtWs21olOnxGFRY+DFb9/cg
 ikDw==
X-Gm-Message-State: AOAM533cGud7Hn+BkBb/gGt6HIpX8m/EPvbTHKxQWwIueyiEz/RJVVsu
 hxYTDfFqXvHrJM7+R6dIZOb1yh+e19qf+Zcb3F+TLD9kkTc=
X-Google-Smtp-Source: ABdhPJwlB9n9o27H0eiPJK4ThzjiRsGW5uZuWeVwxkmJmol8eNMwTxYUHoNovC0jyvYrcktCQ8D9mCMJBHlcrBgZNno=
X-Received: by 2002:aca:f1d5:0:b0:2ec:eaab:eb9b with SMTP id
 p204-20020acaf1d5000000b002eceaabeb9bmr2435717oih.228.1649787559063; Tue, 12
 Apr 2022 11:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
 <8735ims60b.fsf@dell.be.48ers.dk>
 <d1a1ead3-98a8-35fe-4c4c-e7fd3f02e058@microchip.com>
 <CAPi7W81VbAArhoyDEJrNMeseVXgmJzu2+K39njx1j5y3_5mb5g@mail.gmail.com>
 <8735iifser.fsf@dell.be.48ers.dk>
 <34fddc8f-8710-65f9-330d-81fefe64354a@microchip.com>
 <87y20aeb04.fsf@dell.be.48ers.dk>
In-Reply-To: <87y20aeb04.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 Apr 2022 20:17:18 +0200
Message-ID: <CAPi7W83dikm9d7KWjKfqYwr7mP3U4WzAzdw6iLF6gmOkTgwB-Q@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: Eugen.Hristev@microchip.com,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWFyLiAxMiBhdnIuIDIwMjIgw6AgMTQ6MzQsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gICA8RXVnZW4uSHJpc3RldkBtaWNyb2No
aXAuY29tPiB3cml0ZXM6Cj4KPiBIaSwKPgo+ICA+PiBZZWFoLiBFdWdlbiwgaXMgdGhlcmUgYW55
IHNwZWNpZmljIHJlYXNvbiB3aHkgeW91IHVzZSB0aGUgZGhjcCBwYWNrYWdlCj4gID4+IG92ZXIg
dGhlIG90aGVyIERIQ1AgY2xpZW50cyB3ZSBwcm92aWRlPwo+Cj4gID4gSGlzdG9yaWNhbCByZWFz
b25zLCBhbmQgdGhlIGZhY3QgdGhhdCBwZW9wbGUgaGF2ZSB3b3JraW5nIGNvbmZpZ3VyYXRpb25z
Cj4gID4gdXNpbmcgdGhpcyBwYWNrYWdlLi4uIEkgd2FzIHVuYXdhcmUgdGhhdCBpdCB3YXMgZHVl
IHRvIGJlIHJlbW92ZWQuCj4gID4gV2Ugd2lsbCB0cnkgdG8gc3dpdGNoIHRvIGEgZGlmZmVyZW50
IHBhY2thZ2UgaW4gdGhlIGZ1dHVyZS4gVGhhbmtzIGZvcgo+ICA+IGxldHRpbmcgbWUga25vdy4K
PiAgPiBIb3dldmVyLCBpZiB0aGUgcGFja2FnZSBpcyBzdGlsbCBpbiB0aGlzIGJ1aWxkcm9vdCBy
ZWxlYXNlLCBpdCBoYXMgdG8KPiAgPiB3b3JrIHJpZ2h0ID8KPgo+IFllcywgdGhhdCBpcyB0aGUg
aWRlYS4gSWYgaXQgaXMgZGVhZCB1cHN0cmVhbSBhbmQgaGFyZCB0byBmaXggdGhlbiB0aGF0Cj4g
bmF0dXJhbGx5IG1ha2VzIGl0IGhhcmRlciB0byBkbywgYnV0IHRoZSBpbnRlbnRpb24gaXMgdG8g
Zml4IGl0LgoKVGhlIGZvbGxvd2luZyBwYXRjaCBzaG91bGQgZml4IHRoZSBpc3N1ZToKaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDQxMjE4
MTYwNy4xNDUxNTgwLTEtZm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20vCgo+Cj4gLS0KPiBCeWUs
IFBldGVyIEtvcnNnYWFyZAoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
