Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A2606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bCLiznef;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=aCIrvJN7
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA8A408EE;
	Fri, 23 Oct 2026 14:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ov_L_PrKwUn; Fri, 23 Oct 2026 14:59:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ACC9540844
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792767574;
	b=PyxMMe6azTkBfFJI245E/gR2TUYaVE26UPb88ZlBl3/jwTTPOYqaqQXTJ9FGIBuBKvGY
	 cd4x8cLPQRmqJwaca3Vv/i/8jRG7a//rOHX/ThdQyommgTtibpuAn9WnxE5nZA7epZ+yw
	 mlO0AwAg/LxyBQs34OsC06JyPrJS3NgCfHO/1D/BODxxgmaohRnE3rm0WQIa/rpQX3XFF
	 YBPdgzVzXNu2XKmM61RcnXmAjBCkSml1RLPNSp9pqfoz3goakc2LXr7rFfNkhpZzUYcGJ
	 q+7X9kY9t/TZMNwkWdl/3IzYTumMfrMDkiH3yyBatMXeDL3SHHLayoW0a/kBMLvBI2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792767574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:From:In-Reply-To:X-CMAE-Envelope:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=6kIrJOBSQFznukgjYymghsDjJgmj7I66/DlJWJuxRtk=;
	b=IbN9y3xEwQKuZ21oaOvl3NF+uwaW0MT0wmGi6/3O5J6ss7DXRxt9daV/OFefZutPvOvy
	 3wAqtqJ9uF0RjY6mU5R6YsLGcKeJ8Oc+w7zSz8ndePXw1M2GnGYwfHdhy5RPHOwxH7dl6
	 Y/uF7N4XQO2spT+9Loc1mmiDp+LCYnYJYmI7oy4PeuQH9pRVwvYUJqu4wCA6ecwsVPzVV
	 pHNka4zqzQ9GSZaorNqpBtFtSvfWwRLUpdgbE7PMMCmEetbVgikKJFjfVWUrEQKQ9I870
	 xJHfzL5n9EIcQjWV2BCLgvQ/PVu6fmzFYWd/XrUn+a/tMMnGoUxptDhGaY4ywHSYw9g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792767574;
	bh=6kIrJOBSQFznukgjYymghsDjJgmj7I66/DlJWJuxRtk=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bCLiznefvU1ZS9M6m0ELOQLdJdeqlVnnkPIf7JqW/1PcE99AW6uftglTt21IRIehF
	 zqFJ7sYXRDrxt+IY7UoMPqiSPiZ6HbMtclzSUkkZj1xGpSR46WtbT8J66Qm1GIeHzg
	 ggZKyeV1EUvxVp+OVdjafaVnguqMYMfDLSue7t9ZE4k2gGyPSi7Y3lZfj72Z0cWm7z
	 QWDidKuvSOas0zrrTbPQoGkOqPqfN+mJhnHP0z6hwih19w+sY+4UlmU0VRP10eo5H/
	 lTZj3x3OL+mggq5jSZOOzjYPxWcJW1rpnRqiNa20Mwtdx/eOm3XHZufF1PMrQMidw5
	 aBx0KVlbuPSig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC9540844;
	Fri, 23 Oct 2026 14:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF9C149D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A56BC401DF
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSjBqaLv0dcH for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 14:59:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7A074401D2
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=62.149.156.86
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792767570;
 b=qA5CKQ2GmETwn1FKTHrcUmwQw1S+0dnZC4ieEJeRDU8w9kFC/O8u7iRLN1Tys3MGRFRL
 UhmTIG0xRux4bv/r/jFwSuUn94aDOUOlGagJKzRgx7lMX2WZRSGIJ5rt/ZeLICLgUesN2
 QA2rfvP7zlEkV0166FnCbw4+4mxu406Xh77wEDR3KRPZbtB1IJPCkcrM2QPtYL8QcEFqm
 PDL8p4eSZ0M1i3vAvMnAcqdhnua0oNTcGp2mgPNu9Qd7N6iG1cbSsfx8LFJl8BGCvi3Di
 UZVNx/sJnV2NmMor3qCth2NU/0r9YGc83MUlURqNa4ZXCaoYdnH4+50LzsVNb+MhpgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792767570;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=DX2EYpohJRy+EXocSKkR5eg1CuYrn1dQYhn8vJuHHFY=;
 b=m5olQJ1ivpRjDI7lA5lJ/TSfYJRz4Vmd8Tp70kY4zKIwJoxH5RfOoB3BCHiQiJVUtm33
 OWKKHp1IFjNSggibAXI3r0LvvnFuXIykEbm5ZxoZyE84kfg3Pl0mYSHY/gBjUcBr+YCZn
 xjVNfs14ngoeSoM7nQElwLsH4Q6wbZFFf+3NXeUwujOXNxFVz8FfA5Y9Bz30wmgb2nSqJ
 GI7wDmjSlB60RyPJtthFE01IcpAShCWhr6hnW0fz5UKrDWFteuEgBRhemRcKNxoWeW/1D
 UrPdNU5IfsYLEANwbViPjZuTZi06ZQasC1AX8MNqyppBEF97CzNlEB3DRhgAndbrFdw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=aCIrvJN7; 
 arc=none smtp.remote-ip=62.149.156.86
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.86;
 helo=smtpcmd0986.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=aCIrvJN7
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A074401D2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:59:29 +0000 (UTC)
Received: from [192.168.1.115] ([151.95.84.63]) by Aruba SMTP with ESMTPSA
 id KGjuxmG6zAFghKGjvxLgKJ; Fri, 23 Oct 2026 16:59:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1792767567; bh=sSLSzs6hqL1dxOEEY0ft2rYfZXS2/j/BPCXdJAk81GA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=aCIrvJN7VxVL5ZOcE0lffKgxUS8gX08pqXjqO750sKFcLneOTar+sMwj5PSt8nmNM
 wbs1lk4CsmoKuklL8sVieztum17wUPSgKe4y8y4p/ijKauCTPpXu6KpGv+BRwhFt6h
 gMHWmeHI/Z+Ugzjl8WZqISfgSPJoTZTMJEeSAJv0j3SiKb+pSZIej8aviQZBBPtvtT
 aKQoY5p3cVPz8eVNe2JTbVJQ5UPsLZ1bHedoOzrYXMLfzLPWkAJ4fCm+mB12S5Cz6Z
 RVdcmaCOYxagWFpSXxvrEpYD4iiRDlyYOsGR8WJgvqhchHeEg9OeQJjsCi1sDvx6Mz
 GfRMEs7Q2SZnA==
