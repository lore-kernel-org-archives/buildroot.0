Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B2FFF886F
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 22:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 545DC6F658;
	Thu, 30 Apr 2026 22:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsdRor5dTg7X; Thu, 30 Apr 2026 22:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7128F6F660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777587733;
	bh=4aIDosSN05dgKpEXfR1hjpfk3A+j+d9uGKUFw9cT8v4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BGGbE3nX+H1yLVwp0EeLjJVY8JZ14HaFqRDR1j3RaxxRCX0A7HnmJ2H7yDe9Ss4sK
	 nDN+fSZMf5cdrPK99wJQ2QBaK8O1xjSDvLVhhg5tf0mOSVkDAPJTjuRbpQmghgxKLl
	 n0Si4KaJAEuWpvNh2bVAqjIqjL9vVvfjEDygo1+PdPVk1K/b1IH8d+LNsy09PQDe71
	 4niUAO6C7JpCDkqljhjg0SvxBkuHc6lziLUUYWQ3Wd1PRQHiJbxjpRfkrHnvQT8XRk
	 c+RIg/iXEa5d52/4jJanFB384WnNigApqjpxdDyNIrBz6JNJwGahi5pc5BksRVbiCF
	 avRmsW0nyMJ2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7128F6F660;
	Thu, 30 Apr 2026 22:22:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A439A127
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 22:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A20CB8535E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 22:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiC9GMqQFq24 for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 22:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA96785079
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA96785079
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA96785079
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 22:22:10 +0000 (UTC)
Received: from [10.42.0.16] (ip-109-42-51-131.web.vodafone.de [109.42.51.131])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 187992C80C0F;
 Fri, 01 May 2026 00:22:08 +0200 (CEST)
Message-ID: <aa4a5ba1-eb8c-46e1-8aba-572b1cf23835@bubu1.eu>
Date: Fri, 1 May 2026 00:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
 <20260425085657.474422-5-fiona.klute@gmx.de>
 <f17073a5-410e-467a-8b29-befc23b3dc0e@bubu1.eu>
 <cab73423-6879-4382-8d7c-64d8db5940f6@gmx.de>
Content-Language: en-US
In-Reply-To: <cab73423-6879-4382-8d7c-64d8db5940f6@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777587728; bh=5JvzbTPmC80dA8WL0KI5f/Q2r0mllRQ8ugcfEWHbyWY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=UM3YxZRToDWBz0Csr3zF6BRFaWPLQ6MW3C081jiiBsA0EZ4BjsB19i5238MiY+L7P
 Tk7VV5UxluPkpwAeXmoTkmVQ0yBl+TxOAtgDR/KcxholciTk8rRWsp3AaP3aAEbYAj
 VZDu1RRCN6ZPD4RH7xGr0NPsW/i1x2PyHTv7nOAQboJy2fNKvY7u8Vx4zA8vVn7nST
 4Z+2x94/wVOx6O55KfNG9ZPyTfb00N5tE1wASQuFBXxDJUJSkra07Fv0AciAwRPXQq
 c6XOk+fiKZJ4ReAFfkDsEjbVbba2Bhl9uc+rhWJV56FN7yk9bXo/w+KKGoXlHd3ij3
 PUPfXRD/tsIJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=UM3YxZRT
Subject: Re: [Buildroot] [PATCH 4/5] package/kmod: switch to Meson build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

