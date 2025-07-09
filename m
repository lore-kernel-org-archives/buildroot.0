Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E29C83F03
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 18:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 474DC409B1;
	Wed,  9 Jul 2025 18:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7JL6aV4ZYt3y; Wed,  9 Jul 2025 18:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59486405F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59486405F0;
	Wed,  9 Jul 2025 18:52:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38A5012E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 18:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F3F680C48
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 18:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rh4VYf0ShqCq for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 18:52:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33B0B80C19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33B0B80C19
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33B0B80C19
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 18:52:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C26FF2003B4;
 Wed,  9 Jul 2025 20:52:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Jul 2025 20:52:47 +0200
MIME-Version: 1.0
Date: Wed, 09 Jul 2025 20:52:47 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250708113328.2269438-1-titouan.christophe@mind.be>
References: <20250708113328.2269438-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <8a7d80892bf03ab3e732d0214a43b1f3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752087168;
 bh=2yl4w6jjySFHwA6bV6Q62ruDw96Z8JhCHH/onYNqcdc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pG848Zzf+frVJsAHMLYdNW7jhQdm3pwwVYhkKvIUGWMfQZlmo5G1gqzunQDX0OPLF
 ZAxuHBGfDYGEm0FTLXRP50VfF3K6/Ur1KQnK9fZe0euDe8IWG5U/lbzVCl7knYaiwZ
 P0tB+5+c6tHo+Mo2abDOIqy1T5BUxeaRAo7PzV3BFqoYVZijcfzUuEhnfBq2igbSPJ
 1CtowZMbvOK3XvpomC6BWlN7AY3HP5Dijp+RHkomhKFFpZneHBHWXzctg18s4tAIqc
 GM5el0/sI2cbvF0LkNhwEWH/hvxVgi/pNWjfMeYUBxNYY5fnOcYSGTDad+/A8NHNaw
 teFoSIxWnF1Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pG848Zzf
Subject: Re: [Buildroot] [PATCH] package/sngrep: security bump to v1.8.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDgvMDcvMjAyNSAxMzozMywgVGl0b3VhbiBDaHJpc3RvcGhlIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gU2VlIHRoZSByZWxlYXNlIG5vdGVzOgo+IAo+IC0gaHR0cHM6Ly9naXRodWIuY29tL2ly
b250ZWMvc25ncmVwL3JlbGVhc2VzL3RhZy92MS43LjAKPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9p
cm9udGVjL3NuZ3JlcC9yZWxlYXNlcy90YWcvdjEuOC4wCj4gLSBodHRwczovL2dpdGh1Yi5jb20v
aXJvbnRlYy9zbmdyZXAvcmVsZWFzZXMvdGFnL3YxLjguMQo+IC0gaHR0cHM6Ly9naXRodWIuY29t
L2lyb250ZWMvc25ncmVwL3JlbGVhc2VzL3RhZy92MS44LjIKPiAKPiBUaGlzIGZpeGVzIHRoZSBm
b2xsb3dpbmcgdnVsbmVyYWJpbGl0aWVzOgo+IAo+IC0gQ1ZFLTIwMjQtMzExOToKPiAgICAgQSBi
dWZmZXIgb3ZlcmZsb3cgdnVsbmVyYWJpbGl0eSBleGlzdHMgaW4gYWxsIHZlcnNpb25zIG9mIHNu
Z3JlcCAKPiBzaW5jZQo+ICAgICB2MC40LjIsIGR1ZSB0byBpbXByb3BlciBoYW5kbGluZyBvZiAn
Q2FsbC1JRCcgYW5kICdYLUNhbGwtSUQnIFNJUAo+ICAgICBoZWFkZXJzLiBUaGUgZnVuY3Rpb25z
IHNpcF9nZXRfY2FsbGlkIGFuZCBzaXBfZ2V0X3hjYWxsaWQgaW4gc2lwLmMgCj4gdXNlCj4gICAg
IHRoZSBzdHJuY3B5IGZ1bmN0aW9uIHRvIGNvcHkgaGVhZGVyIGNvbnRlbnRzIGludG8gZml4ZWQt
c2l6ZSAKPiBidWZmZXJzCj4gICAgIHdpdGhvdXQgY2hlY2tpbmcgdGhlIGRhdGEgbGVuZ3RoLiBU
aGlzIGZsYXcgYWxsb3dzIHJlbW90ZSBhdHRhY2tlcnMgCj4gdG8KPiAgICAgZXhlY3V0ZSBhcmJp
dHJhcnkgY29kZSBvciBjYXVzZSBhIGRlbmlhbCBvZiBzZXJ2aWNlIChEb1MpIHRocm91Z2gKPiAg
ICAgc3BlY2lhbGx5IGNyYWZ0ZWQgU0lQIG1lc3NhZ2VzLgo+ICAgICBodHRwczovL3d3dy5jdmUu
b3JnL0NWRVJlY29yZD9pZD1DVkUtMjAyNC0zMTE5Cj4gCj4gLSBDVkUtMjAyNC0zMTIwOgo+ICAg
ICBBIHN0YWNrLWJ1ZmZlciBvdmVyZmxvdyB2dWxuZXJhYmlsaXR5IGV4aXN0cyBpbiBhbGwgdmVy
c2lvbnMgb2YgCj4gc25ncmVwCj4gICAgIHNpbmNlIHYxLjQuMS4gVGhlIGZsYXcgaXMgZHVlIHRv
IGluYWRlcXVhdGUgYm91bmRzIGNoZWNraW5nIHdoZW4KPiAgICAgY29weWluZyAnQ29udGVudC1M
ZW5ndGgnIGFuZCAnV2FybmluZycgaGVhZGVycyBpbnRvIGZpeGVkLXNpemUgCj4gYnVmZmVycwo+
ICAgICBpbiB0aGUgc2lwX3ZhbGlkYXRlX3BhY2tldCBhbmQgc2lwX3BhcnNlX2V4dHJhX2hlYWRl
cnMgZnVuY3Rpb25zCj4gICAgIHdpdGhpbiBzcmMvc2lwLmMuIFRoaXMgdnVsbmVyYWJpbGl0eSBh
bGxvd3MgcmVtb3RlIGF0dGFja2VycyB0bwo+ICAgICBleGVjdXRlIGFyYml0cmFyeSBjb2RlIG9y
IGNhdXNlIGEgZGVuaWFsIG9mIHNlcnZpY2UgKERvUykgdmlhIAo+IGNyYWZ0ZWQKPiAgICAgU0lQ
wqBtZXNzYWdlcy4KPiAgICAgaHR0cHM6Ly93d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIw
MjQtMzEyMAo+IAo+IFNpZ25lZC1vZmYtYnk6IFRpdG91YW4gQ2hyaXN0b3BoZSA8dGl0b3Vhbi5j
aHJpc3RvcGhlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
