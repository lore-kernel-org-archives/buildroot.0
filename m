Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AED606A864
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d2spH2et
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F0A607FA;
	Wed,  4 Nov 2026 20:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 984NHMEg8dFp; Wed,  4 Nov 2026 20:38:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D91D46080B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793824738;
	b=hot9BUupO3QcmrD+zhyBmqJLGG1Kerp14sg1SPPROnJYRoXg88He2vsUWGhcKewUgMgq
	 PPplzkjV11i/N2uBlC5UyZeEXDghP3D2dvNz23Zz8iNOyuGziOhlAu0H2vaIz8KVAi2OA
	 VbWHpjMVpMc1oozz6zcFkhTLjjyIjCJ6PtA7Ua+KLh2iUMdnnzsqHlMP0u/JE4Jc0A/bI
	 L3mrPKe8rzVoB0hFZj+DCEbaDCTO6fVHOfnpS1mx1MG0JVNyXKCjaNe+ElPH3sKqe0ujt
	 hJvX/CGhAvybfIk0Pd+SdJ5MHaOLmxwvhSpTYlZRswCrDAA1lkRVoBG4ktrB020+Klg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793824738;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=lqgJnhjo0lqI9K+cVWt2qkBH9Df3ifMUmI8WmAS+GnE=;
	b=b+R/0GuERDi7JQc1uFJ5aGrM2GPjmy3jKcWS1SDxWFk5ykwfxUvjgQBaxrCVyLVw5LMW
	 w1BSchz8JjiCAWAIDh8qZuodqGyQm6a4k+Mdo5XWC73ZA8s//Fu0EihWy8JGpQWKtCT3B
	 Yd3jDPYt/a28RY/ktvS2bMduQ0UjNe1pU+BdSFG/RbW8E03Dcub8MmzCQ5DlAE39XAPXP
	 OrrEcgJV0Jj+5T0ZI1pvZxRPCxy/XBe7Him+TVhr92J3TRb9DVVHcePdz5GZvqc6hHxjB
	 SIIb/hrdMfcj9np+Sj/JYl7oqmo5dvtl/t1H1bt2sNQBfFeKjYMwxPKqjTlYq021HTw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793824737;
	bh=lqgJnhjo0lqI9K+cVWt2qkBH9Df3ifMUmI8WmAS+GnE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d2spH2etXv94BLFYWb3ZMlgUQ0GsXAXgH59S2BVqb+E1oJUe87tU18D0McP50oPuB
	 wyg7AT22ANjp9keVWKTXcmdSVzc6Rxa807XRosphI2bWBDAjZTKDGNDsPlHu7IHqri
	 XLl7zHgxYmDZuUWGAAZhfX/S/YkaJJouwNYU0SzQsjJK0WOlWVulW+AAlRlyROYgr8
	 7KkpKff0kSuygjQH9PMkkE5YMuS3oG0xPwW+7LgCNdiSqJsJ4ZzNt2KKseabr8FwiV
	 kv6+nI24vZeyar2Wl79c6hT2fuuwjysCYrIkZlIjgroKjQwPNS1aOQINH6vWjpJhLU
	 ArnH9cQ2EoXZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D91D46080B;
	Wed,  4 Nov 2026 20:38:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D120B6C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83172813D8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jx-wUss_y1Wx for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:38:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 95740813BD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95740813BD
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:38:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1CB9A2003C3;
 Wed,  4 Nov 2026 21:38:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 21:38:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 21:38:50 +0100
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261103-bump_libxmlsec-v1-1-7ddff8f300c1@bootlin.com>
References: <20261103-bump_libxmlsec-v1-1-7ddff8f300c1@bootlin.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <f9c4deff6a706d1010d859696b513bfe@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libxmlsec1: bump to version 1.3.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDMvMTEvMjAyNiAyMDo0MCwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gQ2hhbmdlbG9nIGF2YWlsYWJsZSBhdDoKPiBodHRwczovL2dpdGh1Yi5jb20vbHNoMTIzL3ht
bHNlYy9yZWxlYXNlcy90YWcvMS4zLjEzCj4gCj4gV2hpbGUgYXQgaXQsIHVwZGF0ZSB0aGUgaGFz
aCBmaWxlIHRvIG1lbnRpb24gdGhlIGhhc2ggZm91bmQgaW4gdGhlCj4gcmVsZWFzZSBwYWdlIHJh
dGhlciB0aGFuIG1lbnRpb25pbmcgYSBjb21wdXRlZCBoYXNoLiBUaGUgaGFzaCBmb3IgdGhlCj4g
Q29weXJpZ2h0IGZpbGUgaGFzIGNoYW5nZWQ6IHRoZSBkaWZmIGlzIG9ubHkgYWJvdXQgc29tZSB0
eXBvcyB0aG91Z2gsCj4gc2VlIAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9sc2gxMjMveG1sc2VjL2Nv
bW1pdC9iNmQ2OWMwOWY0YmM1MTg0NWRiZTkwZjBkYTgyYzllYjA0YmQ2NzFlCj4gCj4gVGhlIHYx
LjMuMTMgZG9lcyBub3QgYnVpbGQgaW1tZWRpYXRlbHkgd2l0aG91dCBzb21lIGhlbHA6Cj4gCj4g
LSB0aGUgY29uZmlndXJlIHN0ZXAgZmFpbHMsIGJlY2F1c2UgaXQgZmFpbHMgdG8gYnVpbGQgc29t
ZSB0ZXN0IAo+IHByb2dyYW0uCj4gICBUaGlzIHRlc3QgcHJvZ3JhbSBmYWlscyB0byBidWlsZCBi
ZWNhdXNlIF9GT1JUSUZZX1NPVVJDRSBpcyBkZWZpbmVkCj4gICB0d2ljZSwgaXQgaXMgcGFzc2Vk
IGFzIF9GT1JUSUZZX1NPVVJDRT0xIGJ5IGRlZmF1bHQgYnkgYnVpbGRyb290LCBhbmQKPiAgIHRo
aXMgbmV3IGxpYnhtbHNlYzEgdmVyc2lvbiBoYXMgaGFyZGVuaW5nIGVuYWJsZWQgYnkgZGVmYXVs
dCwgd2hpY2gKPiAgIHNldHMgX0ZPUlRJRllfU09VUkNFPTIuIFRoaXMgaXNzdWUgaXMgZml4ZWQg
YnkgcHJlc2VydmluZyB0aGUgZm9ybWVyCj4gICBiZWhhdmlvciwgaWUgcGFzc2luZyAtLWRpc2Fi
bGUtaGFyZGVuaW5nIGF0IGNvbmZpZ3VyZSB0aW1lLgo+IC0gdGhlIHRvb2xjaGFpbiB3cmFwcGVy
IHJhaXNlcyBhbiBlcnJvciBhYm91dCBzb21lIHN5c3RlbSBoZWFkZXJzIGJlaW5nCj4gICBpbmNs
dWRlZDoKPiAgICAgYWFyY2g2NC1saW51eC1nY2M6IEVSUk9SOiB1bnNhZmUgaGVhZGVyL2xpYnJh
cnkgcGF0aCB1c2VkIGluIFwKPiAgICAgY3Jvc3MtY29tcGlsYXRpb246ICctSS91c3IvaW5jbHVk
ZS94bWxzZWMxJwo+ICAgVGhpcyBlcnJvciBpcyBkdWUgdG8gc29tZSBmdXp6ZXIgcHJvZ3JhbSBu
b3cgYmVpbmcgcGFydCBvZiB0aGUKPiAgIHN0YW5kYXJkIGJ1aWxkLCBhbmQgbWlzc2luZyBzb21l
IGNmbGFncy4gVGhlIGNvcnJlc3BvbmRpbmcgcGF0Y2ggaGFzCj4gICBiZWVuIHNlbnQgYW5kIGlu
dGVncmF0ZWQgdXBzdHJlYW0sIGFuZCBiYWNrcG9ydGVkIGluIHRoaXMgY29tbWl0Cj4gLSBUaGUg
c2FtZSBmdXp6ZXIga2VlcCBvbiB1c2luZyBzb21lIERFUyByZWxhdGVkIEFQSXMgZXZlbiB3aGVu
Cj4gICAtLWRpc2FibGUtZGVzIGlzIHBhc3NlZC4gVGhlIGlzc3VlIGlzIGFscmVhZHkgZml4ZWQg
dXBzdHJlYW0sIHRoaXMKPiAgIGNvbW1pdCBiYWNrcG9ydHMgdGhpcyBwYXRjaCBhcyB3ZWxsLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxp
bi5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
