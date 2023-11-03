Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBE6C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 21:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F217822E1;
	Fri,  3 Nov 2023 21:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F217822E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gl9N4fXj3POq; Fri,  3 Nov 2023 21:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AE1682327;
	Fri,  3 Nov 2023 21:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AE1682327
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41B491BF616
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 21:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2617040134
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 21:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2617040134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNcv6tFkyXZn for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 21:22:02 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9972640015
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 21:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9972640015
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:207e:5629:5034:6d7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4AB54B00571;
 Fri,  3 Nov 2023 22:21:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 03 Nov 2023 22:21:51 +0100
Date: Fri, 3 Nov 2023 22:21:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231103212151.GA2875@scaer>
References: <20231031120713.678783-1-giulio.benetti@benettiengineering.com>
 <20231101152114.GE114892@scaer>
 <26fabf07-fc17-421b-9cbb-fb721bf63374@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26fabf07-fc17-421b-9cbb-fb721bf63374@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699046517;
 bh=g1Daz3Dx9fn9RkINGEQ1nJAv2Kf+U72DOvb1GkoMBXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q1wtHZBcGhM5bcVESGCBS8Hn2sntL8ANPXbMKen61WbBX8kwidDJRUBnAMkCh5/af
 K9+ERsB5cMNH3o/aS3WY0BuoOc7nReNNNLHLjUgVgGErZL/OKPPwAE+mFI2+7wIB/o
 JyGW116esU515C3XkRiPAhC8OUnPqMQ6VBP5JfCKVx10QWRFObpQY03XCSh+YWzISc
 pC5b/QU00CasvgoT4ZlUgCD8Yy5Yi3jxvsTG4jN7bqhakRHUojp4LLs2yIMnKHILW9
 rWmY/MctMgJHV2MoSojOKQScYT7jRnmQRBGgsBuDN2t9dmakGF7d1w9+gPAtNSSatK
 X7LmT4sFylqrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q1wtHZBc
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: remove .node
 files with different architecture
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
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2l1bGlvLCBBbGwsCgpPbiAyMDIzLTExLTAzIDAwOjE2ICswMTAwLCBHaXVsaW8gQmVuZXR0aSBz
cGFrZSB0aHVzbHk6Cj4gT24gMDEvMTEvMjMgMTY6MjEsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4g
Pk9uIDIwMjMtMTAtMzEgMTM6MDcgKzAxMDAsIEdpdWxpbyBCZW5ldHRpIHNwYWtlIHRodXNseToK
Wy0tU05JUC0tXQo+ID5UaGVyZSdzIGFsc28gYmluZGluZy5neXAgdGhhdCBsb29rcyBsaWtlIGl0
IGxpc3RzIHdoYXQgdG8gYnVpbGQgdW5kZXIKPiA+d2hpY2ggY29uZGl0aW9uLgo+IHllcywgLmd5
cCBmaWxlIGlzIGFub3RoZXIgYnVpbGQgc3lzdGVtLCBzYW1lIE1vemlsbGEgYWRvcHRlZCBmb3Ig
TlNTKG1heWJlCj4gc29tZXRoaW5nIGVsc2UpOgo+IGh0dHBzOi8vZ3lwLmdzcmMuaW8vaW5kZXgu
bWQKPiBCdXQgTm9kZUpTIHNlZW1zIHRvIGRlYWwgd2l0aCBpdCB3aXRob3V0IHRoZSBuZWVkIHRv
IGFkZCBhIGd5cCBpbmZyYS4KPiA+SW4gd2hpY2ggY2FzZSwgaG93IGRvZXMgbnBtIGRlY2lkZSB0
aGF0IGl0IGNhbiB1c2Ugb25lIHN1Y2ggcHJlYnVpbGQsIG9yCj4gPndoZXRoZXIgaXQgc2hvdWxk
IGNvbXBpbGUgZnJvbSB0aGUgc291cmNlIGZpbGVzPyBDYW4gd2UgZm9yY2UgaXQgdG8KPiA+bmV2
ZXIgdXNlIHByZWJ1aWxkcyBhbmQgYWx3YXlzIGNvbXBpbGU/Cj4gSSdtIHdvcmtpbmcgb24gdGhp
cyBhZnRlciB5b3VyIHJldmlldywKCkdyZWF0IQoKSWYgd2UgY2FuIG1ha2Ugd2l0aG91dCB0aGUg
cHJlYnVpbGQgc3R1ZmY6IGlzIHRoZSAicHJlYnVpbGRzIiBkaXJlY3RvcnkKbmFtZSBhIG5vcm0s
IGFuZCBpZiBzbywgY2FuIHdlIGZvcmNpYmx5IHJlbW92ZSB0aGVtIGluIG9uZSBmZWxsIHN3b29w
PwoKPiA+U28geWVzLCBucG0gaXMgc3VjaCBhIG1lc3MgdGhhdCBtYXliZSBzd2VlcGluZyB0aGUg
ZHVzdCB1bmRlciB0aGUgcnVnIGlzCj4gPnRoZSBvbmx5IHNvbHV0aW9uIHdlIGNhbiBpbXBsZW1l
bnQsIGJ1dCBpdCBpcyBkaXNhcHBvaW50aW5nLi4uCj4gSSB0aGluayBpdCdzIG5vdCB0aGUgd2F5
IHRvIGdvIGJlY2F1c2Ugb2YgbGliYywgdGhhdCBjaGFuZ2VzIGV2ZXJ5dGhpbmcsCgpXZWxsLCBJ
IHdvdWxkIGFzc3VtZSB0aGF0IG5wbSBoYXMgIm1hZ2ljIiB0byBjaG9vc2UgdGhlIHByb3BlciBw
cmVidWlsdC4KT3RoZXJ3aXNlLCBpdCB3b3VsZCBub3QgZXZlbiBoYXZlIHRoZSBsaWJjIGFzIGEg
Y3JpdGVyaWEgaW4gdGhlCnByZWJ1aWxkcyBuYW1lLgoKPiA+TWF5YmUgd2UgY2FuIGp1c3QgYWxz
byBleGNsdWRlIHRoZSBub2RlIG1vZHVsZXMgZnJvbSBjaGVjay1iaW4tYXJjaAo+ID5hbHRvZ2V0
aGVyIGFuZCBiZSBkb25lIHdpdGggaXQ6Cj4gPiAgICAgTk9ERUpTX1NSQ19CSU5fQVJDSF9FWENM
VURFID0gL3Vzci9saWIvbm9kZV9tb2R1bGVzLwo+IFRoaXMgXl5eIGRvZXNuJ3QgZml4IHRoZSBs
aWJjIHByb2JsZW0uIElmIHlvdSBubToKPiB0YXJnZXQvdXNyL2xpYi9ub2RlX21vZHVsZXMvc2Vy
aWFscG9ydC9iaW5kaW5ncy1jcHAvYnVpbGQvUmVsZWFzZS9iaW5kaW5ncy5ub2RlCj4geW91IHdp
bGwgc2VlIHRoYXQgTm9kZUpTIGFzc3VtZSBuYXRpdmUgY29kZSB0byBiZSBidWlsdCB3aXRoIGds
aWJjLCBzbwoKT2gsIEkgd2FzIGp1c3Qgd2Fsa2luZyB0aGUgIm5wbSBpcyBhIG1lc3MgYW55d2F5
LCBqdXN0IGlnbm9yZSBhbnl0aGluZwpmcm9tIGl0LCB3ZSBkb24ndCBjYXJlIiByb2FkLiBJZiB3
ZSB0YWtlIHRoaXMgc3RhbmNlLCB0aGVuCl9CSU5fQVJDSF9FWENMVURFIGlzIGEgdHJpdmlhbCB3
YXkgdG8gYXZvaWQgdGhlIGNoZWNrLWJpbi1hcmNoIGlzc3VlLgoKQW5kIEkgYW0gZmluZSBpZiB0
aGlzIGlzIHRoZSBvdXRjb21lIG9mIHlvdXIgaW52ZXN0aWdhdGlvbnMuCgo+IEkgcmVhbGx5IG5l
ZWQgdG8gZ28gd2l0aCBidWlsZGluZyBmcm9tIHNjcmF0Y2guIEFuZCB0aGlzIHdvcmtzIHVzaW5n
Ogo+IG5wbSByZWJ1aWxkIC4uLgo+IGJ1dCBJJ20gZGVhbGluZyB3aXRoIGluc3RhbGxhdGlvbiB0
aGF0IGlzIG5vdCBzbyBlYXN5Lgo+IE9uY2UgSSBoYXZlIGl0IGJ1aWxkaW5nIG5hdGl2ZWx5IHdp
dGggY29ycmVjdCBsaWJjIEkgd2lsbCBzZW5kIGEgcGF0Y2guCgpJZiB3ZSBjYW4gZ2V0IHNvbWV0
aGluZyB0aGF0IGlzICJyZWxhdGl2ZWx5IiBzaW1wbGUsIGVhc3ksICphbmQqCm1haW50ZW5hYmxl
LCB0aGVuIHRoYXQncyBPSy4gQnV0IGl0aGVyd2lzZSwgSSB3b3VsZCBzYXkgd2Ugc2hvdWxkIG5v
dApzcGVuZCBhbnkgdW5yZWFzb25hYmxlIGFtb3VudCBvZiB0aW1lIG9uIHRoZSB0b3BpYy4uLgoK
VGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcyBtZXNzLCBhbnl3YXkhIPCfkY0gOi0pCgpSZWdh
cmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
