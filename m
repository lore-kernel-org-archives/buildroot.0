Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A6ACCD194
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 10:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEDF3617AE;
	Thu, 16 Oct 2025 10:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTaMdTce-TSC; Thu, 16 Oct 2025 10:24:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E604461AC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E604461AC0;
	Thu, 16 Oct 2025 10:24:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C72593E
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 10:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 422C080E04
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 10:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7t1W8U9jx8_6 for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 10:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51FEE80DF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51FEE80DF7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51FEE80DF7
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 10:24:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 142E6B978F21; Thu, 16 Oct 2025 12:23:57 +0200 (CEST)
Message-ID: <be4ca682-bdaa-4f3d-8b56-82e0b79d449c@rnout.be>
Date: Thu, 16 Oct 2025 12:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Pierre FICHEUX <pierre.ficheux@smile.fr>
Cc: buildroot@buildroot.org
References: <CAFc1U0tQYsSWe1=EtduNZogzNTtJHGr4eX3pjnYro5zJeArniA@mail.gmail.com>
 <81b9aa9b-4904-4296-96a8-81de83f8575c@rnout.be>
 <CAFc1U0tCdwSN1AMQsV41e1j=TqPhFQLZ40e4peUZ46O_MD-7xQ@mail.gmail.com>
 <CAFc1U0sQMsnrc2oXYFwWptdEevpKDf6z5iCdPBG0tVR8qsmhnw@mail.gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <CAFc1U0sQMsnrc2oXYFwWptdEevpKDf6z5iCdPBG0tVR8qsmhnw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1760610239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=XHmKrXeDvKrhnawPExXXzxEgc75mVCPX138MlerR24M=;
 b=TqOCqTSf0uj+BrEKBRnDH7cEAI4YUQ7XDu17LKKlGcylvjfzUFg30GqWnw/IE/hHisq5d0
 dgaNjy4u3ZsH0E+wyy+rvEL44gK3MJjRuNOtYATkVJkrS/3xONjOCa23KqpRJAwBadJgRF
 lqZ+880rKz2Ug1l2gk/5mAPErwAtu1FlqFrI9dLfPo2qLOj8VcnzVfVjc0JCg4ru/WrFh0
 yJJvw5giTkPNlZR9zdcGwWW1+RklZ1TSSq2/ZagV6I9JFVtf0EqujrmfeMb0ObLHYxZrSa
 X0Cj6fgFCjHC3XLRvADWjqitOdDaJfHiohPrMf/rk3DITdWgoaM48Y5q7cYJEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=TqOCqTSf
Subject: Re: [Buildroot] PocketBeagle2 support
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

