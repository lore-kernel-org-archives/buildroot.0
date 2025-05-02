Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E530AC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4CE681EFD;
	Fri,  2 May 2025 10:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QYYeqbpJTUT; Fri,  2 May 2025 10:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6D8F8136E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D8F8136E;
	Fri,  2 May 2025 10:49:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF331229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC71340918
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4Hi4Vw5W-xy for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4727640906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4727640906
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4727640906
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:49:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 758A51C0D8C; Fri,  2 May 2025 12:49:27 +0200 (CEST)
Message-ID: <202a5027-38ae-410e-9dfd-dd48abb5e8dc@rnout.be>
Date: Fri, 2 May 2025 12:49:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
References: <20250417124124.1911199-1-gael.portay+rtone@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250417124124.1911199-1-gael.portay+rtone@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182967; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5mn+l6lCsdSmYVOGPenuwSfznBreWx839+R912CLjyA=;
 b=k7MKF4Zuk+m5zl4L0/Y8kJELAKIE60uOFrRHdG1ATlFjWnZE7rTAt5HypdX7wXdWmGrGk6
 8Z2pMRRCKSY3RlOv6z0ndezP7y91d35c6lz9dgdtKOyNiCZVsLtUg55JWf/mYqGZCsh/uU
 NgJqvlJfuBONY3Po4f7zcN80IswSqAHQX1GiIAPlpvGfl3YobJTMCRE/QYRiGSTW/6xQpv
 RRZxnyeUkUqhFpsNGU0WI9+qvH4SyuhWY89TKIu3BJGwCE88zUUR8uQhyIDneHlKt/tlEQ
 JGDw8DD6IFzWJ2P1rdnSo4LXjkN9EeVppUgNAewQzcpetZu9gtfIoMcpdqB2YA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=k7MKF4Zu
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: add note to keep
 in sync with kernel
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

CgpPbiAxNy8wNC8yMDI1IDE0OjQxLCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4gVGhlIGJ1bXAgb2Yg
cGFja2FnZXMgcnBpLWZpcm13YXJlIGFuZCBsaW51eCBoYXZlIHRvIGJ5IHN5bmNlZCwgc2luY2Ug
dGhlCj4gbGludXggcGFja2FnZSBkb2VzIG5vdCBpbnN0YWxsIHlldCBpdHMgZGV2aWNlLXRyZWUg
b3ZlcmxheSBibG9icy4KPiAKPiBUaGlzIGFkZHMgYSBub3RlIHRvIHJlbWluZCB0byBrZWVwIGlu
IHN5bmMgdGhlIHZlcnNpb25zIG9mIHJwaS1maXJtd2FyZQo+IHBhY2thZ2UgYW5kIGtlcm5lbCAo
c2V0IGluIHRoZSBkZWZjb25maWdzKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkg
PGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNvbT4KCiAgQXBwbGllZCB0byAyMDI1LjAyLngsIHRo
YW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL3JwaS1maXJtd2Fy
ZS9ycGktZmlybXdhcmUubWsgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsg
Yi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsKPiBpbmRleCA3YWU5ZmY2YzI4
Li44MzUwZDM5NWRhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJt
d2FyZS5tawo+ICsrKyBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawo+IEBA
IC00LDYgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+ICsj
IFBsZWFzZSBrZWVwIGluIHN5bmMgd2l0aCBjb25maWdzL3Jhc3BiZXJyeXBpKl9kZWNvbmZpZwo+
ICAgUlBJX0ZJUk1XQVJFX1ZFUlNJT04gPSA1NDc2NzIwZDUyY2Y1NzlkYzE2Mjc3MTUyNjJiMzBi
YTEyNDI1MjVlCj4gICBSUElfRklSTVdBUkVfU0lURSA9ICQoY2FsbCBnaXRodWIscmFzcGJlcnJ5
cGksZmlybXdhcmUsJChSUElfRklSTVdBUkVfVkVSU0lPTikpCj4gICBSUElfRklSTVdBUkVfTElD
RU5TRSA9IEJTRC0zLUNsYXVzZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
