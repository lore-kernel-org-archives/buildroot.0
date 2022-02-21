Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB42C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 08:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C9FE812B4;
	Mon, 21 Feb 2022 08:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cx0dYjVgVaol; Mon, 21 Feb 2022 08:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E7E380DCC;
	Mon, 21 Feb 2022 08:44:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9CA41BF419
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 08:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5E64404FB
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 08:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJ9qqT-0xdap for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 08:44:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTP id E46AC404FA
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 08:44:39 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id M4J4njJXuks1JM4J5nUqoG; Mon, 21 Feb 2022 09:44:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645433076; bh=kmwiG6I3OUTQs72GavJiKYK9PlkYtclHWJVFWlzDRGE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=aE8h/Kmi8shGsoVAN0YMZEON/0tbhSRC/a6q7LFZb5x94uC1xCqjUmVTSjCj4EUjH
 lNpPwM5P7GjjU8pe7AhJm7BX77t/k2XA4azCKmmIUqP/TpZFi1iCXrUkbDxl9wvM/s
 165dSX2b6AMgvTnc1E2q50nP1XTCEGGqpAavZ3h4LZDEyRRhvaFuQg2zFhTXjKWviL
 cMXsJxjHENMYjiX8iLgTh0oNUhL1AwMjjv25+yeqpmXFvUH12ENp/sTxFm44xGlBap
 1SdgnQ9ByWGThQ5cmsCrSyGAYUyAFELrG6fq9Ja/Z24zM01K67t0VCiU1lYLEHMCYV
 ExzQ1T1w9JUNA==
Message-ID: <71b0c2b1-0b71-9aca-5209-33ea3a6cacf1@benettiengineering.com>
Date: Mon, 21 Feb 2022 09:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
References: <CAHnHX5jAJw2ON8-e6UBmvDLR6j3p1iUYY1GvRpbULHBjF80SrQ@mail.gmail.com>
 <186B6238-5452-4211-BD9D-29A3C921DE42@benettiengineering.com>
 <CAHnHX5grmd94PGaBJn=XkJttwCEFdc=tWaE6v7PpZCN5UL8tSg@mail.gmail.com>
 <469c0dbc-6101-be6c-7272-400ac4512b86@grenoble.cnrs.fr>
 <4d8f6289-f16f-9602-a458-2b5836a817e6@benettiengineering.com>
 <CAHnHX5gJ2_=u09ntg_WxJeM1XwHrgOsgvjDYrUsHJk7AdUVyLQ@mail.gmail.com>
 <CAHnHX5i3M890wBfkx_C4QEAKHv3S-Np2mEqZX=nEySXrQ8Bg=g@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAHnHX5i3M890wBfkx_C4QEAKHv3S-Np2mEqZX=nEySXrQ8Bg=g@mail.gmail.com>
X-CMAE-Envelope: MS4wfJwjIXeYN2QxKPGgDzbYxDmZZrU2Ndckzu7Jj/CrMcHomBMlJ34qySkYFRsxRbiJgVPpb0fYuC16+j9imkXmHNTbHXpba4eLKLjXGXlIV4bfT8FacXls
 SoUoE1dZKiswpneUTVadKI/ns5gSBmU9Cxb8/+s0d3lrdDYHrte6R8d8wswfMINCiqAPnyzjY93UV7A1wtwy8AFY6iYnffgo/KS+KLQoyQdAMxGt0gMJPzps
 qUsB8r7aq3TyYpj53qlEqm8kVrR38jD0xPmBO815ZDg=
