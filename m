Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795C1C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 21:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A087400D3;
	Wed, 17 Apr 2024 21:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFDHy71_cQvX; Wed, 17 Apr 2024 21:10:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3FDD400F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3FDD400F4;
	Wed, 17 Apr 2024 21:10:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06A501BF267
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 21:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6F94400F4
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxQTCZQlyrpQ for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 21:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.65;
 helo=mout01.posteo.de; envelope-from=gero.schwaericke@posteo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E32FD400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E32FD400D3
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E32FD400D3
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 21:10:22 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id CDD6B240028
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 23:10:19 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4VKYTR1QGYz9rxL;
 Wed, 17 Apr 2024 23:10:19 +0200 (CEST)
Date: Wed, 17 Apr 2024 21:10:17 +0000
From: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240417211017.GA3300@Apollo>
Mail-Followup-To: Arnout Vandecappelle <arnout@mind.be>,
 buildroot@buildroot.org
References: <20240305070452.183573-1-karthikeyan@linumiz.com>
 <9b60fd4d-7a0e-47da-a37a-9690b4ac84db@mind.be>
 <20240407203807.GB13509@Apollo>
 <f76b797d-b9f3-4a40-bc99-8ef057b9aaeb@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f76b797d-b9f3-4a40-bc99-8ef057b9aaeb@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1713388219; bh=I8Z91E73b8qQgq1RzyQmoutpAqhMtOv6OMc/AO20Ztg=;
 h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:From;
 b=ouVFJGj9kWXMQBdfMKM8uSaMJk/N952NxAeGkgWRsZ3+sLRX6r20QnQYrVssMMnMn
 XMrB2QgGHuycgxV2RhWn40/kYl34G9yr8ESra2NiVEH1N2NVQ2ioVBlmTkrEH4QStj
 N9JUw++BAvlaUZdpoIP+Tz8G/MKcsTNGExwubdm1Jyf0BmIrAmVvhH0oGyK0dh/WwS
 02OnvU/57+BNwOjeQGbsPZ3iKp/4Y6mpdmN2XY94ZtyoHTLLWXnMbmBos8bGSYHvvP
 z1468MmnZnrjjEjT1YQF4Z8fI99NT7vNbmu2RipCfzI7RaCGsPwTri6agxJ6cIi9W5
 oVYQQovKT4nEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=ouVFJGj9
Subject: Re: [Buildroot] [PATCH] package: linux-firmware: update linux fw
 bluetooth package for rtl88xx
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMTA6MDY6MDhBTSArMDIwMCwgQXJu
b3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiAKPiBPbiAwNy8wNC8yMDI0
IDIyOjM4LCBHZXJvIFNjaHfDpHJpY2tlIHdyb3RlOgpbc25pcF0KPiA+IAo+ID4ganVzdCBzYXcg
dGhpcyBjb21taXQuIEluIGVmZmVjdCBpdCBhZGRlZCBuZXcgZmlybXdhcmUgYmxvYnMgZm9yCj4g
PiBydGw4ODIxY3MgYW5kIHJ0bDg4NTJidHUsIGJ1dCBhbHNvIHJlbW92ZWQgb25lIGZvciBydGw4
ODUyY3UsIHdhcyB0aGlzCj4gPiBpbnRlbnRpb25hbD8KPiA+IAo+ID4gICAgJCBkaWZmIG9sZCBu
ZXcKPiA+ICAgIDRhNSw2Cj4gPiAgICA+IHJ0bDg4MjFjc19jb25maWcuYmluCj4gPiAgICA+IHJ0
bDg4MjFjc19mdy5iaW4KPiA+ICAgIDE0YTE3LDE4Cj4gPiAgICA+IHJ0bDg4NTJidHVfY29uZmln
LmJpbgo+ID4gICAgPiBydGw4ODUyYnR1X2Z3LmJpbgo+IAo+ICBUaGlzIGlzIHRoZSBwdXJwb3Nl
IG9mIHRoZSBwYXRjaC4KPiAKPiA+ICAgIDE4ZDIxCj4gPiAgICA8IHJ0bDg4NTJjdV9md192Mi5i
aW4KPiAKPiAgVGhpcyBpcyBkZWZpbml0ZWx5IG5vdCBpbnRlbnRpb25hbC4gSSBjbGVhcmx5IGRp
ZG4ndCB0ZXN0IHRoZSBwYXRjaCBlbm91Z2gKPiBiZWZvcmUgYXBwbHlpbmcgOi0oCj4gCj4gIENh
cmUgdG8gc2VuZCBhIGZpeD8gIEkgdGhpbmsgdGhlIGVhc2llc3QgaXMgdG8gY2hhbmdlIHRoZSBw
YXR0ZXJuIHRvCj4gcnRsODgqLmJpbiwgYnV0IGl0IG5lZWRzIHRvIGJlIHZlcmlmaWVkLgoKSSBq
dXN0IHNlbmQgdGhlIHBhdGNoLiBGb3IgdGVzdGluZyBJIHJlY29yZGVkIHRoZSBmaXJtd2FyZSBw
YWNrYWdlIHdpdGgKCiAgdGFyIC0tbGlzdCAtLWZpbGUgb3V0cHV0L2J1aWxkL2xpbnV4LWZpcm13
YXJlLTIwMjQwMTE1L2JyLWZpcm13YXJlLnRhciB8IHNvcnQgPiAvdG1wLy5vbGQgICMgYW5kIC90
bXAvLm5ldwoKVGhlIGRpZmYgaXMgdGhlbgoKICAkIGRpZmYgL3RtcC8ub2xkIC90bXAvLm5ldyAK
ICAyMmEyMwogID4gcnRsX2J0L3J0bDg4NTJjdV9md192Mi5iaW4KClNlZW1zIHRvIHdvcmsgYXMg
aW50ZW5kZWQuCgpJIG5vdGljZWQgdGhvdWdoIHRoYXQgZHVlIHRvIHRoZSBuZXcgZ2xvYmJpbmcg
YXBwcm9hY2ggdGhlIGtjb25maWcgaGVscApzdHJpbmcgaXMgb3V0ZGF0ZWQuIEknbGwgc2VuZCB0
aGF0IGFzIGEgc2VwYXJhdGUgcGF0Y2guCgpCZXN0LApHZXJvCgo+IAo+ICBSZWdhcmRzLAo+ICBB
cm5vdXQKPiAKPiA+IAo+ID4gQmVzdCwKPiA+IEdlcm8KW3NuaXBdCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
