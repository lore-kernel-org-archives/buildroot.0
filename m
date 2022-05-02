Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ACBC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 09:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3916403FB;
	Mon,  2 May 2022 09:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9lIiW4mb9fG; Mon,  2 May 2022 09:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 834A0402F2;
	Mon,  2 May 2022 09:51:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87F6B1BF280
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 09:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C626960BB1
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 09:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=freenet.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1JN6ANjMtH1 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 09:51:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout2.freenet.de (mout2.freenet.de [IPv6:2001:748:100:40::2:4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33B1660736
 for <buildroot@buildroot.org>; Mon,  2 May 2022 09:51:30 +0000 (UTC)
Received: from [195.4.92.119] (helo=sub0.freenet.de)
 by mout2.freenet.de with esmtpa (ID earthquake.de@freenet.de) (port 25) (Exim
 4.94.2 #2) id 1nlSiF-00B9cZ-45
 for buildroot@buildroot.org; Mon, 02 May 2022 11:51:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0PIqM5gQESeCDLSc+gkDFkMMuOjXvNfHoe/eoIIWaSo=; b=DMVI9lHA8eMe58MTB+KHNB/48H
 Clruwv+X+TMVX9t/I6KvFy1f5dzeIezRmW579+A0icjhi0SuZOvtHjeQvmfOVRgyBGv5ALlE/kgSC
 SpyzTkYa9whq5HA17m7+tdIlkI1lVKpPbXSKPrFGiKHV2lF7o9kpA91UmU9WUG5Wd+5v/Wm0S+sb1
 c3NQDNSpUca69SylPkx7VsF5cCOcH+6xLn27DK3KOsOAl2KaC7871M61TiNLSBIAVydpA3JOG3qGy
 w4yN/vCL0njtA+u5BXBUZah+S9ZoN2GRkNfbIv8d9lSZgX+gf15bqHvmA1L3wMusmshsMJQnu5H10
 EFX0LVZQ==;
Received: from ipbcc0e031.dynamic.kabel-deutschland.de ([188.192.224.49]:58216
 helo=[192.168.0.12])
 by sub0.freenet.de with esmtpsa (ID earthquake.de@freenet.de)
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim
 4.94.2 #2) id 1nlSiE-005QAL-R2
 for buildroot@buildroot.org; Mon, 02 May 2022 11:51:26 +0200
Message-ID: <e7567c94-6750-bfe4-bce7-fd763264c2e2@freenet.de>
Date: Mon, 2 May 2022 11:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
To: buildroot@buildroot.org
References: <8043273d-730b-c378-fd91-21e6902081fa@freenet.de>
 <3bcef05e-2ddd-2929-8bc7-f16c7ef33cd1@mind.be>
From: Alex <earthquake.de@freenet.de>
In-Reply-To: <3bcef05e-2ddd-2929-8bc7-f16c7ef33cd1@mind.be>
X-Originated-At: 188.192.224.49!58216
X-Scan-TS: Mon, 02 May 2022 11:51:26 +0200
Subject: Re: [Buildroot] ACE + TAO with buildroot - GLIBC_2.28 not found
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKdGhhbmtzIGZvciB5b3VyIGFuc3dlci4KCkFtIDMwLjA0LjIwMjIgdW0gMTI6
MzEgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZToKPgo+Cj4gT24gMjkvMDQvMjAyMiAxNjow
MiwgRWFydGhxdWFrZSB3cm90ZToKPj4gSGksCj4+Cj4+IGludGVyZ3JhdGluZyBBQ0Ugd2FzIHN1
Y2Nlc3NmdWxsIHdpdGgKPj4KPj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2J1aWxkcm9vdC9wYXRjaC8yMDIxMDQxMzEzNDEzOS4xMzI4MS0xLW1hdHRoZXcud2ViZXJAcm9j
a3dlbGxjb2xsaW5zLmNvbS8gCj4+Cj4+Cj4+IEFDRSBsaWIgaXMgYnVpbHQuCj4+Cj4+IFdoZW4g
SSBpbnRlZ3JhdGUgVEFPIGluIHRoZSBhY2UubWsKPj4KPj4gVEFPX0xJQlJBUklFUyArPSBUQU9f
SURMCj4+IFRBT19MSUJSQVJJRXMgKz0gdGFvL1BvcnRhYmxlU2VydmVyCj4+ICQoZm9yZWFjaCBs
aWIsJChUQU9fTElCUkFSSUVTKSwgQUNFX1JPT1Q9IiQoQEQpIiAKPj4gJChUQVJHRVRfQ09ORklH
VVJFX09QVFMpICQoTUFLRSkgLUMgJChARCkvVEFPLyQobGliKSBBQ0VfUk9PVD0iJChARCkiIAo+
PiBUQU9fUk9PVD0iJChARCkvVEFPIsKgIGFsbCApCj4+Cj4+IFRoZSB0YW9faWRsIGNvbXBsaWVy
IHdpbGwgYmUgYnVpbHQuCj4+Cj4+IFRoZSBQb3J0YWJsZVNlcnZlciB1c2VzIHRoZSBjcmVhdGVk
IHRhb19pZGwgY29tcGxpZXIgYnV0IGV4aXQgd2l0aDoKPj4KPj4gLi4vLi4vLi4vYmluL3Rhb19p
ZGw6IC9saWIveDg2XzY0LWxpbnV4LWdudS9saWJjLnNvLjY6IHZlcnNpb24gCj4+IGBHTElCQ18y
LjI4JyBub3QgZm91bmQgKHJlcXVpcmVkIGJ5IC4uLy4uLy4uL2xpYi9saWJBQ0Uuc28uNy4wLjIp
Cj4+IC4uLy4uLy4uL2Jpbi90YW9faWRsOiAvbGliL3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42
OiB2ZXJzaW9uIAo+PiBgR0xJQkNfMi4zMicgbm90IGZvdW5kIChyZXF1aXJlZCBieSAuLi8uLi8u
Li9saWIvbGliQUNFLnNvLjcuMC4yKQo+Cj4gwqBZb3UgY3JlYXRlZCB0YW9faWRsIGZvciB0aGUg
dGFyZ2V0LCBidXQgYXJlIHRyeWluZyB0byBydW4gaXQgb24gdGhlIAo+IGhvc3QuIFRoZSBsaWJj
IHZlcnNpb25zIG9uIHRhcmdldCBhbmQgaG9zdCBhcmUgbm90IGNvbXBhdGlibGUuCj4KPiDCoFRo
aXMgcHJvYmFibHkgbWVhbnMgdGhhdCB0aGUgdGFvIGJ1aWxkIHN5c3RlbSBpcyBub3QgCj4gY3Jv
c3MtY29tcGlsYXRpb24gZnJpZW5kbHkuIFBlcmhhcHMgaXQgZG9lcyBzdXBwb3J0IGNyb3NzLWNv
bXBpbGF0aW9uIAo+IGJ1dCB5b3UgbmVlZCBzb21lIG90aGVyIG9wdGlvbiB0byBwYXNzIHRoZSBo
b3N0IGNvbXBpbGVyICh3ZSBwYXNzIAo+IENDX0ZPUl9CVUlMRD0iJChIT1NUQ0MpIiBiZWNhdXNl
IENDX0ZPUl9CVUlMRCBpcyB0aGUgdmFyaWFibGUgdXNlZCBieSAKPiBhdXRvdG9vbHMsIGJ1dCB3
aXRoIGEgY3VzdG9tIE1ha2VmaWxlIHRoZXkgbWF5IGV4cGVjdCBhIGRpZmZlcmVudCAKPiB2YXJp
YWJsZSkuCgpUQU8gc3VwcG9ydHMgY3Jvc3MgY29tcGlsZS4KVEFPIGl0c2VsZiBhbGxvd3MgdG8g
c2V0IHRoZSBsb2NhdGlvbiBmb3IgdGhlIGNvbXBpbGVyLgpJIGhhdmUgdG8gd3JpdGUgYSBob3N0
LWFjZS5tayBiYWNhdXNlIGZvciBjcm9zcyBjb21waWxhdGlvbiB0aGUgdGFvX2lkbCAKY29tcGls
ZXIgbXVzdCBiZSBidWlsdC9hdmFpbGFibGUgZm9yIHRoZSBob3N0ICh0aGUgYnVpbGRyb290IGhv
c3QpLgoKU2V0dGluZyB0aGUgY29tcGlsZXIgcGF0aCBpbiBUQU8gcGxhdGZvcm1fbWFjcm9zLkdO
VSBmaWxlOgoKVEFPX0lETCA6PSAkKEhPU1RfUk9PVCkvYmluL3Rhb19pZGwKVEFPX0lETEZMQUdT
ICs9IC1nICQoSE9TVF9ST09UKS9iaW4vZ3BlcmYKVEFPX0lETF9ERVAgOj0gJChIT1NUX1JPT1Qp
L2Jpbi90YW9faWRsJChFWEVFWFQpCgpDYW4gSSB1c2UgYSBidWlsZHJvb3QgdmFyaWFibGVzIHRo
YXQgY29udGFpbnMgdGhlIGhvc3QgcGF0aD8KCgo+Cj4gwqBJZiBpdCByZWFsbHkgZG9lc24ndCBz
dXBwb3J0IGNyb3NzLWNvbXBpbGF0aW9uLCB0aGVuIHlvdSBzaG91bGQgbWFrZSAKPiBhIGhvc3Qt
YWNlIHBhY2thZ2UgdGhhdCBidWlsZHMgdGFvX2lkbCBhbmQgaW5zdGFsbHMgaXQgaW4gCj4gJChI
T1NUX0RJUikvYmluLCBhbmQgdGhlbiBjYWxsIHRoYXQgb25lLgoKCkkgdGhlcmUgYSBob3N0IHBh
Y2thZ2UgdGVtcGxhdGUgdGhhdCBJIGNhbiB1c2UgZm9yIGNyZWF0aW5nIHRoZSAKaG9zdC1hY2Uu
bWs/CgoKPiDCoFJlZ2FyZHMsCj4gwqBBcm5vdXQKPgo+Pgo+PiBXcm9uZyB3YXkgdG8gY2FsbD8K
Pj4KPj4KPj4gVGhhbmtzIGZvciBzdXBwb3J0LAo+Pgo+PiBBbGV4Cj4+Cj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKClRoYW5rwrRzLgoKQmVzdCByZWdhcmRzLAoKQWxleAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
