Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B27CC369CA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE19605F7;
	Wed, 16 Apr 2025 21:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4hUdwgYNvk3; Wed, 16 Apr 2025 21:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63FBC60BBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63FBC60BBA;
	Wed, 16 Apr 2025 21:35:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E76C6B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 451D440AED
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Fs6fRUrcq0S for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E4F64013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E4F64013C
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E4F64013C
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:35:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 71E9E1C00C0; Wed, 16 Apr 2025 23:35:54 +0200 (CEST)
Message-ID: <3296b75c-75a0-48dd-afe1-bd0b0b7b1901@rnout.be>
Date: Wed, 16 Apr 2025 23:35:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com
References: <20250412091936.1251605-1-dario.binacchi@amarulasolutions.com>
 <20250412091936.1251605-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20250412091936.1251605-2-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744839354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=XXA2+JGrBe5LBYSJju7of12IPxLsOYmON/4fx1H+K6I=;
 b=CygSUENwvxD562Nyu7URKCMLmXw69/4XmLyJGa1eQhNLYbFBNVjUyaiyWcVGVTOIpIU+H0
 6jxbcKEdzR0isaT0XLpplDaJPDimNVsj9xs3xsOeyvA5fYvgoXm+aBeXF61vgmSnKlsieB
 2CWdY605CVBP4fiALaTbXDkKY7HHwlgl8PgHE8uBo/cU+WxLtEas3brLnVvgZ8mBCMd9ck
 LyACDYZn+tHd3hfClerC7BILgvKMQd3UdmeMPPmys0ZQl1aODCx6hCPv/xMd0NRFtdZFzA
 GdWjhoiq7j8uhmQS5GD1+tVw9EaTzVEi6xaRcaScE4Xj74NCAEdSqeo6kArX6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for
 ti-k3-boot-firmware
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

Ck9uIDEyLzA0LzIwMjUgMTE6MTksIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4K
CiDCoEFwcGxpZWQgdG/CoDIwMjUuMDIueCwgMjAyNC4xMS54IGFuZCAyMDI0LjAyLngsIHRoYW5r
cy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAgIERFVkVMT1BFUlMgfCAxICsKPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BF
UlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggMWM4NGY5NTk0MzVhLi4wZDc4NDFlYjk0OGIgMTAwNjQ0
Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtNzk0LDYgKzc5NCw3
IEBAIE46CURhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNv
bT4KPiAgIEY6CWJvYXJkL2JzaC8KPiAgIEY6CWJvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0z
MmY3NDYtZGlzY28vCj4gICBGOglib2FyZC9zdG1pY3JvZWxlY3Ryb25pY3Mvc3RtMzJmNzY5LWRp
c2NvLwo+ICtGOglib290L3RpLWszLWJvb3QtZmlybXdhcmUvCj4gICBGOgljb25maWdzL2lteDZ1
bHpfYnNoX3NtbV9tMl9kZWZjb25maWcKPiAgIEY6CWNvbmZpZ3MvaW14OG1uX2JzaF9zbW1fczJf
ZGVmY29uZmlnCj4gICBGOgljb25maWdzL2lteDhtbl9ic2hfc21tX3MyX3Byb19kZWZjb25maWcK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
