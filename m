Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE9DC636CC
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 21:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D102081346;
	Tue, 31 Jan 2023 21:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D102081346
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMhugEAkjys0; Tue, 31 Jan 2023 21:25:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03E92812F0;
	Tue, 31 Jan 2023 21:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03E92812F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E0BC1BF3FB
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 21:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 757C4400D8
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 21:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 757C4400D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PeB2ihCF-1iQ for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 21:25:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 895B6400C8
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 895B6400C8
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:25:24 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:6e20:2978:7b29:e91f:c04c] (unknown
 [IPv6:2a01:e0a:947:6e20:2978:7b29:e91f:c04c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id C1CD1C0471;
 Tue, 31 Jan 2023 22:24:30 +0100 (CET)
Message-ID: <b75191f6-1f8e-c22c-adf6-c8ef3957dc4d@grenoble.cnrs.fr>
Date: Tue, 31 Jan 2023 22:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Jason Choi <jason.choi9@yahoo.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <665997591.554194.1675195174617@yahoo.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <665997591.554194.1675195174617@yahoo.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1675200271;
 bh=hxOvUiV0x7elPYJ/svUFJKp3/TCiZCGFFEfZkMXOkew=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=WuTIPA5xR9PtBhCmuvcW/TVpDNHV+rsWXHZOjjBGn4xDMU8LV9XbCQ/vYAbsmKDQI
 gvqq3+99cpPqKjdFK751wi/eHoWe3f3oVfsasnZaUeuTkLxPH/NOYuiy38y16IQnQS
 RCOGv2oBEHttcQWrLP2CGYutTVwEBu4+0ucOcjtuGkp/zvjMVk/rXLu2YR0M1uaKK+
 WWirpe1p57ZzgXnDVlWkZpEOt8msHqmEWRP9VaaOj3WvtqpNX9a9hBI9joyUmR3+51
 3TyMVHo8nbQridYoFAqF/BurrNhpQvtELHSjbviJU6nH86F82lVU2iYlFf1qQjVow7
 6hkg5uJq8GcQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=WuTIPA5x
Subject: Re: [Buildroot] How to know the package updated?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpKYXNvbiBDaG9pIHdyb3RlOgo+IEnigJl2ZSByZWNlbnRseSBjaGVja2VkIHRoZSB2
ZXJzaW9uIDIwMjIuMDIuMyBhbmQgMjAyMi4wMi40LiBJIGZvdW5kCj4gYmluZCBpcyBtZW50aW9u
ZWQgdW5kZXIgZml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZQo+
IGlzc3VlcyBpbiB+LiBTbywgSSBjb21wYXJlZCBiaW5kIHBhY2thZ2UgYmV0d2VlbiAyMDIyLjAy
LjMgYW5kCj4gMjAyMi4wMi40LiBBbmQgYWN0dWFsbHkgdGhleSBhcmUgc2FtZSB2ZXJzaW9uIHdo
aWNoIGlzCj4gYmluZC05LjE2LjI3LnRhci54ei4gWy4uLl0gYW0gSSBtaXN1bmRlcnN0YW5kaW5n
IHRoZSBjaGFuZ2UgbG9nPwoKVGhlIENIQU5HRVMgZmlsZSBvbmx5IGdpdmVzIGEgdmVyeSBicmll
ZiBzdW1tYXJ5IG9mIHdoYXQgY2hhbmdlcyB3ZXJlCmludHJvZHVjZWQgYnkgZWFjaCByZWxlYXNl
LiBJZiB5b3Ugd2FudCBtb3JlIGRldGFpbHMsIHlvdXIgYmVzdCBvcHRpb24KbWF5IGJlIHRvIGNs
b25lIHRoZSBnaXQgcmVwb3NpdG9yeToKCiAgICAkIGdpdCBjbG9uZSBnaXQ6Ly9naXQuYnVpbGRy
b290Lm5ldC9idWlsZHJvb3QKICAgIENsb25pbmcgaW50byAnYnVpbGRyb290Jy4uLgogICAgWy4u
Ll0KICAgICQgY2QgYnVpbGRyb290CiAgICAkIGdpdCBsb2cgLS1zdGF0IDIwMjIuMDIuMy4uMjAy
Mi4wMi40IC0tIHBhY2thZ2UvYmluZAogICAgY29tbWl0IDcwMzJkNTgyNmQwOTI3ZjNmNjBmNTY1
NmQzZDRmZThhZmM4NmU2OTcKICAgIEF1dGhvcjogRGFub21pIE1hbmNoZWdvIDxkYW5vbWltYW5j
aGVnbzEyM0BnbWFpbC5jb20+CiAgICBEYXRlOiAgIFR1ZSBKdWwgNSAyMzowMjozNiAyMDIyIC0w
NDAwCgogICAgICAgIHBhY2thZ2UvYmluZDogZml4IGluZGVudGF0aW9uIG9mIG9wdGlvbnMgaW4g
bWVudWNvbmZpZwogICAgICAgIAogICAgICAgIE1vdmUga2NvbmZpZyBjb21tZW50IGJlbG93IHRo
ZSAiaWYgQlIyX1BBQ0tBR0VfQklORC4uLmVuZGlmIiBibG9jayBzbwogICAgICAgIHRoYXQgdGhl
IHR3byBzdWItb3B0aW9ucyBhcmUgcHJlc2VudGVkIGluIG1lbnVjb25maWcgYXMgc3Vib3JkaW5h
dGUgdG8KICAgICAgICAiYmluZCIgcGFja2FnZSBzZWxlY3Rpb24gcmF0aGVyIHRoYW4gZXF1YWwg
dG8gaXQgYXMgaWYgdGhleSB3ZXJlCiAgICAgICAgdW5yZWxhdGVkLgogICAgICAgIAogICAgICAg
IFNpZ25lZC1vZmYtYnk6IERhbm9taSBNYW5jaGVnbyA8ZGFub21pbWFuY2hlZ28xMjNAZ21haWwu
Y29tPgogICAgICAgIFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRh
enpvbmlAYm9vdGxpbi5jb20+CiAgICAgICAgKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgMGQ1
NjZiOGNjNzE0NmFkNTdkZmRmN2VmMTNhY2ViODBiODVhY2Q5ZSkKICAgICAgICBTaWduZWQtb2Zm
LWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CgogICAgIHBhY2thZ2Uv
YmluZC9Db25maWcuaW4gfCAxMCArKysrKy0tLS0tCiAgICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKClRoaXMgc2hvd3MgdGhhdCwgYmV0d2VlbiAyMDIy
LjAyLjMgYW5kIDIwMjIuMDIuNCwgdGhlcmUgd2FzIG9ubHkgb25lCmNvbW1pdCB0b3VjaGluZyB0
aGUgYmluZCBwYWNrYWdlLCBhbmQgdGhhdCBjb21taXQgb25seSB0b3VjaGVkIHRoZSBmaWxlCkNv
bmZpZy5pbi4gWW91IGNhbiB1c2Ug4oCcZ2l0IHNob3cgPGNvbW1pdC1JRD7igJ0gaWYgeW91IHdh
bnQgdG8gc2VlIHRoZQpkZXRhaWxzIG9mIHRoZSBjaGFuZ2VzLgoKUmVnYXJkcywKCkVkZ2FyLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
