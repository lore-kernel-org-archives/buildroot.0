Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEB2D7788F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 17:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A064407E2;
	Fri, 23 Jan 2026 17:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kh9Mh01JTNWY; Fri, 23 Jan 2026 17:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 644F9407EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769188493;
	bh=SIa+Dhch0CnVUPbFqhH0+sVZPeSTdbdqSgKcg2dlI4g=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qhzQaKOkWgi4WMOLjRS+j7gECBtLv1A0TsOnwCLhF7faebjPEJrCAsbS+MHaixuqK
	 yGJ2oEUA5octDWrDWJFo39iizqPJlOpDVuGB5/RQ9QmbrTSV81ijZdAN9WjIJ2b/Dp
	 Qs+HHQIe2k/FlNlsL0ezeX19iFznN3sPpu16gIY5aOQcN7hWHKDdoMXijCoVh/jnV4
	 6smGMI8Hz5CWw6N+/tepbSZIJ/WrEjCTXBj02ZnIDdb2UpA/YZrWThNqGDho4DyrzY
	 zA5aysapDMkjHnvKasT1zZosH5+B7heJUZik113ojQQwPU10etVEYE+VaWx5xBYUkO
	 EytB6BG/oTiBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 644F9407EA;
	Fri, 23 Jan 2026 17:14:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39987122
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 17:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28D2240416
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 17:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pskiTD7P0zOp for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 17:14:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9DF44031C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9DF44031C
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9DF44031C
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 17:14:47 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id jKk8vbB0oRbTBjKk9vSxeg; Fri, 23 Jan 2026 18:14:45 +0100
Message-ID: <3e0e22ca-c0f3-4e34-989d-df032f6b7b7e@benettiengineering.com>
Date: Fri, 23 Jan 2026 18:14:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
References: <20260121011429.1442015-1-james.hilliard1@gmail.com>
 <70549457-9F2A-412B-9756-3E45D724B853@benettiengineering.com>
 <CADvTj4r0Q9AOjL3zaSj3LMRKpHcuMMUC1-uKi93YaPGThOUgMw@mail.gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CADvTj4r0Q9AOjL3zaSj3LMRKpHcuMMUC1-uKi93YaPGThOUgMw@mail.gmail.com>
X-CMAE-Envelope: MS4xfOxxD8AznyPULAQnvsW/eSwl0QmH6ExqWSM5cqnkn2waBlle+0P7qyIIGsblz/vsbp8CPp3va6PSUo0Y4MvAFoA0mL6fScNGeEPYnHn7zPxY82qsIQW4
 CM5j7ZCyTOSdwHefFHwfe1k94V7ZtKiHeoZBZt7jt9Ils3yOUU8XBea6yKn4wSzEQ+BKArjswlcD4ETtVgpt/fQmp4D0WrEGwBHiwzv2KXXQBFApkhtX6cDY
 lJaEF2iXz4T7zMq3zS7GEw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1769188485; bh=DjEKmdBIWReJPMRz3Vtq1vc4qZV47hg7lNqF8jkesqA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=PaI8XuyVLzm+AKDtyjyysMkdmgIN7drXyWz2wLIZqK5+xmc1W/0wIyAl9WpAMu2UU
 Coxzn8v45k51mhLSXZEk7soLqDuC3LZ1nEijPsbJ8FfY4K4iB9H2/Eiqi21D/xQ8Wr
 N9yVQmPFmPLuGcXd+zNrT4EqAN1PtrDBHSQ2lXDAyRizrRmhdsRLxEZq4j7WEgUVHv
 mK+0XjFilVJ04d4vbrXxZO85q7huPzbtyubaaAVDZe249TTFinNrJojn+/kmkVaXZX
 1ik3Gw/FbIV/rtt5a5XWxmvl2R9nOPNqsfxf6JzGYhRrLKfkkbZo75yBbhBWssRYxc
 Gauuz+B5sLJIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=PaI8XuyV
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2025.12
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

