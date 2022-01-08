Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0C4C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7FD44091B;
	Sat,  8 Jan 2022 16:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kxil3FiextU9; Sat,  8 Jan 2022 16:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CB064090C;
	Sat,  8 Jan 2022 16:54:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 210A41BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DBD9400E4
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00ooeULQDP_Y for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:54:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D534B400BA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:54:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7DB8140003;
 Sat,  8 Jan 2022 16:54:14 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6Eyr-0005hP-Sc; Sat, 08 Jan 2022 17:54:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
 <20211228164916.2beec0d6@windsurf>
 <CAPi7W80OfGF3AhM2h6mjtsUjLEnYEV4gteJ12GFq4edNysEV5A@mail.gmail.com>
 <20211228181447.2a42dc86@windsurf>
 <ed10db1b-6b39-344d-8c4b-aa0a6d085d40@gmail.com>
 <CAPi7W8094+7P-RRPafDfRgSCe94aqQUfoQ7z=WvGRFsj_wdpww@mail.gmail.com>
 <874k6egvrm.fsf@dell.be.48ers.dk>
 <CAPi7W80y_knjUqY1TuKsxbqvgPET08pS9vee07zM7HCm9w4qYg@mail.gmail.com>
Date: Sat, 08 Jan 2022 17:54:13 +0100
In-Reply-To: <CAPi7W80y_knjUqY1TuKsxbqvgPET08pS9vee07zM7HCm9w4qYg@mail.gmail.com>
 (Fabrice Fontaine's message of "Sat, 8 Jan 2022 16:03:49 +0100")
Message-ID: <87zgo6f9sa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBIaSwKID4gTGUgc2FtLiA4IGphbnYuIDIwMjIgw6AgMTU6MTQs
IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOgogPj4gCiA+
PiA+Pj4+PiAiRmFicmljZSIgPT0gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+IHdyaXRlczoKID4+IAogPj4gSGksCiA+PiAKID4+ID4gSW5kZWVkLCB0aGlzIGlz
IGFsc28gYW4gYWx0ZXJuYXRpdmUsIGV2ZW4gaWYgSSB0aGluayB0aGF0IGFkZGluZwogPj4gPiBt
YmVkdGxzMyB3b3VsZCBiZSBhIGdyZWF0IGFkZGl0aW9uLgogPj4gPiBGb3IgZXhhbXBsZSwgbGli
Y3VybCBzdXBwb3J0cyBtYmVkdHMgMy4wIHNpbmNlIGl0cyB2ZXJzaW9uIDcuNzkgYW5kCiA+PiA+
IGh0dHBzOi8vZ2l0aHViLmNvbS9jdXJsL2N1cmwvY29tbWl0LzNmMTI2MTM4YmUzYzQ1OWEyNzk0
ZDM1ZjgxNzBlOTJlNjVhNTBkYWQuCiA+PiA+IE90aGVyd2lzZSwgYXMgcmVxdWVzdGVkIGJ5IFRo
b21hcywgSSBzZW50IGFuIGVtYWlsIHRvIG1iZWR0bHMgbWFpbGluZwogPj4gPiBsaXN0OgogPj4g
PiBodHRwczovL2xpc3RzLnRydXN0ZWRmaXJtd2FyZS5vcmcvYXJjaGl2ZXMvbGlzdC9tYmVkLXRs
c0BsaXN0cy50cnVzdGVkZmlybXdhcmUub3JnL3RocmVhZC9IRUhDTlFaVEJPWlY1NlJUR1JUR1NR
UVJNRVdZSlBHSS8KID4+IAogPj4gV2hhdCBpcyB0aGUgcGxhbiBmcm9tIHVwc3RyZWFtIHJlZ2Fy
ZGluZyBtYmVkdGxzIDIueD8gV2lsbCBpdCBiZQogPj4gbWFpbnRhaW5lZCBpbiBwYXJhbGxlbCB3
aXRoIDMueCBmb3Igc29tZSB0aW1lIChhbmQgZm9yIGhvdyBsb25nPykgb3IgaXMKID4+IGl0IGVm
ZmVjdGl2ZWx5IEVPTCBhbHJlYWR5PwogPiAyLjE2LnggaXMgRU9MIHNpbmNlIERlY2VtYmVyIDIw
MjE6CiA+IGh0dHBzOi8vdGxzLm1iZWQub3JnL3RlY2gtdXBkYXRlcy9ibG9nL2Fubm91bmNpbmct
bHRzLWJyYW5jaC1tYmVkdGxzLTIuMTYKID4gVGhlIG5leHQgTFRTIGJyYW5jaCBpcyAyLjI4IHdo
aWNoIHdpbGwgYmUgbWFpbnRhaW5lZCB1bnRpbCBlbmQgb2YKID4gMjAyNDogaHR0cHM6Ly9naXRo
dWIuY29tL0FSTW1iZWQvbWJlZHRscy9ibG9iL2RldmVsb3BtZW50L0JSQU5DSEVTLm1kCgpPaywg
c28gd2Ugc2hvdWxkIGlkZWFsbHkgbW92ZSBvdXIgbWJlZHRscyB2ZXJzaW9uIHRvIDIuMjgueCBi
ZWZvcmUKMjAyMi4wMi4gV2hhdCBhYm91dCAzLngsIGlzIHRoYXQgYWxzbyBhIExUUyBvciBpcyB0
aGF0IGNvbnNpZGVyZWQgYQpub3QteWV0LXN0YWJsZSBkZXZlbG9wbWVudCB2ZXJzaW9uPwoKRm9y
IHRoZSBxdWVzdGlvbiBpZiB3ZSBuZWVkIHRvIG1haW50YWluIGJvdGggMi4yOC54IGFuZCAzLngg
aW4KcGFyYWxsZWwgSSBndWVzcyBpdCByZWFsbHkgZGVwZW5kcyBvbiBpZiB0aGUgcGFja2FnZXMg
d2UgaGF2ZSBkZXBlbmRpbmcKb24gbWJlZHRscyAoRS5HLiBiY3Rvb2xib3gsIGJteDcsIG1vbmdy
ZWwyLCBzaGFkb3dzb2Nrcy1saWJldikgY2FuIChiZQpwYXRjaGVkIHRvKSB3b3JrIHdpdGggbWJl
ZHRscyAzLnggb3Igbm90PwoKSWYgdGhleSBjYW4gKG9yIGFyZSBubyBsb25nZXIgbWFpbnRhaW5l
ZCB1cHN0cmVhbSksIHRoZW4gSSB3b3VsZCBwcmVmZXIKdG8gb25seSBzdXBwb3J0IG1iZWR0bHMg
My54IGdvaW5nIGZvcndhcmQuIElmIG9uIHRoZSBvdGhlciBoYW5kIG1iZWR0bHMKMy54IGlzbid0
IHJlYWxseSBzdGFibGUgeWV0IGFuZCBvbmx5IG5lZWRlZCBmb3IgaGlhd2F0aGEsIHRoZW4gaW5k
ZWVkIHdlCnNob3VsZCBwZXJoYXBzIGp1c3QgcG9zdHBvbmUgaXQgYSBiaXQgYW5kIHVzZSB0aGUg
aW50ZXJuYWwgbWJlZHRscyBjb3B5CmluIGhpYXdhdGhhIG9yIGRvd25ncmFkZSAvIGRyb3AgVExT
IHN1cHBvcnQuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