CgpPbiAxNi8xMC8yMDI1IDA3OjUxLCBQaWVycmUgRklDSEVVWCB3cm90ZToKPiBTbyBpdCdzIEFS
TTY0IG5vdCBBUk0uLi4KPiAKPiBMZcKgamV1LiAxNiBvY3QuIDIwMjUgw6DCoDA3OjM3LCBQaWVy
cmUgRklDSEVVWCA8cGllcnJlLmZpY2hldXhAc21pbGUuZnIgCj4gPG1haWx0bzpwaWVycmUuZmlj
aGV1eEBzbWlsZS5mcj4+IGEgw6ljcml0wqA6Cj4gCj4gICAgIEhpLAo+IAo+ICAgICBUaGUgUEIy
IHVzZXMgYW4gQU02MjU0wqBTb0MsIGRpZmZlcmVudMKgZnJvbSB0aGUgQU0zMzV4LgoKICBPaCBz
b3JyeSBJIGRpZG4ndCBzZWUgdGhlIDIgKFBvY2tldEJlYWdsZSBpcyB0aGUgc2FtZSBTb0MgYXMg
QmVhZ2xlYm9uZSkuCgogIEkgYmVsaWV2ZSB0aGF0IHRoYXQgb25lIGlzIHF1aXRlIHNpbWlsYXIg
dG8gdGhlIEJlYWdsZVBsYXkuIEJ1dCBJIGRvbid0IApyZWFkaWx5IGZpbmQgZGV2aWNlIHRyZWVz
IGZvciBpdCBpbiB1cHN0cmVhbSBVLUJvb3QgYW5kIGtlcm5lbCwgc28geW91J2xsIGhhdmUgCnRv
IHNvdXJjZSB0aG9zZSBmcm9tIHNvbWV3aGVyZSBlbHNlLi4uCgogIFJlZ2FyZHMsCiAgQXJub3V0
Cgo+IAo+ICAgICBEbyB5b3UgdGhpbmsgaXQgY291bGQgd29yayA/Cj4gCj4gCj4gCj4gICAgIExl
wqBtZXIuIDE1IG9jdC4gMjAyNSDDoMKgMjE6NTAsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5v
dXRAcm5vdXQuYmUKPiAgICAgPG1haWx0bzphcm5vdXRAcm5vdXQuYmU+PiBhIMOpY3JpdMKgOgo+
IAo+IAo+IAo+ICAgICAgICAgT24gMTMvMTAvMjAyNSAwODowNywgUGllcnJlIEZJQ0hFVVggdmlh
IGJ1aWxkcm9vdCB3cm90ZToKPiAgICAgICAgICA+IEhpIGFsbCwKPiAgICAgICAgICA+Cj4gICAg
ICAgICAgPiBBcmUgeW91IGNvbnNpZGVyaW5nIGFueSBCUiBzdXBwb3J0IGZvciBQQjIgPyBJIHNh
dyB0aGUgZm9sbG93aW5nIGxpbmsKPiAgICAgICAgIGJ1dCBpdCdzIG9sZDoKPiAgICAgICAgICA+
Cj4gICAgICAgICAgPiBodHRwczovL2dpdGh1Yi5jb20vbWl4YXovYnVpbGRyb290LXBvY2tldGJl
YWdsZSA8aHR0cHM6Ly9naXRodWIuY29tLwo+ICAgICAgICAgbWl4YXovYnVpbGRyb290LXBvY2tl
dGJlYWdsZT4KPiAgICAgICAgICDCoCBJIGV4cGVjdCB0aGF0IHRoZSBwb2NrZXRiZWFnbGUgY2Fu
IHVzZSB0aGUgc2FtZSBjb25maWcgYXMgdGhlCj4gICAgICAgICBiZWFnbGVib25lX2RlZmNvbmZp
ZywganVzdCBhZGQgdGkvb21hcC9hbTMzNXgtcG9ja2V0YmVhZ2xlLmR0cyB0bwo+ICAgICAgICAg
QlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUUuCj4gCj4gICAgICAgICAgwqAgSWYgdGhh
dCB3b3Jrcywgd2UnZCB3ZWxjb21lIGEgcGF0Y2guIE1ha2Ugc3VyZSB5b3UgYWxzbyB1cGRhdGUK
PiAgICAgICAgIGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZWJvbmUvcmVhZG1lLnR4dAo+IAo+ICAg
ICAgICAgIMKgIFJlZ2FyZHMsCj4gICAgICAgICAgwqAgQXJub3V0Cj4gCj4gCj4gCj4gICAgIC0t
IAo+IAo+ICAgICBQaWVycmUgRklDSEVVWCAtLy0gQ1RPIFNtaWxlIEVDUywgRnJhbmNlIC1cLXBp
ZXJyZS5maWNoZXV4QHNtaWxlLmZyIDxtYWlsdG86cGllcnJlLmZpY2hldXhAc21pbGUuZnI+Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh0dHA6Ly93d3cuc21pbGUuZnIgPGh0
dHA6Ly93d3cuc21pbGUuZnIvPgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBo
dHRwczovL3NtaWxlLmV1L2ZyL29mZnJlcy9lbWJhcnF1ZS1pb3QgPGh0dHBzOi8vc21pbGUuZXUv
ZnIvb2ZmcmVzL2VtYmFycXVlLWlvdD4KPiAgICAgSSB3b3VsZCBsb3ZlIHRvIGNoYW5nZSB0aGUg
d29ybGQsIGJ1dCB0aGV5IHdvbid0IGdpdmUgbWUgdGhlIHNvdXJjZSBjb2RlCj4gCj4gCj4gCj4g
LS0gCj4gCj4gUGllcnJlIEZJQ0hFVVggLS8tIENUTyBTbWlsZSBFQ1MsIEZyYW5jZSAtXC1waWVy
cmUuZmljaGV1eEBzbWlsZS5mciA8bWFpbHRvOnBpZXJyZS5maWNoZXV4QHNtaWxlLmZyPgo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh0dHA6Ly93d3cuc21pbGUuZnIgPGh0dHA6Ly93
d3cuc21pbGUuZnIvPgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh0dHBzOi8vc21p
bGUuZXUvZnIvb2ZmcmVzL2VtYmFycXVlLWlvdCA8aHR0cHM6Ly9zbWlsZS5ldS9mci9vZmZyZXMv
ZW1iYXJxdWUtaW90Pgo+IEkgd291bGQgbG92ZSB0byBjaGFuZ2UgdGhlIHdvcmxkLCBidXQgdGhl
eSB3b24ndCBnaXZlIG1lIHRoZSBzb3VyY2UgY29kZQo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
