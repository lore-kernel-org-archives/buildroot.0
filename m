Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5E5CD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 08:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C1B861AED;
	Sun,  7 Jun 2026 08:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfEFVt8GUv6z; Sun,  7 Jun 2026 08:54:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B13C61AF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780822488;
	bh=VeqZ8yf91d11rlnUCDGQt+eBzneCJNrMbJzR/J47kxk=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cYnIR2SbQveJhNdaoPufjHS3Gz0HUNTj4Wfe0Z85smd2nYMf3Y7trxVWYoEEJIHAD
	 67pbANkbaI4IITs6P96g57ocq/rPFg8T+bJiiDf+HrLkvPRMExm20TxDW3pnmtKv8i
	 mauelv9c6vSMMAil5WvivGlFGdBtDjnukAryYYfJXF4ipUj4q2Le/3BuwH7Qs+xseV
	 zjrrC73KDUTmuEnfQ/l95SPvB5kITH/U7/V2QaUi8dghDoTwYPx+ADmffgtRXq+S/t
	 xU+hUhLFiajbC+eqx8rHdeJ6fyR9V16b2uSKbxrj1/anQo5z4Mw2DZTLYxMRU19Nh2
	 43KbSrDxbjlkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B13C61AF1;
	Sun,  7 Jun 2026 08:54:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A4692C1
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 08:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B5E142847
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 08:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_1BJoGlj70u for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 08:54:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D05942846
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D05942846
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D05942846
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 08:54:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9EAD3EBD5;
 Sun,  7 Jun 2026 08:54:40 +0000 (UTC)
Message-ID: <c6878138-7675-4fbd-bd02-7792e48644ed@yoseli.org>
Date: Sun, 7 Jun 2026 10:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20260604051221.317172-1-jeanmichel.hautbois@yoseli.org>
 <20260605001649.GB120710@igalia.com>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20260605001649.GB120710@igalia.com>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: dmFkZTEt5b4d3rCP9J8PNyHM8qBNpWGRgCI7c8iUUCPrWjC7qwymQeJnoQR0ilCsymXJIxN13z/tgAps+qj7/IPAtpCZ/fTAt0dOMVxd+M4B1rbo1e1nVlDPUmVFHe4xIs/LgN95mDUupx3Y5UNA7DdoUwORya/91MOMumodX92vJlf0TiJdyDsuVo1ThbgFcGtTFxTqui5IT7JKI986oLhSbfVJpCyy5iZeKfbvtV7SGxFrWcZg+aVWhGEVoGGvzk98aqmXG0iT5+aC4M3Kv+Q56dZ4ImNbLzU+cORDmXQK1FzFKtfyc9Ia8aQeDsLCvDDqiSjWppeZc4DXIspcjvCRs4isScO/oR/cftozw0LJ9G0odtXfvk8JKfhbKRMduJEbMFgfbiTrsvBoAe4NtbPGgXfH1c8nuY7YNWxxdTWDIiN07N4jPUexBh3kbgZQJmpJ656rlw2X5XqoW3vAa4vFf/M460DgGK1Y7a2G5zA+zzqgcZRKv2wu/ZrdggZTODEl4C5bSVBJ5p1t1Hr7WgT4h1WwwP6/fxj2faJThrvJIoDcZaKUC+H14uayCMfa5XSkF9ReERtQeysWFWCdHt+roSX5EUUw+6NqAjaJFeWosAuRbXAIbBCFzD2a1/QYvobNBM0nts43tya75ZiyCwSQLhkCFxYFVqmdRdncmriPxAxEWQ
X-GND-State: clean
X-GND-Score: -100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780822481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dINrDOSrB/mv9Sw38N0KYtnnuIPfwZG+VAH6uqLaLyk=;
 b=aP9Mno4pZuGjPwTmkCfhPr1Cyi7Me+z/zPP++WVKBWr4amf5B4e8Df6rB7pr4sRPY7DKm/
 GZj+gUvQJkGtDW/FQKOK7EuhbdoiHiqGPekBlunc0bwRgvOo1YWYlHE7rI7+WErtXcjiHS
 uyPsnpWNOrsGS+qi0/SJ2t6JRLmIWaDI4b4cafEzk1pOewMdhsz+NItDWAmWdxxGCFqId3
 SThRRlEVqpAFWCV6kjixNOBeeLspy8UUGBFzbcjvdDWUl7l7AyV6sWQqSspYwE6mb2Pl7c
 Bnq/z9jAVgRzzur5JpwnBcngZCzw7HcfdJTsbMVAhvS84Vv9R7/N6UUaZw+RCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=aP9Mno4p
