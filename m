Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B475CA5FA5
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 05:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83DFC40640;
	Thu,  1 Oct 2026 05:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpuKrzxuSgfZ; Thu,  1 Oct 2026 05:54:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8900C40BD6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790834071;
	b=juV6yxs7jWeN957JIb95CZQALdfMfCx9nRyHAuB1JTPz9DgMVcBF1bzop57nSadGpBFj
	 /ZzqRlIjo1Ig9HcLPTf4JUwnAlZ1HtB53XE3OLX78kq5bA4piYbTjNc1FmpqDwSJgf15+
	 sFLswrkcInt6XKIInZcmvXuIbQLzBLhoMnp8xz2LXvkB/87/vEYKgn66uv6AOQzx3u9rz
	 K9eOV/x7S3tKpWL0M/SHulpMDpgc53SkR4q/1Gfn8nM+z9TC1+YqGf5APlRG9qU1FGBUL
	 YxLVrm7/BFCHnEAQscdL5UDum0sr4+EBMPuX2I3u6Lwde2z5P/5+u7NKHTjoBoQizeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790834071;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zdBC01nAQS3A9/SO11s1nvalU8zyrFMbFfZO0ZQFMiE=;
	b=KUflS8U/+pRDCcq/UajOZd2u0tJQAp1C2PGbV7KkgUJKjE47nSZ7OD44Q+/ofw7U0qA/
	 qjP6A+7z5gm8zx+xi53SeOowj01OKlfhmN6Bs6IWiTIX3md/nXwLnH7EDdp8AaLG+O/NB
	 EwG1sv8xW1fe08ieIi94J8PhgncdB/ceo5Jux0qZQBdyegdWczbfE9xVCqEpPZX9Nx2lZ
	 IjTtmwVW3tCtpYaseY23fbm8Au/DvJEsuYKg3g9U/3Zftk96yRYvi0YBAbSvrS+p+fblq
	 bWrhRjmhVbja+VYJqNyaZAC6iu0z3CwxEdRwdhHcL4OcXN3WwvbWJEmA5uWc1EPSV5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790834071;
	bh=zdBC01nAQS3A9/SO11s1nvalU8zyrFMbFfZO0ZQFMiE=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aRoLwAZkF/5O1hi0RNczlT46WI5fAgAubE01dbCB7vzSNn8njlj6Y1u+9fGkLHD/E
	 RgSKwtSAaAQ147EL1dH9ELN/ilW3h2Gyj0Hw5GVcrpsvRuwEWHJGkouuW1e6e3QtgG
	 aHSxg22qUTL3tjsXNlQuHigv0/WM2aIOdwvkltCPJesSjPAkByOFPZuflyLD9Zi/M+
	 Py8BXt4p9JmhzPRfEJ9d8ggxAJ4EuxnQ8GPhRfzZrrYChCbbXTMbf84TXGC/l4txu0
	 K+8y+mbV8r8Hevm61nE0AvjRFDpALXi8eHmDADhmjh7zBty/QyhuUcbg+dlwrZEaSm
	 T9+x6qaKbNaiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8900C40BD6;
	Thu,  1 Oct 2026 05:54:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9036A3AC
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 05:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 754C080C73
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 05:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvirAA2PiM3R for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 05:52:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 41A5A80AE6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790833972;
 b=Jh7JFnMpXvz7ok1my80fOkdj/hS/ru1sCmYhNRFJ05sDjIGw1HGvwgiHwaJj1u2k82m+
 XOOR6tJ7kt6n21/vplnpj2hawV0rwsOhRq+nsfB3EzjkJgNVfil8P1x2ZYU01c9WrXYGP
 fix9jneZy+DotOK4L2pLgXWUrU2G6KL56Ew6FJ4reRYlqEvrfm5ga2JdP1vMxQHJBLsRy
 XupMGh+QTWTqX3nFD60tAJzP/Z9CwsTEq22fAqjQsz7V63aXrWL2LctPRdLv7SpMnxfdJ
 NWKJcpAX5hHJEopLX6TI9svy8NS92OKXV1nNRVgFn5RkMfn8g+hGSyBOC31nKkRD9nw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790833972;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To:X-Operating-System;
 bh=zZ0FPI1Ep5Uefu10Vyjz6KsCsYPJ2R+uoRXlZAwkKTc=;
 b=POyvd+ZG3/x5OE/4csqpLs9NN8z4xLWVisU00q8Tl62BvdnPIVqYH973TtMn3hxlTEpN
 E4ARBuj1J1bOGSNfNDUNovBTPiq9zs5MaC3yxOGze+REiFE8jCqHbiYLZPfFkB0d8u3au
 rARVK7C8D/rKbsENvDYfThrasF9wA7nFJvuhvth5JdIM3Rur8BUT1J9/SQUkyYkpBmKIv
 k65yyysucNa/8QtIJU71ijToWOsxn2kH7+H492wRDBtjm3ZXfNhuabeCwgIOjI5fyaf8n
 gK7AgDEZ7n45xz3go3odKlO5oB9/r+cGXmB+cxSPdPuLAalioja+/K+94vkrr19Nk3Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41A5A80AE6
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 05:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1790833969; bh=54d1QxmUjSB9yVncC7dktnmSDhelaCh3IGrxaNnPToU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XgfrOS7tzm6O1/2qhBrzlCNNeqtE/Drz9OgzCeWo8qMjaq+hkNns+YBQDweNeaSTg
 zzwF38gAoiTJWr+LwZR9yU7BV/ZUt9CVdxb1ETbRwkQ0gAU0grrcngOF90KeEnb/vR
 3GoDhbyn0m4jixvc4XEx+NhCXJXK4ppwd66fI5qu+3waQDpIMKPDsK23vOTwrG/Zuk
 DA8pWR7hngOKMrWqAMopN+vXfQWzv6zrobhTfmLx+21JY5eazzt+G2UC14ABhy2Lzv
 VT9vHESBHGqTsZJc6MyXK6RRaMi4uVGNtUVESgyjEzA8v+1Xm98b7qB35m5+FOGqPL
 sPx2GrdO3ekFw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C198731E0AF6; Thu, 01 Oct 2026 07:52:48 +0200 (CEST)
