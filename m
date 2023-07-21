Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0170DEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 12:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81A27612F3;
	Fri, 21 Jul 2023 12:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81A27612F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dOJT1LwpkNow; Fri, 21 Jul 2023 12:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E3FB612DB;
	Fri, 21 Jul 2023 12:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E3FB612DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CEA61BF331
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 12:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26901612DB
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 12:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26901612DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZZ3s8nxYEoq for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 12:58:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAC79612B7
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 12:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAC79612B7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA8342F4;
 Fri, 21 Jul 2023 05:59:16 -0700 (PDT)
Received: from debian (unknown [10.57.31.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD6D53F6C4;
 Fri, 21 Jul 2023 05:58:32 -0700 (PDT)
Date: Fri, 21 Jul 2023 14:58:29 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZLqAtjeeukVSdN4b@debian>
Mail-Followup-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
References: <20230719125309.723762-1-vincent.stehle@arm.com>
 <20230720232827.09c3094d@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230720232827.09c3094d@windsurf>
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: add patch to fix
 fiptool link
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMTE6Mjg6MjdQTSArMDIwMCwgVGhvbWFzIFBldGF6em9u
aSB3cm90ZToKPiBIZWxsbyBWaW5jZW50LAoKSGkgVGhvbWFzLAoKVGhhbmtzIGZvciB0aGUgcmV2
aWV3LgoKPiAKPiBPbiBXZWQsIDE5IEp1bCAyMDIzIDE0OjUzOjA5ICswMjAwCj4gVmluY2VudCBT
dGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPiB3cm90ZToKPiAKPiA+IFdoZW4gYnVpbGRp
bmcgYSBmaXAgZmlybXdhcmUgKEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfRklQPXkp
LCB0aGUKPiA+IFRGLUEgYnVpbGQgcmVjaXBlIHN0YXJ0cyBieSBidWlsZGluZyB0aGUgaG9zdCBw
cm9ncmFtIGZpcHRvb2wgd2l0aCB0aGUKPiA+IHByb3BlciBidWlsZCBlbnZpcm9ubWVudCB2YXJp
YWJsZXMuIFRoZW4gdGhlIG1haW4gVEYtQSB0YXJnZXQgZmlybXdhcmUKPiA+IGJ1aWxkIHN0ZXAg
dGFrZXMgcGxhY2UsIHdpdGggdGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhlIGZpcHRvb2wgcHJvZ3Jh
bSB3aWxsCj4gPiBiZSB1c2VkIHVuZGVyIHRoZSBob29kIGlmIG5lY2Vzc2FyeS4KPiA+IAo+ID4g
SW4gVEYtQSwgdGhlIGJ1aWxkIHJlY2lwZSBmb3IgdGhlIGhvc3QgcHJvZ3JhbSBmaXB0b29sIGhh
cyBzdWJ0bHkgY2hhbmdlZAo+ID4gYWZ0ZXIgdjIuNywgaW4gY29tbWl0IGNmMmRkMTdkZGRhMiAo
InJlZmFjdG9yKHNlY3VyaXR5KTogYWRkIE9wZW5TU0wgMS54Cj4gPiBjb21wYXRpYmlsaXR5Iiku
IFRoaXMgY2hhbmdlIGhhcyB0aGUgZWZmZWN0IHRvIGZvcmNlIHJlLWxpbmtpbmcgZmlwdG9vbAo+
ID4gZWFjaCB0aW1lLgo+ID4gCj4gPiBJZiB3ZSB0cnkgdG8gYnVpbGQgd2l0aCBCdWlsZHJvb3Qg
YSBmaXAgZmlybXdhcmUgd2l0aCBhIFRGLUEgdmVyc2lvbiBhZnRlcgo+ID4gdjIuNyBjb21wcmlz
aW5nIHRoZSBhZm9yZW1lbnRpb25lZCBjaGFuZ2UsIHRoZSBmaXB0b29sIHByb2dyYW0gaXMgZm9y
Y2libHkKPiA+IHJlLWxpbmtlZCBkdXJpbmcgdGhlIG1haW4gZmlybXdhcmUgYnVpbGQgc3RlcC4g
VGhpcyBoYXBwZW5zIHdpdGhvdXQgdGhlCj4gPiBwcm9wZXIgYnVpbGQgZW52aXJvbm1lbnQgdmFy
aWFibGVzIGFuZCBjb25zZXF1ZW50bHksIGlmIG9wZW5zc2wgaXMgbm90Cj4gPiBpbnN0YWxsZWQg
b24gdGhlIGhvc3QsIHRoZSBsaWJjcnlwdG8gc2hhcmVkIGxpYnJhcnkgd2lsbCBub3QgYmUgZm91
bmQgYnkKPiA+IHRoZSBsaW5rZXIgYW5kIHRoZSBsaW5rIHdpbGwgZmFpbCB3aXRoIHRoZSBmb2xs
b3dpbmcgZXJyb3I6Cj4gPiAKPiA+ICAgL3Vzci9iaW4vbGQ6IGNhbm5vdCBmaW5kIC1sY3J5cHRv
OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gPiAKPiA+IEEgcGF0Y2ggaGFzIGJlZW4gaW50
ZWdyYXRlZCBpbnRvIFRGLUEgdG8gYXZvaWQgcmUtbGlua2luZyBmaXB0b29sIHdoZW4gbm90Cj4g
PiBuZWNlc3NhcnksIHdoaWNoIHNob3VsZCBzb2x2ZSB0aGUgcHJvYmxlbSBzdGFydGluZyB3aXRo
IHZlcnNpb24gdjIuMTAuIEFkZAo+ID4gdGhhdCBwYXRjaCBpbiBCdWlsZHJvb3QgZm9yIHZlcnNp
b25zIHYyLjggYW5kIHYyLjksIHRvIHJlcGFpciB0aGUgYnVpbGQgaW4KPiA+IHRoZSBjYXNlcyBk
ZXNjcmliZWQgYWJvdmUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8
dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiA+IENjOiBEaWNrIE9sc3NvbiA8aGlAc2VuemlsbGEu
aW8+Cj4gPiBDYzogU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+IAo+ID4gCj4gPiBIaSwKPiA+IAo+ID4gVGhpcyBjYW4gYmUgdGVzdGVkIHdpdGggZS5n
LiB0ZXN0cy5ib290LnRlc3RfZWRrMiBpbiBhbiBlbnZpcm9ubWVudCB3aXRoIG5vCj4gPiBvcGVu
c3NsIChsaWJjcnlwdG8pIGluc3RhbGxlZC4KPiAKPiBJbmRlZWQsIHdoaWNoIG1lYW5zIHRoaXMg
Y29tbWl0IGNhbiBoYXZlOgo+IAo+IEZpeGVzOgo+IAo+ICAgaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy80NjY0ODQ1NzY3Cj4gCgpPaywgdGhhbmtzLiBJ
IHdpbGwgc2VuZCBhIHYyIHdpdGggdGhpcyBtZW50aW9uLgoKPiBBcyB1c3VhbCwgb25lIGNvbmNl
cm4gaXMgdGhhdCB5b3VyIGNvbW1pdCBpcyBmaXhpbmcgdGhlIGlzc3VlIGZvcgo+IHBlb3BsZSB1
c2luZyB2Mi44IGFuZCB2Mi45IHByZWNpc2VseSwgYnV0IGFueW9uZSB1c2luZyBhIGN1c3RvbSB2
ZXJzaW9uCj4gYmFzZWQgb24gMi44IG9yIDIuOSB3aWxsIG5vdCBiZW5lZml0IGZyb20gdGhpcyBm
aXguCgpZb3UgYXJlIHJpZ2h0LCB0aGlzIHNvbHV0aW9uIGlzIG5vdCBwZXJmZWN0LgoKVG8gbWl0
aWdhdGUgdGhpcyBiYWQgaW1wcmVzc2lvbiwgaGVyZSBpcyBhIHF1aWNrIGF1ZGl0IG9mIHRoZSBl
eGlzdGluZwpkZWZjb25maWdzIGluIHRoZSB0cmVlOgoKICA0NSBoYXZlIFRGLUEKICAgOSBoYXZl
IFRGLUEgd2l0aCBGSVAKICAgMiBoYXZlIGEgY3VzdG9tIFRGLUEgdmVyc2lvbiAodjIuNC1zdG0z
Mm1wLXIxKQogICAyIGhhdmUgYSBURi1BIHZlcnNpb24gaW4gdjIuOC4udjIuOQogICAwIGhhdmUg
VEYtQSB3aXRoIEZJUCBhbmQgYSBjdXN0b20gdmVyc2lvbiBpbiB2Mi44Li52Mi45CgpJIHdvdWxk
IHNheSB0aGF0IGZvciB3aGF0IGlzIGluIHRyZWUgYXQgbGVhc3Qgd2UgYXJlIHNhZmUuCgo+IAo+
IE9uZSBvcHRpb24gd291bGQgYmUgdG8gcGFzcyB0aGUgcmVsZXZhbnQgZW52aXJvbm1lbnQgdmFy
aWFibGVzIGFsc28gYXQKPiBidWlsZCB0aW1lLCBzbyB0aGF0IHdoZW4gZmlwdG9vbCBpcyByZWxp
bmtlZCwgaXQgZ2V0cyByZWxpbmtlZAo+IGNvcnJlY3RseS4gQnV0IGl0J3MgcXVpdGUgYW5ub3lp
bmcgdG8ga2VlcCB0aGlzIHByZXR0eSBtdWNoIGZvcmV2ZXIgaW4KPiBCdWlsZHJvb3QuIFNvIHBl
cmhhcHMgeW91ciBzb2x1dGlvbiB3aXRoIGEgcGF0Y2ggaXMgdGhlIG1vc3QKPiByZWFzb25hYmxl
LCBhbmQgcGVvcGxlIGFmZmVjdGVkIGJ5IHRoZSBpc3N1ZSB3aWxsIGZpbmQgdGhlIHBhdGNoIGlu
Cj4gQnVpbGRyb290IGFuZCB1c2UgaXQgZm9yIHRoZWlyIGN1c3RvbSB2ZXJzaW9uIGFzIHdlbGwu
CgpBbm90aGVyIGFwcHJvYWNoIG1pZ2h0IGJlIGZvciB0aGUgbWFrZWZpbGUgdG8gYXBwbHkgdGhl
IHBhdGNoIG9ubHkgaWYgaXQgY2FuCmRldGVybWluZSB0aGF0IHRoZSBURi1BIHZlcnNpb24gaXMg
aW4gdGhlIHJhbmdlIHYyLjguLnYyLjkgYW5kIHRoYXQgZmlwdG9vbCBpcwpuZWNlc3NhcnkuCkkg
dGhpbmsgaXQgaXMgbmVhcmx5IGltcG9zc2libGUgdG8gbWFrZSB0aGUgcmFuZ2UgZGV0ZXJtaW5h
dGlvbiB3b3JrIGluIHRoZQpnZW5lcmFsIGNhc2UgKGZvciBleGFtcGxlIHdoZW4gdGhlIHZlcnNp
b24gZ2l2ZW4gaXMgYSBjb21taXQgaWQpLCB0aGVyZWZvcmUgSQpkaWQgbm90IGludmVzdGlnYXRl
IHRoYXQgcGF0aCBzZXJpb3VzbHkuCgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgo+IAo+IFRob21h
cwo+IC0tIAo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBz
Oi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
