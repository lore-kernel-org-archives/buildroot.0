Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B33C4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 00:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 679D340B67;
	Mon, 12 Feb 2024 00:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uf7O1S_1NINC; Mon, 12 Feb 2024 00:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38EF640189
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38EF640189;
	Mon, 12 Feb 2024 00:13:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2165C1BF47D
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A5BC40189
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FfycmC5Lm3J7 for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 00:13:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D66E40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D66E40106
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D66E40106
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 00:13:31 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6E6052C83901;
 Mon, 12 Feb 2024 01:13:29 +0100 (CET)
Message-ID: <18bea399-dc8e-424b-b087-3823d0bd4545@bubu1.eu>
Date: Mon, 12 Feb 2024 01:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20240209175631.1337370-1-james.hilliard1@gmail.com>
 <Zck6_sR8fspWF37e@landeda>
 <CADvTj4ppD06TSGnYUUBSzB_sV6vErb2ozyMuGr1QjyLtu_pvPA@mail.gmail.com>
 <ZclC3_dSvLTp6Ras@landeda>
In-Reply-To: <ZclC3_dSvLTp6Ras@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707696809; bh=2pQOfNDKRqRy50jsPo5rEgZesgPahovncZ9rIX1XunU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=B/RWew10vuene7jwvcR59f0A/cdedWelA7nb/Qqkrn8zCtPxAnc7prZaP5HBZI5hj
 Br04pO1FsWyH+TLZo5jelYyb5D5rd3aXFuR6Csf0/aej4WCwnlhtLXp0meHyXn0zEg
 JiIQMPEyjNid4BOKKX93jEDBKhusACYogP+3R5h3iMrLH258jzJonhAG95Jvb4T49Q
 4X7RteceUOinR2xuPLPlEDlT5z8j5sOLYCynr+hkFZWLy8HXxDbVsXdba9CpbfNPIZ
 bIPSte5TvPpyxJVtqkwIj1RwKNy/029ILOX5BKYz3oUfrKEDKJ66C2NJzLhFkg6loD
 XkIi4KQLhdhRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=B/RWew10
