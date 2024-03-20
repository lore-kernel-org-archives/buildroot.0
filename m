Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A72C54E67
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 10:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A78108206E;
	Wed, 20 Mar 2024 10:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ARlgtaI4Qerk; Wed, 20 Mar 2024 10:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CF1282032
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF1282032;
	Wed, 20 Mar 2024 10:16:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F0051BF321
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 10:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E17A60A4F
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 10:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfUQfU26pGTY for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 10:16:16 +0000 (UTC)
X-Greylist: delayed 966 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 Mar 2024 10:16:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1BFC460BD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BFC460BD4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.250.212.17;
 helo=ip67fad411.ipv4.syd02.ds.network;
 envelope-from=phil.williams@advisoft.co.nz; receiver=<UNKNOWN> 
Received: from ip67fad411.ipv4.syd02.ds.network
 (ip67fad411.ipv4.syd02.ds.network [103.250.212.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BFC460BD4
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 10:16:15 +0000 (UTC)
Received: from server-72-r70.ipv4.per01.ds.network
 (ip7ac97cc8.ipv4.syd02.ds.network [122.201.124.200])
 by halon-out02.au.ds.network (Halon) with ESMTPS
 id fced608a-e6a0-11ee-9d07-d094665788dc;
 Wed, 20 Mar 2024 18:02:40 +0800 (AWST)
Received: from [139.180.125.36] (port=61255 helo=[192.168.1.46])
 by cp-fp09.syd02.ds.network with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.1)
 (envelope-from <phil.williams@advisoft.co.nz>) id 1rmsjs-002fkq-0n
 for buildroot@buildroot.org; Wed, 20 Mar 2024 23:00:04 +1300
Message-ID: <0eeaf13d-71f6-424d-a555-f6b29ca47dfd@advisoft.co.nz>
Date: Wed, 20 Mar 2024 23:00:04 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <ebb78d96-4372-4df8-b891-a46ff8703724@advisoft.co.nz>
 <ZfqWZTDSOg9lUlpu@tl-lnx-nyma7486-2>
Content-Language: en-GB
From: Phil Williams <phil.williams@advisoft.co.nz>
In-Reply-To: <ZfqWZTDSOg9lUlpu@tl-lnx-nyma7486-2>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp09.syd02.ds.network
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - advisoft.co.nz
X-Get-Message-Sender-Via: cp-fp09.syd02.ds.network: authenticated_id:
 phil.williams@advisoft.co.nz
X-Authenticated-Sender: cp-fp09.syd02.ds.network: phil.williams@advisoft.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=advisoft.co.nz; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XzhBUnkcO3tF/fdT7bKzbLNQzQoMZHeiRgE2qAt9+co=; b=R6GOxZugAKQ8paZND2eR0/Rx62
 4lKgICzG58txv+vsNhKB9+frjl2JxyiC9HK8GrjwezNOF56IWfmmDI2B+FVGpPycE1sKrSat9P1oJ
 9WzVLI1OUpEP+iSnWXv5LjbXnAy3a6vdAsKSPehYKs97EbHdsZl/U3XV6HVJeSuf64B3aF93IiBpQ
 ssfbFFjzeGrmCOYA1t3WU5AnzMKuT9nG9PWbykBiD/Dv4kNpzQ7KMIExmPkvpaJOhdd5bWscMlfcZ
 bRO2+FI0F4gFlT3qxoZZyZiIe1dkbKkjtUqLi9zgDB2jFOT5Cumd169nsneu0QM1ZSNJdT0ZCoEZ8
 iO/GGTmQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=advisoft.co.nz
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=advisoft.co.nz header.i=@advisoft.co.nz
 header.a=rsa-sha256 header.s=default header.b=R6GOxZug
Subject: Re: [Buildroot] go receipe not installing go.env
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

SSBoYWQgc291cmNlZCB0aGUgaG9zdC9lbnZpcm9ubWVudC1zZXR1cCBhbmQgd2FzIHVzaW5nIGdv
IHRvIG1hbnVhbGx5IApidWlsZCBzb21ldGhpbmcgd2hpY2ggaGFkIGRlcGVuZGVuY2llcyB0aGF0
IG5lZWRlZCB0byBiZSBkb3dubG9hZGVkLgoKT24gYm90aCBXaW5kb3dzIGFuZCBVYnVudHUgR09S
T09UIGNvbnRhaW5zIHRoYXQgZ28uZW52IGZpbGUsIHNvIEkgCmZpZ3VyZWQgaXQgcHJvYmFibHkg
c2hvdWxkIGJlIHRoZSBzYW1lIGhlcmUuCgpPbiAyMC8wMy8yMDI0IDg6NTUgcG0sIHlhbm4ubW9y
aW5Ab3JhbmdlLmNvbSB3cm90ZToKPiBQaGlsLCBBbCwKPgo+IE9uIDIwMjQtMDMtMjAgMTM6MTcg
KzEzMDAsIFBoaWwgV2lsbGlhbXMgc3Bha2UgdGh1c2x5Ogo+PiBJIHJhbiBpbnRvIHRoaXMgaXNz
dWUgd2hlbiB1c2luZyB0aGUgdG9vbGNoYWluIGNvbXBpbGVkIHdpdGggYnVpbGRyb290Ogo+PiBo
dHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy82MTkyOAo+IEZUUiwgdGhlIGlzc3Vl
IGlzIGdvIHdoaW5uaW5nIGFib3V0Ogo+Cj4gICAgICBHT1BST1hZIGxpc3QgaXMgbm90IHRoZSBl
bXB0eSBzdHJpbmcsIGJ1dCBjb250YWlucyBubyBlbnRyaWVzCj4KPj4gQXBhcmVudGx5IHRoZSBk
ZWZhdWx0IEdPUFJPWFkgY29uZmlndXJhdGlvbiBpcyBub3cgcmVhZCBmcm9tIEdPUk9PVC9nby5l
bnYuCj4+Cj4+IEkgbWFkZSB0aGUgZm9sbG93aW5nIGNoYW5nZSB3aGljaCBmaXhlZCBteSBpc3N1
ZToKPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLCBzZWUgYmVsb3cuLi4KPgo+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9nby9nby5tayBiL3BhY2thZ2UvZ28vZ28ubWsKPj4gaW5kZXggOWVmZDRh
MzEuLmQwMzFmZDI1IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2dvL2dvLm1rCj4+ICsrKyBiL3Bh
Y2thZ2UvZ28vZ28ubWsKPj4gQEAgLTE1Myw2ICsxNTMsOCBAQCBkZWZpbmUgSE9TVF9HT19JTlNU
QUxMX0NNRFMKPj4KPj4gIMKgwqDCoMKgwqDCoMKgIGNwIC1hICQoQEQpL2xpYiAkKEhPU1RfR09f
Uk9PVCkvCj4+Cj4+ICvCoMKgwqDCoMKgwqAgY3AgLWEgJChARCkvZ28uZW52ICQoSE9TVF9HT19S
T09UKS8KPiBUaGUgZGVmYXVsdCBnby5lbnYgYXMgcHJvdmlkZWQgYnkgZ28sIGNvbnRhaW5zOgo+
ICAgICAgR09QUk9YWT1odHRwczovL3Byb3h5LmdvbGFuZy5vcmcsZGlyZWN0Cj4KPiBUaGlzIGxv
b2tzIGxpa2UgdGhpcyBpcyBnb2luZyB0byBmaXJ0IHRyeSB0aGUgaHR0cHM6Ly9wcm94eS5nb2xh
bmcub3JnCj4gcHJveHksIGFuZCBmYWxsYmFjayB0byBkaXJlY3QgZG93bmxvYWQgaWYgbWlzc2lu
ZyBvbiB0aGUgcHJveHkuCj4KPiBJIGRvbid0IHRoaW5rIHRoYXQgaXMgd2hhdCB3ZSB3YW50LiBJ
bnN0ZWFkLCB3ZSB3YW50IHRvIGtlZXAgdGhlCj4gZXhpc3RpbmcgYmVoYXZpb3VyOgo+Cj4gICAg
LSB3aGVuIHdlIGRvd25sb2FkLCB3ZSB3YW50IHRvIGRvIGEgZGlyZWN0IGRvd25sb2Qgd2l0aG91
dCBnb2luZwo+ICAgICAgdGhyb3VnaCBhbnkgcHJveHkgYXQgYWxsCj4KPiAgICAtIHdoZW4gd2Ug
YnVpbGQsIHdlIGRvIG5vdCB3YW50IHRvIGdvIGFuZCBmZXRjaCBhbnl0aGluZywgYXMgd2UgYXJl
Cj4gICAgICBzdXBwb3NlZCB0byBoYXZlIGV2ZXJ5dGhpbmcgYWxyZWFkeSB2ZW5kb3JlZCBhdCBk
b3dubG9hZCB0aW1lLgo+Cj4gSG93ZXZlciwgYXMgSSByZWFkIGZyb20gaHR0cHM6Ly9naXRodWIu
Y29tL2dvbGFuZy9nby9ibG9iL21hc3Rlci9nby5lbnYKPiBzZXR0aW5nIEdPUFJPWFkgaW4gdGhl
IGVudmlyb25tZW50IHNob3VsZCBzdGlsbCBiZSBzdXBwb3J0ZWQ6Cj4KPiAgICAgICMgVGhlIGVu
dmlyb25tZW50IG92ZXJyaWRlcyBldmVyeXRoaW5nIGVsc2UuCj4KPiBBbmQgdGhlIHVwc3RyZWFt
IGRvY3VtZW50YXRpb24gc3RpbGwgcmVmZXJlbmNlcyBpdCwgd2l0aCB0aGUgdmFsdWVzIHdlCj4g
YXJlIGN1cnJlbnRseSB1c2luZzoKPgo+ICAgICAgaHR0cHM6Ly9nby5kZXYvcmVmL21vZCNlbnZp
cm9ubWVudC12YXJpYWJsZXMKPgo+ICAgICAgVHdvIGtleXdvcmRzIG1heSBiZSB1c2VkIGluIHBs
YWNlIG9mIHByb3h5IFVSTHM6Cj4KPiAgICAgICAgKiBvZmY6IGRpc2FsbG93cyBkb3dubG9hZGlu
ZyBtb2R1bGVzIGZyb20gYW55IHNvdXJjZS4KPiAgICAgICAgKiBkaXJlY3Q6IGRvd25sb2FkIGRp
cmVjdGx5IGZyb20gdmVyc2lvbiBjb250cm9sIHJlcG9zaXRvcmllcyBpbnN0ZWFkCj4gICAgICAg
ICAgb2YgdXNpbmcgYSBtb2R1bGUgcHJveHkuCj4KPiBTbyB3ZSdkIG5lZWQgYSBsaXR0bGUgYml0
IG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGFjdHVhbCBpc3N1ZToKPgo+ICAgIC0gd2hhdCBw
YWNrYWdlIGRvIHlvdSBnZXQgdGhlIGlzc3VlIHdpdGg/Cj4gICAgLSBpcyBpdCBkdXJpbmcgZG93
bmxvYWQgKHZlbmRvcmluZyksIG9yIGR1cmluZyBidWlsZD8KPiAgICAtIGNhbiB5b3Ugc2hhcmUg
YSByZXByb2R1Y2VyPwo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4+ICDCoMKgwqDC
oMKgwqDCoCBta2RpciAtcCAkKEhPU1RfR09fUk9PVCkvcGtnCj4+ICDCoMKgwqDCoMKgwqDCoCBj
cCAtYSAkKEBEKS9wa2cvaW5jbHVkZSAkKEhPU1RfR09fUk9PVCkvcGtnLwo+PiAgwqDCoMKgwqDC
oMKgwqAgY3AgLWEgJChARCkvcGtnL3Rvb2wgJChIT1NUX0dPX1JPT1QpL3BrZy8KPj4KPj4gSSBk
b24ndCBrbm93IGVub3VnaCBhYm91dCBidWlsZHJvb3Qgb3IgZ28gYXMgdG8gd2hldGhlciB0aGlz
IHdvdWxkIGJlIHVzZWZ1bAo+PiBmb3Igb3RoZXJzLgo+Pgo+PiBJZiBzb21lb25lIGNhbiBjb25m
aXJtIGl0IGlzLCBJIHdpbGwgZm9sbG93aW5nIHRoZSBwcm9jZWR1cmUgYW5kIHByb3Blcmx5Cj4+
IHN1Ym1pdCBhIHBhdGNoLgo+Pgo+PiBUaGFua3MKPj4KPj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
