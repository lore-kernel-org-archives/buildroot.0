Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A0AC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 02:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6668B41BF7;
	Tue,  6 Feb 2024 02:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6668B41BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WER0L6dBmUHs; Tue,  6 Feb 2024 02:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9144541BF8;
	Tue,  6 Feb 2024 02:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9144541BF8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7301BF281
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 02:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 6315B40584
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 02:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6315B40584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id AdLFO3SY9BAG for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 02:56:55 +0000 (UTC)
X-Greylist: delayed 932 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 Feb 2024 02:56:54 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63F87400CE
Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com
 [203.205.221.242])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 63F87400CE
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 02:56:54 +0000 (UTC)
Received: from smtpclient.apple ([36.101.134.205])
 by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
 id A48BF47F; Tue, 06 Feb 2024 10:41:08 +0800
X-QQ-mid: xmsmtpt1707187268tr0fz0cx3
Message-ID: <tencent_2D2306C0CCF8E74BD2B26673E6BFA9A49B05@qq.com>
X-QQ-XMAILINFO: NWgUotxFuZrxKXqBEA7xcCVLVTTclFx7u1rIRSr0T7c00eozsCMeRSTXoxRkgq
 kmKjW3aQB4b4H+muCd2u2AgHgbT7FR4yPGDVdqnp/FzkmC5WqxvpcOy4YKAlBSscGB3uUIYJ+6TG
 vJn93Qekl+ZiMcTozhfOEOvqcgEGrkilvX93k9G+/PZDJjCvhb1MimV6mQiYG6GA0mY0lva9OuGJ
 dWgV0XxNaPlNvF9U36vecbabrisS+p+wKjg8mEUvjpWFUrJhtiKyzrY6nonfPM9YfdIZQVYfVoLw
 HT/XQrgJc5dE6FXEIiz4QexPj1VqVyaXLUq/Bz3DFSKNjwDb2b+3jwyM7Al5FGflid8RshKmd3fF
 /NwSuO3h1W344TVmXBdLbaKhrEXkYTaok5WYx0YQvn/whPzq6EoB7F4qlWbDmGUiS5qEucmag6qG
 gsXnCW8oS+VNubuMgnJesI4Mw4ikOhTEfajDrVJDAlyB+kQpD5VghP8GZtYuULZYiiX91+Op97PE
 U3mjyRN1qrKwtv0oUitL5gtsRt3rC7AdsrUyVBMWGX+DzLFND+YBQAPTumMy4uamNTUrITPDNm3q
 AzBCdeLoXfKwM7cGXFnRAvLKUh8f4i7EU0Og4SB5qNOqS5GXjtlzI24NrRHYKVT0x0JnGgC6FrLD
 ZyQbLrUmcK9w2PSZ5gkIMehjWaJaEFwyN9gVGugX5cFQ7cshfl+BHsqLRivVikkbOZkvADrqGmzC
 hXytSpWQZoukfasmiDcIqZ3iilKfAUEsB/aoySrYY3BEF8y50/fxgnqDXiaXvdd4eUrrjwnQXSIn
 k4KqSFPT2B8+N368T0noFe6qSYTk0Mbj2g0acCqEDqmTVQ193B7pnKsFDgpU6Qrjjr/Z+4N7gUFy
 Pm/caknfuNLcWhUogBUZj+niqkx15IlXYtBjENKu5Rt7/WtAUKwbMoiCBeTlv6Zy/HMULm0UM2Yq
 XvHInqPg0kdoTL1t96XA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
