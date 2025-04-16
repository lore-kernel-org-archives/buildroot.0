Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C837C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 404D061B0A;
	Wed, 16 Apr 2025 21:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZnrGNfwUsXo; Wed, 16 Apr 2025 21:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 585E360751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 585E360751;
	Wed, 16 Apr 2025 21:24:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A1A11B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC6A4407E7
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_AovQpuAKBt for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:23:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 905874067D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 905874067D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 905874067D
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:23:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A8DFD1C00C0; Wed, 16 Apr 2025 23:23:54 +0200 (CEST)
Message-ID: <600b8559-ae58-477a-90cf-be339970e37c@rnout.be>
Date: Wed, 16 Apr 2025 23:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com
References: <20250401162109.4027248-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20250401162109.4027248-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9TmwR/01GrWJx6jYwcMaCEvfTj5GNmt2Ior7niY1CcY=;
 b=dkoHnvFzJqTer3Ogj+DYrUMESAT/ULDlo1BYFeUkGsaBi5vFrevlzvL/KYnxz/FW4dgSi2
 GnkETdSnNZ4Zvzwlkv+ttCJmMEJDjGo0+V85vxYJJN96PHIdAjfFlZAzKXveoKe3F8plV7
 GkDh3pBq2YMXRjcHpXkrTUTI6ONhdJe1UWJxYCl0qyoon/jS0EwhOjv066Z7JwNZ+MCSzI
 EVecNyyqHu2rUahbCk02/+8skU+3soQRbdpXt8lI3a+52DkvKgNa1x91Hk5kBJAFRSxvEN
 7o1Tz8b5bsoq7VR085UTTS6XPBZuw2YQibFTBHotb52jCEN8ZBcF+8OQxInbvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 14.4.1
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

Ck9uIDAxLzA0LzIwMjUgMTg6MjEsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IFJlbGVhc2Ugbm90
ZXM6Cj4gaHR0cHM6Ly9hcm1hLnNvdXJjZWZvcmdlLm5ldC9kb2NzLmh0bWwjY2hhbmdlbG9nCj4K
PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+CgogwqBBcHBsaWVkIHRvIDIwMjUuMDIueCwgdGhhbmtzLgoKIMKgUmVnYXJk
cywKIMKgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9hcm1hZGlsbG8vYXJtYWRpbGxvLmhhc2gg
fCAyICstCj4gICBwYWNrYWdlL2FybWFkaWxsby9hcm1hZGlsbG8ubWsgICB8IDIgKy0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvYXJtYWRpbGxvL2FybWFkaWxsby5oYXNoIGIvcGFja2FnZS9hcm1hZGls
bG8vYXJtYWRpbGxvLmhhc2gKPiBpbmRleCA3MzRkMGM2ZGI5N2QuLjMxNjFkMmRmODc5NyAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL2FybWFkaWxsby9hcm1hZGlsbG8uaGFzaAo+ICsrKyBiL3BhY2th
Z2UvYXJtYWRpbGxvL2FybWFkaWxsby5oYXNoCj4gQEAgLTEsNCArMSw0IEBACj4gICAjIExvY2Fs
bHkgY29tcHV0ZWQ6Cj4gLXNoYTI1NiAgMDIzMjQyZmQ1OTA3MWQ5OGM3NWZiMDE1ZmQzMjkzYzky
MTEzMmRjMzliZjQ2ZDIyMWQ0YjA1OWFhZThkNzlmNCAgYXJtYWRpbGxvLTE0LjQuMC50YXIueHoK
PiArc2hhMjU2ICAyNmNlMjcyYmZkYzgyNDZjMjc4ZTZmOGNmYTUzNzc3YTFlZmIxNGVmMTk2ZTg4
MDgyZmVlMDVkYTFhNDYzNDkxICBhcm1hZGlsbG8tMTQuNC4xLnRhci54ego+ICAgIyBMaWNlbnNl
IGZpbGVzLCBsb2NhbGx5IGNhbGN1bGF0ZWQKPiAgIHNoYTI1NiAgM2RkZjliZTVjMjhmZTI3ZGFk
MTQzYTVkYzc2ZWVhMjUyMjJhZDFkZDY4OTM0YTA0NzA2NGU1NmVkMmZhNDBjNSAgTElDRU5TRS50
eHQKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hcm1hZGlsbG8vYXJtYWRpbGxvLm1rIGIvcGFja2Fn
ZS9hcm1hZGlsbG8vYXJtYWRpbGxvLm1rCj4gaW5kZXggNzA0MTk5ZmY5MTQ4Li5jNDFlNjA2MjVl
MmYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9hcm1hZGlsbG8vYXJtYWRpbGxvLm1rCj4gKysrIGIv
cGFja2FnZS9hcm1hZGlsbG8vYXJtYWRpbGxvLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICAjCj4g
ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gLUFSTUFESUxMT19WRVJTSU9OID0gMTQu
NC4wCj4gK0FSTUFESUxMT19WRVJTSU9OID0gMTQuNC4xCj4gICBBUk1BRElMTE9fU09VUkNFID0g
YXJtYWRpbGxvLSQoQVJNQURJTExPX1ZFUlNJT04pLnRhci54ego+ICAgQVJNQURJTExPX1NJVEUg
PSBodHRwczovL2Rvd25sb2Fkcy5zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdC9hcm1hCj4gICBBUk1B
RElMTE9fSU5TVEFMTF9TVEFHSU5HID0gWUVTCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
