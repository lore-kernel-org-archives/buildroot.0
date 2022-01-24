Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2AAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 09:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF4A9403CF;
	Mon, 24 Jan 2022 09:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nqeAAc6PQRoh; Mon, 24 Jan 2022 09:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B66D4046B;
	Mon, 24 Jan 2022 09:32:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97E3A1BF3DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9170860B9F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cUSQs4ILZGX for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 09:32:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90009605C9
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:32:14 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Bvhsnl0U4gdXdBvhsnZE3u; Mon, 24 Jan 2022 10:32:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643016732; bh=knn4OJ3/2JWB3RK8SUkwzmpJgdBu00HJS0txtdHMubw=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=Amo9wOGtrUXo8ARqxXnfxlwBviFqVlvJ7nmTY2bngJbVUMbNgMKmm8SkcCgnWt36I
 9ZrThDfCRqgwHmcHgyhcF/nbac+jbfHx3ltOJCAY4Z4Mbz7wFrIIM0B/ZjqOju3l05
 Jhr6fqOPraSaP/OXDwL3gOBXxk58IZXZoMwya6U4GrzNFTyHUPL5OJRnXlzLkyiP4x
 lT2DEXrxPFk1Jys6pkz09dVKScw6aT8vjO9HRehV9cYD6rL7psfXdi1FvDkeftHZ3p
 r2eNZ9q8OS0KkFEURvCpnemDS+fBLkUB9AGyVuZ2ujDqvMbEj7hZ67dhlaBSMtuebJ
 wt8CuV1JLQhuA==
To: Antoine Tenart <atenart@kernel.org>
References: <164301520937.4708.9842501306400984658@kwain>
 <F25BFFC0-C4B1-4099-99A5-F42AF66C061E@benettiengineering.com>
 <164301659905.4708.13356617813640521530@kwain>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <4bcfec4b-c0eb-7c4e-0fc9-6782b2dbac0a@benettiengineering.com>
Date: Mon, 24 Jan 2022 10:32:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164301659905.4708.13356617813640521530@kwain>
Content-Language: en-US
X-CMAE-Envelope: MS4wfJy/xf0ajdzKPoplIUztqr/cI+hhDaaik2f+j0FvDs9LTF6ykP/L9hIRfhA9B8vHl32NRrld4AteoLWuPdHa055u0up2e40IET0li/YVXQLwjypGeQva
 WALUc62hcm86TafEe4VO+3cw8yOBU/dBhwhn9nlet3rQudEiRqg1zq/jh8Fc8psJWqL28kyE2++aEUP8cA1q2nTdUUVY0FmQt3VVbC4jWdoE2ya8U9Pz0pQu
 JG2OYB3brFFfvWU3/GLwXnOXgFCW21e276pDPp8bEyRo3xdStYzaDPMSeR4uEgSigixt7gyJKG+LnrtIsaIzIsIzyB8FM0s8Of8PziwcUDI=
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
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjQvMDEvMjIgMTA6MjksIEFudG9pbmUgVGVuYXJ0IHdyb3RlOgo+IFF1b3RpbmcgR2l1bGlv
IEJlbmV0dGkgKDIwMjItMDEtMjQgMTA6MjA6NTkpCj4+Cj4+IFRoZW4gSeKAmWQgZ28gZm9yOgo+
PiBCUjJfUEFDS0FHRV9SRUZQT0xJQ1lfRU5BQkxFX0VYVFJBX0FVRElUX0xPRwo+Pgo+PiDigJxF
bmFibGUgZXh0cmEgYXVkaXQgbG9n4oCdCj4+Cj4+IEFuZCBpbiB0aGUgaGVscCBzZWN0aW9uIEkg
c3BlY2lmeSBhbGwgdGhlIHdhcm5pbmdzLgo+PiBEZWZhdWx0ZWQgdG8gbi4KPj4KPj4gVGhpcyB3
YXkgaXTigJlzIHByZXR0eSBjbGVhciB0byBtZSB0aGF0IEkgYXBwcm9hY2ggdGhlIHBhY2thZ2Ug
Zm9yIHRoZQo+PiBmaXJzdCB0aW1lLiBBbmQgbW9zdCBvZiBhbGwgaXTigJlzIHdoYXQgaXQgZG9l
cyBhcyB5b3XigJl2ZSBleHBsYWluZWQgbWUKPj4gYWJvdmUuCj4gCj4gQnV0IHRoZW4gaXQncyBu
b3QgY2xvc2UgdG8gdGhlIHJlZnBvbGljeSBpbXBsZW1lbnRhdGlvbiBhbmQgSSBkb24ndAo+IGZp
bmQgaXQgcGFydGljdWxhcmx5IGNsZWFyIGVpdGhlci4gRXh0cmEgYXVkaXQgY291bGQgYmUgbmlj
ZSBpbiBtYW55Cj4gd2F5cyA6KQo+IAo+IExldCdzIHdhaXQgYSBiaXQgZm9yIG90aGVyIHRvIGhh
dmUgdGltZSB0byBjaGltZSBpbiwgdGhleSBtaWdodCBoYXZlIGFuCj4gaW50ZXJlc3RpbmcgdGFr
ZSwgb3Igc3VnZ2VzdGlvbnMuCgpPaywgZ29vZCBpZGVhCgpCZXN0IHJlZ2FyZHMhCi0tIApHaXVs
aW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
