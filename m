Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD62C36002
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 20:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE0A60F19;
	Sun,  6 Apr 2025 20:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eoR4Q6anEG6; Sun,  6 Apr 2025 20:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E1D60F1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E1D60F1B;
	Sun,  6 Apr 2025 20:14:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 236201DE
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 20:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09806408C9
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 20:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xh6uxJp5tz7T for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 20:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3895F408B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3895F408B4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3895F408B4
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 20:14:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 78FEE780375;
 Sun,  6 Apr 2025 22:14:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Apr 2025 22:14:26 +0200
MIME-Version: 1.0
Date: Sun, 06 Apr 2025 22:14:26 +0200
From: Julien Olivain <ju.o@free.fr>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20250314-fix-m68k-ntpl-uclibc-v1-1-086dff8d713e@yoseli.org>
References: <20250314-fix-m68k-ntpl-uclibc-v1-1-086dff8d713e@yoseli.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <74561b1d0fe0bdaffb6455a22dbd744a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743970467;
 bh=HER1sURZcl9J9w8x3fqUMnvJ7q3U8Zfjolvb853PDQY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EzU/9G8BoWRQB3MVY/wYjDjQHmBu4k5zwBEO2jT1ChmyACzu0iKwtmW3Hxl8x5lVi
 0zz4+J+QrfNHDocZTMlJM4SzvnSGvtGpdwIedpFWjPUzAGgmQuWdZHqqE3UpGUhOVz
 1qWS2GAx3tmZpgFy5OQegMNZSuUfhLCuapsEBNeUaCnpr/cFJrrsG4brG4rh2syKGs
 zEIi3tfZJnHuzDJJKiFkUQnuV4sArA8VJP2TKUYeAAkESXuegzlpdQ1ImooHyC0ctL
 x47r7mX3pDHxpkn8aKAGRDtmL95zPxZ9KnGoIofgSTz047e8oIW8G7XEmhpRXbJKGN
 7Y6nHJgcINrLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EzU/9G8B
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix NPTL alignment on m68k
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

T24gMTQvMDMvMjAyNSAxMDoxNiwgSmVhbi1NaWNoZWwgSGF1dGJvaXMgd3JvdGU6Cj4gVGVzdGVk
IG9uIFFFTVUgdXNpbmcgdGhlIHFlbXVfbTY4a19xODAwX2RlZmNvbmZpZyBjb25maWd1cmF0aW9u
LCB3aXRoIGEKPiBzd2l0Y2ggb2YgIHRoZSB0b29sY2hhaW4gdG8gdWNsaWJjLW5nIGFuZCBlbmFi
bGluZyByc3lzbG9nLgo+IAo+IFRoaXMgcGF0Y2ggYWRkcmVzc2VzIGFuIGlzc3VlIHdoZXJlIHJz
eXNsb2figJlzIHB0aHJlYWRfY29uZF93YWl0IHdhcwo+IGJ1c3ktbG9vcGluZyBkdWUgdG8gZnV0
ZXhfdGltZTY0IHJlcGVhdGVkbHkgcmV0dXJuaW5nIEVJTlZBTC4gVGhlCj4gY29ycmVjdGlvbiBp
biBOUFRMIGFsaWdubWVudCByZXNvbHZlcyB0aGUgMTAwJSBDUFUgdXNhZ2UgcHJvYmxlbS4KPiAK
PiBUaGlzIHBhdGNoIGlzIGZpeGVkIHVwc3RyZWFtIFsxXSBzbyBhcHBseSBpdCB1bnRpbCBpdCBp
cyB0YWdnZWQuCj4gCj4gWzFdOiAyNzhhYzZiMzAgKCJtNjhrOiBmaXggYWxpZ25tZW50IGluIE5Q
VEwgY29kZSIpCj4gCj4gU2lnbmVkLW9mZi1ieTogSmVhbi1NaWNoZWwgSGF1dGJvaXMgPGplYW5t
aWNoZWwuaGF1dGJvaXNAeW9zZWxpLm9yZz4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCkZv
ciBpbmZvLCBJIGZpeGVkIGEgY2hlY2stcGFja2FnZSBlcnJvci4gU2VlOgpodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNTNlYWU5ODZhNWMxNWFmZDBh
ZGU3NDg3NWNlOTZhMWI3MGU3YzUzYgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
