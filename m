Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319F6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 20:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5F844035F;
	Sat, 20 Nov 2021 20:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJMH9o7C4dO4; Sat, 20 Nov 2021 20:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED3B840375;
	Sat, 20 Nov 2021 20:23:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A98501BF3E3
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 20:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97C7A818AC
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 20:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BddqWfhSNstA for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 20:23:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CB79818A1
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 20:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637439799;
 bh=WX83fpEEfpdPrlOvUwy4o22oUOqnGUyZqH3F3oUu88c=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=bLhvPmsHZ8NSllm9qpFNWTrAjYKQIsuBcKJXDMp8AQ3HhI9ilyMt0ZHA4QmGsMi8W
 cLUpEwe6fA/MViwYC9WFP2CfoM/wRnz3y4oK659wW9X1JLdCwvM2TuGiUU7BWdEnQw
 EGAmMQxQMaw3piUaVCLtGL8PidlT7Duzlk0S3UzE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.105]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC30Z-1mvz0F43Y5-00CVK1; Sat, 20
 Nov 2021 21:23:19 +0100
Date: Sat, 20 Nov 2021 21:23:17 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211120212317.12cfaaef@gmx.net>
In-Reply-To: <CAPi7W82DcY+8QW+c83hR=veNGqGz64geziZFymw4S7Lnz9jUog@mail.gmail.com>
References: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
 <20211120003256.61693b53@gmx.net>
 <CAPi7W81xnSeS3w+mswu1ALNKSQVphfyim5jkFDmJgLJmj=dopA@mail.gmail.com>
 <20211120205359.0213edde@gmx.net>
 <CAPi7W82DcY+8QW+c83hR=veNGqGz64geziZFymw4S7Lnz9jUog@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:9kDxxtvgVk/t34UQRf1euutEPY5cWsk+eKQ5Xkq7SYD5YhA+KPT
 5AQWSaqkCaGXMdHqfvQLdoZfVvJmj1a5AGRj3cRQ/Q/V+aVgyyX3cSaglN0P16PvPQQ14+l
 ix6txW8HdSLTAmJVKSupMz1RtBwWaRLMNjY5kCY8vqvkO1qRylcw9II1JT96qHaB6iho9Fo
 SCDSQZcUS5mdu6Ay8B2PQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8lTMUycTqT4=:t/5/q059MKuQGgow8LybW+
 b8yWfUep4bRRimFiBO5YWH81mN8X+RoN+MoQSPnuByRFgKZ35m31bP+rP6JZWpF0B4ZIcs09e
 FizZ8/u2iO6dKrbOuYwxxe338P4fQ+0qNrqtSOiIc7/x4+grcL+QvBnPkh7zEkxhH9iq6RqQN
 kJouLMBh+Uv/S3BeEYa9HUUvSFkLxn3+/N38+81qnC4Kozbf6omsuoJT7YFxPOD2rmSYnMlkz
 3m3qzk69ao3DsMbQtJnbwCWV0RP5PEGPD6T/cI06dSnsdzfnSRpcR9wfIaGVVtd3iZakMRCYm
 ZakfmlsUp6CEjGx/NFXFBpvrOO3PZajy7TZ5EAX0xeuuy5sxUa0Z+oBQ8CZfF5DLELDxrnBjG
 snzN8LmnEk5tz8kLJLbemjrYPWg5PuJBHftncLXFmao+6MkKiTNiZjMWreYY8gtU0usXjoVk0
 tz7XXaU0ybwSuDfTGOMIMhn1OnUS1lf01rkU/SxCXUi4EfS3iuLSCH8DOfWctH+B71Ae1kpfQ
 43HYYgq6/cBc/XFAhHSpYX91Cj6eCaXpn5kH1Mcm1R0tIdgb/3B106adMzlCLUXC9SqCf6FPF
 nTjvxbb68rrSyPD7D+M1EilG2paEl7YREEURFuH6gv2BW4hxCsEXMmAFHb1XS3HJ+MCxR06Tr
 Up4Zmyf7254se7/YX0c/74hB9N5/NJQ4HbazlkClzRqrsvE5QxZTKvmllHimobbYST1Cb+096
 UnKWDtg6eIQlZSd4y7T/Si1i3Mqp3GFo6uJyTJpvMCTatcPValUK5RPNDvPcbsVLrXTi4Z8zi
 tHlZErsvo756C8lGgmJOqUuvqSov+f2rL1xWZ0T5GdoKScNfHTNmNVrZPAA2Zyr2CRDFkJebB
 22PbkzEYLIvpVjxKHNxbEsq+BoxKT+BwWi11qe2oa/SnyA4OSoV3u3fkrKdypOIJijd0yBKGU
 ySJNe1b0w5ZnLf62JpQ7p1DuD3fc/eUfcrwt3LvjyFHrNS0jJtaS9JN1n4828IToi9LDFceff
 sH3a3uqb7Ntyfl5Mr9JGNWqRPdv5SknarhZLzVPUvWr+jKK9Kmwf04RGbmmC/s8K9Rpnh+wd3
 2HP7NV8LiE8c88=
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: run autoreconf
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFyYnJpY2UsCgpPbiBTYXQsIDIwIE5vdiAyMDIxIDIxOjE1OjQwICswMTAwLCBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IExlIHNh
bS4gMjAgbm92LiAyMDIxIMOgIDIwOjU0LCBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5u
ZXQ+IGEgw6ljcml0IDoKPiA+Cj4gPiBIZWxsbyBGYWJyaWNlLAo+ID4KPiA+IE9uIFNhdCwgMjAg
Tm92IDIwMjEgMTA6MjM6MTEgKzAxMDAsIEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJp
Y2VAZ21haWwuY29tPiB3cm90ZToKPiA+ICAKPiA+ID4gSGVsbG8gUGV0ZXIsCj4gPiA+Cj4gPiA+
IExlIHNhbS4gMjAgbm92LiAyMDIxIMOgIDAwOjMzLCBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0
QGdteC5uZXQ+IGEgw6ljcml0IDogIAo+ID4gPiA+Cj4gPiA+ID4gSGVsbG8gRmFicmljZSwKPiA+
ID4gPgo+ID4gPiA+IE9uIFRodSwgMTggTm92IDIwMjEgMjI6MDY6MjMgKzAxMDAsIEZhYnJpY2Ug
Rm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPiAgCj4g
PiA+ID4gPiBGb3IgYW4gdW5rbm93biByZWFzb24sIHRoZSBidWlsZCBmYWlscyBzaW5jZSBidW1w
IHRvIHZlcnNpb24gMS40LjYwIGluCj4gPiA+ID4gPiBjb21taXQgZDYyYjdmNTRmMDAyOTFhNTAy
NzQ0MDlmYjU1MTA1MjdmZDcyNWZmZSBvbjoKPiA+ID4gPiA+Cj4gPiA+ID4gPiBhcnJheS5jOjE0
MDoyOiBlcnJvcjogJ2ZvcicgbG9vcCBpbml0aWFsIGRlY2xhcmF0aW9ucyBhcmUgb25seSBhbGxv
d2VkIGluIEM5OSBtb2RlCj4gPiA+ID4gPiAgIGZvciAodWludDMyX3QgaSA9IDA7IGkgPCBzejsg
KytpKSB7Cj4gPiA+ID4gPiAgIF4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBSdW5uaW5nIGF1dG9yZWNv
bmYgZml4ZXMgdGhlIGJ1aWxkLiAgCj4gPiA+ID4KPiA+ID4gPiBUaGUgZGlmZmVyZW5jZSBpcyBk
dXJpbmcgdGhlIGNvbmZpZ3VyZSBzdGVwOgo+ID4gPiA+Cj4gPiA+ID4gLSBjaGVja2luZyBmb3Ig
Li4uL2hvc3QvYmluL2FybS1ub25lLWxpbnV4LWdudWVhYmktZ2NjIG9wdGlvbiB0byBhY2NlcHQg
SVNPIEM4OS4uLiBub25lIG5lZWRlZAo+ID4gPiA+ICsgY2hlY2tpbmcgZm9yIC4uLi9ob3N0L2Jp
bi9hcm0tbm9uZS1saW51eC1nbnVlYWJpLWdjYyBvcHRpb24gdG8gZW5hYmxlIEMxMSBmZWF0dXJl
cy4uLiAtc3RkPWdudTExCj4gPiA+ID4KPiA+ID4gPiBBbmQgdGhlIHVzZSBvZiB0aGUgJy1zdGQ9
Z251MTEnIGZsYWcgZm9yIHRoZSBjb21waWxlIHN0ZXBzLi4uLCBhbnkgbW9yZQo+ID4gPiA+IGxp
Z2h0d2VpZ2h0IG9wdGlvbiB0byBlbmFibGUgQzExPyAgCj4gPiA+IFRoZW4sIEkgYXNzdW1lIHRo
YXQgdXBzdHJlYW0gZm9yZ290IHRvIHJlZ2VuZXJhdGUgdGhlIGNvbmZpZ3VyZSBzY3JpcHQgYWZ0
ZXIKPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2xpZ2h0dHBkL2xpZ2h0dHBkMS40L2NvbW1pdC83
Mzg2NTAyNTcyOTg5N2QxMTQ5NGRlNTZhMjljNzdjNGZjOGU1NzAyCj4gPiA+IEkgb3BlbmVkIGFu
IGlzc3VlIGhlcmU6IGh0dHBzOi8vcmVkbWluZS5saWdodHRwZC5uZXQvaXNzdWVzLzMxMTYgIAo+
ID4KPiA+Cj4gPiBUaGFua3MgZm9yIGVmZm9ydCwgYnV0IHVwc3RyZWFtIHNlZW1zIHZlcnkgY29u
dmluY2VkIG9mIGRvaW5nIG5vdGhpbmcgd3JvbmcgKGFuZAo+ID4gbm90IHJlYWR5IHRvIGludmVz
dGlnYXRlIGZ1cnRoZXIpLi4uLiwgZGVzcGl0ZSB1c2luZyBhdXRvY29uZi0yLjY5IChmcm9tIDIw
MTIsCj4gPiBzZWUgbGlnaHR0cGQtMS40LjYxL2NvbmZpZ3VyZSkgYW5kOgo+ID4KPiA+ICAgICAg
ICAgJCBkaWZmIC11IGxpZ2h0dHBkLTEuNC41OS9jb25maWd1cmUgbGlnaHR0cGQtMS40LjYxL2Nv
bmZpZ3VyZQo+ID4gWy4uLl0KPiA+IEBAIC00NDQwLDI5OCArNDQ2MCw2IEBACj4gPiAgZmkKPiA+
Cj4gPgo+ID4gLSAgIGNhc2UgJGFjX2N2X3Byb2dfY2Nfc3RkYyBpbiAjKAo+ID4gLSAgbm8pIDoK
PiA+IC0gICAgYWNfY3ZfcHJvZ19jY19jOTk9bm87IGFjX2N2X3Byb2dfY2NfYzg5PW5vIDs7ICMo
Cj4gPiAtICAqKSA6Cj4gPiAtICAgIHsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xpbmVuby0kTElO
RU5PfTogY2hlY2tpbmcgZm9yICRDQyBvcHRpb24gdG8gYWNjZXB0IElTTyBDOTkiID4mNQo+ID4g
LSRhc19lY2hvX24gImNoZWNraW5nIGZvciAkQ0Mgb3B0aW9uIHRvIGFjY2VwdCBJU08gQzk5Li4u
ICIgPiY2OyB9Cj4gPiAtaWYgJHthY19jdl9wcm9nX2NjX2M5OSs6fSBmYWxzZTsgdGhlbiA6Cj4g
PiAtICAkYXNfZWNob19uICIoY2FjaGVkKSAiID4mNgo+ID4gLWVsc2UKPiA+IC0gIGFjX2N2X3By
b2dfY2NfYzk5PW5vCj4gPiAtYWNfc2F2ZV9DQz0kQ0MKPiA+IFsuLi5dCj4gPgo+ID4KPiA+IFRo
ZSB3aG9sZSBjOTkgY2hlY2sgdmFuaXNoZWQuLi4uLCBhbmQ6Cj4gPgo+ID4gICAgICAgICAkIGRp
ZmYgLXUgbGlnaHR0cGQtMS40LjU5L2NvbmZpZ3VyZS5hYyBsaWdodHRwZC0xLjQuNjEvY29uZmln
dXJlLmFjCj4gPiBbLi4uXQo+ID4gQEAgLTYxLDcgKzYxLDYgQEAKPiA+Cj4gPiAgZG5sIENoZWNr
cyBmb3IgcHJvZ3JhbXMuCj4gPiAgQUNfUFJPR19DQwo+ID4gLUFDX1BST0dfQ0NfU1REQwo+ID4g
IEFYX1BST0dfQ0NfRk9SX0JVSUxECj4gPiAgTFRfUEFUSF9MRAo+ID4gIEFDX1BST0dfSU5TVEFM
TAo+ID4KPiA+Cj4gPiBCdXQgdGhlcmUgaXMgYWx0aG91Z2ggc3VwcG9ydCBmb3IgdGhlIG1lc29u
IGJ1aWxkIHN5c3RlbSBpbiB0aGUgc291cmNlcy4uLiwKPiA+IG1heWJlIHRpbWUgdG8gY2hhbmdl
IHRvIGl0PyAgCj4gSSBkb24ndCBrbm93IGlmIHRoaXMgaXMgYSBnb29kIGlkZWEgdG8gY2hhbmdl
IGl0IGJlZm9yZSB0aGUgMjAyMS4xMQo+IHJlbGVhc2UgYXMgbWVzb24gd2lsbCBwcm9iYWJseSBy
YWlzZSBpdHMgb3duIGJ1aWxkIGZhaWx1cmVzLgoKR29vZCBwb2ludCBmb3IgdGhlIGF1dG9yZWNv
bmYgc29sdXRpb24gKGFuZCBtZXNvbiBmb3IgbmV4dCA7LSkpLi4uCgpSZWdhcmRzLApQZXRlcgoK
PiA+Cj4gPiBSZWdhcmRzLAo+ID4gUGV0ZXIKPiA+ICAKPiA+ID4gIAo+ID4gPiA+Cj4gPiA+ID4g
UmVnYXJkcywKPiA+ID4gPiBQZXRlcgo+ID4gPiA+ICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBGaXhl
czoKPiA+ID4gPiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzAz
NDlkOGZlZDM1YjA3NjY3OTZkZDliYTNiOGRlNmZmOGJkNjhmZTcKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIHBhY2thZ2UvbGlnaHR0cGQvbGlnaHR0cGQu
bWsgfCAyICsrCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4g
PiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpZ2h0dHBkL2xpZ2h0dHBkLm1r
IGIvcGFja2FnZS9saWdodHRwZC9saWdodHRwZC5tawo+ID4gPiA+ID4gaW5kZXggOWMxOGE2MDM4
ZS4uYzM5YTVkYjIwZiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL3BhY2thZ2UvbGlnaHR0cGQvbGln
aHR0cGQubWsKPiA+ID4gPiA+ICsrKyBiL3BhY2thZ2UvbGlnaHR0cGQvbGlnaHR0cGQubWsKPiA+
ID4gPiA+IEBAIC0xMiw2ICsxMiw4IEBAIExJR0hUVFBEX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UK
PiA+ID4gPiA+ICBMSUdIVFRQRF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ID4gPiA+ID4gIExJ
R0hUVFBEX0NQRV9JRF9WRU5ET1IgPSBsaWdodHRwZAo+ID4gPiA+ID4gIExJR0hUVFBEX0RFUEVO
REVOQ0lFUyA9IGhvc3QtcGtnY29uZgo+ID4gPiA+ID4gKyMgSXNzdWUgaW4gY29uZmlndXJlIHNj
cmlwdCBwcm92aWRlZCBpbiB0YXJiYWxsCj4gPiA+ID4gPiArTElHSFRUUERfQVVUT1JFQ09ORiA9
IFlFUwo+ID4gPiA+ID4gIExJR0hUVFBEX0NPTkZfT1BUUyA9IFwKPiA+ID4gPiA+ICAgICAgIC0t
d2l0aG91dC13b2xmc3NsIFwKPiA+ID4gPiA+ICAgICAgIC0tbGliZGlyPS91c3IvbGliL2xpZ2h0
dHBkIFwgIAo+ID4gPiA+ICAKPiA+ID4gQmVzdCBSZWdhcmRzLAo+ID4gPgo+ID4gPiBGYWJyaWNl
ICAKPiA+ICAKPiBCZXN0IFJlZ2FyZHMsCj4gCj4gRmFicmljZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