Subject: Re: [Buildroot] [PATCH] package/libglib2: disable sysprof profiling
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

SGkgQWRyaWFuLAoKTGUgMDQvMDYvMjAyNiDDoCAyMzoxNiwgQWRyaWFuIFBlcmV6IGRlIENhc3Ry
byBhIMOpY3JpdMKgOgo+IEhlbGxvIEplYW4sIGFsbCwKPiAKPiBPbiBUaHUsIDA0IEp1biAyMDI2
IDA3OjEyOjIxICswMjAwIEplYW4tTWljaGVsIEhhdXRib2lzIDxqZWFubWljaGVsLmhhdXRib2lz
QHlvc2VsaS5vcmc+IHdyb3RlOgo+IAo+PiBUaGUgc3lzcHJvZiBwcm9maWxpbmcgc3VwcG9ydCBp
cyBub3QgdXNlZnVsIG9uIGVtYmVkZGVkIHRhcmdldHMgYW5kCj4+IG9ubHkgYWRkcyBidWlsZCBj
b21wbGV4aXR5LiBEaXNhYmxlIGl0IGV4cGxpY2l0bHkgc28gdGhhdCB0aGUgYnVpbGQKPj4gZG9l
cyBub3QgZGVwZW5kIG9uIHdoZXRoZXIgbGlic3lzcHJvZi1jYXB0dXJlIGhhcHBlbnMgdG8gYmUg
ZGV0ZWN0ZWQKPj4gb24gdGhlIGhvc3QuCj4gCj4gU29ycnksIGJ1dCBJIHdpbGwgaGF2ZSB0byBk
aXNhZ3JlZS4gV2hpbGUgZGV2ZWxvcGluZyBXZWJLaXQgKEkgd29yayBib3RoCj4gaW4gdGhlIEdU
SyBhbmQgdGhlIFdQRSBwb3J0cykgdGhlIFN5c3Byb2YgdHJhY2luZyBzdXBwb3J0IGhhcyBiZWVu
Cj4gaW5zdHJ1bWVudGFsIGZvciBvdXIgdGVhbSB0byBiZSBhYmxlIHRvIG1lYXN1cmUgYW5kIGRl
bGl2ZXIgcGVyZm9ybWFuY2UKPiBpbXByb3ZlbWVudHMuIEhhdmluZyBTeXNwcm9mIHRyYWNpbmcg
Zm9yIHRoZSBkZXBlbmRlbmNpZXMgKGluY2x1ZGluZwo+IEdMaWIpIGlzIG5lZWRlZCBsZXNzIG9m
dGVuOyBidXQgaGFzIGhlbHBlZC4KPiAKPiBJTU8sIHdoYXQgbWFrZXMgc2Vuc2UgaXMgdG8gZGlz
YWJsZSBTeXNwcm9mIGZvciAqaG9zdCogYnVpbGRzLCBidXQgbGVhdmUKPiBpdCBlbmFibGVkIGZv
ciAqdGFyZ2V0KiBidWlsZHMgLS0gYmVjYXVzZSBvZiBjb3Vyc2UgcGVvcGxlIGFyZQo+IGludGVy
ZXN0ZWQgaW4gb3B0aW1pemluZyBmb3IgdGhlaXIgdGFyZ2V0IGRldmljZXMuCgpUaGFua3MsIHRo
YXQgbWFrZXMgc2Vuc2UgaW5kZWVkLgoKSSB3aWxsIHNlbmQgYSB2MiB0aGF0IGRpc2FibGVzIHN5
c3Byb2Ygb25seSBmb3IgdGhlIGhvc3QgYnVpbGQgCihIT1NUX0xJQkdMSUIyX0NPTkZfT1BUUykg
YW5kIGxlYXZlcyBpdCBlbmFibGVkIGZvciB0aGUgdGFyZ2V0LgoKVGhhbmtzLApKTQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
