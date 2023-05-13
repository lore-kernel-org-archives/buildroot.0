Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC8FC77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 12:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01B5381EDF;
	Sat, 13 May 2023 12:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01B5381EDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJY35Djm3RoE; Sat, 13 May 2023 12:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C776981EA1;
	Sat, 13 May 2023 12:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C776981EA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD4DD1BF5DD
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2B7942C99
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B7942C99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Of-v1m_TwuUs for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 12:08:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB34642C93
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB34642C93
 for <buildroot@buildroot.org>; Sat, 13 May 2023 12:08:48 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xo3KpoZFKyP3qxo3Kp4ZCI; Sat, 13 May 2023 14:08:46 +0200
Message-ID: <ab845810-6e6a-475a-d7bc-e189c4b77ce4@benettiengineering.com>
Date: Sat, 13 May 2023 14:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US, it
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230513105441.GN2582048@scaer>
 <355A9DF0-610B-4742-8703-554D7EFF1FCC@benettiengineering.com>
 <20230513120329.GQ2582048@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230513120329.GQ2582048@scaer>
X-CMAE-Envelope: MS4xfBNAC93qDNdMXiv8IuaEedYkjwzpeImD5jcuG4WWhmbCs3+ecXtqmIBxpQhjIxvbzto+UfrceKbm1fB3WmbHhx55CftM3FOTP5uDv+nMXeqNNApLuteZ
 KKPky/6ZckfENOI6YalK81mp/e+VTNBJmGcHBPAQRJyGz0zpM5huNtycpUt7Vlx9phI2ifSCJP6hTgXe/i++6wPJQZlBKoAAMh+SIS4MaTTRJcG+L87JGKKm
 5C2oIIhl+vln1343bS2x4yOwsUVsTiVNnaXuJrL/stc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1683979726; bh=U3ZT3f3vh1xLkEx6d3pegiWBh6wJYNUJXd+l+NDAD7Y=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=IQY8mLoFwt/0U669MlRaBjC5DgU3S2hIUNJj6V8xAfqOtvPl5usesCuhfX8R5vF1V
 ggWOZ+H0RUMjDxJh0cNUSoRTwoJxyVd7wYEZRGVYNJc6SbE1ZV02kNksTyLWCBaSkA
 wejr/wLDtQ+kpIbalzn0/PSp3F9qh807IOZWIy/hj/FpwFGxSIQCasGkaSQh7jlfs0
 tiqzGrFutAKe4JH9H/gxZ0w8U8butEv7H0MdIH7NOKTTAYo/r8IwepuVSedzOxJOdX
 Q8+aDl3g06UiqPMujpg7zrS7OpgUH6JElUmYVXSrSUP3vkCPsBdwaGkBfQCYeULEJx
 fEH320vF0z4Ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=IQY8mLoF
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump to version 2.6.3
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDEzLzA1LzIzIDE0OjAzLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IEdpdWxpbywgQWxsLAo+
IAo+IE9uIDIwMjMtMDUtMTMgMTM6NTQgKzAyMDAsIEdpdWxpbyBCZW5ldHRpIHNwYWtlIHRodXNs
eToKPj4+IElsIGdpb3JubyAxMyBtYWcgMjAyMywgYWxsZSBvcmUgMTI6NTUsIFlhbm4gRS4gTU9S
SU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBoYSBzY3JpdHRvOgo+Pj4+IC4uLmV2ZW50LWFu
ZC1saWJzcWxpdGUzLWNoZWNrZWQtd2hlbi1uZi5wYXRjaCB8IDc5ICsrKysrKysrKysrKysrKysr
KysKPj4+PiAuLi5lYWQtZml4LWxpbmtpbmctd2hpbGUtc3RhdGljLWxpbmtpbmcucGF0Y2ggfCA0
OSAtLS0tLS0tLS0tLS0KPj4+PiAuLi5lLmFjLWFsbG93LXRvLWRpc2FibGUtbmZzcmFoZWFkLXRv
b2wucGF0Y2ggfCA2OCAtLS0tLS0tLS0tLS0tLS0tCj4+PiAgICAgJCAuL3V0aWxzL2RvY2tlci1y
dW4gbWFrZSBjaGVjay1wYWNrYWdlCj4+PiAgICAgLmNoZWNrcGFja2FnZWlnbm9yZToxMDc4OiBp
Z25vcmVkIGZpbGUgcGFja2FnZS9uZnMtdXRpbHMvMDAwMS1uZnNyYWhlYWQtZml4LWxpbmtpbmct
d2hpbGUtc3RhdGljLWxpbmtpbmcucGF0Y2ggaXMgbWlzc2luZwo+Pj4gICAgIC5jaGVja3BhY2th
Z2VpZ25vcmU6MTA3OTogaWdub3JlZCBmaWxlIHBhY2thZ2UvbmZzLXV0aWxzLzAwMDItY29uZmln
dXJlLmFjLWFsbG93LXRvLWRpc2FibGUtbmZzcmFoZWFkLXRvb2wucGF0Y2ggaXMgbWlzc2luZwo+
PiBBaCwgSeKAmW0gY3VyaW91cyB0byB1bmRlcnN0YW5kIGhvdyBpdCBoYXBwZW5lZC4KPiAKPiBU
aGF0O3MgYmVjYXVzZSAuY2hlY2twYWNrYWdlaWdub3JlIGlzIHJsYXRpdmVseSBuZXcsIGFuZCB0
aGVyZSB3YXMgdW50aWwKPiByZWNlbnRseSBubyB0b29saW5nIHRoYXQgY2hlY2tlZCB0aGUgYWJv
dmUuIEkndmUgcmVjZW50bHkgYXBwbGllZCBhCj4gZW5oYW5jZW1lbnQgdG8gY2hlY2stcGFja2Fn
ZSB0aGVhdCBkZXRlY3RzIHRoYXQsIGJ1dCBpdCBzdGlsbCBpcyBub3QKPiBlbm91Z2ggaW4gYWxs
IGNhc2VzLgo+IAo+IFNvIG1haW50YWluZXJzIGhhdmUgdGhlIGR1dHkgdG8gY2hlY2sgZm9yIHRo
YXQgZm9yIG5vdywgb3IgdGhlIENJIHdpbGwKPiB3aGluZS4gOy0pCgpPaywgdGhhbmtzIGZvciBp
bXByb3ZpbmcgWWFubiEgQW5kIEknbGwgdGFrZSBjYXJlIGFib3V0IGl0LgoKS2luZCByZWdhcmRz
Ci0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
