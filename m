Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E603EC5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 21:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F57A6076B;
	Wed, 26 Aug 2026 21:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59dChHScJJTp; Wed, 26 Aug 2026 21:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787780971;
	bh=oaF2Kf4Szm6jgoFhziaUcjUWVslEmfne7PsSiS6z5Dk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TCCD7acgKRSzFzzZz7BXzV1sMrIks0drhnE0v8Y0gK1ZRG1lzye1CbWjbjYi3I0Pf
	 44AcrzMFAQsHzsDOXsQaeuHcaL3vnR+T3yUVpSmNu9UeTZwJ1IAiz1Ouor5YGrEww+
	 EjoR0AVta9IQd8vZVEWa3GWbhnKqdDm5IBLK9tSuAR8Mt5WgeXUE5LQ7V9wJao5LtP
	 ttsyd36MdezYRQ9WLIL9fTw7aG6vg8RVUDmzLtZRcl9h3v3T6cYaxipEXUONv1Ag/Y
	 1AlG2OSrYMXW5+1p/5LEbZwWdBDNrErTF4sjXR9sMp4tPLpgVCB1NVjofKU0QYQLhy
	 DdrOjyhMHJ1Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D00EE6060E;
	Wed, 26 Aug 2026 21:49:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83EF33A4
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81F014024A
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIWUBiTAvCSz for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 21:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AC3F4009E
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:49:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 250085FFA3;
 Wed, 26 Aug 2026 23:49:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Aug 2026 23:49:26 +0200
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 23:49:26 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <b66264b2-351c-4163-9c99-c1deefd2affd@smile.fr>
References: <20260824184502.676800-1-ju.o@free.fr>
 <b66264b2-351c-4163-9c99-c1deefd2affd@smile.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <4c801cac5a9d1e4b77957245d3286f6a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: php: fix test by
 switching to "Debian" filesystem layout
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

T24gMjYvMDgvMjAyNiAyMjoxMiwgUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4g
SGVsbG8gSnVsaWVuLAo+IAo+IExlIDI0LzA4LzIwMjYgw6AgMjA6NDUsIEp1bGllbiBPbGl2YWlu
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPj4gQnVpbGRyb290IGNvbW1pdCBbMV0gKHBhY2th
Z2UvYXBhY2hlOiB1c2UgIkRlYmlhbiIgZmlsZXN5c3RlbQo+PiBsYXlvdXQgdG8gZml4IHJlYWQt
b25seSByb290ZnMpIGNoYW5nZWQgdGhlIGZpbGVzeXN0ZW0gbGF5b3V0Lgo+PiBUaGlzIGhhZCB0
aGUgZWZmZWN0IG9mIGluc3RhbGxpbmcgZmlsZXMgdG8gZGlmZmVyZW50IGxvY2F0aW9ucwo+PiBh
bmQgYnJlYWtpbmcgdGhlIHRlc3RfcGhwIHJ1bnRpbWUgdGVzdC4KPj4gCj4+IFRoaXMgY29tbWl0
IGZpeGVzIHRoZSBpc3N1ZSBieSB1cGRhdGluZyB0aGUgZmlsZSBwYXRocyB0byB0aGVpcgo+PiBy
aWdodCBsb2NhdGlvbnMuIFRoZSAiaHR0cGQuY29uZiIgd2FzIHVwZGF0ZWQgYnkgZm9sbG93aW5n
IHRoZQo+PiBzYW1lIHJlY2lwZSBkZXNjcmliZWQgaW4gdGhlIGNvbW1lbnQgKHN0YXJ0aW5nIGZy
b20gYSBjb25maWcKPj4gZmlsZSBhcyBpbnN0YWxsZWQgYnkgdGhlIGFwYWNoZSBCdWlsZHJvb3Qg
cGFja2FnZSkuCj4+IAo+PiBGaXhlczoKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8xNjA2MDE1Mjk3OQo+PiAKPj4gWzFdIAo+PiBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMTAwNjY2NmY2N2JhMjgz
N2JhNGNmMTAxNDE4NmYzYjFjYzhmMzQxNQo+IAo+IFRlc3RlZC1ieTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzIGZvciB0ZXN0
aW5nLgoKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
