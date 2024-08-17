Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485F2C52D7D
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 12:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B971840168;
	Sat, 17 Aug 2024 12:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqhr_0SSkD5a; Sat, 17 Aug 2024 12:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 459AA4023A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 459AA4023A;
	Sat, 17 Aug 2024 12:48:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 310FC1BF356
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 12:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EDB44023A
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 12:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a74NYEVJPurx for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 12:48:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5888B40168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5888B40168
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5888B40168
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 12:48:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73134240002;
 Sat, 17 Aug 2024 12:48:01 +0000 (UTC)
Date: Sat, 17 Aug 2024 14:48:00 +0200
To: =?UTF-8?B?UmFwaGHDq2w=?= Gallais-Pou <rgallaispou@gmail.com>
Message-ID: <20240817144800.5a2a813b@windsurf>
In-Reply-To: <b9b52c88-a352-4ff2-856e-430cb65185ed@gmail.com>
References: <20240814-master-v1-0-7834f3deddcb@gmail.com>
 <20240814-master-v1-2-7834f3deddcb@gmail.com>
 <20240815105603.1a752184@windsurf>
 <b9b52c88-a352-4ff2-856e-430cb65185ed@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723898881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5TV2iJVEUP0eBK3qHkjw39eiUP2J2ixGYY+KkbYBJeg=;
 b=Xob/ip7SXlAsUfFlyyAtgRjWWbWAoVkZxk8rhyLR1IW7d8UB7jyyjoa6WVNklIOhCP6p/7
 FwQ57aTjmikw0xaMKRu25KbZOlhlQmD28VMY/0ofuyX1TqXmn7Kh4RQLCAvLsfEirJllui
 94+W22HoLNG+48xKSzFKBXBf0p/QwnhEvhGM5JaE0STZrEj5UkJ0MBTN7/dF+6+NRkrPop
 WqSF6981G1SLgZsf8xDZoyNjM+xtJ3ia5ufSfUJUfEhDCaIe4j5dwLv9esMNjEQc1tYiFY
 /XClrDhSTQk6cuGH4CCRaCa+6UyaRUvE5eCOohoh7FBaQJHMeckPa8aol1zCSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xob/ip7S
Subject: Re: [Buildroot] [PATCH RESEND 2/2] configs/stm32mp135f-dk: new
 defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGFlbCwKCk9uIFNhdCwgMTcgQXVnIDIwMjQgMTI6NTU6NDcgKzAyMDAKUmFwaGHD