K1lhbm4sIHdobyBhZGRlZCB0aGUgTUVSR0VEX0JJTiBoYW5kbGluZyBpbiBrbW9kLgoKT24gNC8z
MC8yNiAxNTo0NiwgRmlvbmEgS2x1dGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBIaSBNYXJjdXMh
Cj4gCj4gQW0gMzAuMDQuMjYgdW0gMTQ6NDYgc2NocmllYiBNYXJjdXMgSG9mZm1hbm46Cj4+IEhp
IEZpb25hLAo+Pgo+PiB0aGFua3MgZm9yIHRoaXMgcGF0Y2gsIEkgaGF2ZSBvbmUgcXVlc3Rpb24g
YmVsb3csIG90aGVyd2lzZSB0aGlzIGxvb2tzIAo+PiBnb29kLgo+Pgo+Pj4gWy4uLl0KPj4+IC0j
IC9zYmluIGlzIHJlYWxseSAvdXNyL3NiaW4gd2l0aCBtZXJnZWQgL3VzciwgYW5kIC91c3Ivc2Jp
biBpcwo+Pj4gLSMgcmVhbGx5IC91c3IvYmluIHdpdGggbWVyZ2VkLWJpbiwgc28gYWRqdXN0IHJl
bGF0aXZlIHN5bWxpbmsKPj4+IMKgIGlmZXEgKCQoQlIyX1JPT1RGU19NRVJHRURfVVNSKSx5KQo+
Pj4gwqAgaWZlcSAoJChCUjJfUk9PVEZTX01FUkdFRF9CSU4pLHkpCj4+PiAtS01PRF9CSU5fUEFU
SCA9IGttb2QKPj4+IC1LTU9EX1NCSU5fRElSID0gYmluCj4+PiArS01PRF9DT05GX09QVFMgKz0g
LURzYmluZGlyPWJpbgo+Pj4gwqAgZWxzZQo+Pj4gLUtNT0RfQklOX1BBVEggPSAuLi9iaW4va21v
ZAo+Pj4gLUtNT0RfU0JJTl9ESVIgPSBzYmluCj4+PiArS01PRF9DT05GX09QVFMgKz0gLURzYmlu
ZGlyPXNiaW4KPj4+IMKgIGVuZGlmCj4+PiDCoCBlbHNlCj4+PiAtS01PRF9CSU5fUEFUSCA9IC4u
L3Vzci9iaW4va21vZAo+Pj4gLUtNT0RfU0JJTl9ESVIgPSBzYmluCj4+PiArS01PRF9DT05GX09Q
VFMgKz0gLURzYmluZGlyPS9zYmluCj4+PiDCoCBlbmRpZgo+Pgo+PiBJcyB0aGUgYmluZGlyL3Ni
aW5kaXIgbG9naWMgc3RpbGwgcmVxdWlyZWQgYWN0dWFsbHk/IEknZCBoYXZlIGhvcGVkIAo+PiB0
aGF0IG1lc29uIGRvZXMgdGhpcyBjb3JyZWN0bHkgb24gaXQncyBvd24gKGFmYWljdCB0aGVzZSBh
cmUgYnVpbHQtaW4gCj4+IG1lc29uIGZsYWdzLCB0aGF0IHN1cHBvc2VkbHkgYXJlIGFsc28gZmls
bGVkIGluIHdpdGggc29tZSBzZW5zaWJsZSAKPj4gZGVmYXVsdD8pCj4+Cj4+IEhhdmUgeW91IHRl
c3RlZCByZW1vdmluZyB0aGlzIGFsdG9nZXRoZXI/Cj4gCj4gSSBkb24ndCBzZWUgYW55IG1lcmdl
ZC11c3IgKG9yIC91c3IvYmluKSBoYW5kbGluZyBpbiBwa2ctbWVzb24ubWsuIFdoaWNoIAo+IG1h
a2VzIHNlbnNlOiBBbG1vc3QgYWxsIHBhY2thZ2VzIHNob3VsZCBpbnN0YWxsIHRvIC91c3IgZXZl
biB3aXRob3V0IAo+IG1lcmdlZC11c3IsIHNvIHBhY2thZ2VzIHRoYXQgbmVlZCB0byBpbnN0YWxs
IHRvIC9zYmluIG9yIC9iaW4gd2lsbCBuZWVkIAo+IHRvIG92ZXJyaWRlLgo+IAo+IFdlIGNvdWxk
IHByb2JhYmx5IHJlbW92ZSB0aGUgQlIyX1JPT1RGU19NRVJHRURfQklOPXkgY2FzZSAoYnV0IEkg
aGF2ZW4ndCAKPiB0ZXN0ZWQgdGhhdCksIGJlY2F1c2Ugd2l0aCAvdXNyL3NiaW4gYXMgYSBzeW1s
aW5rIHRvIC91c3IvYmluIHRoZSAKPiBkaWZmZXJlbmNlIHNob3VsZG4ndCBtYXR0ZXIuIE1ha2Vz
IG1lIHdvbmRlciB3aHkgaXQgd2FzIG9yaWdpbmFsbHkgYWRkZWQgCj4gdGhvdWdoLCBiZWNhdXNl
IHRoZSBzeW1saW5rcyBoYXZlbid0IGNoYW5nZWQuCgpZYW5uLCBtYXliZSB5b3UgaGF2ZSBzb21l
IGlucHV0IGhlcmU/CgpJbiBnZW5lcmFsLCB0aGlzIGlzIGEgYml0IGhhcmQgdG8gZ3Jhc3AgZnJv
bSBqdXN0IHJldmlld2luZyB0aGUgLm1rIGZpbGUgCndpdGhvdXQgYnVpbGRpbmcgZGlmZmVyZW50
IHZhcmlhdGlvbnMgb2YgdGhpcywgc28gdWhtLCB3aGF0IHN5bWxua3MgYXJlIAp3ZSB0cnlpbmcg
dG8gY3JlYXRlIGZyb20gd2hlcmUgdG8gd2hlcmUgYW5kIHdoeT8KPiBJIGhhdmUgdGVzdGVkIHdp
dGggYW5kIHdpdGhvdXQgQlIyX1JPT1RGU19NRVJHRURfVVNSPXksIHRvIGdldCB0aGUgCj4gc3lt
bGlua3MgaW4gL3NiaW4gd2l0aCBCUjJfUk9PVEZTX01FUkdFRF9VU1I9biBhcyBiZWZvcmUgd2Ug
bmVlZCAtIAo+IERzYmluZGlyPS9zYmluICh0aGUgTWVzb24gZGVmYXVsdCBpcyAke3ByZWZpeH0v
c2JpbikuCj4gCj4gV2hldGhlciB0aGF0IG1ha2VzIHNlbnNlIHdpdGggdGhlIGttb2QgYmluYXJ5
IGluIC91c3IvYmluIGlzIGEgZGlmZmVyZW50IAo+IHF1ZXN0aW9uOiBJZiAvdXNyIGlzIG9uIGEg
c2VwYXJhdGUgcGFydGl0aW9uICh0aGUgYW5jaWVudCByZWFzb24gZm9yIHRoZSAKPiBzcGxpdCks
IHRoZSBzeW1saW5rcyB3aWxsIGJlIGJyb2tlbiB1bnRpbCB0aGF0IGlzIG1vdW50ZWQuIEkgc2lt
cGx5IGtlcHQgCj4gdGhlIHNhbWUgYmVoYXZpb3IgYXMgYmVmb3JlLiBJZiBwbGFjaW5nIHRoZSBz
eW1saW5rcyBpbiAvdXNyL3NiaW4gaW4gCj4gYnVpbGRzIHdpdGggQlIyX1JPT1RGU19NRVJHRURf
VVNSPW4gaXMgZmluZSwgd2UgY2FuIHJlbW92ZSB0aGlzIHdob2xlIAo+IG1lc3Mgb2YgY29uZGl0
aW9uYWxzLiA6LSkKClRoYXQgd291bGQgYmUgbmljZSAobW9zdGx5IGJlY2F1c2UgSSBzdGlsbCBk
b24ndCByZWFsbHkgZm9sbG93IHdoYXQncyAKZ29pbmcgb24pLCBidXQgY291bGQgcHJvYmFibHkg
Y29tZSBhcyBhIHNlcGFyYXRlIHBhdGNoIGxhdGVyIGFzIHdlbGwuCgo+IAo+IEJlc3QgcmVnYXJk
cywKPiBGaW9uYQo+IApCZXN0LApNYXJjdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
