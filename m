Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF52C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 21:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBA9060670;
	Wed, 22 May 2024 21:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9Jl3p5dZ6eJ; Wed, 22 May 2024 21:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA39E6067A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA39E6067A;
	Wed, 22 May 2024 21:54:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93B0B1C603C
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 21:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E86581095
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 21:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5MO4jLc7bth for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 21:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3118C80C60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3118C80C60
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3118C80C60
 for <buildroot@buildroot.org>; Wed, 22 May 2024 21:54:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56EF2FF802;
 Wed, 22 May 2024 21:54:48 +0000 (UTC)
Message-ID: <d385057c-8976-4900-b27b-558967a73d4e@korsgaard.com>
Date: Wed, 22 May 2024 23:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240520111730.1231889-1-peter@korsgaard.com>
 <20240520111730.1231889-3-peter@korsgaard.com>
 <75be4856-0446-4407-8345-542a9dce3f56@smile.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <75be4856-0446-4407-8345-542a9dce3f56@smile.fr>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/5] configs/orangepi_pc_defconfig: bump
 Linux kernel to 6.1.91
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

T24gNS8yMi8yNCAxNzowMiwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEhlbGxvIFBldGVyLAo+IAo+
IExlIDIwLzA1LzIwMjQgw6AgMTM6MTcsIFBldGVyIEtvcnNnYWFyZCBhIMOpY3JpdMKgOgo+PiBM
aW51eCA2LjYueCBjcmFzaGVzIGR1cmluZyBib290LCBzbyBzdGljayB0byA2LjEueCBmb3Igbm93
Lgo+IAo+IFlvdXIgU29CIGxpbmUgaXMgbWlzc2luZyBoZXJlLgo+IAo+PiAtLS0KPj4gICBjb25m
aWdzL29yYW5nZXBpX3BjX2RlZmNvbmZpZyB8IDQgKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9jb25maWdz
L29yYW5nZXBpX3BjX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvb3JhbmdlcGlfcGNfZGVmY29uZmlnCj4+
IGluZGV4IGIxNGNmNTYxNTUuLmFkNjNkYThkYWQgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3Mvb3Jh
bmdlcGlfcGNfZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvb3JhbmdlcGlfcGNfZGVmY29uZmln
Cj4+IEBAIC0xLDcgKzEsNyBAQAo+PiAgIEJSMl9hcm09eQo+PiAgIEJSMl9jb3J0ZXhfYTc9eQo+
PiAgIEJSMl9BUk1fRlBVX1ZGUFY0PXkKPj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVS
U19DVVNUT01fNV8xMD15Cj4+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9N
XzZfNj15Cj4gCj4gSXQgc2hvdWxkIGJlIEJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19D
VVNUT01fNl8xIGhlcmUgYnV0IGl0IHNlZW1zIHBhdGNoCj4gNC81IG5lZWRzIHRvIGJlIHNxdWFz
aGVkLgoKWWVzLCBzb21ldGhpbmcgbXVzdCBoYXZlIGdvbmUgd3JvbmcgaW4gdGhlIHJlYmFzZSwg
c29ycnkgYWJvdXQgdGhhdC4gQXMgCnlvdSBwcm9iYWJseSBjb3VsZCBndWVzcyBJIGZpcnN0IGJ1
bXBlZCB0byA2LjYueCwgYnV0IHRoZW4gY2hhbmdlZCB0byAKNi4xLnggYmVjYXVzZSBvZiB0aGUg
cmVncmVzc2lvbnMuCgpJJ2xsIHNlbmQgYSB2MiBzZXJpZXMuCgotLSAKQnllLCBQZXRlciBLb3Jz
Z2FhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
