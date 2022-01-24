Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2BBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 09:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3452040951;
	Mon, 24 Jan 2022 09:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VrJFU8iUxYAl; Mon, 24 Jan 2022 09:30:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D77BC40979;
	Mon, 24 Jan 2022 09:30:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2CA1BF3DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 093FD8281A
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qsDAzXXvENwk for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 09:30:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A10482C91
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:30:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 69D09CE1051;
 Mon, 24 Jan 2022 09:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF2CC340E7;
 Mon, 24 Jan 2022 09:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643016602;
 bh=qU6IqW799Xhz7Lo6RiGkRZhhjdx6K5ElLqpy8wvf1gw=;
 h=In-Reply-To:References:Subject:Cc:To:From:Date:From;
 b=gkBgMftiZEfisyvb9SKjQp42Ch1UN6JzI0jYA0JS/RiP+4jBL7xAcRDMyXli5V501
 ycT1kXWhQnQ8CEnPL5WfKRoPl1UiotXxT6/MT2It5ftMoUdqLRVBAhCpfhdi8Pmdn2
 55fhFHXmii2T6DQ5cGenRZ1eY1Bqi4of+fPgpRE3ogeM7g0GqJf48fGsQfFfQOQ0pd
 noQ2RQ8klrHyQ1LTKb36Cmv125aTc+2XV2XyURDh1yI34cK6PxZ3HH1JawEp4rQROo
 9PTd27X1wd7RHeXae6qdjz8dlOUkOpVElFD2OALqxvMubpHIeI3Xk9UM5/TLLo9Deb
 CkI5PdJA0IQ3A==
MIME-Version: 1.0
In-Reply-To: <F25BFFC0-C4B1-4099-99A5-F42AF66C061E@benettiengineering.com>
References: <164301520937.4708.9842501306400984658@kwain>
 <F25BFFC0-C4B1-4099-99A5-F42AF66C061E@benettiengineering.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
From: Antoine Tenart <atenart@kernel.org>
Message-ID: <164301659905.4708.13356617813640521530@kwain>
Date: Mon, 24 Jan 2022 10:29:59 +0100
Subject: Re: [Buildroot] [PATCH v3] package/refpolicy: Add option to disable
 "dontaudit" rules
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
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UXVvdGluZyBHaXVsaW8gQmVuZXR0aSAoMjAyMi0wMS0yNCAxMDoyMDo1OSkKPiAKPiBUaGVuIEni
gJlkIGdvIGZvcjoKPiBCUjJfUEFDS0FHRV9SRUZQT0xJQ1lfRU5BQkxFX0VYVFJBX0FVRElUX0xP
Rwo+IAo+IOKAnEVuYWJsZSBleHRyYSBhdWRpdCBsb2figJ0KPiAKPiBBbmQgaW4gdGhlIGhlbHAg
c2VjdGlvbiBJIHNwZWNpZnkgYWxsIHRoZSB3YXJuaW5ncy4KPiBEZWZhdWx0ZWQgdG8gbi4KPiAK
PiBUaGlzIHdheSBpdOKAmXMgcHJldHR5IGNsZWFyIHRvIG1lIHRoYXQgSSBhcHByb2FjaCB0aGUg
cGFja2FnZSBmb3IgdGhlCj4gZmlyc3QgdGltZS4gQW5kIG1vc3Qgb2YgYWxsIGl04oCZcyB3aGF0
IGl0IGRvZXMgYXMgeW914oCZdmUgZXhwbGFpbmVkIG1lCj4gYWJvdmUuCgpCdXQgdGhlbiBpdCdz
IG5vdCBjbG9zZSB0byB0aGUgcmVmcG9saWN5IGltcGxlbWVudGF0aW9uIGFuZCBJIGRvbid0CmZp
bmQgaXQgcGFydGljdWxhcmx5IGNsZWFyIGVpdGhlci4gRXh0cmEgYXVkaXQgY291bGQgYmUgbmlj
ZSBpbiBtYW55CndheXMgOikKCkxldCdzIHdhaXQgYSBiaXQgZm9yIG90aGVyIHRvIGhhdmUgdGlt
ZSB0byBjaGltZSBpbiwgdGhleSBtaWdodCBoYXZlIGFuCmludGVyZXN0aW5nIHRha2UsIG9yIHN1
Z2dlc3Rpb25zLgoKVGhhbmtzLApBbnRvaW5lCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
