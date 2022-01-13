Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4FCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 05:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B41E415C0;
	Thu, 13 Jan 2022 05:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLF--BYLz6I4; Thu, 13 Jan 2022 05:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94AE1415BD;
	Thu, 13 Jan 2022 05:13:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5361BF867
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 05:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59ECF415BD
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 05:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4o-L9x4BgB4 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 05:13:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D941C415BB
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 05:13:14 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id 30so18744899edv.3
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 21:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DVOI3wWg8iQX87RGQ6DxNYkmmxucfVETL9eCfky8S6k=;
 b=mBs487/HC5qiXf+Ro9hlGKhnPrr3YwU5semKtMIKJ0VAKz+DItKCvodOfOwIzMAvj2
 qWoxkfafUflv6Sa4v/m1DqsomI+cbPPkUrOgrDlKNLa+OTM4mhy539nI1r7AwoRs7rj1
 HXafyXi5HhHib+hU+iir7iKaFWU5PITJL44xAG49/Oky4pDFZtMIcX5mndWxMUViqH3p
 SglVSC3ku5Y9jWFa/wC/UdTueqcdcVrgW7wRj+JLl+AUbVxCQm5ixmL2vXOwT4FXU/WP
 1O5zNnV1Cz3AZcxzuiHDHcagk/T5i6t7wgPGIbRr7+Uc78ZvvRIctPZNRG4V7YX+aFLH
 zA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DVOI3wWg8iQX87RGQ6DxNYkmmxucfVETL9eCfky8S6k=;
 b=RoKuOPGQAxQG7zeJK9vCxoBL7NOY2vT9aPCmX7FlQ5F+QKWyVibQ89j96wEZWWhS5G
 qd0I82Ij0jkKg0FJEYci+rs11A97whukMvge9CqfpCA7i4c5sxjbY9tnT7WrcBFwTWIG
 iPrJruz/E+ARm1dlQ6A4Fqyl8p/YgT6XLFGkQ+bqATjTV0dVhkzAny6HGOmImBeGwWhM
 PPhhKcsZoInlyiO0nJMphoUonFkH1oK65e8Ri010fx7nHBx0qYc0xvAmb8uiP5V0OYYN
 YFNKopbq+sLkPZy+5Sbabh2ldwMU2UqqSZfz5jjlBBwNUz3DwkbZvTJM3jON7HxXb0Cq
 rQ7A==
X-Gm-Message-State: AOAM530CbwEL7X0TkQlz4XSmFxleLcw/4asSfAbA7HUD6qMjiMrsFRo4
 RTCevEkoVMoiJ8tAjDQ+fyoMpHBFtQ30/4M2aAPrxu5389pd5FmR
X-Google-Smtp-Source: ABdhPJzipWaJB54SoCCS7HIGxoRk1tmXyeJfSo9QOpqmBr3+CRyZo0Smk0wVPrAR3My/KgaM36Vz77UokNxJakqWpUA=
X-Received: by 2002:a50:c38c:: with SMTP id h12mr2770788edf.72.1642050792940; 
 Wed, 12 Jan 2022 21:13:12 -0800 (PST)
MIME-Version: 1.0
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-2-jose.pekkarinen@unikie.com>
 <20220105214129.2f5fffae@windsurf>
 <CAJPV9MpzSPFyj-AMO+_iCNZ-PVp+DcKaH1yrMHvO2TawoUPa1g@mail.gmail.com>
 <20220112155103.7e6c11c0@windsurf>
 <CAJPV9MpjN_fPn04Z6crTsogUL2-UWjgBr2P-A9Uz-QYqYd_aGw@mail.gmail.com>
 <20220112170043.03abd8c1@windsurf>
