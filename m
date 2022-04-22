Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA29C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 19:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9278840AE9;
	Fri, 22 Apr 2022 19:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vKQXOfHYcVC; Fri, 22 Apr 2022 19:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB62E40AE8;
	Fri, 22 Apr 2022 19:22:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC6E1BF9A4
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 19:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27DFB40AE8
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 19:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I7QpHySb-PCC for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 19:22:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E80D40360
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 19:22:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 7B9F71F46B90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650655363;
 bh=fnkRUVNUP5SeohKaIbbaWY7g5a0VsVrgn9h6twp8cmU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FrnDruh0qEinb+oADGQYzktTN6L7ZOsH1VAJ3quP2CdHqqkOpP765NXGRsjud7JTk
 GTvRnzUTs/fDHCoKtLH6SL/dPg2CgNpIGuZd0U3UWWhhyeJib1NuWDhroJQ3mBsRMW
 DPWEV4uopHnDqY7b1ZxyFXA0CbsG7nuWwBrM6EtcgC9+eKSKrPgR9lZaztn2Jldx12
 8Dj7n0aLbqI9/wIxo6vSX99B385dA0nHF7ABU30uojztbNwoqUp5VbslIJgo69fLhW
 gCc+EnESIiBnGZLwrknnpXZ7fC1OTLqTDHDKtieercUXqSUreMpKbwtO+x+Wskovqb
 PABPhGu9rTd2g==
Message-ID: <c2c70fd1-3bce-8dae-8f38-8dcb16d2f833@collabora.com>
Date: Fri, 22 Apr 2022 16:22:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <20220131145555.2819020-1-michael@amarulasolutions.com>
 <e7701dd2-5636-2891-0e47-7a518c1dc961@mind.be>
 <CAOf5uw=rqEpd5eC-tjV=bNAqwE7-VS152GByK_KZ58TCrZTbfw@mail.gmail.com>
 <b8664feb-5b6b-9261-62ab-4743a01b7721@mind.be>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <b8664feb-5b6b-9261-62ab-4743a01b7721@mind.be>
Subject: Re: [Buildroot] [PATCH V3] board: Add support for iMX8MN BSH SMM S2
 PRO
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyLzEyLzIyIDA5OjQyLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiAKPiAKPiBP
biAxMi8wMi8yMDIyIDEzOjM2LCBNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkgd3JvdGU6Cj4+
IEhpCj4+Cj4+IE9uIFNhdCwgRmViIDEyLCAyMDIyIGF0IDE6MTAgUE0gQXJub3V0IFZhbmRlY2Fw
cGVsbGUgPGFybm91dEBtaW5kLmJlPgo+PiB3cm90ZToKPj4+Cj4+Pgo+Pj4KPj4+IE9uIDMxLzAx
LzIwMjIgMTU6NTUsIE1pY2hhZWwgVHJpbWFyY2hpIHdyb3RlOgo+Pj4+IEFkZCBpbml0aWFsIHN1
cHBvcnQgZm9yIGlNWDhNTiBCU0ggU01NIFMyIFBSTyBib2FyZDoKPj4+Pgo+Pj4+IC0gTGludXg6
IHY1LjE3LXJjMQo+Pj4KPj4+IMKgwqAgSSdtIGEgYml0IHVuY29tZm9ydGFibGUgdG8gYWRkIGFu
IC1yYyB2ZXJzaW9uLiBCdXQgSSBndWVzcyBpdCBjYW4KPj4+IGJlIHVwZGF0ZWQKPj4+IGFzIHNv
b24gYXMgNS4xNyBpcyByZWxlYXNlZC4KPj4KPj4gT2ssIEkgd2lsbCB0aGVuIHdhaXQKPiAKPiDC
oE5vLCB3aGF0IEkgbWVhbnQgdG8gc2F5IGlzOiBpdCdzIE9LIHRvIGRvIGl0IHdpdGggdGhlIC1y
YywganVzdCBtYWtlCj4gc3VyZSB0aGF0IHlvdSB1cGRhdGUgaXQgdG8gdGhlIHJlbGVhc2UgdmVy
c2lvbiB3aGVuIGl0IGNvbWVzIGFyb3VuZAo+ICh3aGljaCB3aWxsIHN0aWxsIGJlIGFub3RoZXIg
OC1pc2ggd2Vla3MpLgoKU3VwcG9ydCBpcyBub3cgYWxtb3N0IGNvbXBsZXRlbHkgbWVyZ2VkIHVw
c3RyZWFtIGZvciBrZXJuZWwgYW5kIHUtYm9vdC4KV2UgY291bGQgdXBkYXRlIHRoZSBwYXRjaCB0
byBwdWxsIGZyb206CgoqIGxpbnV4OiB2NS4xNyAoYXVkaW8gZm9yIHRoaXMgYm9hcmQgaXMgZW5h
YmxlZCBpbiB2NS4xOC1yYzMpCiogdS1ib290OiB2MjAyMi4wNy1yYzEgKHJlbGVhc2VkIG9uIE1v
biAyNSBBcHJpbCAyMDIyLCAyIGRheXMgcmVtYWluaW5nKQoKV2UgY2FuIHVwZGF0ZSBsYXRlciBv
biB0aGUgbGludXggcmVsZWFzZSB0byBpbmNsdWRlIHRvIHdob2xlIHN1cHBvcnQgYW5kCmF0IGxl
YXN0IHdlIGNhbiBnZXQgcmlkIG9mIHRoZSBjdXN0b20gdS1ib290IHJlcG8vYnJhbmNoLgoKUmVn
YXJkcywKQXJpZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