q2wgR2FsbGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4gd3JvdGU6Cgo+ID4gVGhhbmtz
IGZvciB0aGUgcmVzZW5kLCBidXQgdGhlcmUgd2FzIG5vIG5lZWQgdG8gcmVzZW5kOiB5b3VyIHBy
ZXZpb3VzCj4gPiBwYXRjaCB3YXMgc3RpbGwgaW4gb3VyIHF1ZXVlIG9mIHBhdGNoZXMgdG8gcmV2
aWV3L21lcmdlLiBJIGhhdmUgYQo+ID4gbnVtYmVyIG9mIGNvbW1lbnRzIGJlbG93LiAgCj4gCj4g
U29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlLiBJIGhhZCBubyBuZXdzIG9mIHRoZSBwYXRjaHNl
dCB3aGljaCBsZWQgbWUgCj4gdG8gcmVzZW5kIGl0LiBUaGFua3MgZm9yIHRha2luZyB0aGUgdGlt
ZSB0byByZXZpZXcgdGhpcyBvbmUgYW5kIG1lcmdlIAo+IHRoZSBwcmV2aWV3LgoKUGF0Y2hlcyBh
cmUgbmV2ZXIgZm9yZ290dGVuOiB0aGV5IGFyZSB0cmFja2VkIHVuZGVyIHBhdGNod29yayBhcyBz
b29uCmFzIHRoZXkgYXJlIHBvc3RlZCBvbiB0aGUgbWFpbGluZyBsaXN0LiBJZiB5b3UgaGF2ZSBu
byBuZXdzLCB5b3UgY2FuCnBpbmcgb24gdGhlIHBhdGNoIHNlcmllcyBpZiB5b3Ugd2FudCwgYnV0
IHJlc2VuZGluZyB3aXRob3V0IGFueSBjaGFuZ2VzCmlzbid0IHZlcnkgdXNlZnVsLgoKPiA+IEZp
cnN0IG9mIGFsbCwgeW91IG5lZWQgdG8gZW5hYmxlIEJSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19I
QVNIRVM9eSwKPiA+IHdoaWNoIHJlcXVpcmVzIGFkZGluZzoKPiA+IAo+ID4gQlIyX0dMT0JBTF9Q
QVRDSF9ESVI9ImJvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMm1wMTM1Zi1kay9wYXRjaGVz
LyIKPiA+IAo+ID4gYW5kIHRoZW4gcnVuIC4vdXRpbHMvYWRkLWN1c3RvbS1oYXNoZXMsIHdoaWNo
IHdpbGwgYXV0b21hdGljYWxseQo+ID4gcG9wdWxhdGUgdGhpcyBmb2xkZXIuICAKPiAKPiBGb3Ig
dGhpcyBvbmUgSSB0aGluayB0aGF0IGl0IHdpbGwgYmUgYmV0dGVyIHRvIHNldCB0aGUgZGlyZWN0
b3J5IGFzIHRoZSAKPiBzYW1lIG9mIHRoZSBjb21tb24gZGlyZWN0b3J5LCBlZy4gCj4gImJvYXJk
L3N0bWljcm9lbGVjdHJvbmljcy9jb21tb24vc3RtMzJtcDF4eC9wYXRjaGVzLyIuIFNvIHRoYXQg
dGhlIAo+IHZlcnNpb25zIGJldHdlZW4gVEYtQS9VLUJvb3QsIHRoZSBMaW51eCBrZXJuZWwgYXMg
d2VsbCBhcyBPUC1URUUsIGlmIGl0IAo+IGlzIGFjdGl2YXRlZCBpbiB0aGUgZnV0dXJlIGZvciB0
aGUgb3RoZXIgcGxhdGZvcm1zLCB3aWxsIGJlIHN5bmNlZCAKPiBiZXR3ZWVuIGFsbCBzdG0zMm1w
MSogcGxhdGZvcm1zLgoKQnV0IHRoZW4gaXQgbWVhbnMgdGhhdCBhbGwgdGhlIHN0bTMybXAxIGRl
ZmNvbmZpZ3MgbXVzdCBiZSB1cGRhdGVkIGluCnN5bmMgd2hlbmV2ZXIgTGludXgsIFUtQm9vdCwg
VEYtQSBvciBPUC1URUUgYXJlIGJ1bXBlZC4KCgo+ID4gSSBzZWUgb24gU1RNMzJNUDE1Nywgd2Un
cmUgdXNpbmcgc29tZSBjdXN0b20ga2VybmVsIGNvbmZpZ3VyYXRpb24KPiA+IGZpbGVzLCB3aXRo
IHByZXN1bWFibHkgYSBtb3JlICJvcHRpbWl6ZWQiIGNvbmZpZ3VyYXRpb24gdGhhbiBtdWx0aV92
Ny4KPiA+IFNob3VsZCB3ZSBkbyB0aGUgc2FtZSBoZXJlPyAgCj4gCj4gRWZmZWN0aXZlbHkgdGhp
cyByZWR1Y2VzIHRoZSBvdmVyYWxsIGtlcm5lbCBzaXplLiBNeSB0aG91Z2h0IG9uIHRoaXMgCj4g
d291bGQgYmUgdG8gc2V0IHRoZSBnZW5lcmFsIG11bHRpX3Y3IGtlcm5lbCBkZWZjb25maWcgb24g
dGhlIGluaXRpYWwgCj4gc3RtMzJtcDEzIHN1cHBvcnQsIGFuZCBmaW5lIHR1bmUgYWZ0ZXIuIEJl
Y2F1c2UgdGhlcmUgaXMgbWFueSBoYXJkd2FyZSAKPiBkaWZmZXJlbmNlcyBiZXR3ZWVuIHN0bTMy
bXAxNSBhbmQgc3RtMzJtcDEzIHBsYXRmb3JtcyAoZm9yIGV4YW1wbGUgdGhlcmUgCj4gaXMgbm8g
YXVkaW8gamFjayBpbiBteSBrbm93bGVkZ2UpLCBJIGZlZWwgbGlrZSB0aGlzIHdvdWxkIHRha2Ug
cXVpdGUgCj4gc29tZSB0aW1lIGZvciBtZSB0byBzb3J0IGV2ZXJ5IGRyaXZlcnMuCj4gCj4gV2hh
dCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBwcm9jZXNzID8KCldoeSBub3QsIGJ1dCBzaW5jZSB3
ZSdsbCBoYXZlIGEgc2luZ2xlIGNvbW1vbiBrZXJuZWwgY29uZmlnIGZvciBhbGwsCnRoaXMgc3Rv
cnkgb2YgIm5vdCBoYXZpbmcgYXVkaW8gamFjayBvbiBTVE0zMk1QMTMiIGlzIG5vdCB2ZXJ5CnJl
bGV2YW50LiBJLmUsIHdoYXQgbm90IGp1c3QgdXNlIHRoZSBleGlzdGluZyBrZXJuZWwgY29uZmln
dXJhdGlvbiB1c2VkCmZvciBNUDE1IGFsc28gZm9yIE1QMTMsIGFuZCBqdXN0IGFkZCB3aGF0J3Mg
bWlzc2luZyBpbiB0aGlzIGNvbW1vbgpjb25maWd1cmF0aW9uPyBXZSdyZSBhbHNvIG5vdCB0cnlp
bmcgdG8gbWFrZSB0aGUgc3VwZXIgc3VwZXIgb3B0aW1pemVkCmtlcm5lbCBjb25maWd1cmF0aW9u
IHdpdGggb25seSBzdHJpY3RseSB3aGF0J3MgbmVlZGVkLiBCdXQgbXVsdGlfdjcgaXMKbWFzc2l2
ZWx5IGJsb2F0ZWQuCgo+ID4gUGxlYXNlIHVzZSB0aGUgImN1c3RvbSIgdmVyc2lvbiBtZWNoYW5p
c20gdG8gc3BlY2lmeSB0aGUgZXhhY3QgdmVyc2lvbgo+ID4gb2YgT1AtVEVFIHRvIGJlIHVzZWQs
IGxpa2UgeW91IGRpZCBmb3IgVEYtQSwgTGludXggYW5kIFUtQm9vdC4gIAo+IAo+IEFjaywgZm9y
Z290IGFib3V0IHRoYXQgb25lLiBJIHNhdyB0aGF0IHRoZXJlIHdhcyBubyAiY3VzdG9tIHZlcnNp
b24iIAo+IG9wdGlvbiwgbGlrZSB0aGVyZSBpcyBmb3IgVS1Cb290IGFuZCB0aGUgS2VybmVsLiBB
bmQgZ3JlcGluZyB0aHJvdWdoIHRoZSAKPiBvdGhlciBkZWZjb25maWcgdGhlcmUgaXMgbm8gaGFy
ZGNvZGVkIHZlcnNpb25zLiBNYXliZSB0aGlzIGNhbiBiZSBhIGlkZWEgCj4gZm9yIHRoZSBmdXR1
cmUuIEZvciBub3cgSSB3aWxsIHNldCBhIGN1c3RvbSB0YXJiYWxsIHBvaW50aW5nIHRvIHRoZSAK
PiBvZmZpY2lhbCA0LjMuMCB0YXJiYWxsLiBXb3VsZCB0aGlzIGJlIG9rYXkgPwo+IAo+IGNmLiBo
dHRwczovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVlX29zL2FyY2hpdmUvcmVmcy90YWdzLzQuMy4w
LnRhci5negoKV2VsbCwgdGhlcmUgaXMgZGVmaW5pdGVseSBhIGN1c3RvbSB2ZXJzaW9uIGZvciBP
UC1URUUsIGxpa2UgdGhlcmUgaXMKZm9yIExpbnV4IGFuZCBVLUJvb3Q6CgpjaG9pY2UKICAgICAg
ICBwcm9tcHQgIk9QLVRFRSBPUyB2ZXJzaW9uIgogICAgICAgIGRlZmF1bHQgQlIyX1RBUkdFVF9P
UFRFRV9PU19MQVRFU1QgaWYgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19BUkNIX1NVUFBPUlRTCiAg
ICAgICAgaGVscAogICAgICAgICAgU2VsZWN0IHRoZSB2ZXJzaW9uIG9mIE9QLVRFRSBPUyB5b3Ug
d2FudCB0byB1c2UKCmNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX0xBVEVTVAogICAgICAgIGJv
b2wgIjQuMy4wIgogICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19BUkNI
X1NVUFBPUlRTCiAgICAgICAgc2VsZWN0IEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9O
X0NSWVBUT0dSQVBIWQogICAgICAgIGhlbHAKICAgICAgICAgIFVzZSB0aGUgbGF0ZXN0IHJlbGVh
c2UgdGFnIGZyb20gdGhlIE9QLVRFRSBPUyBvZmZpY2lhbCBHaXQKICAgICAgICAgIHJlcG9zaXRv
cnkuCgpjb25maWcgQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fVEFSQkFMTAogICAgICAgIGJv
b2wgIkN1c3RvbSB0YXJiYWxsIgogICAgICAgIGhlbHAKICAgICAgICAgIFRoaXMgb3B0aW9uIGFs
bG93cyB0byBzcGVjaWZ5IGEgVVJMIHBvaW50aW5nIHRvIGFuIE9QLVRFRSBPUwogICAgICAgICAg
c291cmNlIHRhcmJhbGwuIFRoaXMgVVJMIGNhbiB1c2UgYW55IHByb3RvY29sIHJlY29nbml6ZWQg
YnkKICAgICAgICAgIEJ1aWxkcm9vdCwgbGlrZSBodHRwOi8vLCBmdHA6Ly8sIGZpbGU6Ly8gb3Ig
c2NwOi8vLgoKICAgICAgICAgIFdoZW4gcG9pbnRpbmcgdG8gYSBsb2NhbCB0YXJiYWxsIHVzaW5n
IGZpbGU6Ly8sIHlvdSBtYXkgd2FudAogICAgICAgICAgdG8gdXNlIGEgbWFrZSB2YXJpYWJsZSBs
aWtlICQoVE9QRElSKSB0byByZWZlcmVuY2UgdGhlIHJvb3Qgb2YKICAgICAgICAgIHRoZSBCdWls
ZHJvb3QgdHJlZS4KCmNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9HSVQKICAgICAg
ICBib29sICJDdXN0b20gR2l0IHJlcG9zaXRvcnkiCiAgICAgICAgaGVscAogICAgICAgICAgVXNl
IGEgY3VzdG9tIHZlcnNpb24gZmV0Y2hlZCBmcm9tIGEgR2l0IHJlcG9zaXRvcnkuCgplbmRjaG9p
Y2UKClNvIGRvIHRoZSBzYW1lIGFzIHdoYXQgeW91IGRvIGZvciBMaW51eCBhbmQgVS1Cb290IDot
KQoKPiA+IFBsZWFzZSBkcm9wLCB3ZSBkb24ndCBlbmFibGUgYm1hcC10b29scyBpbiBvdXIgZGVm
Y29uZmlncywgd2UgbGVhdmUKPiA+IHRoYXQgY2hvaWNlIHVwIHRvIHRoZSB1c2VyLiAgCj4gCj4g
QWNrLiBNaW5kIHRoYXQgSSB3aWxsIGxlYXZlIHRoZSBCUjJfUEFDS0FHRV9IT1NUX0dFTklNQUdF
PXkgb3B0aW9uIHNpbmNlIAo+IGl0IGlzIG1hbmRhdG9yeSBmb3IgYnVpbGRpbmcgdGhlIGltYWdl
LgoKQWJzb2x1dGVseSEKClRoYW5rcyBhIGxvdCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