In-Reply-To: <20220112170043.03abd8c1@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Thu, 13 Jan 2022 07:12:37 +0200
Message-ID: <CAJPV9Mo=aD1BgXuJVagAfmtsDpDCrPZTVpKwNiQQYY08_wngrw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 2/7] package/minijail: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKYW4gMTIsIDIwMjIgYXQgNjowMCBQTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMTIgSmFuIDIwMjIgMTc6
MDg6MjYgKzAyMDAKPiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNv
bT4gd3JvdGU6Cj4KPiA+ID4gcHJsaW1pdCgpIGV4aXN0cyBpbiBtdXNsLiBXYXMgPHN5cy9yZXNv
dXJjZS5oPiBpbmNsdWRlZCwgYXMgc3VnZ2VzdGVkCj4gPiA+IGJ5IHRoZSBwcmxpbWl0KCkgbWFu
IHBhZ2UgPwo+ID4KPiA+ICAgICBJdCBpczoKPiA+Cj4gPiAkIGNhdCBsaWJtaW5pamFpbC5jCj4g
PiBbLi4uXQo+ID4gI2luY2x1ZGUgPHN5cy9yZXNvdXJjZS5oPgo+ID4gWy4uLl0KPgo+IEFoLCBp
dCdzIHVDbGliYyB0aGF0IGlzIG1pc3NpbmcgcHJsaW1pdCgpLiBDYW4geW91IGNvbmZpcm0gdGhh
dAo+IG1pbmlqYWlsIGJ1aWxkcyBmaW5lIHdpdGggZ2xpYmMgYW5kIG11c2wsIGJ1dCBicmVha3Mg
b24gdUNsaWJjIGR1ZSB0bwo+IHBybGltaXQoKSBiZWluZyBtaXNzaW5nPwo+Cj4gSSdtIG5vdCBz
dXJlIGl0J3MgcG9zc2libGUgdG8gcmVwbGFjZSBwcmxpbWl0KCkgYnkgc2V0cmxpbWl0KCkuIElu
ZGVlZCwKPiBwcmxpbWl0KCkgaGFzIGEgUElEIGFzIHRoZSBmaXJzdCBhcmd1bWVudCwgd2hpY2gg
YWxsb3dzIHRvIHN0ZSByZXNvdXJjZQo+IGxpbWl0cyBvbiBvdGhlciBwcm9jZXNzZXMsIHdoaWxl
IHNldHJsaW1pdCgpIG9ubHkgdGFrZXMgY2FyZSBvZiB0aGUKPiBjdXJyZW50IHByb2Nlc3MuCj4K
PiBJJ20gYWZyYWlkIGl0IHNlZW1zIHdlIHdpbGwgaGF2ZSB0byBkaXNhbGxvdyB0aGUgdXNlIG9m
IG1pbmlqYWlsIHdpdGgKPiB1Q2xpYmMgdG9vbGNoYWlucy4KCiAgICBIaSwKCiAgICBZZXMsIGl0
IGlzIG9ubHkgdWNsaWJjLCB0aGlzIGlzIHRoZSBvdXQgb2YgdGVzdC1wa2c6CgokIHV0aWxzL3Rl
c3QtcGtnIC1jIG1pbmlqYWlsLmNmZyAtcCBtaW5pamFpbAogICAgICAgICAgICAgICAgICAgYm9v
dGxpbi1hcm12NS11Y2xpYmMgWzEvNl06IEZBSUxFRAogICAgICAgICAgICAgICAgICAgIGJvb3Rs
aW4tYXJtdjctZ2xpYmMgWzIvNl06IE9LCiAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjdt
LXVjbGliYyBbMy82XTogU0tJUFBFRAogICAgICAgICAgICAgICAgICAgIGJvb3RsaW4teDg2LTY0
LW11c2wgWzQvNl06IE9LCiAgICAgICAgICAgICAgICAgICAgIGJyLWFybS1mdWxsLXN0YXRpYyBb
NS82XTogU0tJUFBFRAogICAgICAgICAgICAgICAgICAgICAgICAgICBzb3VyY2VyeS1hcm0gWzYv
Nl06IE9LCjYgYnVpbGRzLCAyIHNraXBwZWQsIDEgYnVpbGQgZmFpbGVkLCAwIGxlZ2FsLWluZm8g
ZmFpbGVkCgogICAgVGhhbmtzIQoKICAgIEpvc8OpLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
