Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9FCC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:22:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C80860ED3
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C80860ED3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D66C4011B;
	Thu, 19 Aug 2021 21:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zH0-9zxUof0j; Thu, 19 Aug 2021 21:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 667784011D;
	Thu, 19 Aug 2021 21:22:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6560F1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD3B0819C8
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vxCYsRy97i4 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:21:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 518A181A24
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:21:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6C36CC0004;
 Thu, 19 Aug 2021 21:21:57 +0000 (UTC)
Date: Thu, 19 Aug 2021 23:21:56 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20210819232156.688fdc7d@windsurf>
In-Reply-To: <20210809055557.8698-1-jose.pekkarinen@unikie.com>
References: <20210809055557.8698-1-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/restorecond: Add new init script
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gSm9zw6ksCgpPbiBNb24sICA5IEF1ZyAyMDIxIDA4OjU1OjU3ICswMzAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gVGhlIGN1cnJl
bnQgcmVzdG9yZWNvbmQgdXBzdHJlYW0gaW5pdCBzY3JpcHQgaXMgbm8KPiBnb29kIGZpdCBmb3Ig
dGhlIHVzZXIgc3BhY2UgZ2VuZXJhdGVkIGJ5IGJ1aWxkcm9vdCwKPiB0aGlzIHNjcmlwdCBpcyBh
biBleHRlbnNpb24gb2YgdGhlIG9yaWdpbmFsLCB0aGF0Cj4gYnJpbmdzIHNvbWUgY2hhbmdlcyBm
cm9tIHRoZSBkZWJpYW4gaW5pdCBzY3JpcHQgdG8KPiB1c2Ugc3RhcnQtc3RvcC1kYWVtb24gaW5z
dGVhZCBvZiBkYWVtb24sIHdoaWxlCj4gcmVtb3ZpbmcgZGVwZW5kZW5jaWVzIG9uIC9ldGMvcmMu
ZC9pbml0LmQvZnVuY3Rpb25zCj4gYW5kIC9saWIvbHNiL2luaXQtZnVuY3Rpb25zLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29t
PgoKVGhhbmtzIGEgbG90LCBidXQgdW5mb3J0dW5hdGVseSB5b3VyIHByb3Bvc2VkIHNjcmlwdCBz
dGlsbCBkb2Vzbid0CmZvbGxvdyB0aGUgbW9kZWwvdGVtcGxhdGUgb2YgcGFja2FnZS9idXN5Ym94
L1MwMXN5c2xvZ2QuIENvdWxkIHlvdSB0cnkKdG8gZm9sbG93IHRoZSB0ZW1wbGF0ZSBhcyBjbG9z
ZWx5IGFzIHBvc3NpYmxlID8KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmVzdG9yZWNvbmQvUzAy
cmVzdG9yZWNvbmQgYi9wYWNrYWdlL3Jlc3RvcmVjb25kL1MwMnJlc3RvcmVjb25kCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4yNGVlMzA4NTNmCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2UvcmVzdG9yZWNvbmQvUzAycmVzdG9yZWNvbmQKPiBAQCAtMCww
ICsxLDExMyBAQAo+ICsjIS9iaW4vc2gKPiArIwo+ICsjIHJlc3RvcmVjb25kOgkJRGFlbW9uIHVz
ZWQgdG8gbWFpbnRhaW4gcGF0aCBmaWxlIGNvbnRleHQKPiArIwo+ICsjIGNoa2NvbmZpZzoJLSAx
MiA4Nwo+ICsjIGRlc2NyaXB0aW9uOglyZXN0b3JlY29uZCB1c2VzIGlub3RpZnkgdG8gbG9vayBm
b3IgY3JlYXRpb24gb2YgbmV3IGZpbGVzIFwKPiArIyBsaXN0ZWQgaW4gdGhlIC9ldGMvc2VsaW51
eC9yZXN0b3JlY29uZC5jb25mIGZpbGUsIGFuZCByZXN0b3JlcyB0aGUgXAo+ICsjIGNvcnJlY3Qg
c2VjdXJpdHkgY29udGV4dC4KPiArIwo+ICsjIHByb2Nlc3NuYW1lOiAvdXNyL3NiaW4vcmVzdG9y
ZWNvbmQKPiArIyBjb25maWc6IC9ldGMvc2VsaW51eC9yZXN0b3JlY29uZC5jb25mCj4gKyMgcGlk
ZmlsZTogL3J1bi9yZXN0b3JlY29uZC5waWQKPiArIwo+ICsjIFJldHVybiB2YWx1ZXMgYWNjb3Jk
aW5nIHRvIExTQiBmb3IgYWxsIGNvbW1hbmRzIGJ1dCBzdGF0dXM6Cj4gKyMgMCAtIHN1Y2Nlc3MK
PiArIyAxIC0gZ2VuZXJpYyBvciB1bnNwZWNpZmllZCBlcnJvcgo+ICsjIDIgLSBpbnZhbGlkIG9y
IGV4Y2VzcyBhcmd1bWVudChzKQo+ICsjIDMgLSB1bmltcGxlbWVudGVkIGZlYXR1cmUgKGUuZy4g
InJlbG9hZCIpCj4gKyMgNCAtIGluc3VmZmljaWVudCBwcml2aWxlZ2UKPiArIyA1IC0gcHJvZ3Jh
bSBpcyBub3QgaW5zdGFsbGVkCj4gKyMgNiAtIHByb2dyYW0gaXMgbm90IGNvbmZpZ3VyZWQKPiAr
IyA3IC0gcHJvZ3JhbSBpcyBub3QgcnVubmluZwoKV2UgZG9uJ3QgY2FyZSBhYm91dCBhbGwgdGhv
c2UgY29tbWVudHMuCgo+ICtQQVRIPS9zYmluOi9iaW46L3Vzci9iaW46L3Vzci9zYmluCj4gK0RF
U0M9IlNFTGludXggZmlsZSBjb250ZXh0IG1haW50YWluaW5nIGRhZW1vbiIKClRoZXNlIHZhcmlh
YmxlcyBhcmUgbm90IG5lZWRlZC4KCj4gK05BTUU9cmVzdG9yZWNvbmQKPiArREFFTU9OPS91c3Iv
c2Jpbi8kTkFNRQo+ICtEQUVNT05fQVJHUz0iIgo+ICtQSURGSUxFPS92YXIvcnVuLyROQU1FLnBp
ZAo+ICtMT0NLRklMRT0vdmFyL3J1bi8kTkFNRS5waWQKPiArU0NSSVBUTkFNRT0vZXRjL2luaXQu
ZC8kTkFNRQo+ICsKPiArWyAteCAvdXNyL3NiaW4vc2VsaW51eGVuYWJsZWQgXSAmJiAvdXNyL3Ni
aW4vc2VsaW51eGVuYWJsZWQgfHwgZXhpdCA3CgpXZSBkb24ndCBjYXJlIGFib3V0IHRoaXMgZWl0
aGVyLgoKPiArIyBDaGVjayB0aGF0IHdlIGFyZSByb290IC4uLiBzbyBub24tcm9vdCB1c2VycyBz
dG9wIGhlcmUKPiArdGVzdCAkRVVJRCA9IDAgIHx8IGV4aXQgNAoKU2FtZS4KCj4gK3Rlc3QgLXgg
L3Vzci9zYmluL3Jlc3RvcmVjb25kICB8fCBleGl0IDUKPiArdGVzdCAtZiAvZXRjL3NlbGludXgv
cmVzdG9yZWNvbmQuY29uZiAgfHwgZXhpdCA2CgpTYW1lLgoKPiArCj4gK1JFVFZBTD0wCj4gKwo+
ICtzdGFydCgpCj4gK3sKPiArCSMgUmV0dXJuCj4gKwkjICAgMCBpZiBkYWVtb24gaGFzIGJlZW4g
c3RhcnRlZAo+ICsJIyAgIDEgaWYgZGFlbW9uIHdhcyBhbHJlYWR5IHJ1bm5pbmcKPiArCSMgICAy
IGlmIGRhZW1vbiBjb3VsZCBub3QgYmUgc3RhcnRlZAo+ICsJc3RhcnQtc3RvcC1kYWVtb24gLS1z
dGFydCAtLXF1aWV0IC0tcGlkZmlsZSAkUElERklMRSAtLWV4ZWMgJERBRU1PTiAtLXRlc3QgPiAv
ZGV2L251bGwgXAo+ICsJCXx8IHJldHVybiAxCgpEb24ndCB0ZXN0LgoKPiArCXN0YXJ0LXN0b3At
ZGFlbW9uIC0tc3RhcnQgLS1xdWlldCAtLXBpZGZpbGUgJFBJREZJTEUgLS1leGVjICREQUVNT04g
LS0gXAo+ICsJCSREQUVNT05fQVJHUyBcCj4gKwkJfHwgcmV0dXJuIDIKClBsZWFzZSBzZWUgUzAx
c3lzbG9nZCBvbiBob3cgdG8gZG8gdGhpcy4KCj4gK3N0b3AoKQo+ICt7Cj4gKwkjIFJldHVybgo+
ICsJIyAgIDAgaWYgZGFlbW9uIGhhcyBiZWVuIHN0b3BwZWQKPiArCSMgICAxIGlmIGRhZW1vbiB3
YXMgYWxyZWFkeSBzdG9wcGVkCj4gKwkjICAgMiBpZiBkYWVtb24gY291bGQgbm90IGJlIHN0b3Bw
ZWQKPiArCSMgICBvdGhlciBpZiBhIGZhaWx1cmUgb2NjdXJyZWQKPiArCXN0YXJ0LXN0b3AtZGFl
bW9uIC0tc3RvcCAtLXF1aWV0IC0tcmV0cnk9VEVSTS8zMC9LSUxMLzUgLS1waWRmaWxlICRQSURG
SUxFIC0tbmFtZSAkTkFNRQo+ICsJUkVUVkFMPSIkPyIKPiArCVsgIiRSRVRWQUwiID0gMiBdICYm
IHJldHVybiAyCj4gKwo+ICsJcm0gLWYgJFBJREZJTEUKPiArCXJtIC1mICRMT0NLRklMRQo+ICsJ
cmV0dXJuICIkUkVUVkFMIgoKUGxlYXNlIGRvIGxpa2UgUzAxc3lzbG9nZC4KClRoYW5rcyBhIGxv
dCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3li
b3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
