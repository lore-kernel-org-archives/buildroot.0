Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7CCC5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 16:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FCCD6063F;
	Sat, 22 Aug 2026 16:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPRDrI40tg-0; Sat, 22 Aug 2026 16:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787416779;
	bh=p1RilxFkAUYAFG3g1D6p6reYFUAi96Rb5lbgJlPRnvo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YoEFhlZd377qXXL8Zj7HRMW+4wNk+dkBxBJdgGHJkunZ5XGih8z6VGMby6XgcS0i7
	 xBFk6aYHsYtiLBWgofRZgl65F4fFZ5bQOGy1xNah8+zGHMBH5CayDeuqpE+8RYnlEp
	 Ilyv5GQBsSI2pk8tKEHHb8heR9QkdsxwhNib/Grp6iR1LEnBVBbTLul3bd1iaiUvOY
	 b0POGReDYEPKeNa4rDmo+UpxwTrkJmdP8FI+u6WLiNAB+ZqPnlr8RTu+M47DkbmX5K
	 jSggvUQNroWYcqeBhJ1nvnASFZFd+1p5xJAbFvhDqgPAMls+3yF81eG8ta/E3Jy5+U
	 pczZ6iX7m3y8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4ED60621;
	Sat, 22 Aug 2026 16:39:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56CC129B
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CB5E4056E
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erElCQ-AhPkH for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 16:39:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C2BC40563
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 16:39:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 253A913F86E;
 Sat, 22 Aug 2026 18:39:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Aug 2026 18:39:32 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 18:39:32 +0200
To: Stefan Mueller <stemu86@gmx.ch>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260820092940.525268-1-stemu86@gmx.ch>
References: <20260820092940.525268-1-stemu86@gmx.ch>
User-Agent: Webmail Free/1.6.18
Message-ID: <9dce673a06bb6b537088f88e15e476cc@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/wget: fix CVE-2026-58469
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

T24gMjAvMDgvMjAyNiAxMToyOSwgU3RlZmFuIE11ZWxsZXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGcm9tOiBTdGVmYW4gTcO8bGxlciA8c3RlbXU4NkBnbXguY2g+Cj4gCj4gQmFja3BvcnQgdGhl
IHVwc3RyZWFtIGZpeCBmb3IgYSBidWZmZXIgdW5kZXJmbG93IGluIAo+IGNsZWFuX21ldGFsaW5r
X3N0cmluZygpLCB0b2dldGhlciB3aXRoIHRoZSB0d28gcmVxdWlyZWQgZm9sbG93LXVwIGZpeGVz
IAo+IGZvciB0aGUgaW52ZXJ0ZWQgd2hpdGVzcGFjZSBjaGVjayBhbmQgbWlzc2luZyBjdHlwZS5o
IGluY2x1ZGUuCj4gCj4gQmFja3BvcnQgdG86IDIwMjUuMDIueAo+IAo+IFNpZ25lZC1vZmYtYnk6
IFN0ZWZhbiBNw7xsbGVyIDxzdGVtdTg2QGdteC5jaD4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MuCgpJbiB0aGUgZnV0dXJlLCBjb3VsZCB5b3Ugc2VuZCBwYXRjaCBzZXJpZXMsIHBsZWFzZT8K
CkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