Message-ID: <e9098c25-c591-465e-aab1-c92b22f863fb@benettiengineering.com>
Date: Fri, 23 Oct 2026 16:59:26 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
References: <20261023145524.1751306-1-raphael.melotte@mind.be>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20261023145524.1751306-1-raphael.melotte@mind.be>
X-CMAE-Envelope: MS4xfMvwdZEajz0hLFv07Rlr82h8jV7F9jaHAbwYlmLVODDPDXFdhcd/AwvbGYXvqRJNZ8//Nw4JHsuYwtwun48oJvdsqImQDphf1g4jseMMGaqMHfNngc4j
 jeUWNtQmzJDAfIH1QM+lknhx/W7Mb2BLBHtjad8ngaYEZgokDEspi7n3BoaARsuLRg5I1iLhEd7B39zdsav8zjQOJ22pLxR0kbs8EBKsLHdi3fN2Kv20JF9E
 Rx5kWDDNXj90JCAzc7QtNoLiPH2oZ0NjQnoBSpODnfzTzedSmXGhMKhXhnKpSND2
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: security bump to
 version 3.132
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUmFwaGHDq2wsCgpPbiAxMC8yMy8yNiAxNjo1NSwgUmFwaGHDq2wgTcOpbG90dGUgd3JvdGU6
Cj4gVmVyc2lvbiAzLjEzMiBjb250YWlucyBhIGZpeCBmb3IgdGhlIGVNdWRocmEgaW50ZXJtZWRp
YXRlIENBcyAoWzFdKS4KPiAKPiBGb3IgcmVsZWFzZSBub3RlcyBzaW5jZSAzLjEzMSwgc2VlOgo+
IGh0dHBzOi8vaGctZWRnZS5tb3ppbGxhLm9yZy9wcm9qZWN0cy9uc3MvZmlsZS9OU1NfM18xMzFf
MV9SVE0vZG9jL3NyYy9yZWxlYXNlcy9uc3NfM18xMzFfMS5tZAo+IGh0dHBzOi8vaGctZWRnZS5t
b3ppbGxhLm9yZy9wcm9qZWN0cy9uc3MvZmlsZS9OU1NfM18xMzJfUlRNL2RvYy9zcmMvcmVsZWFz
ZXMvbnNzXzNfMTMyLm1kCj4gCj4gWzFdOiBodHRwczovL2VtdWRocmEud2UtaGF2ZS1hLXByb2Js
ZW0uY29tLwo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1l
bG90dGVAbWluZC5iZT4KCkkgd2FzIGFib3V0IHRvIHNlbmQgdGhlIGlkZW50aWNhbCBwYXRjaCwg
c286ClJldmlld2VkLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVu
Z2luZWVyaW5nLmNvbT4KCkJlc3QgcmVnYXJkcwpHaXVsaW8KCj4gLS0tCj4gICBwYWNrYWdlL2xp
Ym5zcy9saWJuc3MuaGFzaCB8IDQgKystLQo+ICAgcGFja2FnZS9saWJuc3MvbGlibnNzLm1rICAg
fCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJuc3MvbGlibnNzLmhhc2ggYi9wYWNrYWdl
L2xpYm5zcy9saWJuc3MuaGFzaAo+IGluZGV4IDAyYmJjYWYwMGQuLjM3OTIyZjA5NGMgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9saWJuc3MvbGlibnNzLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYm5z
cy9saWJuc3MuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+IC0jIEZyb20gaHR0cHM6Ly9mdHAubW96
aWxsYS5vcmcvcHViL3NlY3VyaXR5L25zcy9yZWxlYXNlcy9OU1NfM18xMzFfUlRNL3NyYy9TSEEy
NTZTVU1TCj4gLXNoYTI1NiAgY2EwMDA1YmM3N2U5MjU1ZDk5NDIxMDNlNmY5NzU2Y2ZlMzExYTNk
ZjcyYWZhOTk4NjA3MDllMzg2ZWIzYzE2NyAgbnNzLTMuMTMxLnRhci5nego+ICsjIEZyb20gaHR0
cHM6Ly9mdHAubW96aWxsYS5vcmcvcHViL3NlY3VyaXR5L25zcy9yZWxlYXNlcy9OU1NfM18xMzJf
UlRNL3NyYy9TSEEyNTZTVU1TCj4gK3NoYTI1NiAgZWU5Y2Y0ODM3YmE4MDExNDFhODA0MzIxYzQ0
NjJhZDhmNDUyZmY0MzE0Mjc1YzZkNTEwOGE2YjA1YWYyMjdmZiAgbnNzLTMuMTMyLnRhci5nego+
ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAgIHNoYTI1NiAgYTIwYzFhMzJkMWY4MTAyNDMyMzYw
YjQyZTkzMjg2OWY3YzExYzdjZGJhY2Y5Y2FjNTU0YzQyMjEzMmFmNDdmNCAgbnNzL0NPUFlJTkcK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJuc3MvbGlibnNzLm1rIGIvcGFja2FnZS9saWJuc3Mv
bGlibnNzLm1rCj4gaW5kZXggNmI0ZTY4YTYyNC4uMjA5NzMwZjZiNSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2xpYm5zcy9saWJuc3MubWsKPiArKysgYi9wYWNrYWdlL2xpYm5zcy9saWJuc3MubWsK
PiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAK
PiAtTElCTlNTX1ZFUlNJT04gPSAzLjEzMQo+ICtMSUJOU1NfVkVSU0lPTiA9IDMuMTMyCj4gICBM
SUJOU1NfU09VUkNFID0gbnNzLSQoTElCTlNTX1ZFUlNJT04pLnRhci5nego+ICAgTElCTlNTX1NJ
VEUgPSBodHRwczovL2Z0cC5tb3ppbGxhLm9yZy9wdWIvbW96aWxsYS5vcmcvc2VjdXJpdHkvbnNz
L3JlbGVhc2VzL05TU18kKHN1YnN0IC4sXywkKExJQk5TU19WRVJTSU9OKSlfUlRNL3NyYwo+ICAg
TElCTlNTX0RJU1RESVIgPSBkaXN0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
