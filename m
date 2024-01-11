Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E5EC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 11:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EF5642897;
	Thu, 11 Jan 2024 11:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EF5642897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8LzxxigCrKN; Thu, 11 Jan 2024 11:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08A5C41E1E;
	Thu, 11 Jan 2024 11:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08A5C41E1E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D54CF1BF97F
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 11:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9F01405D0
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 11:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9F01405D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5HDVNm-h3fV for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 11:41:26 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2032140142
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 11:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2032140142
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BB172B0059C;
 Thu, 11 Jan 2024 12:41:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 12:41:18 +0100
Date: Thu, 11 Jan 2024 12:41:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZZ_T3kL9qPTAOHEA@landeda>
References: <20240111103819.3984913-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111103819.3984913-1-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704973284;
 bh=xAI5fcZ5I/ZMnFp8iaO/vcsRsnKmZ/EKlF8fo2ytMmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hc98IppBjFzHhBiux2MJyhdPbNdb76yR9+3Qr4W3k3tmc/uNixNxd0SB0A+Rd/71N
 yaxPWQL87YdJ1GevVT7Wz7odpu6tLp2IvXUVvIBPVPT0Hw+7p62sKKedzwloU+KFC+
 gxYeDsBOQXSRSoRhrzYFeWGn2p3NGSPKBW31e8hznrRbUcMzQkbCazPnrCtXt4JKDy
 KH9on/3HQd6ECyN5HSit4jUuIu9O2F8Mm3BgpN/G/BYuW88ggfyto9f51jSBjlJsXm
 FNVPxfRdERdnOBMbDXCn+nr3+0NuV4MSNAiR0+/7zXoqqDnlEJhM27ZepwKyj7/Qq4
 2BfVpr94FYU3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Hc98IppB