In-Reply-To: <d2a79053-ad5c-4596-9e03-8abc1811eacb@benettiengineering.com>
Date: Tue, 6 Feb 2024 10:40:58 +0800
X-OQ-MSGID: <EEEBF0FD-3E77-4BE8-BFBB-C5B26EE024F4@qq.com>
References: <tencent_267933F59FABC482631A00CC38E64BD83205@qq.com>
 <d2a79053-ad5c-4596-9e03-8abc1811eacb@benettiengineering.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1707188209; bh=/XGKM+ydX/08sXbJ43VEXFkW2N4W9uG0k3t8J9NG+wo=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=jzqj3tnpcH271LBdnkXudzviQo2AOE7337Vw13HDWi8i2akKobetKzs8YUhJMQyuR
 SycWTNegWilA+PFOsK85dGxF2rXNzslxnQZugaxk7t2C/Hrgg/M5OUkSaMbwohJzIO
 df08fKsT6Pn7J7WgQ88LjfX+vrcw/sAKQcK50YA4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=jzqj3tnp
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/milkv_duo: new defconfig
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
From: hanyuan via buildroot <buildroot@buildroot.org>
Reply-To: hanyuan <hanyuan-z@qq.com>
Cc: Emil S <emil.soltys@outlook.com>, GP Orcullo <kinsamanka@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2l1bGlvLAoKVGhhbmtzISBJdOKAmXMgbmljZSB0byBnZXQgeW91ciByZXZpZXdzLiBM
ZXQgbWUgZXhwbGFpbiBzb21lIG9mIHRoZW0uCgo+IDIwMjTlubQy5pyINuaXpSAwMToyNe+8jEdp
dWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiDlhpnp
gZPvvJoKPiAKPiBIaSBIYW55dWFuLAo+IAo+IHRoYW5rIGZvciBjb250cmlidXRpbmcsCj4gb25l
IGltcG9ydGFudCBub3RlIGlzIHRvIHN3YXAgUGF0Y2ggMS8yIGFuZCAyLzIuIFRoaXMgaXMgYmVj
YXVzZSB0aGV5Cj4gYXJlIGJpc2VjdGFibGUgdGhpcyB3YXkgc2luY2Ugb24gUGF0Y2ggMS8yIHlv
dSBlbmFibGUgcGFja2FnZXMgYXBwZWFyaW5nCj4gaW4gUGF0Y2ggMi8yLCBhbHNvLAoKR290IGl0
LiBTaG91bGQgSSBsYXRlciBzZW50IHRoZSBQYXRjaCBWMyBhbmQgbWFrZSB0aGVtIGxvb2sgbGlr
ZToKClt2MywxLzJdIHBhY2thZ2UvbWlsa3YtZHVvOiBhZGQgcGFja2FnZXMgZm9yIG1pbGt2LWR1
bwpbdjMsMi8yXSBjb25maWdzL21pbGt2X2R1bzogbmV3IGRlZmNvbmZpZwoKPiBjYW4geW91IHBs
ZWFzZSBwcm92aWRlIHRoZSBib2FyZCBwcm9kdWN0IHdlYnBhZ2UgVVJMIGhlcmU/Cj4gQW5kIGFs
c28gc29tZSBJT04gaW5kaWNhdGlvbnMgdG9vPwoKR290IGl0LiBJIHdvdWxkIGFwcGVuZCBtb3Jl
IGluZm8gdG8gdGhlIHJlYWRtZS50eHQgYWJvdXQgd2hhdCB0aGUgSU9OIG1lYW5zLgoKPiBBbGwg
dGhpcyBpZiBzdGF0ZW1lbnQgaXMgcmVkdW5kYW50IHdpdGggdGhlIGVsc2UgcGFydC4KPiBDYW4g
eW91IGFkZCBhIHZhcmlhYmxlIGxpa2U6Cj4gRklQVE9PTF9BUkdVTUVOVFMgPSBnZW5maXAgJHtC
SU5BUklFU19ESVJ9L2ZpcC5iaW4gXAo+IAktLU1PTklUT1JfUlVOQUREUj0weDgwMDAwMDAwIFwK
PiAJLS1DSElQX0NPTkY9JHtCSU5BUklFU19ESVJ9L2NoaXBfY29uZi5iaW4gXAo+IC0tTk9SX0lO
Rk89RkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZG
RkZGRkZGRkZGRkZGRkZGRkZGIFwKPiAJLS1OQU5EX0lORk89MDAwMDAwMDAgXAo+IAktLUJMMj0k
e0JJTkFSSUVTX0RJUn0vYmwyLmJpbiBcCj4gCS0tQkxDUF9JTUdfUlVOQUREUj0weDA1MjAwMjAw
IFwKPiAJLS1CTENQX1BBUkFNX0xPQURBRERSPTAgXAo+IAktLUREUl9QQVJBTT0ke0JJTkFSSUVT
X0RJUn0vZGRyX3BhcmFtLmJpbiBcCj4gCS0tTU9OSVRPUj0ke0JJTkFSSUVTX0RJUn0vZndfZHlu
YW1pYy5iaW4gXAo+IAktLUxPQURFUl8yTkQ9JHtCSU5BUklFU19ESVJ9L3UtYm9vdC5iaW4gXAo+
IAo+IGFuZCB0aGVuIHlvdSBhZGQgb3Igbm90IHRoZSByZW1haW5pbmcgQkxDUCogdmFyaWFibGVz
IGJlbG93IGFuZCBleGVjdXRlCj4gJHtCSU5BUklFU19ESVJ9L2ZpcHRvb2wucHkgJHtGSVBUT09M
X0FSR1VNRU5UU30KPiBUaGVuIHRoaXMgbmVzdGVkIGlmIHN0YXRlbWVudCBhbmQuLgo+IC4udGhp
cyBhcmUgcmVkdW5kYW50IHRvby4gQ2FuIHlvdSBwcm92aWRlIGEgc2luZ2xlIGlmLWVsc2UtZmkg
c3RhdGVtZW50Cj4gb3V0c2lkZSB0aGUgbWFpbiBpZiBzdGF0ZW1lbnQuLi4KPiAuLi4gaGVyZT8K
PiAKClNvcnJ5IGZvciB0aGF0LiBPSywgSSB3b3VsZCBtYWtlIHRoZXNlIGxpbmVzIGxvb2sgYmV0
dGVyLgoKPiBJcyBDWFggbmVlZGVkIGJ5IGFueSBwYWNrYWdlIHNlbGVjdGVkIGhlcmU/CgpBdCB0
aGF0IHRpbWUgSSBzdWJtaXR0ZWQgdGhlIHBhdGNoIEkgaGF2ZW7igJl0IHVuZGVyc3RhbmQgdGhl
IGJ1aWxkcm9vdOKAmXMgbWluaW1hbApwaGlsb3NvcGh5IHRvbyBtdWNoLiBTb3JyeSBmb3IgdGhh
dC4gSSB3b3VsZCByZW1vdmUgdGhpcyBsaW5lLgoKPiBoZXJlIHlvdSBuZWVkOgo+IEJSMl9MSU5V
WF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiBoZXJlIHlvdSBuZWVkOgo+IEJSMl9MSU5V
WF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKCk9LLiBJIHdpbGwgYWRkIHRoZW0uCgo+IEZv
ciB0aGUgcmVzdCB0aGUgcGF0Y2ggbG9va3MgZ29vZCBhbmQgYnVpbGRzIGZpbmUgdXNpbmcgdXRp
bHMvZG9ja2VyLXJ1biBleGNlcHQgcGFja2FnZSBodG9wIHRoYXQgZmFpbHMgdG8gYnVpbGQgZHVl
IHRvIGdjYyBJQ0UgMTA5ODA5IGZvciB3aGljaAo+IEkndmUgc2VudCBhIHBhdGNoOgo+IGh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTM5
MzY2Nwo+IAo+IFNvIHRoaXMgcGF0Y2hzZXQgZGVwZW5kcyBvbiBwYXRjaHNldCBhYm92ZSBmb3Ig
aHRvcCBnY2MgSUNFLgoKSSB0aGluayBJIHNob3VsZCB0ZWxsIHlvdSB0aGlzLiBJbiBmYWN0IEkg
ZW5jb3VudGVyZWQgYW5vdGhlciBnY2MgYnVnCndoZW4gdXNpbmcgYWxsIHRoZSB0LWhlYWTigJlz
IG9wdGltaXphdGlvbnMgd2l0aCB0aGUgZ2xpYmMuIFRoZSBnY2MgcmVwb3J0ZWQKaW50ZXJuYWwg
ZXJyb3JzIHdoZW4gd2UgCgorQlIyX1RBUkdFVF9PUFRJTUlaQVRJT049Ii1tYXJjaD1ydjY0aW1h
ZmRjX3h0aGVhZGJhX3h0aGVhZGJiX3h0aGVhZGJzX3h0aGVhZGNtb194dGhlYWRjb25kbW92X3h0
aGVhZGZtZW1pZHhfeHRoZWFkZm12X3h0aGVhZGludF94dGhlYWRtYWNfeHRoZWFkbWVtaWR4X3h0
aGVhZG1lbXBhaXJfeHRoZWFkc3luYyIKClNvIHdlIGhhdmUgdG8gdXNlIG11c2wgYW5kIGZpbmQg
dGhpcyBidWcgaXMgbm90IHJlcG9ydGVkIGFueW1vcmUuCk1heWJlIHRoZSBodG9wIGNvbXBpbGlu
ZyBidWcgY29tZXMgZnJvbSB0aGVzZSBvcHRpbWl6YXRpb25zLgpJIHdvdWxkIGhhdmUgYSB0cnkg
d2hhdCB3b3VsZCBoYXBwZW4gaWYgd2UgZGlzYWJsZSBhbGwgdGhlIHQtaGVhZApmZWF0dXJlcyBh
bmQgdGhlbiBjb21waWxlIHRoZSBodG9wLiBJZiBpdCBpcyByZWFsbHkgdGhlIHQtaGVhZOKAmXMg
cHJvYmxlbSwKbWF5YmUgd2UgY2FuIGxldCB0aGUgdC1oZWFk4oCZcyBvcHRpbWl6YXRpb25zIGdv
LgoKVGhhbmtzIGFnYWluIGZvciB5b3VyIGNhcmVmdWwgcmV2aWV3IQoKQmVzdCByZWdhcmRzLApI
YW55dWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