Date: Thu, 1 Oct 2026 07:52:48 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <ar31MOefHRDMsx46@waldemar-brodkorb.de>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
 <20260930120101.474560-2-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260930120101.474560-2-raphael.melotte@mind.be>
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH 2/2] package/mupdf,
 python-pymupdf: bump to versions 1.28.5 and 1.28.2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksClJhcGhhw6tsIE3DqWxvdHRlIHZpYSBidWlsZHJvb3Qgd3JvdGUsCgo+IFJlbGVhc2Ugbm90
ZXM6Cj4gaHR0cHM6Ly9tdXBkZi5jb20vcmVsZWFzZXMKPiBodHRwczovL3B5bXVwZGYucmVhZHRo
ZWRvY3MuaW8vZW4vbGF0ZXN0L2NoYW5nZXMuaHRtbAo+IAo+IE5vdGUgdGhhdCB0aGlzIGJ1bXAg
Zml4ZXMgbXVsdGlwbGUgc2VjdXJpdHkgdnVsbmVyYWJpbGl0aWVzLCBhbmQgYXQKPiBsZWFzdCB0
aGUgZm9sbG93aW5nIG9uZXM6Cj4gLSBDVkUtMjAyNS00NjIwNgo+IC0gQ1ZFLTIwMjUtNzEzODIK
PiAtIENWRS0yMDI2LTcyMzMKPiAtIENWRS0yMDI2LTQwNTA1Cj4gCj4gV2l0aCB0aGlzIG5ldyBw
eXRob24tcHltdXBkZiAoYW5kIG11cGRmKSB2ZXJzaW9uLCB3ZSBjYW4gbm8gbG9uZ2VyCj4gYnVp
bGQgdGhlIG9sZCBpbXBsZW1lbnRhdGlvbiAodGhlICdhJyBpbXBsZW1lbnRhdGlvbikuICBXZSBu
b3cgbmVlZCB0bwo+IGJ1aWxkIG11cGRmJ3MgcHl0aG9uIGJpbmRpbmcsIHdoaWNoIHJlcXVpcmUg
aG9zdC1jbGFuZyAoYW5kIGl0cyBweXRob24KPiBiaW5kaW5ncykgdG8gYmUgYnVpbHQuCj4gCj4g
QWxzbyBub3RlIHRoYXQgcHl0aG9uLW11cGRmJ3MgdmVyc2lvbiBzdGlsbCBuZWVkcyB0byBzdGF5
IGNsb3NlIHRvCj4gbXVwZGYncyB2ZXJzaW9uLCB0aGV5IGNhbiBvbmx5IGJlIHVwZGF0ZWQgdG9n
ZXRoZXIuCj4gCj4gQSBudW1iZXIgb2YgbXVwZGYgcGF0Y2hlcyB3ZXJlIG5lZWRlZDoKPiAtIFRv
IGFsbG93IGNoYW5naW5nIHRoZSBidWlsZC10aW1lIGxvZyBsZXZlbCBmcm9tIGFuIGVudmlyb25t
ZW50Cj4gdmFyaWFibGUuCj4gLSBUbyBiZSBhYmxlIHRvIHByb3ZpZGUgdGhlIGxpYmNsYW5nIGlu
Y2x1ZGUgZGlyZWN0b3JpZXMuIFRoaXMgaXMKPiBuZWVkZWQgYmVjYXVzZSBvdXIgZGVmYXVsdCBs
aWJjbGFuZyBpbmNsdWRlIGRpcmVjdG9yaWVzIGFyZSBub3QKPiBwcm9wZXJseSBzZXQuCj4gLSBU
byBiZSBhYmxlIHRvIGxpbmsgYWdhaW5zdCBtdXBkZiB3aXRoIG5vIHZlcnNpb25pbmcgbnVtYmVy
Lgo+IC0gVG8gZml4IGJ1aWxkIGVycm9ycyB3aGVuIGdlbmVyYXRpbmcgdGhlIHB5dGhvbiBiaW5k
aW5ncyBmb3IKPiBweXRob24tcHltdXBkZiB3aXRoIGNsYW5nIDIyLgo+IC0gVG8gZml4IGJ1aWxk
IGVycm9ycyB3aXRoIHVDbGliYy4KPiAtIFRvIG1ha2UgaXQgcG9zc2libGUgdG8gYnVpbGQgd2l0
aG91dCBhIHZlbnYuCj4gCj4gcHl0aG9uLXB5bXVwZGYgYWxzbyBuZWVkZWQgYSAoYmFja3BvcnRl
ZCkgcGF0Y2ggdG8gZml4IGJ1aWxkaW5nIHdpdGgKPiBzd2lnIDQuNSsuCj4gCj4gSW4gbXVwZGYs
IHNldHRpbmcgSkxJQl9sb2dfbGV2ZWxzIGlzIG5vdCBzdHJpY3RseSBuZWNlc3NhcnksIGJ1dCBp
dAo+IGdyZWF0bHkgaGVscHMgZGVidWdnaW5nIGJ1aWxkIGlzc3Vlcy4gSXQgYWxzbyBvbmx5IGhh
cyBhbiBpbXBhY3QgYXQKPiBidWlsZCB0aW1lIGFueXdheS4gVG8gbWFrZSBpdCBlYXNpZXIgdG8g
ZGVidWcgcG90ZW50aWFsIGZ1dHVyZSBDSQo+IGJ1aWxkIGZhaWx1cmVzLCB3ZSBlbmFibGUgaXQg
dW5jb25kaXRpb25hbGx5Lgo+IGJyb3RsaSBpcyBhbHNvIGFkZGVkIGFzIGEgbmV3IG9wdGlvbmFs
IGRlcGVuZGVuY3ksIHN1cHBvcnRlZCBzaW5jZQo+IG11cGRmIHYxLjI2LjAuCj4gU3RhcnRpbmcg
ZnJvbSB2ZXJzaW9uIDEuMjguMSBwaXBjbCBpcyBubyBsb25nZXIgYnVuZGxlZCBhbmQgbmVlZHMg
dG8KPiBiZSBpbnN0YWxsZWQgc2VwYXJhdGVseSwgc28gYWRkIGhvc3QtcHl0aG9uLXBpcGNsIHdo
ZW4gd2UgYnVpbGQgdGhlCj4gcHl0aG9uIGJpbmRpbmdzLgo+IFN0YXJ0aW5nIGZyb20gdmVyc2lv
biAxLjI4LjIsIG11cGRmIGFkZGVkIHRoZSB1bmNvbmRpdGlvbmFsIHVzZSBvZiBhCj4gdmVudiwg
c28gZGlzYWJsZSBpdCB3aXRoIE1VUERGX05PX0FVVE9WRU5WLgo+IAo+IEluIHB5dGhvbi1weW11
cGRmLCAhQlIyX1NUQVRJQ19MSUJTIGlzIG5vdyByZXF1aXJlZCBieSBtdXBkZiBhbnl3YXksCj4g
c28gdXBkYXRlIHRoZSBjb21tZW50IGFjY29yZGluZ2x5Lgo+IHBpcGNsIChyZXF1aXJlZCB0byBi
dWlsZCBweXRob24tcHltdXBkZikgdXNlZCB0byBiZSBidW5kbGVkIGluCj4gcHl0aG9uLXB5bXVw
ZGYgYnV0IGlzIG5vdyBhdmFpbGFibGUgYXMgYSBzZXBhcmF0ZSBwYWNrYWdlLCBzbyB1c2UKPiBp
dC4gVGhpcyBhbHNvIGFsbG93cyB1cyB0byB1c2UgJ3BlcDUxNycgYXMgdGhlIHNldHVwIHR5cGUu
Cj4gVGhlIHRlc3QgaXMgYWxzbyB1cGRhdGVkIHRvIHVzZSB0aGUgbmV3IGltcGxlbWVudGF0aW9u
Lgo+IAo+IEZvciBib3RoIHBhY2thZ2VzLCB0aGUgcGF0Y2hlcyB0aGF0IGFyZSBub3cgdXBzdHJl
YW0gYXJlIGFsc28gcmVtb3ZlZC4KPiAKPiBUaGUgdGFyYmFsbCBmaWxlbmFtZSBmb3IgcHl0aG9u
LXB5bXVwZGYgaGFzIGNoYW5nZWQgdXBzdHJlYW0gc28gaXQgaXMKPiBhbHNvIHVwZGF0ZWQgYWNj
b3JkaW5nbHkuCj4gCj4gVGhlc2UgbmV3IHZlcnNpb25zIG5vIGxvbmdlciBmaXQgaW4gdGhlIDEy
ME0gcm9vdGZzIGNvbmZpZ3VyZWQgZm9yIHRoZQo+IHJ1bnRpbWUgdGVzdCwgc28gZG91YmxlIGl0
cyBzaXplLgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLiBJIHdhcyBvbmNlIHRyeWluZyB0byBkbyBh
biB1cGRhdGUgbXlzZWxmIGFuZApmYWlsZWQgdG8gZ2V0IHB5dGhvbi1weW11cGRmIHRvIGNvbXBp
bGUuIFRoZXkgY2hhbmdlZCBzbyBtdWNoIGluCnRoZWlyIG5ldyB2ZXJzaW9uLiBHcmVhdCB3b3Jr
IQoKWW91IGNhbiBhZGQgbXkgClRlc3RlZC1CeTogV2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVu
YWRrLm9yZz4KClRlc3RlZCBtdXBkZi14MTEgaW4gZmx1eGJveCB3aXRoIHFlbXUtc3lzdGVtLXg4
Nl82NCBhbmQgZ2xpYmMKdG9vbGNoYWluLgogCj4gVGhlIG11cGRmIGJ1aWxkcyBhcmUgcXVpdGUg
ZmluaWNreSBvbiBhdCBsZWFzdCBzd2lnIGFuZCBsaWJjbGFuZwo+IHZlcnNpb25zLCBzbyBhcHBs
eWluZyB0aGVzZSBjaGFuZ2VzIG9uIHRoZSBCdWlsZHJvb3QgTFRTIGJyYW5jaGVzCj4gc2hvdWxk
IG9ubHkgYmUgZG9uZSB3aXRoIGNhcmVmdWwgY29uc2lkZXJhdGlvbiAoYW5kIG1ha2luZyBzdXJl
IHRoYXQKPiBpdCBidWlsZHMgYW5kIHBhc3NlcyB0aGUgcnVudGltZSB0ZXN0KS4KCkkgdHJpZWQg
dGhlIHVwZGF0ZSBmb3IgMjAyNS4wMiwgYnV0IGdldDoKCi4vc2NyaXB0cy9tdXBkZndyYXAucHkg
IC1kIGJ1aWxkL3NoYXJlZC1yZWxlYXNlIC1iIDAxCigrMC4wcyk6IGpsaWIucHk6MzcxOmxvZ19s
ZXZlbHNfYWRkOiBhZGRpbmcgbGV2ZWw6IGZpbGVuYW1lX3ByZWZpeD0nLycgZnVuY3Rpb25fcHJl
Zml4PScnCigrMC4wcyk6IHBhcnNlLnB5OjE2Ojxtb2R1bGU+OiBXYXJuaW5nLCBjb3VsZCBub3Qg
aW1wb3J0IGNsYW5nOiBObyBtb2R1bGUgbmFtZWQgJ2NsYW5nJwooKzAuMHMpOiBzdGF0ZS5weToy
MTo8bW9kdWxlPjogV2FybmluZzogZmFpbGVkIHRvIGltcG9ydCBjbGFuZy5jaW5kZXg6IGU9TW9k
dWxlTm90Rm91bmRFcnJvcigiTm8gbW9kdWxlIG5hbWVkICdjbGFuZyciKQooKzAuMHMpOiBzdGF0
ZS5weToyMTo8bW9kdWxlPjogV2UgbmVlZCBDbGFuZyBQeXRob24gdG8gYnVpbGQgTXVQREYgcHl0
aG9uLgooKzAuMHMpOiBzdGF0ZS5weToyMTo8bW9kdWxlPjogSW5zdGFsbCB3aXRoIGBwaXAgaW5z
dGFsbCBsaWJjbGFuZ2AgKHR5cGljYWxseSBpbnNpZGUgYSBQeXRob24gdmVudiksCgpTbyBhZGRp
bmcgaXQgdG8gTFRTIHdpbGwgYmUgY2hhbGxlbmdpbmcgYWdhaW4gSSB0aGluay4KCmJlc3QgcmVn
YXJkcwogV2FsZGVtYXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
