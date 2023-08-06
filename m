Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4560AC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC36560E5B;
	Sun,  6 Aug 2023 21:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC36560E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 236Iu9AxGW3O; Sun,  6 Aug 2023 21:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDD6260E50;
	Sun,  6 Aug 2023 21:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDD6260E50
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 211C11BF947
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A5FC60AAC
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A5FC60AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gne-xN5WXijq for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:22:01 +0000 (UTC)
Received: from smtpcmd15188.aruba.it (smtpcmd15188.aruba.it [62.149.156.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA08960E51
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA08960E51
Received: from [10.10.6.40] ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SlCFqibn2QDLBSlCGqQGfS; Sun, 06 Aug 2023 23:21:57 +0200
Message-ID: <e33edaae-e04b-c9fd-29f1-8bd6954d2d74@benettiengineering.com>
Date: Sun, 6 Aug 2023 23:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZM/aaG0d/pzoYgp1@waldemar-brodkorb.de>
 <1f870f14-4bc1-1f8d-aa4e-e9f3e32f7f3c@benettiengineering.com>
In-Reply-To: <1f870f14-4bc1-1f8d-aa4e-e9f3e32f7f3c@benettiengineering.com>
X-CMAE-Envelope: MS4xfI0JogenvpF9sGswV5urLjBoli8TJd5nx0WFB/ANDXGuR6QPT7Q8Dk9ziUDKjYqryZGAPa06sePHZh/Sfih30FY0RO5PbsMoIsgRMztilGQMu0vQc4M5
 KLAfxC/BHOP0t8kKVfmi7MNCSiPJhJFaQ+y4XG8uiY63GSOgqp0vgR1QtOROMYAUcBtEZ0VaMiQLqBsahkgByxZXkL07fioXPSLXwCI3cholFBZmcqllfDNM
 scpN2Z0SdiKty4Doh26+dA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691356917; bh=kWLTM4CVAZ0jYalpUz2X6C78dmWruw2s5RaokU+vCCc=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=SoeYszDutgO1PLQ/Zylu0ohZHMDkltSrhDSUKxABky2QT5XvbXz5Io7ELy6yzbDbo
 fwgbM0V3rLX/26YJ+RgOMmAAamVJLWhNVJvJALhrLRm5+n/ZLKBMS8imkw875VwMhR
 88EeeAxweilpw1iw/0ynVpxcLdfX6hSsVTKg3myabpfYHGKD9S8ULR74rACJqmAZsC
 srzW6aACPXmHGk1CGQTk0z5re9BYzFMJCBjMInm2DNcHbRefVlYZlaCJ/MZymaEtz+
 sCOScDFN5hQLOnWtgb2CHn78K5ifzLjWeTXETIYytWeA4ACI4jINh3jj5g4a2kL7ve
 zGP1CJEw56hKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SoeYszDu
Subject: Re: [Buildroot] [PATCH] package/openssh: fix compile issue for m68k
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

T24gMDYvMDgvMjMgMjA6MzksIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IEhpIFdhbGRlbWFyLAo+
IAo+IE9uIDA2LzA4LzIzIDE5OjM3LCBXYWxkZW1hciBCcm9ka29yYiB3cm90ZToKPj4gRm9sbG93
aW5nIElDRSBvY2N1cnM6Cj4+IChjZCBvcGVuYnNkLWNvbXBhdCAmJiAvaG9tZS9hdXRvYnVpbGQv
bWFrZS9tYWtlKQo+PiBtYWtlWzJdOiBFbnRlcmluZyBkaXJlY3RvcnkgCj4+ICcvaG9tZS9hdXRv
YnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTEwL291dHB1dC0xL2J1aWxkL29wZW5zc2gtOS4zcDEv
b3BlbmJzZC1jb21wYXQnCj4+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMTAv
b3V0cHV0LTEvaG9zdC9iaW4vbTY4ay1idWlsZHJvb3QtbGludXgtdWNsaWJjLWdjYyAtRF9MQVJH
RUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0
wqAgLU8zIC1nMMKgIC1waXBlIC1Xbm8tZXJyb3I9Zm9ybWF0LXRydW5jYXRpb24gLVdhbGwgLVdw
b2ludGVyLWFyaXRoIC1XdW5pbml0aWFsaXplZCAtV3NpZ24tY29tcGFyZSAtV2Zvcm1hdC1zZWN1
cml0eSAtV3NpemVvZi1wb2ludGVyLW1lbWFjY2VzcyAtV25vLXBvaW50ZXItc2lnbiAtV25vLXVu
dXNlZC1yZXN1bHQgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCAtV21pc2xlYWRpbmctaW5kZW50YXRp
b24gLWZuby1zdHJpY3QtYWxpYXNpbmcgLURfRk9SVElGWV9TT1VSQ0U9MiAtZnRyYXB2IC1memVy
by1jYWxsLXVzZWQtcmVncz1hbGwgLWZuby1idWlsdGluLW1lbXNldMKgwqAgLWZQSUMgLUkuIC1J
Li4gLUkuIC1JLi8uLiAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAt
RF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX1hPUEVOX1NPVVJDRT02MDAgLURfQlNEX1NPVVJDRSAt
RF9ERUZBVUxUX1NPVVJDRSAtRF9HTlVfU09VUkNFIC1ESEFWRV9DT05GSUdfSCAtYyBic2QtYXNw
cmludGYuYwo+PiAvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTEwL291dHB1dC0x
L2hvc3QvYmluL202OGstYnVpbGRyb290LWxpbnV4LXVjbGliYy1nY2MgLURfTEFSR0VGSUxFX1NP
VVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NMKgIC1PMyAt
ZzDCoCAtcGlwZSAtV25vLWVycm9yPWZvcm1hdC10cnVuY2F0aW9uIC1XYWxsIC1XcG9pbnRlci1h
cml0aCAtV3VuaW5pdGlhbGl6ZWQgLVdzaWduLWNvbXBhcmUgLVdmb3JtYXQtc2VjdXJpdHkgLVdz
aXplb2YtcG9pbnRlci1tZW1hY2Nlc3MgLVduby1wb2ludGVyLXNpZ24gLVduby11bnVzZWQtcmVz
dWx0IC1XaW1wbGljaXQtZmFsbHRocm91Z2ggLVdtaXNsZWFkaW5nLWluZGVudGF0aW9uIC1mbm8t
c3RyaWN0LWFsaWFzaW5nIC1EX0ZPUlRJRllfU09VUkNFPTIgLWZ0cmFwdiAtZnplcm8tY2FsbC11
c2VkLXJlZ3M9YWxsIC1mbm8tYnVpbHRpbi1tZW1zZXTCoMKgIC1mUElDIC1JLiAtSS4uIC1JLiAt
SS4vLi4gLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9P
RkZTRVRfQklUUz02NCAtRF9YT1BFTl9TT1VSQ0U9NjAwIC1EX0JTRF9TT1VSQ0UgLURfREVGQVVM
VF9TT1VSQ0UgLURfR05VX1NPVVJDRSAtREhBVkVfQ09ORklHX0ggLWMgYnNkLWNsb3NlZnJvbS5j
Cj4+IGR1cmluZyBSVEwgcGFzczogemVyb19jYWxsX3VzZWRfcmVncwo+PiBic2QtY2xvc2Vmcm9t
LmM6IEluIGZ1bmN0aW9uICdjbG9zZWZyb20nOgo+PiBic2QtY2xvc2Vmcm9tLmM6MTUxOjE6IGlu
dGVybmFsIGNvbXBpbGVyIGVycm9yOiBpbiBjaGFuZ2VfYWRkcmVzc18xLCAKPj4gYXQgZW1pdC1y
dGwuYzoyMjc1Cj4+IMKgwqAgMTUxIHwgfQo+PiDCoMKgwqDCoMKgwqAgfCBeCj4+IDB4N2ZhNzZm
NGJhZDA5IF9fbGliY19zdGFydF9tYWluCj4+IMKgwqDCoMKgLi4vY3N1L2xpYmMtc3RhcnQuYzoz
MDgKPj4gUGxlYXNlIHN1Ym1pdCBhIGZ1bGwgYnVnIHJlcG9ydCwKPj4gd2l0aCBwcmVwcm9jZXNz
ZWQgc291cmNlIGlmIGFwcHJvcHJpYXRlLgo+PiBQbGVhc2UgaW5jbHVkZSB0aGUgY29tcGxldGUg
YmFja3RyYWNlIHdpdGggYW55IGJ1ZyByZXBvcnQuCj4+IFNlZSA8aHR0cDovL2J1Z3MuYnVpbGRy
b290Lm5ldC8+IGZvciBpbnN0cnVjdGlvbnMuCj4+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MTA2
OiBic2QtY2xvc2Vmcm9tLm9dIEVycm9yIDEKPj4KPj4gRml4ZXMgZm9sbG93aW5nIGF1dG9idWls
ZCBmYWlsdXJlOgo+PiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9kMjkv
ZDI5YzY2MmU0MWQ4OTY5ZTZhOGFhMjQ4NzBlNzI4YmNjNzA1MDU2My8KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogV2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4KPj4gLS0tCj4+IMKgIHBh
Y2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rIHwgNSArKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zc2gvb3BlbnNz
aC5tayBiL3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rCj4+IGluZGV4IGUxNGQ3NTIyOTAuLjY1
ZjAyMDg4YTAgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rCj4+ICsr
KyBiL3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rCj4+IEBAIC0zNSw2ICszNSwxMSBAQCBkZWZp
bmUgT1BFTlNTSF9QRVJNSVNTSU9OUwo+PiDCoMKgwqDCoMKgIC92YXIvZW1wdHkgZCA3NTUgcm9v
dCByb290IC0gLSAtIC0gLQo+PiDCoCBlbmRlZgo+PiArIyB3b3JrYXJvdW5kIGdjYyBJQ0Ugd2l0
aCAxMS54LzEyLnggYW5kIDEzLngKPj4gK2lmZXEgKCQoQlIyX202OGspLHkpCj4+ICtPUEVOU1NI
X0NPTkZfT1BUUyArPSAtLXdpdGhvdXQtaGFyZGVuaW5nCj4+ICtlbmRpZgo+PiArCj4gCj4gVGhp
cyBkZXNlcnZlcyBhIGdjYyBidWcgdGhhdCBJJ3ZlIGFkZGVkIHdpdGggdGhpcyBwYXRjaDoKPiBo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMw
ODA2MTgzNzM4LjI1NzAwNi0xLWdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20v
Cj4gCj4gdGhpcyBpcyB0aGUgYnVnOgo+IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hv
d19idWcuY2dpP2lkPTgwNzg2Cj4gCj4gYW5kIGZvciBjb25zaXN0ZW5jeSBpbiBCdWlsZHJvb3Qg
d2UgdGVuZCB0byB3b3JrLWFyb3VuZCBnY2MvYmludXRpbHMKPiBidWdzLCB3aGVuZXZlciBwb3Nz
aWJsZSwgYnkgbG93ZXJpbmcgdGhlIG9wdGltaXphdGlvbiB0byAtTzAsIHNvIEkgYXNrCj4geW91
IHRvIHNlbmQgYSBwYXRjaCBkb2luZyB0aGlzLgo+IFlvdSBjYW4gdGFrZSBhcyBhIG1vZGVsIHRo
aXMgY29tbWl0IGZvciB0aGUgY29tbWl0IGxvZyB0b286Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzgwMzI0NzMzN2QzNTY0M2FmZGNhOTcxOGM0
NjE2NTAwYjk5MzBmMmQKCkJ5IHRoZSB3YXkgSSd2ZSBnaXZlbiBhIHRyeSB3aXRoIC1PMCB3b3Jr
YXJvdW5kIGJ1dCBpdCBzdGlsbCBzaG93cyBnY2MKSUNFIHdpdGggZ2NjIDEzLjIuMC4gU28gYXQg
dGhpcyBwb2ludCBJIHdvdWxkIGRpc2FibGUgaGFyZGVuaW5nIGxpa2UKeW91J3ZlIHByb3Bvc2Vk
IGJ1dCBieSBjaGVja2luZyBmb3IgQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JVR184MDc4NgppbnN0
ZWFkIG9mIEJSMl9tNjhrLiBDYW4geW91IHByb3ZpZGUgc3VjaCBwYXRjaCBwb2ludGluZyB0aGF0
IGl0CmRlcGVuZHMgb24gbWluZSBvbiBhIGNvdmVyIGxldHRlciBvciBhZnRlciB0aGUgMyBkYXNo
ZXM/CgpUaGFuayB5b3UhCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQ0VPJkNUT0BC
ZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
