Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16D5C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 12:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F2864092C;
	Tue,  8 Feb 2022 12:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id je-4_LsPyiOL; Tue,  8 Feb 2022 12:26:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8644B40922;
	Tue,  8 Feb 2022 12:26:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8310B1BF3A9
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 12:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C65E4058D
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 12:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeIOM2K9T6Nw for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 12:26:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 534544010C
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 12:26:17 +0000 (UTC)
Received: from host-79-2-93-196.business.telecomitalia.it ([79.2.93.196]:60586
 helo=[192.168.101.73])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nHPZX-000Bfk-5S; Tue, 08 Feb 2022 13:26:15 +0100
Message-ID: <690d8e1b-fb6d-7c36-b07f-4ed9ca61b768@lucaceresoli.net>
Date: Tue, 8 Feb 2022 13:26:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Neal Frager <nealf@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: Michal Simek <michals@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwKCk9uIDA4LzAyLzIyIDEyOjE2LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBO
ZWFsLAo+IAo+IE9uIDA4LzAyLzIyIDExOjI0LCBOZWFsIEZyYWdlciB3cm90ZToKPj4gSGkgR2l1
bGlvLAo+Pgo+Pj4gT2ssIEkgd2FzIGFib3V0IGJ1aWxkaW5nIHlvdXIgcGF0Y2hlcyA6LSkKPj4K
Pj4+IFBsZWFzZSBzZW5kIGFzIHYyLCBzbyB3aGVuIGNyZWF0aW5nIHBhdGNoZXMgYWRkIC12MjoK
Pj4+ICMgZ2l0IGZvcm1hdC1wYXRjaCAtcyAtTSAtbyBvdXRnb2luZyAtMiAtdjIgdGhlbiBhZGQg
MyBkYXNoZXMgYmVmb3JlCj4+PiB0aGUgYWN0dWFsIDMgZGFzaGVzIGluIHRoZSBwcm9kdWNlZCBw
YXRjaGVzIGFuZCBkZXNjcmliZWQgd2hhdCBpcwo+Pj4gY2hhbmdlZCBiZXR3ZWVuIFYxIHZlcnNp
b24gdG8gVjIgbGlrZToKPj4+IC0tLQo+Pj4gVjEtPlYyOgo+Pj4gKiBtb3ZlZCBCUjJfVEFSR0VU
X1VCT09UX1pZTlFNUF9QTV9DRkcgdG8gYW4gVVJMIGluc3RlYWQgb2YgbG9jYWwKPj4+IHBhdGNo
IGFzIHN1Z2dlc3RlZCBieSBHaXVsaW8KPj4+ICogb3RoZXIgZXZlbnR1YWwgbW9kaWZpZXMKPj4+
IC0tLQo+Pgo+Pj4gQW5kIGlmIHlvdSBzZW5kIHRoZW4gYSB2MywgdGhlbiBrZWVwIHByZXZpb3Vz
IFYxLT5WMiBhbmQgYWRkOgo+Pj4gLS0tCj4+PiBWMS0+VjI6Cj4+PiAqIG1vdmVkIEJSMl9UQVJH
RVRfVUJPT1RfWllOUU1QX1BNX0NGRyB0byBhbiBVUkwgaW5zdGVhZCBvZiBsb2NhbAo+Pj4gcGF0
Y2ggYXMgc3VnZ2VzdGVkIGJ5IEdpdWxpbwo+Pj4gVjItPlYzOgo+Pj4gKiBtb2RpZmllZCAuLi4u
Cj4+PiAtLS0KPj4KPj4gVGhhbmsgeW91IGZvciB5b3VyIHF1aWNrIHJlc3BvbnNlLsKgIEhvdyBk
byB5b3UgdGhpbmsgd2Ugc2hvdWxkIGhhbmRsZQo+PiB0aGlzP8KgIEl0IGFwcGVhcnMgdGhhdCB0
aGUgQlIyX1RBUkdFVF9VQk9PVF9aWU5RTVBfUE1fQ0ZHCj4+IGNvbmZpZ3VyYXRpb24gZG9lcyBu
b3QgeWV0IHN1cHBvcnQgcHJlLWRvd25sb2FkaW5nIHRoZSBmaWxlIGZyb20gYSBVUkwuCj4gCj4g
SXQncyBub3QgaXRzIHB1cnBvc2UuCj4gCj4+IMKgSXMgdGhpcyBzb21ldGhpbmcgdGhhdCBjYW4g
ZWFzaWx5IGJlIHVwZGF0ZWQ/wqAgSWYgbm90LCBwZXJoYXBzIGl0Cj4+IG1ha2VzIHNlbnNlIHRv
IG1vdmUgZm9yd2FyZCB3aXRoIG15IHBhdGNoIHNldCBhcyBpcyBmb3Igbm93LCBhbmQgdGhlbgo+
PiBJIGNhbiBpbmNsdWRlIGEgbmV3IHVwZGF0ZSBvbmNlIHRoZSBCUjJfVEFSR0VUX1VCT09UX1pZ
TlFNUF9QTV9DRkcKPj4gY29uZmlndXJhdGlvbiBhY2NlcHRzIFVSTCBpbnB1dHMuCj4+Cj4+IFdo
YXQgYXJlIHlvdXIgdGhvdWdodHMgb24gdGhpcz8KPiAKPiBJIHRoaW5rIHlvdSBzaG91bGQgZ28g
d2l0aCBsb2NhbCBwYXRjaCBob25lc3RseS4KPiBBcyB0aGUgcGF0Y2ggaXMgbm93LgoKSSBhZ3Jl
ZSB3aXRoIEdpdWxpbywgaXQncyBwcm9iYWJseSBiZXR0ZXIgdG8gYWRkIHRoZSBmaWxlIHRvIEJ1
aWxkcm9vdC4KCkhlcmUncyB0aGUgcmF0aW9uYWxlLgoKRG93bmxvYWRpbmcgZmlsZXMgaW5zdGVh
ZCBvZiB2ZXJzaW9uaW5nIHRoZW0gaXMgbm90IG5lY2Vzc2FyaWx5IGEgYmFkCmlkZWEuIEhvd2V2
ZXIgcG1fY2ZnX29iai5jIGlzIHVuYXZvaWRhYmx5IGEgY29uZmlndXJhdGlvbi1kZXBlbmRlbnQK
ZmlsZSwgbWVhbmluZyBlYWNoIHVzZXIgbWFraW5nIHRoZWlyIF9wcm9qZWN0XyAocHJvamVjdCA9
IGEgc3BlY2lmaWMKY29uZmlndXJhdGlvbiBvZiBhIHNwZWNpZmljIGhhcmR3YXJlKSB3aWxsIGhh
dmUgYSBkaWZmZXJlbnQKcG1fY2ZnX29iai5jLiBUaGlzIGlzIGRpZmZlcmVudCBmcm9tIGRvd25s
b2FkaW5nIGEgcGF0Y2gsIG9yIGEKcG11ZncuYmluLCB3aGljaCBhcmUgcmV1c2FibGUgYWNyb3Nz
IHNldmVyYWwgcHJvamVjdHMuCgpUaGVvcmV0aWNhbGx5LCBpdCBtaWdodCBtYWtlIHNlbnNlIHRv
IGhhdmUgYSByZXBvIGhvc3RpbmcgcG1fY2ZnX29iai5jCm9ubHkgaWYgdGhhdCByZXBvIGNvbnRh
aW5zIGFsbCBwcm9qZWN0LXNwZWNpZmljIG1hdGVyaWFsIGZvciB0aGUKX3Byb2plY3RfIDogc2No
ZW1hdGljcywgRlBHQSBkZXNpZ24gZXRjLiBCdXQgdGhpcyBpcyBub3QgdGhlIGNhc2UgaGVyZS4K
CkJUVyBwbV9jZmdfb2JqLmMgaXMgYSAzMiBrQiB0ZXh0IGZpbGUgdGhhdCBjb21wcmVzc2VzIHRv
IDIga0IuIE5vdCBhIGJpZwpkZWFsLgoKLS0gCkx1Y2EKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
