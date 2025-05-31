Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836E0C5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E59D832DB;
	Tue,  3 Jun 2025 06:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbT7X1RYias8; Tue,  3 Jun 2025 06:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AC308346C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AC308346C;
	Tue,  3 Jun 2025 06:22:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46277DA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 420986158A
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkIOZIoW6gBD for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:22:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4955C61573
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4955C61573
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4955C61573
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E1941C1413; Tue,  3 Jun 2025 08:22:13 +0200 (CEST)
Message-ID: <dc6142f6-cb6e-470b-b79b-50ff83f553eb@rnout.be>
Date: Sat, 31 May 2025 19:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>,
 buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240731145754.330678-1-gael.portay@rtone.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20240731145754.330678-1-gael.portay@rtone.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1knjHxFonuUfgj+eB8qCI2pbFSopmuCj2ujUKwtEY3I=;
 b=kmWl8gh1Y2tjUBqUNLWDJ0LrmTBLYuUxW5SE1YbO3EW4QHutiMOWDn1rmC3LWWcfvIHfeh
 wkGr9o37Z/c5l4EYTkDKl8mn7ZN0AI1zL3Br1hh5e0TQbJHQdIM0Wnc2BkE0laOVrQccUL
 BuZmmqi5gyzo1KiKcHH3lyBkD6xv0zfS9dD+k/drq7GYlbEBedL4BI58IrfKinBki03S6P
 WTP4Z2RPznH/c3Yo3RECf2vh5ynqYjlWPkCQbsrgvs1bwmT7J12p8wNnaa4+gnWuOaEIYx
 6IQDTnLlppwg5dtOiQJ//gzR9Zrr8j9hw6MnnQ7k+c1T7n9Q/7H9T0UGxmQl6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kmWl8gh1
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5webengine: add missing opus
 dependency
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAzMS8wNy8yMDI0IDE2OjU3LCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4gVGhlIHBhY2thZ2Ug
b3B1cyBpcyBzZWxlY3RlZCBidXQgaXQgaXMgbm90IGxpc3RlZCBpbiB0aGUgZGVwZW5kZW5jaWVz
Lgo+IAo+IFRoaXMgYWRkcyBvcHVzIHRvIFFUNVdFQkVOR0lORV9ERVBFTkRFTkNJRVMuCj4gCj4g
Rml4ZXM6Cj4gCj4gCSQgbWFrZSBxdDV3ZWJlbmdpbmUKPiAJKC4uLikKPiAJRVJST1I6IEZlYXR1
cmUgJ3dlYmVuZ2luZS1zeXN0ZW0tb3B1cycgd2FzIGVuYWJsZWQsIGJ1dCB0aGUgcHJlLWNvbmRp
dGlvbiAnY29uZmlnLnVuaXggJiYgbGlicy53ZWJlbmdpbmUtb3B1cycgZmFpbGVkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+CgogIEFwcGxp
ZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAg
cGFja2FnZS9xdDUvcXQ1d2ViZW5naW5lL3F0NXdlYmVuZ2luZS5tayB8IDEgKwo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0
NXdlYmVuZ2luZS9xdDV3ZWJlbmdpbmUubWsgYi9wYWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUvcXQ1
d2ViZW5naW5lLm1rCj4gaW5kZXggNTI5YTgzZGY2Yy4uZjg0ZjA1NmU5NCAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUvcXQ1d2ViZW5naW5lLm1rCj4gKysrIGIvcGFja2Fn
ZS9xdDUvcXQ1d2ViZW5naW5lL3F0NXdlYmVuZ2luZS5tawo+IEBAIC03OCw2ICs3OCw3IEBAIFFU
NVdFQkVOR0lORV9ERVBFTkRFTkNJRVMgKz0gXAo+ICAgCWxpYnZweCBcCj4gICAJbGlieG1sMiBc
Cj4gICAJbGlieHNsdCBcCj4gKwlvcHVzIFwKPiAgIAlzbmFwcHkgXAo+ICAgCXdlYnAKPiAgIAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