Subject: Re: [Buildroot] [PATCH 1/2] package/python-uvloop: add support for
 cython3
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwgSmFtZXMsCgpPbiAxMS4wMi4yNCAyMjo1NywgWWFubiBFLiBNT1JJTiB3cm90ZToK
PiBKYW1lcywgQWxsLAo+IAo+IE9uIDIwMjQtMDItMTEgMTQ6MzkgLTA3MDAsIEphbWVzIEhpbGxp
YXJkIHNwYWtlIHRodXNseToKPj4gT24gU3VuLCBGZWIgMTEsIDIwMjQgYXQgMjoyNOKAr1BNIFlh
bm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPj4+IE9uIDIwMjQt
MDItMDkgMTA6NTYgLTA3MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPj4+PiBBZGQg
cGF0Y2hlcyBmcm9tIHBlbmRpbmcgdXBzdHJlYW0gcHVsbCByZXF1ZXN0IHdoaWNoIGFkZCBjeXRo
b24zCj4+Pj4gY29tcGF0aWJpbGl0eS4KPj4+IFdlIGFyZSBhIGxpdHRsZSBiaXQgY2F1dGlvdXMg
YXQgYXBwbHlpbmcgcmFuZG9tIHBhdGNoZXMgdGhhdCBoYXZlIG5vdAo+Pj4geWV0IGJlZW4gYXQg
bGVhc3QgcmV2aWV3ZCBieSB1cHN0cmVhbS4gSW4gdGhpcyBjYXNlLCB0aGVyZSBoYXMgbm90IGJl
ZW4KPj4+IGFueSB1cHN0cmVhbSBhY3Rpdml0eSBzaW5jZSB0aGUgbGFzdCByZWxlYXNlLCBhbmQg
bm90IG11YyBiZWZvcmUgdGhhdAo+Pj4gZWl0aGVyLi4uCj4+IFdlbGwgdGhlc2UgcGF0Y2hlcyBh
cmUgYmVpbmcgdXNlZCBieSBnZW50b28gc28gdGhleSBhcmUgbm90IGVudGlyZWx5Cj4+IHVudGVz
dGVkIGluIHRoZSByZWFsIHdvcmxkLgo+IAo+IEl0J3Mgbm90IHRoYXQgdGhleSBhcmUgdGVzdGVk
IG9yIG5vdC4gSXQgaXMgYWJvdXQgd2hldGhlciB0aGV5J2xsIGhhdmUgYQo+IGNoYW5jZSB0byBi
ZSBhY2NlcHRlZCB1cHN0cmVhbSwgb3Igd2hldGhlciB3ZSdsbCBoYXZlIHRvIGNhcnJ5IGFuZAo+
IG1haW50YWluIHRoZW0gZm9yZXZlciBpbiBCdWlsZHJvb3QuCj4gCj4gTWF5YmUgaXQncyB0aW1l
IHRoYXQgc29tZW9uZSBwaW5ncyB1cHN0cmVhbSBhYm91dCB0aGF0IFBSPwo+IAo+Pj4gV2UgaGF2
ZSBubyBpbi10cmVlIHVzZXIgb2YgdXZsb29wLCBzbyBJIHdvbmRlciB3aGV0aGVyIGl0IG1ha2Vz
IHNuc2UgdG8KPj4+IGtlZXAgaXQsIGVzcGNpYWxseSBzaW5jZSBpdCBtYXUgYmUgYmxvY2tpbmcg
dGhlIGJ1bXBzIG9mIG90aGVyIHBhY2thZ2VzCj4+PiAobGlrZSBjeXRob24gMy54IGJlaW5nIHJl
cXVpcmVkIGJ5IHdoYXRzLWl0cy1uYW1lKS4KPj4gVGhhdCdzIG5vdCBlbnRpcmVseSB0cnVlLCBp
dCdzIGEgY29tbW9uIG9wdGlvbmFsIGRlcGVuZGVuY3kgZm9yIHBhY2thZ2VzCj4+IGxpa2UgcHl0
aG9uLXV2aWNvcm4gZm9yIGV4YW1wbGUuCj4gCj4gICAgICAkIGdpdCBncmVwIC1pIC1FIHB5dGhv
bi51dmxvb3AKPiAKPiB3b3VsZCB0dXJuIG9ubHkgcHl0aG9uLXV2bG9vcCBpdHNlbGYsIGFuZCBp
dHMgcnVudGltZSB0ZXN0LiBJZiBpdAo+IGlzIG9ubHkgb3B0aW9uYWwsIGFuZCBwcmV2ZW50cyB1
cyBmcm9tIHVwZGF0aW5nIHVubGVzcyB3ZSBhcHBseQo+IG5vbi11cHN0cmVhbWFibGUgcGF0Y2hl
cywgdGhlbiBJJ2QgYXJndWUgd2Ugc2hvdWxkIGRyb3AgaXQuCgpJdCdzIGFuIG9wdGlvbmFsIGRl
cGVuZGVuY3ksIGJ1dCBhIHJlY29tbWVuZGVkIG9uZSwgc2VlIHRoZSBpbnN0YWxsIAppbnN0cnVj
dGlvbnMgZm9yIHV2aXZvcm46IApodHRwczovL2dpdGh1Yi5jb20vZW5jb2RlL3V2aWNvcm4/dGFi
PXJlYWRtZS1vdi1maWxlI3F1aWNrc3RhcnQKCkl0J3MgYSBmYXN0ZXIgZHJvcC1pbiByZXBsYWNl
bWVudCBmb3IgdGhlIHB5dGhvbiBhc3luYyBldmVudCBsb29wLCBidXQgCm9ubHkgY29tcGF0aWJs
ZSB3aXRoIENQeXRob24sIG5vdCBpLmUuIHB5cHksIHNvIHVzdWFsbHkgcHJvamVjdHMgZG9uJ3Qg
CmRlY2xhcmUgYSBoYXJkIGRlcGVuZGVuY3kgb24gaXQuCgpJIGZvdW5kIGEgaG9wZWZ1bGx5IGJl
dHRlciBzb2x1dGlvbiB0byBvdXIgY3l0aG9uIHByb2JsZW1zIHRob3VnaDogc2VlIAp0aGUgcHl0
aG9uLW1zZ3BhY2sgdGhyZWFkLgoKSW4gc2hvcnQ6IGlmIHdlIGNvbnRpbnVlIHRvIHVzZSB0aGUg
c2Rpc3RzIGZyb20gcHlwaSwgY3l0aG9uIGlzIG5vdCBhIApyZWFsIGJ1aWxkIGRlcGVuZGVuY3kg
YW5kIHdlIGNhbiBqdXN0IHJlbW92ZSBpdCBmcm9tIHB5cHRvamVjdC50b21sIAppbnN0ZWFkIG9m
IHRyeWluZyB0byBwcm92aWRlIHRoZSBjb3JyZWN0IHZlcnNpb24gdGhhdCdzIG5ldmVyIGdvaW5n
IHRvIApiZSBpbnZva2VkLgoKPiAKPiBbLS1TTklQLS1dCj4+IEknbGwgZml4IGFuZCByZXNlbmQu
Cj4gCj4gVGhhbmtzLgo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
