Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB1AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 027CE424C1;
	Fri,  7 Jan 2022 21:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ul0IaLkNIhet; Fri,  7 Jan 2022 21:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C811424B7;
	Fri,  7 Jan 2022 21:17:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16AF61BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0395182591
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eeM5yivsR6yO for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:17:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E12082695
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:17:42 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id o6so26856094edc.4
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 13:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=guXuFUkd9ajM+kXpZOdIz72DCh4GRu1G2MjO/5tcosA=;
 b=YkrL/kIyDxXfx5yQdCauthXam6/6ZEPa7Nng27JzYKSQfYFsBnYfjDXMbdlq0UYLWJ
 cK934blJI0iGg7czbLpvPQeEZcD6cRaBSCC77WFdQZfUQ8FoAOUKbZDYXnU4kk7Q4rXZ
 PTnlE7NbPsRNtv+Dw7pQN1zkxS77+Rno5MONIg1gETDZPbPLoZec1SqFrMVYOO/3ODbu
 Y3SFhBlYBEtIfn0vzzGeLEhuog7GtRkMVPK0cDTRFdgYDajWwPf/7BYp3/ikC1XDY4pZ
 B72LWCXl8hDUMrVU7yMeJbFKY75cEL7vJNb6l9jNyjWuHHa6S7PX2fZABqMCB9/ImTjR
 LtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=guXuFUkd9ajM+kXpZOdIz72DCh4GRu1G2MjO/5tcosA=;
 b=C+UBjZ9SASPAL6/Wgf1zWq5LGr8+EYBzCLYaP+vJtjUkUgh+tGqTanc2WSAnz9E6ZB
 zUQzTmUByGU0l2DNDKSLszf5MP3Gm1tY8dYRwrBX/N3PCD7SA6jtnEhumS4yFqmedFIM
 EJKJJuE33npkF2FXHxXiiP+FTGUTK2oH+zIu0OsHWNp0oiQxB4CSuCqVDHjDUCTFZRm/
 ElW9oQN44fhPQ8kbg9rZXRqbMq6LZvIgR9FCVYQZTXIRgKcL5QxMQs8fAdmL9AqrM4y+
 PKH3FQFSRl5eQIlTbjBUaFRfwW0i6Bye5byqERPuoAyZuymhsF4Dilm0R0SLH3dwbNBI
 DmVA==
X-Gm-Message-State: AOAM530rffF8JQjXdRqTwcaIc+Yid/VMyB+STAVMthDCD8SCBB/PR3zW
 Hk7K1TuWQ8Bl0HVSCPEAaUHre37MrlKM9slhvLk=
X-Google-Smtp-Source: ABdhPJw/sPSPSIsoIUeyTtWLwpkgMwWKf+O/+64pQMRklQvxE6sFlPqLNLGmfcGRsHX/y5Vr0wAyV9XHSnjI7PkrAGs=
X-Received: by 2002:a50:d691:: with SMTP id r17mr31579021edi.317.1641590261145; 
 Fri, 07 Jan 2022 13:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20220104210727.3634208-1-fontaine.fabrice@gmail.com>
 <20220107220857.63b9a0da@windsurf>
In-Reply-To: <20220107220857.63b9a0da@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 7 Jan 2022 22:16:26 +0100
Message-ID: <CAPi7W80Y2X0nXp8mGMEuQ6XG=5kO1U03=L-VwDmOpO_JOC2_NA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qpdf: needs atomic
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgdmVuLiA3IGphbnYuIDIwMjIgw6AgMjI6MDgsIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFR1ZSwgIDQgSmFuIDIwMjIg
MjI6MDc6MjcgKzAxMDAKPiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiA+IHFwZGYgbmVlZHMgYXRvbWljIHNpbmNlIGJ1bXAgdG8gdmVyc2lv
biAxMC41LjAgaW4gY29tbWl0Cj4gPiBiNTM1MmMyMTc3MDExY2EzODljYmI3YzY4ZTc4NDQ3NTQ5
Y2JkYWFhIGFuZAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3FwZGYvcXBkZi9jb21taXQvYzVjMWEw
MjhjZGQzY2YzNDUwNDZjNDY5NjNmYjBmZGFjZmIyYzMzYzoKPiA+Cj4gPiAvaG9tZS9idWlsZHJv
b3QvYXV0b2J1aWxkL2luc3RhbmNlLTIvb3V0cHV0LTEvaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9t
NjhrLWJ1aWxkcm9vdC11Y2xpbnV4LXVjbGliYy9iaW4vbGQucmVhbDogL2hvbWUvYnVpbGRyb290
L2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1aWxkL3FwZGYtMTAuNS4wL2xpYnFwZGYv
YnVpbGQvLmxpYnMvbGlicXBkZi5hKFFQREYubyk6IGluIGZ1bmN0aW9uIGBRUERGOjpRUERGKCkn
Ogo+ID4gUVBERi5jYzooLnRleHQrMHg0OGRlKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19h
dG9taWNfZmV0Y2hfYWRkXzgnCj4gPgo+ID4gRml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy83ZTE4Njg5NjcwZGNiZTQ5MWMzNWYwNTk3ZTVjM2M3ODc5
MzYyNjNmCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUu
ZmFicmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL2N1cHMtZmlsdGVycy9Db25m
aWcuaW4gfCAyICsrCj4gPiAgcGFja2FnZS9xcGRmL0NvbmZpZy5pbiAgICAgICAgIHwgMiArKwo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLiBIb3dldmVyLCBjb3VsZCB5b3UgZG8gYSB0ZXN0IGJ1aWxkIG9uCj4gc3BhcmN2
OCA/IEluZGVlZCBub3JtYWxseSB3aGVuIHNvbWV0aGluZyBuZWVkcyBhdG9taWMsIGl0IGFsc28g
bmVlZHMgdG8KPiBsaW5rIHdpdGggbGliYXRvbWljIHdoZW4gYXZhaWxhYmxlLCBhcyBzb21lIGFy
Y2hpdGVjdHVyZXMgKHN1Y2ggYXMKPiBzcGFyY3Y4KSBoYXZlIGFsbCBhdG9taWMgYnVpbHQtaW5z
IGltcGxlbWVudGVkIGluIGxpYmF0b21pYy4KcXBkZiBoYW5kbGVzIGxpbmtpbmcgd2l0aCBhdG9t
aWMgc2luY2UgdmVyc2lvbiAxMC4wLjIgYW5kCmh0dHBzOi8vZ2l0aHViLmNvbS9xcGRmL3FwZGYv
Y29tbWl0LzY2MTk4ZjQ0N2Y0NWE4NzcxOGI2NDU3NzU2OTc2YmFhOGRlZmIyZmQKPgo+IFRoYW5r
cyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCj4gRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20K
QmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