Subject: Re: [Buildroot] [PATCH v4 1/3] Revert "support/download: generate
 even more reproducible tarballs"
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
Cc: Romain Naour <romain.naour@smile.fr>, Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW50b2luZSwgQWxsLAoKT24gMjAyNC0wMS0xMSAxMTozOCArMDEwMCwgQW50b2luZSBDb3V0YW50
IHNwYWtlIHRodXNseToKPiBGcm9tOiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPgo+IAo+IENvbW1pdCA3NjhmOWY4MGY2MmMgKHN1cHBvcnQvZG93bmxvYWQ6IGdlbmVy
YXRlIGV2ZW4gbW9yZSByZXByb2R1Y2libGUKPiB0YXJiYWxscykgY2F1c2VzIG5vbi1yZXByb2R1
Y2liaWxpdHkgaW4gdGFyYmFsbHMgd2UgcHJldmlvdXN5Cj4gZ2VuZXJhdGVkLCBlc3BlY2lhbGx5
IHRoZSBhcmNoaXZlcyBmb3IgdHdvIGNhcmdvLXZlbmRvcmVkIHBhY2thZ2VzLAo+IHJpcGdyZXAg
YW5kIHNlbnRyeS1jbGkuCj4gCj4gVGhlIGNhdXNlIGlzIHRoYXQgdGhvc2UgdHdvIHBha2NhZ2Vz
IGV2ZW50dWFsbHkgdmVuZG9yIGEgZmlsZSB0aGF0IGhhcwo+IHRoZSB1K3ggYml0IHNldCwgYnV0
IGlzIG90ZWhyd2lzZSBnby14LiBXaXRoIDc2OGY5ZjgwZjYyYywgdGhlIGZpbGVzIGFyZQo+IG5v
dyBnbyt4LCBzbyB0aGUgaGFzaCBmb3IgdGhvc2UgZ2VuZXJhdGVkIGFyY2hpdmVzIGhhcyBjaGFu
Z2VkLgo+IAo+IEJlc2lkZXMsIHRoYXQgY29tbWl0IHdhcyB3cm9uZzogaXQgZGlkIG5vdCBhY2Nv
dW50IGZvciB0aGUgJ3InIGJpdCBmb3IKPiBnbyBwYXJ0LCBsZWF2aW5nIHNvbWUgbm9uLXJlcHJv
ZHVjaWJpbGl0eSBzdGlsbCB1bmFjY291bnRlZCBmb3IuCj4gCj4gU28sIHRvIGdlbmVyYXRlIHJl
YWxseSByZXByb2R1Y2libGUgYXJjaGl2ZXMsIHdlIHdvdWxkIG5lZWQgdG8gZml4IHRoYXQKPiBy
ZWFkIGJpdCBhcyB3ZWxsLCBhbmQgdGhhdCBoYXMgdGhlIHBvdGVudGlhbCB0byBhZmZlY3QgYWxs
IHRoZSBhcmNoaXZlcwo+IHdlIGdlbmVyYXRlZCBzbyBmYXIuIElmIHdlIHdhbnRlZCB0byBkbyBz
bywgd2UnZCBuZWVkIGEgd2F5IHRvIHZlcnNpb24KPiBhbGwgZ2VuZXJhdGVkIGFyY2hpdmVzLCBs
aWtlIHdlIGRvIGZvciBnaXQgYW5kIHN2biwgYnV0IG5vdyBmb3IgYWxsIHRoZQo+IGRpZmZlcmVu
dCBDVlNlcywgYXMgd2VsbCBhcyBmb3IgYWxsIHRoZSB2ZW5kb3JpbmcgcG9zdC1wcm9jZXNzZXMu
Cj4gCj4gRm9yIDc2OGY5ZjgwZjYyYywgYWxsIHRoYXQgd2FzIG9mIGNvbmVybiB3YXMgdGhlIHdv
cmtpbmcgY29waWVzIG9mIENWU2VzCj4gKGkuZS4gZ2l0LCBzdm4sIGN2cy4uLikgdGhhdCB3ZSBj
YWNoZSBpbiB0aGUgQnVpbGRyb290IGRvd25sb2FkIGRpciwgbm90Cj4gdGhlIHRlbXBvcmFyeSBm
aWxlcyBkdXJpbmcgcG9zdC1wcm9jZXNzaW5nLiBJbmRlZWQsIGluIHRoYXQgbGF0dGVyIGNhc2Us
Cj4gdGhlIHVzZXIgaGFzIHZpcnR1YWxseSBubyB3YXkgdG8gbWFuZ2xlIHdpdGggdGhlIG1vZGUg
b2YgdGhlCj4gaW50ZXJtZWRpYXRlIGV4dHJhY3QgYmVmb3JlIHJlcGFjay4KPiAKPiBBbmQgd2Ug
ZG8gaGF2ZSBhIGJpZyBmYXQgd2FybmluZyB0aGF0IHVzZXJzIHNob3VsZCBub3QgYXR0ZW1wdCB0
byBtZWRkbGUKPiB3aXRoIHRoZSBnaXQgdHJlZSB0aGF0IEJ1aWxkcm9vdCBjYWNoZXMuCj4gCj4g
QXMgNzY4ZjlmODBmNjJjIGhvd2V2ZXIgZGVtb25zdHJhdGVzLCBpcyB0aGF0IGl0IHRvb2sgcXVp
dGUgYSBsb25nIHRpbWUKPiBiZXR3ZWVuIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIGdpdCBjYWNo
aW5nLCBhbmQgdGhlIHRpbWUgc29tZW9uZQo+IGV2ZW50dWFsbHkgZGlzY292ZXJlZCB0aGV5IGNv
dWxkIG1lZGRsZSBpbiB0aGVyZS4gVGhpcyBzaG93cyB0aGF0IHRoZQo+IGlzc3VlIGl0IG5vdCBh
Y3R1YWxseSBjcml0aWNhbCBpbiBtb3N0IHNldHVwcy4KPiAKPiBBbHNvLCB0aGUgdGFyIG1hbnVh
bCBbMF0gaGludHMgYXQgYSBiZXR0ZXIgc29sdXRpb24gdG8gaGFuZGxlCj4gcmVwcm9kdWNpYmls
aXR5LCB3aGljaCBldmVuIGF2b2lkcyB0b3VjaGluZyB0aGUgZmlsZXMgb24gZGlzayB3aGljaCBp
cwo+IGV2ZW4gbmljZXI6Cj4gCj4gICAgIOKAmC0tbW9kZT0nZ28rdSxnby13J+KAmQo+ICAgICAg
ICAgT21pdCBpcnJlbGV2YW50IGluZm9ybWF0aW9uIGFib3V0IGZpbGUgcGVybWlzc2lvbnMuCj4g
Cj4gSWYgd2Ugd2VyZSB0byBhY3R1YWxseSBoYW5kbGUgdGhlIG1vZGUgYml0IGZvciByZXByb2R1
Y2liaWxpdHksIHdlJ2QKPiBuZWVkIHRvOgo+ICAgLSBpbnRyb2R1Y2UgYXJjaGl2ZSB2ZXJzaW9u
aW5nIGZvciBhbGwgZG93bmxvYWQgYmFja2VuZHMgYW5kCj4gICAgIHByb3N0LXByb2Nlc3NpbmcK
PiAgIC0gdXNlIHRoZSB0YXIgb2ZmaWNpYWxseSBzdWdnZXN0ZWQgbWV0aG9kCj4gCj4gU28sIHJl
dmVydCB0aGF0IGNoYW5nZSwgYXMgaXQgd2FzIGluY29tcGxldGUsIHdhcyBub3QgcmVhbGx5IGZp
eGluZyBtdWNoCj4gaXNzdWVzLCBhbmQgY2F1c2VzIGFjdHVhbCBpc3N1ZXMuCj4gCj4gVGhpcyBy
ZXZlcnRzIGNvbW1pdCA3NjhmOWY4MGY2MmMxZGE2ZTI5OGM2ODBmMGY0YmZhODg3ZjM4Yzc4Lgo+
IAo+IFswXSBodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL3Rhci9tYW51YWwvdGFyLmh0bWwj
UmVwcm9kdWNpYmlsaXR5Cj4gCj4gVGhhbmtzIHRvIFZpbmNlbnQgYW5kIEFybm91dCBmb3IgcG9p
bnRpbmcgYXQgdGhlIHRhciBtYW51YWwuCj4gCj4gUmVwb3J0ZWQtYnk6IEFudG9pbmUgQ291dGFu
dCA8YW50b2luZS5jb3V0YW50QHNtaWxlLmZyPgo+IFJlcG9ydGVkLWJ5OiBUaG9tYXMgUGV0YXp6
b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IFNpZ25lZC1vZmYtYnk6IFlhbm4g
RS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+IENjOiBWaW5jZW50IEZhemlvIDx2
ZmF6aW9AeGVzLWluYy5jb20+Cj4gQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0v
TWluZCkgPGFybm91dEBtaW5kLmJlPgo+IFRlc3RlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4u
bmFvdXJAc21pbGUuZnI+Cj4gU2lnbmVkLW9mZi1ieTogQW50b2luZSBDb3V0YW50IDxhbnRvaW5l
LmNvdXRhbnRAc21pbGUuZnI+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywK
WWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHN1cHBvcnQvZG93bmxvYWQvaGVscGVycyB8IDMgLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBw
b3J0L2Rvd25sb2FkL2hlbHBlcnMgYi9zdXBwb3J0L2Rvd25sb2FkL2hlbHBlcnMKPiBpbmRleCAy
NjU2ODVlZmY1Li45MGE3ZDZjMWVjIDEwMDc1NQo+IC0tLSBhL3N1cHBvcnQvZG93bmxvYWQvaGVs
cGVycwo+ICsrKyBiL3N1cHBvcnQvZG93bmxvYWQvaGVscGVycwo+IEBAIC01Myw5ICs1Myw2IEBA
IG1rX3Rhcl9neigpIHsKPiAgICAgIHRtcD0iJChta3RlbXAgLS10bXBkaXI9IiQocHdkKSIpIgo+
ICAgICAgcHVzaGQgIiR7aW5fZGlyfSIgPi9kZXYvbnVsbAo+ICAKPiAtICAgICMgRW5mb3JjZSBn
cm91cC9vdGhlcnMgbW9kZSBiaXRzCj4gLSAgICBjaG1vZCAtUiBnby13eCtYIC4KPiAtCj4gICAg
ICAjIEVzdGFibGlzaCBsaXN0Cj4gICAgICBmaW5kIC4gLW5vdCAtdHlwZSBkIC1hbmQgLW5vdCBc
KCAtZmFsc2UgIiR7ZmluZF9vcHRzW0BdfSIgXCkgPiIke3RtcH0ubGlzdCIKPiAgICAgICMgU29y
dCBsaXN0IGZvciByZXByb2R1Y2liaWxpdHkKPiAtLSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJ
QkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUg
IERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMz
IDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBc
ZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxf
IHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
