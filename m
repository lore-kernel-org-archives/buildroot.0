Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EADC3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 19:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB038402C3;
	Wed, 31 Jul 2024 19:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5w9k0zttGya; Wed, 31 Jul 2024 19:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8176B4047B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8176B4047B;
	Wed, 31 Jul 2024 19:50:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 123751BF32B
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 19:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00502407AC
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 19:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8K4WXh3L_OCa for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 19:50:25 +0000 (UTC)
X-Greylist: delayed 17671 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 31 Jul 2024 19:50:24 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0102B4081E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0102B4081E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=83.166.143.172;
 helo=smtp-8fac.mail.infomaniak.ch; envelope-from=philip-dylan@gleonec.bzh;
 receiver=<UNKNOWN> 
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch
 [83.166.143.172])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0102B4081E
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 19:50:24 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WZ2kj6tJvzNGQ;
 Wed, 31 Jul 2024 21:50:21 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4WZ2kj43Dcz77W; Wed, 31 Jul 2024 21:50:21 +0200 (CEST)
Message-ID: <c5c8be7c-d718-40aa-9ff0-922d6e880ccc@gleonec.bzh>
Date: Wed, 31 Jul 2024 21:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>
References: <20240731144421.363494-1-philip-dylan@gleonec.bzh>
 <CAOMZO5BO_07mXQTiyLWBMV8CXd3-6N_sYHcT_O1yY+aRcFFiOA@mail.gmail.com>
Content-Language: en-US
From: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
In-Reply-To: <CAOMZO5BO_07mXQTiyLWBMV8CXd3-6N_sYHcT_O1yY+aRcFFiOA@mail.gmail.com>
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=gleonec.bzh
Subject: Re: [Buildroot] [PATCH 0/2] Udoo Neo kernel update
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

T24gMzEvMDcvMjAyNCAxNjo1OSwgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiBIaSBQaGlsaXAtRHls
YW4sCj4gCj4gT24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMTE6NDTigK9BTSBQaGlsaXAtRHlsYW4g
R2xlb25lYwo+IDxwaGlsaXAtZHlsYW5AZ2xlb25lYy5iemg+IHdyb3RlOgo+Pgo+PiBIZWxsbywK
Pj4KPj4gSSdtIGN1cnJlbnRseSBwbGF5aW5nIHdpdGggdGhlIFVkb28gTmVvIGJvYXJkIGFuZCBo
YXZlIGZvdW5kIHRoYXQgdGhlCj4+IGtlcm5lbCBpbiB0aGUgY3VycmVudCBib2FyZCBjb25maWd1
cmF0aW9uIGRvZXMgbm90IGJ1aWxkLgo+Pgo+PiBXaGlsZSBhIHBvaW50IHJlbGVhc2UgYnVtcCB3
b3VsZCBiZSBzdWZmaWNpZW50LCBJIHRvb2sgdGhlIG9wcG9ydHVuaXR5Cj4+IHRvIHVwZGF0ZSB0
aGUga2VybmVsIHRvIHRoZSBsYXRlc3QgTFRTIHZlcnNpb24uIEhhc2hlcyB2ZXJpZmljYXRpb24g
d2FzCj4+IGFkZGVkIHRvIGVuc3VyZSB0aGUgaW50ZWdyaXR5IG9mIHVib290IGFuZCBsaW51eCBz
b3VyY2VzLgo+Pgo+PiBUaGUgNi42IGtlcm5lbCBkb2VzIG5vdCBhZGQgYW55IHJlZ3Jlc3Npb24g
Y29tcGFyZWQgdG8gdGhlIGxhdGVzdCA1LjE1Cj4+IGtlcm5lbC4KPiAKPiBUaGFua3MgZm9yIHRo
ZSB1cGRhdGUuCj4gCj4gRm9yIHRoZSBzZXJpZXM6Cj4gCj4gUmV2aWV3ZWQtYnk6IEZhYmlvIEVz
dGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIGRvIG1lIGEg
ZmF2b3IgYW5kIGNoZWNrIGlmIHRoZSBXaWZpIGNoaXAgZ2V0cyBkZXRlY3RlZD8KPiAKPiBkbWVz
ZyB8IGdyZXAgU0RJTwo+IAo+IFRoYW5rcwoKSGkgRmFiaW8sCgpUaGFua3MgZm9yIHRoZSByZXZp
ZXcuIFJlZ2FyZGluZyB0aGUgdHJhY2UgeW91IGFza2VkLCBJIGdldDoKCiMgZG1lc2cgfCBncmVw
IFNESU8KWyAgICAzLjg0OTI3NF0gbW1jMjogbmV3IGhpZ2ggc3BlZWQgU0RJTyBjYXJkIGF0IGFk
ZHJlc3MgMDAwMQoKSSBjaGVja2VkIG9uIDUuMTUuMTYyIGFuZCBoYXZlIHRoZSBzYW1lIHJlc3Vs
dC4gSW4gYm90aCB2ZXJzaW9ucyBJIGhhdmUKdHJhY2VzIHNob3dpbmcgaXNzdWVzIHdpdGggdGhl
IFdpRmkvQmx1ZXRvb3RoIGZpcm13YXJlIGxvYWQ6CgpbICAgNjQuNjU3Mjk5XSBoY2ktdGkgc2Vy
aWFsMC0wOiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IKdGktY29ubmVjdGl2aXR5L1RJSW5pdF8x
MS44LjMyLmJ0cyBmYWlsZWQgd2l0aCBlcnJvciAtMgpbICAgNjQuNjY3NDQ1XSBoY2ktdGkgc2Vy
aWFsMC0wOiBGYWxsaW5nIGJhY2sgdG8gc3lzZnMgZmFsbGJhY2sgZm9yOgp0aS1jb25uZWN0aXZp
dHkvVElJbml0XzExLjguMzIuYnRzClsgICA2OS42MTQ0OTZdIGNmZzgwMjExOiBmYWlsZWQgdG8g
bG9hZCByZWd1bGF0b3J5LmRiCgpJIGFzc3VtZWQgdGhpcyB3YXMgbm90IGEgcmVncmVzc2lvbiBh
cyB0aGUgYmVoYXZpb3Igd2FzIHRoZSBzYW1lIGJldHdlZW4KdjYuNiBhbmQgdjUuMTUuIFdhcyBp
dCBwcmV2aW91c2x5IHJ1bm5pbmcgYnkgZGVmYXVsdCA/IElmIHNvLCBJIGNhbiBsb29rCmludG8g
Zml4aW5nIHRoaXMuCgpSZWdhcmRzLApQaGlsaXAtRHlsYW4gR2xlb25lYwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
