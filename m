Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA136E8B361
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97DDE403B1;
	Tue,  3 Feb 2026 21:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMGtTqwysOgT; Tue,  3 Feb 2026 21:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B395A403EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770154297;
	bh=HA+x7+2trPT2AHzS8JWIeQ9lSrwHxWHYMBSRjRBktsE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QAbofb9nP4zKQQ9EWVgRFkeR2xewSaXIGn8OeR/gNpRH6OLHAh8KAmJZmBRKb6HGq
	 KgTAimyDe1JSqkb/Riq1bGQaH/z7TJtp5Bf24AsezOtDhxDNucbf3NX1E1uS5pKgZ1
	 SsWVkDvvhwUbwoLtGrRb8GprnJZoF57R4FPZy8/wKeGejtUef8K5O6DF2YA583tJlL
	 7B+m+edsRCUDs4HJ8Mzbx9424nt66eOjPBSiUXCM3BfCD4Uvc8imJJOVyvUiXItZQs
	 0ONhpazvhwBVZj3ZI3omI+sfjCwnrLuxh70kQyDj/tbOk40S3yYNX46k6UXcnPco95
	 eNFUhtFOBi30Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B395A403EE;
	Tue,  3 Feb 2026 21:31:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67B80F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 484F682C3E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKSUUYbKwiyO for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 423C182B3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 423C182B3E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 423C182B3E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:31:34 +0000 (UTC)
Received: from [10.11.4.248] (220.211-78-194.adsl-static.isp.belgacom.be
 [194.78.211.220])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1D0802C80CC5;
 Tue, 03 Feb 2026 22:31:32 +0100 (CET)
Message-ID: <a8fcdb5b-594f-45d1-b68d-84059f6308e7@bubu1.eu>
Date: Tue, 3 Feb 2026 22:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
References: <20250426131331.2479358-1-gael.portay+rtone@gmail.com>
Content-Language: en-US
In-Reply-To: <20250426131331.2479358-1-gael.portay+rtone@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770154292; bh=2T701ouaaeUBeT6ZREdSOcUGUEGr3e9Zx2PzaHAo8ZI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=K3j52XaCG8FXzndvi6K4BgC2i4HugaKRYP0+AjxaARKVYytE55eDsKF+Cs375tsAE
 Ps/j6w/DUd/dAT9Sdo9l41/JqnlTfWq/56vPh2wnI2vs2jN9QHDZ0kvsQOEHJVV+pk
 8N1mAf6Q0vvI+MAjMI2CO/HlZISH7FvwLwX5kZ88eV2KqWKs0nqCzum3EVpU4SLaO2
 NaGvJ/XM9nkO7AeNq3u0r7rM/O7hcFkLLCRD8uZZh3IcrXm07BMbCCZw6u+s+jXMbb
 VTcOiL9y0WB7p+JBLXENRyVZj+5UC+R19gb752Qqtho7Bb3sEeCxLcra2fnJJ61eHx
 yrZQbnI5+uFew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=K3j52XaC
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi3_qt5we: switch to
 mesa3d
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2HDq2wsCgpPbiA0LzI2LzI1IDE1OjEzLCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4gVGhlIHBh
Y2thZ2UgcnBpLXVzZXJsYW5kIGhhcyBiZWVuIG1hcmtlZCBhcyBhbmNpZW50IGFuZCBkZXByZWNh
dGVkWzFdLgo+IAo+IEl0IGNvbnRhaW5zIGNvZGUgdXNpbmcgcHJvcHJpZXRhcnkgQVBJcyB0byBp
bnRlcmZhY2UgdG8gdGhlIFZpZGVvQ29yZQo+IGZpcm13YXJlLiBJdCBoYXMgbW92ZWQgdG8gc3Rh
bmRhcmQgbGludXggQVBJcy4KPiAKPiBJdCBpcyByZWNvbW1lbmRlZCB0byB1c2UgRFJNL0tNUyBh
bmQgTWVzYSBpbnN0ZWFkLgo+IAo+IFRoaXMgc3dpdGNoZXMgdG8gdGhlIG1lc2EzZCBPcGVuR0xF
UyBiYWNrZW5kIGluc3RlYWQgb2YgdGhlIGRlcHJlY2F0ZWQKPiBvbmUgcHJvdmlkZWQgYnkgcnBp
LXVzZXJsYW5kLiBJdCBpbXBsaWVzIHRoZSBsb2FkIGZvciB0aGUgdmM0LWttcy12M2QKPiBkZXZp
Y2UtdHJlZSBvdmVybGF5Lgo+IAo+IFsxXTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBp
L3VzZXJsYW5kL2NvbW1pdC85NmE3MzM0YWU5ZDVmYzlkYjdhYzkyZTU5ODUyMzc3ZGY2M2YxODQ4
Cj4gCj4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFp
bC5jb20+Cj4gLS0tCj4gICBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM19xdDV3ZS50eHQgfCAz
ICsrKwoKVGhpcyBkZWZjb25maWcgaGFzIGJlZW4gcmVtb3ZlZCBpbiAKaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzE3MjEyMDZiMzVkNmIyYjM5Y2Uz
Mzc3NTk2NzRiNWFiNzEyMzAwNWUgCnNvIHRoZSBwYXRjaCBoYXMgYmVlbiBtYXJrZWQgYXMgIk5v
dCBhcHBsaWNhYmxlIiBpbiBwYXRjaHdvcmsuCgpbLi4uXQoKTWFyY3VzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
