Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FF9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 17:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2865060BE2;
	Thu, 10 Feb 2022 17:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rW5XeTed-udZ; Thu, 10 Feb 2022 17:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 538A460B69;
	Thu, 10 Feb 2022 17:38:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCADF1BF228
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 17:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBBAE81353
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 17:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3G03DwqAtCtP for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 17:38:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 864A58134B
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 17:38:52 +0000 (UTC)
Received: from [77.244.183.192] (port=64858 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nIDP8-000ApD-8p; Thu, 10 Feb 2022 18:38:50 +0100
Message-ID: <261c3a21-23cb-4217-e396-a85dc605d4d1@lucaceresoli.net>
Date: Thu, 10 Feb 2022 18:38:49 +0100
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
 <690d8e1b-fb6d-7c36-b07f-4ed9ca61b768@lucaceresoli.net>
 <PH0PR02MB77502EC0E2E1A577AEF5201DD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
 <489a02df-4f2b-a46c-aa49-15c3c545f8f2@lucaceresoli.net>
 <SJ0PR02MB77583C51A75C70EDA6E1AC29D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <acd2a42d-dff6-45f1-607c-1fb74294d1f1@benettiengineering.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <acd2a42d-dff6-45f1-607c-1fb74294d1f1@benettiengineering.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
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

SGkgR2l1bGlvLCBOZWFsLAoKT24gMTAvMDIvMjIgMTc6MzEsIEdpdWxpbyBCZW5ldHRpIHdyb3Rl
Ogo+IEhpIE5lYWwgYW5kIEx1Y2EsCj4gCj4gT24gMTAvMDIvMjIgMTY6NDYsIE5lYWwgRnJhZ2Vy
IHdyb3RlOgo+PiBIaSBMdWNhLAo+Pgo+Pj4gSW50ZXJlc3RpbmcsIEknbSBjdXJpb3VzIGhvdyB0
aGlzIHdvcmtzLiBUaGUgcG1fY2ZnX29iai5jIGF0IHRoZSBVUkwKPj4+IHlvdSBwcm92aWRlZCwg
YXMgd2VsbCBhcyBpbiB0aGUgcGF0Y2hlcyB5b3Ugc2VudCwgaGFzIHNvbWUgcGVyaXBoZXJhbHMK
Pj4+IGRpc2FibGVkOiBVU0IxLCBFVEgwLzEvMiwgYm90aCBTUElzLCBOQU5ELCBDQU4wLCBWQ1Ug
YW5kIG1vcmUuIERvCj4+PiBjdXJyZW50IGtlcm5lbHMgaW1wbGVtZW50IGVuYWJsaW5nIHRoZXNl
IGF0IHJ1bnRpbWUsIG1ha2luZwo+Pj4gYXBwcm9wcmlhdGUgcmVxdWVzdHMgdG8gUE1VRlc/IFRo
aXMgd2Fzbid0IHRoZSBjYXNlIGxhc3QgdGltZSBJCj4+PiBsb29rZWQgaW50byB0aGF0LCBpdCB3
b3VsZCBiZSB2ZXJ5IGludGVyZXN0aW5nIGlmIGl0wqAgaGFzIGhhcHBlbmVkIGluCj4+PiB0aGUg
bWVhbnRpbWUuCj4gCj4gTmVhbCwgY2FuIHlvdSByZXBseSBhYm91dCB0aGlzIF5eXi4gQXQgbGVh
c3QsIGFyZSBVU0IxLCBFVEgwLzEvMiwgYm90aAo+IFNQSXMsIE5BTkQsIENBTjAsIFZDVSBwcmVz
ZW50IG9uIHRob3NlIDIgYm9hcmRzPwo+IAo+Pj4gT3RoZXJ3aXNlIG9uZSB3b3VsZCBuZWVkIHRv
IHByb3ZpZGUgYSBwZXItY29uZmlndXJhdGlvbiBwbXUgY29uZmlnIG9yCj4+PiBhICJ3aWxkY2Fy
ZCIgY29uZmlnLCBidXQgSSdtIG5vdCBzdXJlIHdoZXRoZXIgaXQgd291bGQgY292ZXIgYWxsCj4+
PiBwb3RlbnRpYWwgdXNlIGNhc2VzLiAKPiAKPiBJIGFncmVlLgo+IAo+PiBFdmVuIHRob3VnaCBC
dWlsZHJvb3QgaGFzIFthbG1vc3RdIG9ubHkgZGVmY29uZmlncyBmb3Igd2VsbC1rbm93bgo+PiBl
dmFsdWF0aW9uIGJvYXJkcywgaXQgaXMgcmVhbGx5IG1lYW50IHRvIGJlIHVzZWQgYnkgY3VzdG9t
IGRlc2lnbnMsCj4+IHRodXMgd2Ugd2FudCB0byBiZSBhYmxlIHRvIHVzZSBvdGhlciBjb25maWd1
cmF0aW9ucyB0aGFuIHRob3NlIHVzZWZ1bAo+PiBmb3IgWGlsaW54IGJvYXJkcy4KPiAKPiBObywg
aXQncyBub3QgbWVhbnQgdG8gYmUgdXNlZCBmb3IgY3VzdG9tIGJvYXJkcywgdGhlIGdvYWwgaXMg
aGF2aW5nIHRoZQo+IDIgQlNQIGZvciB0aGUgMiBib2FyZHMgYW5kIHRoYXQncyBpdC4gVGhlIG9u
ZXMgd2hvIHdpbGwgbmVlZCB0byBjcmVhdGUKPiBjdXN0b20gQlNQIHdpbGwgYWQgbmV3IEJTUHMg
c3RhcnRpbmcgZnJvbSB5b3VyIHJlZmVyZW5jZS4gU28gaGVyZSBhZ2Fpbgo+IHdoYXQgTHVjYSBw
b2ludGVkIGFib3ZlIGFib3V0IGEgd2lsZGNhcmQgY29uZmlnIGlzIHRydWU6IHdlIGRvbid0IGtu
b3cKPiBpZiBpdCB3aWxsIHJlYWxseSBjb3ZlciBhbGwgY2FzZXMuCgpFaXRoZXIgSSBkaWRuJ3Qg
ZXhwbGFpbiBjbGVhcmx5IG9yIHdlIGNvbXBsZXRlbHkgZGlzYWdyZWUuIDopCgpXaGF0IEkgbWVh
biBpczogdGhlIGdvYWwgKm9mIEJ1aWxkcm9vdCogaXMgdG8gYnVpbGQgdGhlIHNvZnR3YXJlIHRv
IHJ1bgplbWJlZGRlZCBMaW51eCBzeXN0ZW1zLiBBbnkgZW1iZWRkZWQgTGludXggc3lzdGVtLCBm
aXJzdCBhbmQgZm9yZW1vc3QKdGhlIGVsZWN0cm9uaWMgcHJvZHVjdHMgdGhhdCBtYW55IGNvbXBh
bmllcyBtYWtlLCBhbmQgdGhhdCBJIGNhbGwKImN1c3RvbSBkZXNpZ25zIi4KCkRldmVsb3BtZW50
L2V2YWx1YXRpb24gYm9hcmRzIGFyZSBhIHNtYWxsIHN1YnNldCBvZiB0aGUgYWJvdmUsIGhvd2V2
ZXIKQnVpbGRyb290IGRlZmNvbmZpZ3MgdGVuZCB0byBjb3ZlciB0aG9zZSBib2FyZHMgYmVjYXVz
ZSB0aGV5IGFyZQpwdWJsaWNseSBhdmFpbGFibGUgYW5kIGNvbW1vbmx5IHVzZWQgYnkgZW1iZWRk
ZWQgZGV2ZWxvcGVycy4KCk9mIGNvdXJzZSBJIGFncmVlIHRoYXQgdGhlIGdvYWwgKm9mIE5lYWwn
cyBwYXRjaGVzKiBpcyB0byBzdXBwb3J0IHR3bwpzcGVjaWZpYyBldmFsdWF0aW9uIGJvYXJkcy4K
CkJhY2sgdG8gdGhlIGluaXRpYWwgZGlzY3Vzc2lvbiB0b3BpYywgd2UgbmVlZCBCdWlsZHJvb3Qg
dG8gYmUgYWJsZSB0bwpjb250YWluIGEgcG1fY2ZnX29iai5jIGZvciBlYWNoICJwcm9qZWN0IiAo
cHJvamVjdCB+PSBkZWZjb25maWcpLiBFLmcuIGEKY29tcGFueSBtYWtlcyB0d28genlucW1wIHBy
b2R1Y3RzLCBvbmUgaGF2aW5nIDIgVVNCIHBvcnRzIGFuZCBvbmUgaGF2aW5nCjAgVVNCIHBvcnRz
OiB0aGV5J2xsIG5lZWQgdHdvIHBtX2NmZ19vYmouYyBmaWxlcyBhY2NvcmRpbmdseSBhbmQgbm9u
ZSBvZgp0aGVtIHdpbGwgYmUgZXF1YWwgdG8gdGhlIGZpbGUocykgcHJvdmlkZWQgYnkgTmVhbCdz
IHBhdGNoZXMgd2hpY2gKZW5hYmxlIDEgVVNCLgoKSSBob3BlIGl0IGlzIGNsZWFyZXIgbm93LgoK
PiBTaW5jZSB0aGlzIGlzIG5vdCB0aGUgZ29hbCBvZiBCdWlsZHJvb3QgSSB3b3VsZCBuYXJyb3cg
dGhpbmdzIHRvIGRlYWwKPiB3aXRoIHRoZSAyIGFjdHVhbCBib2FyZHMgcGVyaXBoZXJhbHMgb25s
eS4KPiAKPj4gSSB0b29rIGEgY2xvc2VyIGxvb2sgYXQgdGhlIHBtX2NmZ19vYmouYywgYW5kIEkg
c2VlIHdoYXQgeW91IG1lYW4uwqAKPj4gV2hhdCBjb25mdXNlZCBtZSBpcyB0aGF0IFZpdmFkbyBk
b2VzIG5vdCBnZW5lcmF0ZSB0aGlzIGZpbGUgd2hlbiB5b3UKPj4gY3JlYXRlIGFuIHhzYSBvciBo
ZGYgZmlsZSBmb3IgdGhlIGhhcmR3YXJlIGRlc2lnbiBsaWtlIHRoZSBwc3VfaW5pdC5jCj4+IGZp
bGVzLsKgIFNvIEkgdGhvdWdodCB0aGUgZmlsZSB3YXMgYWx3YXlzIHRoZSBzYW1lIHJlZ2FyZGxl
c3Mgb2YgdGhlCj4+IGhhcmR3YXJlLgo+Pgo+PiBJbnN0ZWFkLCB1c2VycyBoYXZlIHR3byBjaG9p
Y2VzLsKgIFRoZXkgY2FuIGVpdGhlciB1c2UgVml0aXMgdG8KPj4gZ2VuZXJhdGUgYSBGU0JMIHdo
aWNoIHdpbGwgaGF2ZSBhIHBtX2NmZ19vYmouYyBmaWxlIGluIGl0LCBvciB0aGV5IGNhbgo+PiBt
b2RpZnkgdGhpcyBleGFtcGxlIGZpbGUgbWFudWFsbHkuwqAgVGhlIHBtX2NmZ19vYmouYyB0aGF0
IEkgaGF2ZQo+PiBpbmNsdWRlZCB3aXRoIGJ1aWxkcm9vdCBlbmFibGVzIGFsbCBvZiB0aGUgcGVy
aXBoZXJhbHMgdGhhdCBhcmUKPj4gZW5hYmxlZCBvbiB0aGUgWkNVMTAyIGFuZCBaQ1UxMDYgYm9h
cmRzLCBzbyBJIHRoaW5rIGl0IGlzIGZpbmUgZm9yCj4+IGhhdmluZyBhbiBvdXQgb2YgYm94IGV4
YW1wbGUgZm9yIG91ciBjdXN0b21lcnMuCj4gCj4gSSBhZ3JlZSB0aGF0IGhlcmUgd2UgbmVlZCB0
byBkZWFsIHdpdGggdGhvc2UgMiBzcGVjaWZpYyBib2FyZHMuCj4gCj4+IFBlcmhhcHMgYSBnb29k
IHNvbHV0aW9uIHdvdWxkIGJlIGFkZGluZyBhIHJlYWRtZSBmaWxlIGZvciB0aGUKPj4gcG1fY2Zn
X29iai5jIGFsZXJ0aW5nIGRldmVsb3BlcnMgdGhhdCB0aGV5IHdpbGwgbmVlZCB0byBtb2RpZnkg
dGhpcwo+PiBmaWxlIGZvciBidWlsZGluZyBkZXNpZ25zIGZvciBjdXN0b20gaGFyZHdhcmUuIAo+
IAo+IFRoaXMgaXMgaW1wbGljaXQKCkkgYWdyZWUgdGhpcyBpcyBpbXBsaWNpdCwgbWVhbmluZyBp
dCBpcyBub3QgdGhlIGR1dHkgb2YgQnVpbGRyb290IHRvCmV4cGxhaW4gcGVvcGxlIGhvdyBYaWxp
bnggdG9vbHMgd29yay4gT3IgYXQgbGVhc3QgQnVpbGRyb290IHNob3VsZCBhdAptb3N0IGdpdmUg
YSBwb2ludGVyIG9uIHdoYXQgdGhlIHVzZXJzIHNob3VsZCBkbyBhbmQgbGVhdmUgdGhlbSB0aGVp
cgpob21ld29yay4KCkFueXdheSB0aGUgaGVscCBmb3IgQlIyX1RBUkdFVF9VQk9PVF9aWU5RTVBf
UE1fQ0ZHIGFscmVhZHkgZ2l2ZSBlbm91Z2gKaGludHMgSU1PLgoKPj4gSW4gYW55IGNhc2UsIHdl
IG5lZWQgdG8gaGF2ZSBhbiBleGFtcGxlIHBtX2NmZ19vYmouYyBmaWxlIGluIG9yZGVyIGZvcgo+
PiB0aGUgYnVpbGRyb290IGV4YW1wbGVzIHRvIGJ1aWxkIGFuZCBydW4uwqAgQW5kIEkgdGhpbmsg
dGhlIHBtX2NmZ19vYmouYwo+PiBpcyBvbmx5IG9uZSBvZiBtYW55IHRoaW5ncyBkZXZlbG9wZXJz
IHdpbGwgbmVlZCB0byBtb2RpZnkgd2hlbiBtb3ZpbmcKPj4gZnJvbSBhbiBldmFsdWF0aW9uIGJv
YXJkIHRvIHRoZWlyIG93biBjdXN0b20gaGFyZHdhcmUuCj4gCj4gVGhpcyBpcyBvdXQgb2Ygc2Nv
cGUgaGVyZS4gQXMgcGF0Y2ggbmFtZXMgcG9pbnQgeW91J3JlIGJ1bXBpbmcgb3IgYWRkaW5nCj4g
MiBzcGVjaWZpYyBib2FyZHMsIHNvIEkgd291bGRuJ3Qgd29ycnkgYWJvdXQgZXZlbnR1YWwgY3Vz
dG9tIGJvYXJkcy4KPiAKPiBJZiBzb21lb25lIHdpbGwgZGVhbCB3aXRoIGl0IEkgdGhpbmsgdGhl
eSB3aWxsIGFsc28gZGVhbCB3aXRoIFZpdmFkbyB0bwo+IGNyZWF0ZSBzcGVjaWZpYyBjb25maWcg
ZmlsZXMuIEF0IGxlYXN0IHRoYXQgaXMgd2hhdCBJIHdvdWxkIGRvIHdoaWxlCj4gYXBwcm9hY2hp
bmcgdGhlc2UgMiBGUEdBcy4KCkV4YWN0bHkuCgotLSAKTHVjYQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
