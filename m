Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B96ECA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E25C81360;
	Fri, 29 Aug 2025 08:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ERdlZdTtVwJ; Fri, 29 Aug 2025 08:46:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86BF78222D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86BF78222D;
	Fri, 29 Aug 2025 08:46:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03D2069
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E93DC81496
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utZjTiIPVtjH for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:46:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3522684181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3522684181
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3522684181
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:46:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1916798789; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 08:46:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1urukW-00BAaC-2p;
 Fri, 29 Aug 2025 10:46:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250829071234.695202-1-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 10:46:20 +0200
In-Reply-To: <20250829071234.695202-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 29 Aug 2025 09:12:32
 +0200")
Message-ID: <87jz2mjz1f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=psh33cIghxT8ywsaJsFAP/dMPwZm9y/YhmP0Imhw3KqALzLWXgDb9TNmYDUKQMIODtE1rIEX1kli+sPjQxUoKIscUYarL8RVcdrRn3QlttlaE6bUP979/WMZk4BhjPZ0rNxoZTFdNm3bKnZ/BVepg/OdoeJCEBeDAeEVyVigo7hdLSHCWMuw4oyC8hNFThsbK1RTTikaqPfQoB9cW7HokkgGdfXvwmSbFTznc7EhF0x9MuEjg3br3pD/OeGh9DWewgtmXZ0qzfTH8dhX4wTB6Gjt0Zc4MIonHQUOEParfmk3PEpd9rmmGjX4RPjhUym5B1gG5ZzhpLuDdbiIwDGpeQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=XI0U3NkBqRHtce+qf6ZeKUcA9woQkez6z/JedqH1wHc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=psh33cIg
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xlib_libXt: fix GCC 15.x
 build failure
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

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gRml4ZXM6CiA+IFNoZWxsLmM6IEluIGZ1bmN0
aW9uIOKAmF9YdFNoZWxsQW5jZXN0b3JTZW5zaXRpdmXigJk6CiA+IFNoZWxsLmM6MTAwNToyMDog
ZXJyb3I6IGV4cGVjdGVkIGlkZW50aWZpZXIgb3Ig4oCYKOKAmSBiZWZvcmUg4oCYdHJ1ZeKAmQog
PiAgMTAwNSB8ICAgICBzdGF0aWMgQm9vbGVhbiB0cnVlID0gVHJ1ZTsKID4gICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgXn5+fgogPiBTaGVsbC5jOjEwMDg6MzU6IGVycm9yOiBsdmFsdWUgcmVx
dWlyZWQgYXMgdW5hcnkg4oCYJuKAmSBvcGVyYW5kCiA+ICAxMDA4IHwgICAgICAgICB2YWx1ZS0+
YWRkciA9IChYUG9pbnRlcikgKCZ0cnVlKTsKID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXgoKID4gYnkgYmFja3BvcnRpbmcgYW4gdXBzdHJlYW0gY29tbWl0LgoK
ID4gRml4ZXM6CgogPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy80
MGUyMDIyYTU3MTcwZmQzMmZlOWRlMWZkYzA0MmFiYjk0ODI4OGFmLwoKID4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KClNvcnJ5
LCBhbHJlYWR5IGFwcGxpZWQgV2FsZGVtYXIncyBwYXRjaC4gSSB3aWxsIG1hcmsgdGhpcyBzZXJp
ZXMgYXMKc3VwZXJzZWVkZWQuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