T24gMS8yMS8yNiAxNzoyNCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMjEs
IDIwMjYgYXQgMTI6NDLigK9BTSBHaXVsaW8gQmVuZXR0aSAKPiA8Z2l1bGlvLmJlbmV0dGlAYmVu
ZXR0aWVuZ2luZWVyaW5nLmNvbSAKPiA8bWFpbHRvOmdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdp
bmVlcmluZy5jb20+PiB3cm90ZToKPiAKPiAgICAgSGkgSmFtZXMsCj4gCj4gICAgIEkgd2FzIHdv
cmtpbmcgb24gaXQgdG9vLgo+ICAgICBBcyBpcyB0aGUgcGF0Y2ggZG9lc27igJl0IHdvcmsgb24g
bXkgc2lkZS4KPiAgICAgSXQgc2VlbXMgbGlrZSBhdCBsZWFzdCBvbmUgY3J5cHRvIGlzIG5lZWRl
ZCB3aXRoIHRoaXMgdmVyc2lvbiwgc28gSQo+ICAgICB3YXMgZGVmYXVsdGluZyB0byBPcGVuU1NM
IGFuZCBhZGRpbmcgYSBjaG9pY2UgYmV0d2VlbiBpdCwgV29sZnNzbCBldGMuCj4gCj4gCj4gWWVh
aCwgSSB0aGluayBvbmUgY3J5cHRvIHByb3ZpZGVyIG1pZ2h0IGJlIHJlcXVpcmVkIHRvIGJlIHNl
bGVjdGVkCj4gb3Igc29tZXRoaW5nIGluIHRoZSBzd3VwZGF0ZSBtZW51Y29uZmlnLCBidXQgdGhh
dCdzIG1heWJlIG1vcmUKPiBvZiBhbiBpc3N1ZSB0byBmaXggdXBzdHJlYW0/IE15IGJ1aWxkcyBo
YXZlIHNpZ25hdHVyZSB2ZXJpZmljYXRpb24KPiBlbmFibGVkIHNvIEkgdGhpbmsgSSBhbHdheXMg
ZW5hYmxlIHRoYXQuCgpJdCBzZWVtcyBzbyB5ZXMsIGJ1dCBoZXJlIHdlIG5lZWQgYSBwYWNrYWdl
IHRoYXQgYnVpbGRzIG91dCBvZiB0aGUgYm94LAoKPiAKPiBUaGVyZSB3YXMgYXQgbGVhc3Qgb25l
IHJ1bnRpbWUgc2VnZmF1bHQgSSByYW4gaW50byBiZWZvcmUgSSBmaXhlZCBteQo+IHN3dXBkYXRl
IGNvbmZpZyBidXQgSSB0aGluayB0aGF0J3MgYSBzbGlnaHRseSBkaWZmZXJlbnQgaXNzdWUoU0lH
QUxHKToKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qvc3d1cGRhdGUvIAo+
IHBhdGNoLzIwMjYwMTIwMjIwMjE5LjcxNDMwNC0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20v
IDxodHRwczovLyAKPiBwYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3N3dXBkYXRlL3BhdGNo
LzIwMjYwMTIwMjIwMjE5LjcxNDMwNC0xLSAKPiBqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLz4K
ClNvIGl0IG1ha2VzIHNlbnNlIHRvIG1lIHRvIGFkZCBpdCBhcyBsb2NhbCBwYXRjaAoKPiAKPiAK
PiAgICAgQXJlIHlvdSBzdXJlIGl0IGJ1aWxkcyBhcyBpcz8KPiAgICAgT3RoZXJ3aXNlIGNhbiB5
b3UgcGxlYXNlIGZpeCB0aGUgcGF0Y2g/Cj4gCj4gCj4gSSdtIHVzaW5nIHRoaXMgZm9yIG15IHN3
dXBkYXRlIGNvbmZpZyB3aGljaCBzZWVtcyB0byBidWlsZC9ydW4gZmluZToKPiBDT05GSUdfU1lT
VEVNRD15Cj4gQ09ORklHX0hXX0NPTVBBVElCSUxJVFk9eQo+IENPTkZJR19TT0NLRVRfQ1RSTF9Q
QVRIPSIvdG1wL3NvY2tpbnN0Y3RybCIKPiBDT05GSUdfU09DS0VUX1BST0dSRVNTX1BBVEg9Ii90
bXAvc3d1cGRhdGVwcm9nIgo+IENPTkZJR19MVUFQS0c9Imx1YSIKPiBDT05GSUdfVUJPT1Q9eQo+
IENPTkZJR19CT09UTE9BREVSX0RFRkFVTFRfTk9ORT15Cj4gQ09ORklHX0RPV05MT0FEPXkKPiBD
T05GSUdfRE9XTkxPQURfU1NMPXkKPiBDT05GSUdfV0VCU0VSVkVSPXkKPiBDT05GSUdfTU9OR09P
U0VTU0w9eQo+IENPTkZJR19TSUdORURfSU1BR0VTPXkKPiBDT05GSUdfU0lHQUxHX1JBV1JTQT15
Cj4gQ09ORklHX0VOQ1JZUFRFRF9JTUFHRVM9eQo+IENPTkZJR19MVUFFWFRFUk5BTD15Cj4gQ09O
RklHX0FSQ0hJVkU9eQo+IENPTkZJR19CT09UTE9BREVSSEFORExFUj15Cj4gQ09ORklHX0NGST15
Cj4gQ09ORklHX0NGSUhBTU1JTkcxPXkKPiBDT05GSUdfQ09QWT15Cj4gQ09ORklHX0RJU0tQQVJU
PXkKPiBDT05GSUdfRElTS1BBUlRfRk9STUFUPXkKPiBDT05GSUdfRElTS0ZPUk1BVF9IQU5ETEVS
PXkKPiBDT05GSUdfRkFUX0ZJTEVTWVNURU09eQo+IENPTkZJR19MVUFTQ1JJUFRIQU5ETEVSPXkK
PiBDT05GSUdfRU1NQ19IQU5ETEVSPXkKPiBDT05GSUdfUkFXPXkKPiBDT05GSUdfUkRJRkZIQU5E
TEVSPXkKPiBDT05GSUdfUkVBREJBQ0tIQU5ETEVSPXkKPiBDT05GSUdfU0hFTExTQ1JJUFRIQU5E
TEVSPXkKPiBDT05GSUdfU1dVRk9SV0FSREVSX0hBTkRMRVI9eQo+IENPTkZJR19TU0JMU1dJVENI
PXkKPiBDT05GSUdfVUJJVk9MPXkKPiBDT05GSUdfVUJJQkxBQ0tMSVNUPSIwIDEgMiAzIDQgNSIK
PiBDT05GSUdfVUJJV0hJVEVMSVNUPSI2Igo+IENPTkZJR19VTklRVUVVVUlEPXkKClNvIHRoaXMg
c2hvdWxkIGJlIHRoZSBsb2NhbCBzd3VwZGF0ZS5jb25maWcsIHByb2JhYmx5IHdpdGggbGVzcyBv
cHRpb24KZW5hYmxlZC4gSSB3b3VsZCBkaWZmIHRoaXMgYW5kIHRoZSBhY3R1YWwgc3d1cGRhdGUu
Y29uZmlnIHJlc3VsdGluZyBpbnRvCmEgd29ya2luZyBzd3VwZGF0ZS5jb25maWcgd2l0aCBhcyBs
ZXNzIGFzIHBvc3NpYmxlIG9wdGlvbnMgZW5hYmxlZC4KCkNhbiB5b3UgcmV3b3JrIGl0IGFuZCBz
ZW5kIFYyPwoKVGhhbmsgeW91IQpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IAo+IAo+ICAgICBUaGFu
ayB5b3UKPiAgICAgR2l1bGlvCj4gCj4gICAgICA+IElsIGdpb3JubyAyMSBnZW4gMjAyNiwgYWxs
ZSBvcmUgMDI6MTQsIEphbWVzIEhpbGxpYXJkCj4gICAgIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tIDxtYWlsdG86amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4+IGhhCj4gICAgIHNjcml0dG86
Cj4gICAgICA+Cj4gICAgICA+IO+7v1NpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1l
cy5oaWxsaWFyZDFAZ21haWwuY29tCj4gICAgIDxtYWlsdG86amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4+Cj4gICAgICA+IC0tLQo+ICAgICAgPiBwYWNrYWdlL3N3dXBkYXRlL3N3dXBkYXRlLmhh
c2ggfCAyICstCj4gICAgICA+IHBhY2thZ2Uvc3d1cGRhdGUvc3d1cGRhdGUubWsgPGh0dHA6Ly9z
d3VwZGF0ZS5taz7CoCDCoHwgMiArLQo+ICAgICAgPiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAgICAgID4KPiAgICAgID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvc3d1cGRhdGUvc3d1cGRhdGUuaGFzaCBiL3BhY2thZ2Uvc3d1cGRhdGUvCj4gICAgIHN3
dXBkYXRlLmhhc2gKPiAgICAgID4gaW5kZXggYmM5MTFkMTgyMC4uYjNmNDM2NDhmOCAxMDA2NDQK
PiAgICAgID4gLS0tIGEvcGFja2FnZS9zd3VwZGF0ZS9zd3VwZGF0ZS5oYXNoCj4gICAgICA+ICsr
KyBiL3BhY2thZ2Uvc3d1cGRhdGUvc3d1cGRhdGUuaGFzaAo+ICAgICAgPiBAQCAtMSw1ICsxLDUg
QEAKPiAgICAgID4gIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAgICAgID4gLXNoYTI1NiAKPiAgICAg
Njc4YjQ3ZmQyNDE5NzI3YzRkMGFiZjVjOWYzYmMwZGM0YjY3ZTk1OTUxMTMyYmQxYzhmNTYwM2U4
ODk0Nzc3OSAKPiAgICAgc3d1cGRhdGUtMjAyNS4wNS50YXIuZ3oKPiAgICAgID4gK3NoYTI1NiAK
PiAgICAgODUxN2YzNzMwZWViNjZlMjBlNjUxYjg4MWRkNGI5YzEwY2E5YWUwNWUzODgzZGI1OWI1
ZGYxOGFiMWVhYTUzMyAKPiAgICAgc3d1cGRhdGUtMjAyNS4xMi50YXIuZ3oKPiAgICAgID4gc2hh
MjU2IAo+ICAgICA0Y2YwNGVkMzRmZjBlYmJmNWM3MTM0NWI1NmU2YWY1MDkzZmMxNzIwNjM2NGNj
YTBlYmJhZTkyZWYzOTQwNjgzIAo+ICAgICBMSUNFTlNFUy9CU0QtMS1DbGF1c2UudHh0Cj4gICAg
ICA+IHNoYTI1NiAKPiAgICAgZTI3YTNlODc3MDZiM2FhNWZmMmU1MGVhYWZlMmU2ZWQ1Mzk3ZmJm
MmQ3Njc5ZWFmNDQ0YTZkMDAwNTE4YTNhNiAKPiAgICAgTElDRU5TRVMvQlNELTMtQ2xhdXNlLnR4
dAo+ICAgICAgPiBzaGEyNTYgCj4gICAgIDA1NTgxMDE5ODQ1NTBmYTg0ZDFkMTNjMmFmMTFkMTE2
YzIwMDc5ZDJiZTU4NzExZThkOTljYWRjZTcwMDkxOTIgCj4gICAgIExJQ0VOU0VTL0NDMC0xLjAu
dHh0Cj4gICAgICA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N3dXBkYXRlL3N3dXBkYXRlLm1rIDxo
dHRwOi8vc3d1cGRhdGUubWs+IGIvCj4gICAgIHBhY2thZ2Uvc3d1cGRhdGUvc3d1cGRhdGUubWsg
PGh0dHA6Ly9zd3VwZGF0ZS5taz4KPiAgICAgID4gaW5kZXggMDUzMjlkMTNiOC4uODY0Yzg3NmU0
MCAxMDA2NDQKPiAgICAgID4gLS0tIGEvcGFja2FnZS9zd3VwZGF0ZS9zd3VwZGF0ZS5tayA8aHR0
cDovL3N3dXBkYXRlLm1rPgo+ICAgICAgPiArKysgYi9wYWNrYWdlL3N3dXBkYXRlL3N3dXBkYXRl
Lm1rIDxodHRwOi8vc3d1cGRhdGUubWs+Cj4gICAgICA+IEBAIC00LDcgKzQsNyBAQAo+ICAgICAg
PiAjCj4gICAgICA+Cj4gICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAgICA+Cj4gICAg
ICA+IC1TV1VQREFURV9WRVJTSU9OID0gMjAyNS4wNQo+ICAgICAgPiArU1dVUERBVEVfVkVSU0lP
TiA9IDIwMjUuMTIKPiAgICAgID4gU1dVUERBVEVfU0lURSA9ICQoY2FsbCBnaXRodWIsc2JhYmlj
LHN3dXBkYXRlLCQoU1dVUERBVEVfVkVSU0lPTikpCj4gICAgICA+IFNXVVBEQVRFX0xJQ0VOU0Ug
PSBHUEwtMi4wLCBHUEwtMi4wKywgTEdQTC0yLjErLCBNSVQsIElTQywgQlNELTEtCj4gICAgIENs
YXVzZSwgQlNELTMtQ2xhdXNlLCBDQzAtMS4wLCBDQy1CWS1TQS00LjAsIE9GTC0xLjEKPiAgICAg
ID4gU1dVUERBVEVfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0VTL0JTRC0xLUNsYXVzZS50eHQgXAo+
ICAgICAgPiAtLQo+ICAgICAgPiAyLjQzLjAKPiAgICAgID4KPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
