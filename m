Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30102C433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 09:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCF2780C28;
	Wed, 19 Jan 2022 09:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PHqsqtDr_N8; Wed, 19 Jan 2022 09:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED36F80C0D;
	Wed, 19 Jan 2022 09:01:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBA161BF45A
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 09:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9F72410C4
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 09:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=walle.cc
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdH_LH_2XUUQ for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 09:01:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EA3A410BB
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 09:01:28 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 019D422175;
 Wed, 19 Jan 2022 10:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1642582886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPRoCo3gq6NFGaZxGnOunu5IyWoBqjLp1QlajgcyL7Y=;
 b=alfR5krbm83v3IeK7HOsiy+aX3j8eKNa8s3Mb9tTZ3KpXj1H2AzDyh87T8Q5NcFsY3+Awe
 EwkKuTUkFMRhYvrW9Dm60/OgEPMI7jd37P8PEUzFrcUht9KStjBgH6+9F5rFHmf6T0LObe
 kxoNqvSc1MGLqD4xikIJMUuHz/r+oJM=
MIME-Version: 1.0
Date: Wed, 19 Jan 2022 10:01:25 +0100
From: Michael Walle <michael@walle.cc>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <966BF669-674E-4A71-82E3-FF7A2B520659@benettiengineering.com>
References: <CAEyMn7aOFtdpXrmU3bLe03jgkmiVLrYCQvePkbLLv_+5ZOiN4Q@mail.gmail.com>
 <966BF669-674E-4A71-82E3-FF7A2B520659@benettiengineering.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <dd5e7e1636872e562e0a1005d4a8def4@walle.cc>
X-Sender: michael@walle.cc
Subject: Re: [Buildroot] [PATCH v2] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

W3BsZWFzZSBkb24ndCB1c2UgaHRtbCBtYWlsc10KCkFtIDIwMjItMDEtMTggMjE6NDAsIHNjaHJp
ZWIgR2l1bGlvIEJlbmV0dGk6Cgo+IEFmdGVyIGZvbGxvd2luZyB0aGUgZGlzY3Vzc2lvbiBpbiBJ
UkMgYmV0d2VlbiBZYW5uIGFuZCBNaWNoYWVsIEkgYW0KPiBzdXJlIHRoYXQgdGhpcyBzZXR0aW5n
IGNhbm5vdCBiZSB1c2VkIGZvciB0aGUgYWFyY2g2NC9jb3J0ZXgtQTUzIENQVS4KPiBUaGUgc2V0
dGluZ3MgQlIyX0FSTV9DUFVfSEFTX0ZQVSwgQlIyX0FSTV9DUFVfSEFTX1ZGUFYyLAo+IEJSMl9B
Uk1fQ1BVX0hBU19WRlBWMywgQlIyX0FSTV9DUFVfSEFTX1ZGUFY0IGFuZAo+IEJSMl9BUk1fQ1BV
X0hBU19GUF9BUk1WOCBhcmUgc2V0IGltcGxpY2l0bHkuCj4gCj4gWWVzLCBJIHdhcyB3cm9uZyBh
bmQgeW91IHBvaW50IHRoYXQgZnB1IHN0cmF0ZWd5IGZhbGxzIGJhY2sgdG8KPiBCUjJfQVJNX0ZQ
VV9GUF9BUk1WOCBhbmQgaXTigJlzIG9rLgo+IEJ1dCBpLk1YOE1NIHN1cHBvcnRzIE5FT04gdG9v
LCBzbyBJIHdvdWxkIGdvIGZvciBzZXR0aW5nCj4gQlIyX0FSTV9GUFVfTkVPTl9GUF9BUk1WOCwK
PiBiZWNhdXNlIGFzIHBvaW50ZWQgaGVyZVsxXSB0aGUgYXJtdjggbmVvbiBub3cgc3VwcG9ydHMg
SUVFRSA3NTQKPiBmbG9hdGluZyBwb2ludCBzdGFuZGFyZC4KPiAKPiBCVVQgSeKAmXZlIGZvdW5k
IHRoYXQgZ2NjWzJdIHBvaW50cyB0aGF0Ogo+IOKAmOKAmeKAmQo+IAo+IElmIHRoZSBzZWxlY3Rl
ZCBmbG9hdGluZy1wb2ludCBoYXJkd2FyZSBpbmNsdWRlcyB0aGUgTkVPTiBleHRlbnNpb24KPiAo
ZS5nLiAtbWZwdT1uZW9uKSwgbm90ZSB0aGF0IGZsb2F0aW5nLXBvaW50IG9wZXJhdGlvbnMgYXJl
IG5vdAo+IGdlbmVyYXRlZCBieSBHQ0PigJlzIGF1dG8tdmVjdG9yaXphdGlvbiBwYXNzIHVubGVz
cwo+IC1mdW5zYWZlLW1hdGgtb3B0aW1pemF0aW9ucyBpcyBhbHNvIHNwZWNpZmllZC4gVGhpcyBp
cyBiZWNhdXNlIE5FT04KPiBoYXJkd2FyZSBkb2VzIG5vdCBmdWxseSBpbXBsZW1lbnQgdGhlIElF
RUUgNzU0IHN0YW5kYXJkIGZvcgo+IGZsb2F0aW5nLXBvaW50IGFyaXRobWV0aWMgKGluIHBhcnRp
Y3VsYXIgZGVub3JtYWwgdmFsdWVzIGFyZSB0cmVhdGVkCj4gYXMgemVybyksIHNvIHRoZSB1c2Ug
b2YgTkVPTiBpbnN0cnVjdGlvbnMgbWF5IGxlYWQgdG8gYSBsb3NzIG9mCj4gcHJlY2lzaW9uLgo+
IOKAmOKAmeKAmQoKVGhhdCBpcyBmb3IgYWFyY2gzMiBtb2RlLiBhYXJjaDY0IGRvZXNuJ3QgaGF2
ZSB0aGUgLW1mcHUgc3dpdGNoLgpJbnN0ZWFkIHRoZSBGUFUgc3VwcG9ydCBpcyBlaXRoZXIgZGVy
aXZlZCBhdXRvbWF0aWNhbGx5IG9yCnRocm91Z2ggbW9kaWZpZXJzIG9mIHRoZSAtbWNwdSBzd2l0
Y2guCgotbWljaGFlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