Subject: Re: [Buildroot] Issue with login
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTW9oZCwKCk9uIDIxLzAyLzIyIDA2OjE2LCBNb2hkIEZhaXogUm9oYW5pIHdyb3RlOgo+IEhp
IGd1eXMsCj4gCj4gVGhhbmsgeW91IGZvciB5b3VywqBoZWxwLkkgaGF2ZSBvdmVybG9va2VkIHRo
ZSByZXF1aXJlZCBzZXR0aW5nIGFzIAo+IG5vcm1hbGx5IEkgd2lsbCBsZWF2ZSB0aGUgc2V0dGlu
Z8KgdG8gdGhlIGRlZmF1bHQsIGFzIEkgYXNzdW1lIEJ1aWxkcm9vdCAKPiBoYXMgc2VsZWN0ZWTC
oHRoZSByZXF1aXJlZCBzZXR0aW5ncy4gQW55d2F5IEkgaGF2ZSBtYW5hZ2VkIHRvIGxvZ2luIAo+
IHN1Y2Nlc3NmdWxsecKgbm93Lgo+IAo+IEkgaGF2ZSB0dXJuZWQgb24gQlIyX1BBQ0tBR0VfU1lT
VEVNRF9MT0dJTkQgYW5kIAo+IEJSMl9QQUNLQUdFX1VUSUxfTElOVVhfTE9HSU4gc2V0dGluZ3Ms
IHdoaWxlIHRoZSByZXN0IGRvZXMgbm90IGNoYW5nZS4KClBlcmZlY3QsIHRlYW0gd29ya2luZyB3
aXRoIEVkZ2FyIHdvcmtlZCA6LSkKCj4gRnlpLCBJIGhhdmUgdHJpZWQgdGhlIG5ld2VyIHZlcnNp
b25zIG9mIExpbnV4IEtlcm5lbCAoNS4xNSkgYW5kIFVib290IAo+ICh2MjAyMi4wMSkgd2l0aCB0
aGUgTGluYXJvIDcuNSB0b29sY2hhaW4sIGJ1dCBnb3QgYW4gZXJyb3IgZHVyaW5nIHRoZSAKPiBi
b290aW5nIHByb2Nlc3Mgd2hlcmUgdGhlIFJGUyBjYW5ub3QgYmUgbW91bnRlZC4gSXQgbWF5IGJl
IG15IGZhdWx0IAo+IHRocm91Z2ggdGhlIHNldHRpbmdzIHRob3VnaCwgdGhhdCBpcyB3aHkgSSBh
bSB0cnlpbmcgdGhlIG9sZCB2ZXJzaW9uIGFuZCAKPiBpdCB3b3JrZWQuCgpJIHdvdWxkIGF2b2lk
IHVzaW5nIGdjYyA3LjUgb24gc3VjaCBuZXcga2VybmVsL3Vib290LiBNYXliZSBpZiB5b3UgdHJ5
IAp0byByZWJ1aWxkIHVzaW5nIGFuIGV4dGVybmFsIHByZWJ1aWx0IHRvb2xjaGFpbiBsaWtlIHRo
ZSBCb290bGluIG9uZSwgb3IgCnlvdSBidWlsZCBhIEJ1aWxkcm9vdCB0b29sY2hhaW4gd2l0aCBs
YXRlc3QgdmVyc2lvbnMsIGxpa2UgZ2NjIDEwLnggeW91IApjb3VsZCBvYnRhaW4gZGlmZmVyZW50
IHJlc3VsdHMuCgo+IEkgYW0gcGxhbm5pbmcgdG8gdXNlIEJ1aWxkcm9vdCBmb3IgbXkgZnV0dXJl
IGRldmVsb3BtZW50IGFuZCBrZWVuIHRvIAo+IGNvbnRyaWJ1dGUgd2hlcmV2ZXLCoEkgY2FuLiBT
dGlsbCBsb3RzIHRvIGxlYXJuIHRob3VnaC4KCldlbGwhCgo+IFRoYW5rIHlvdSBhZ2FpbiBndXlz
LgoKWW91J3JlIHdlbGNvbWUKCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0
aSBFbmdpbmVlcmluZyBzYXMKCj4gUmVnYXJkcy4KPiBGYWl6Cj4gCj4gCj4gCj4gCj4gT24gTW9u
LCBGZWIgMjEsIDIwMjIgYXQgMjozMyBBTSBNb2hkIEZhaXogUm9oYW5pIAo+IDxtb2hkLmZhaXou
cm9oYW5pQGdtYWlsLmNvbSA8bWFpbHRvOm1vaGQuZmFpei5yb2hhbmlAZ21haWwuY29tPj4gd3Jv
dGU6Cj4gCj4gICAgIFRoYW5rcywgSSdsbCBjaGVjayB0aGVtIG91dC4gV2lsbCB1cGRhdGUgdGhl
IG91dGNvbWUgb25jZSB0aGUKPiAgICAgaW5zdGFsbGF0aW9uIGlzIGRvbmUuCj4gCj4gICAgIFRo
YW5rwqB5b3UuCj4gCj4gICAgIE9uIE1vbiwgRmViIDIxLCAyMDIyLCAxOjU2IEFNIEdpdWxpbyBC
ZW5ldHRpCj4gICAgIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tCj4gICAg
IDxtYWlsdG86Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4+IHdyb3RlOgo+
IAo+ICAgICAgICAgSGkgRWRnYXIsCj4gCj4gICAgICAgICBwbGVhc2UgcmVwbHkgdG8gYWxsIGlu
IE1haWxpbmcgTGlzdCwgSSBhZGQgTW9oZCBpbiBDYywKPiAKPiAgICAgICAgIE9uIDIwLzAyLzIy
IDE3OjE4LCBFZGdhciBCb25ldCB3cm90ZToKPiAgICAgICAgICA+IEhpIQo+ICAgICAgICAgID4K
PiAgICAgICAgICA+IEluIGhpcyBjb25maWcgZmlsZSwgTW9oZCB3cm90ZToKPiAgICAgICAgICA+
PiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0hFQURFUlNfNF8xMD15Cj4gICAgICAgICAgPj4gQlIy
X0xJTlVYX0tFUk5FTF9WRVJTSU9OPSI0LjQuMTU1Igo+ICAgICAgICAgID4KPiAgICAgICAgICA+
IFRoaXMgbWF5IGNhdXNlIHByb2JsZW1zLiBDLmYuIGRvY3MvbWFudWFsL2NvbmZpZ3VyZS50eHQ6
Cj4gICAgICAgICAgPgo+ICAgICAgICAgID7CoCDCoCDCoCBJZiB5b3UgdXNlIGtlcm5lbCBoZWFk
ZXJzIHRoYXQgYXJlIG1vcmUgcmVjZW50IHRoYW4gdGhlCj4gICAgICAgICBMaW51eAo+ICAgICAg
ICAgID7CoCDCoCDCoCBrZXJuZWwgeW91IHJ1biBvbiB5b3VyIGVtYmVkZGVkIHN5c3RlbSwgdGhl
biB0aGUgQwo+ICAgICAgICAgbGlicmFyeSBtaWdodAo+ICAgICAgICAgID7CoCDCoCDCoCBiZSB1
c2luZyBpbnRlcmZhY2VzIHRoYXQgYXJlIG5vdCBwcm92aWRlZCBieSB5b3VyIExpbnV4Cj4gICAg
ICAgICBrZXJuZWwuCj4gCj4gICAgICAgICBHb29kIGNhdGNoIEVkZ2FyIQo+ICAgICAgICAgU28g
TW9oZCwgd2hhdCB5b3UgbmVlZCBoZXJlIGlzIGEgdG9vbGNoYWluIHdpdGggb2xkZXIgbGliYy4K
PiAgICAgICAgIGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5o
dG1sI19jcm9zc19jb21waWxhdGlvbl90b29sY2hhaW4KPiAgICAgICAgIDxodHRwczovL2J1aWxk
cm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNfY3Jvc3NfY29tcGlsYXRpb25f
dG9vbGNoYWluPgo+IAo+ICAgICAgICAgQnV0IGFnYWluLCBkbyB5b3UgcmVhbGx5IG5lZWQgdG8g
dXNlIHNvIHN1Y2ggb2xkIHZlcnNpb25zCj4gICAgICAgICBpbnN0ZWFkIG9mIHRyeQo+ICAgICAg
ICAgdG8gdXNlIGJ1aWxkcm9vdCdzIGJlYWdsZWJvbmVfZGVmY29uZmlnPwo+IAo+ICAgICAgICAg
ID4gSW4gdGhlIHNhbWUgY29uZmlnIGZpbGUsIHRoZXJlIGlzOgo+ICAgICAgICAgID4+ICMgQlIy
X1BBQ0tBR0VfQlVTWUJPWCBpcyBub3Qgc2V0Cj4gICAgICAgICAgPgo+ICAgICAgICAgID4gV2hl
biBkaXNhYmxpbmcgYnVzeWJveCwgeW91IHNob3VsZCBoYXZlIHNlZW4gdGhlIG1lc3NhZ2U6Cj4g
ICAgICAgICAgPgo+ICAgICAgICAgID7CoCDCoCDCoCBZb3UgbWF5IG5lZWQgdG8gZW5hYmxlIG90
aGVyIHBhY2thZ2VzIHRvIGdldCBhIHdvcmtpbmcKPiAgICAgICAgIHN5c3RlbQo+ICAgICAgICAg
ID7CoCDCoCDCoCBZb3UgYmV0dGVyIGtub3cgd2hhdCB5b3UncmUgZG9pbmchCj4gCj4gICAgICAg
ICBEZXNwaXRlIG9mIHdoYXQgSSd2ZSB3cml0dGVuIG9uIG15IHByZXZpb3VzIGUtbWFpbChteSB0
ZXN0IHdhcwo+ICAgICAgICAgd3JvbmcpLAo+ICAgICAgICAgaGUgaGFzIEJSMl9JTklUX1NZU1RF
TUQ9eSB0aGF0IHdvcmtzIGFzIEluaXQgU3lzdGVtLCBzbyB0aGF0J3Mgb2suCj4gCj4gICAgICAg
ICAgPiBBbmQgdGhlbjoKPiAgICAgICAgICA+PiAjIEJSMl9QQUNLQUdFX1NZU1RFTURfTE9HSU5E
IGlzIG5vdCBzZXQKPiAKPiAgICAgICAgIEdvb2QgY2F0Y2ggYWdhaW4gRWRnYXIhIFRoaXMgXl5e
IHNob3VsZCBiZSB0aGUgcG9pbnQuIEJlY2F1c2UgaXQncwo+ICAgICAgICAgZXhhY3RseSB0aGUg
c3lzdGVtZCBsb2dpbiBkYW1lb24uCj4gCj4gICAgICAgICAgPj4gIyBCUjJfUEFDS0FHRV9VVElM
X0xJTlVYX0xPR0lOIGlzIG5vdCBzZXQKPiAKPiAgICAgICAgIFRoaXMgXl5eIGlzIG5vdCBzZWxl
Y3RlZCBieSBzeXN0ZW1kLCBzbyBJIGV4cGVjdAo+ICAgICAgICAgQlIyX1BBQ0tBR0VfU1lTVEVN
RF9MT0dJTkQgdG8gZG8gdGhlIGpvYihldmVuIGlmIEknbSBub3QgYSBzeXN0ZW1kCj4gICAgICAg
ICBleHBvZXJ0IGF0IGFsbCkuCj4gCj4gICAgICAgICBCdXQgYXMgRWRnYXIgcG9pbnRlZCBsaW51
eCBoZWFkZXJzIGRvbid0IG1hdGNoIHNvIHlvdSBoYXZlIDMKPiAgICAgICAgIGNob2ljZXM6Cj4g
ICAgICAgICAxKSBmaW5kIGEgdG9vbGNoYWluIHdpdGggbGludXgtaGVhZGVycyA8PSA0LjQuKgo+
ICAgICAgICAgMikgdXBkYXRlIGxpbnV4IHZlcnNpb24KPiAgICAgICAgIDMpIHN0YXJ0IGZyb20g
c2NyYXRjaCB1c2luZyBidWlsZHJvb3QgYmVhZ2xlYm9uZV9kZWZjb25maWcKPiAKPiAgICAgICAg
IEJlc3QgcmVnYXJkcwo+ICAgICAgICAgLS0gCj4gICAgICAgICBHaXVsaW8gQmVuZXR0aQo+ICAg
ICAgICAgQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
