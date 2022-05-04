Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B564AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 09:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ACA9817B0;
	Wed,  4 May 2022 09:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLU9qrrNShiU; Wed,  4 May 2022 09:53:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64E7881399;
	Wed,  4 May 2022 09:53:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA2551BF239
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C75EC405A6
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7iZs8wjN1r6 for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 09:53:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9892D40598
 for <buildroot@buildroot.org>; Wed,  4 May 2022 09:53:15 +0000 (UTC)
Received: from [77.244.183.192] (port=62418 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nmBh2-000DIi-WE; Wed, 04 May 2022 11:53:13 +0200
Message-ID: <f1eb3f25-8ad4-2a92-b519-05fb56e2a68c@lucaceresoli.net>
Date: Wed, 4 May 2022 11:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: it-IT
To: Michal Simek <michal.simek@xilinx.com>, Neal Frager <nealf@xilinx.com>,
 Peter Korsgaard <peter@korsgaard.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <878rrh3gvx.fsf@dell.be.48ers.dk>
 <86b8666c-4427-32c6-c015-f9b67e963195@xilinx.com>
 <SJ0PR02MB775868320C331FE1CDF57217D7C39@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <ac8c8060-7b89-5d22-c96e-a8c1dc3ea7d8@lucaceresoli.net>
 <SJ0PR02MB7758E5893D7211770C6A3108D7C39@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <a430617e-f535-75c5-a848-2384c774368d@xilinx.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <a430617e-f535-75c5-a848-2384c774368d@xilinx.com>
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
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwgTWljaGFsLAoKT24gMDQvMDUvMjIgMTE6MzUsIE1pY2hhbCBTaW1layB3cm90ZToK
PiAKPiAKPiBPbiA1LzQvMjIgMTE6MjQsIE5lYWwgRnJhZ2VyIHdyb3RlOgo+PiBIaSBMdWNhLAo+
Pgo+Pj4KPj4+PiDCoMKgID4+IFvCoMKgwqAgNC4zODQ3MTVdIHp5bnFtcC1kaXNwbGF5IGZkNGEw
MDAwLmRpc3BsYXk6IHZ0YyBicmlkZ2UKPj4+PiBwcm9wZXJ0eQo+Pj4+IMKgwqAgPj4gbm90IHBy
ZXNlbnQKPj4+PiDCoMKgID4+IFvCoMKgwqAgNC4zOTMxNTZdIC0tLS0tLS0tLS0tLVsgY3V0IGhl
cmUgXS0tLS0tLS0tLS0tLQo+Pj4+IMKgwqAgPj4gW8KgwqDCoCA0LjM5Nzc3Nl0gTW9yZSB0aGFu
IGFsbG93ZWQgZGV2aWNlcyBhcmUgdXNpbmcgdGhlCj4+Pj4gdnBsbF9pbnQsIHdoaWNoIGlzIGZv
cmJpZGRlbgo+Pj4+Cj4+Pj4KPj4+PiDCoMKgID4gVGhpcyBpcyBjYXVzZWQgYnkgbm90IHByb3Bl
ciBwc3VfaW5pdCB3aGljaCBzZXR1cCBQTExzCj4+Pj4gaW5jb3JyZWN0bHkuCj4+Pj4KPj4+PiBU
aGlzIGlzIHVzaW5nIHRoZSBwc3VfaW5pdF9ncGwuYyBpbiBVLUJvb3Q6Cj4+Pj4KPj4+PiBodHRw
czovL2dpdGh1Yi5jb20vWGlsaW54L3UtYm9vdC14bG54L2Jsb2IveGxueF9yZWJhc2VfdjIwMjIu
MDFfMjAyMi4KPj4+PiAxIC9ib2FyZC94aWxpbngvenlucW1wL3p5bnFtcC16Y3UxMDYtcmV2QS9w
c3VfaW5pdF9ncGwuYwo+Pj4+Cj4+Pj4gQW5kIHRoZSBwbXUgY29uZmlndXJhdGlvbiBvYmplY3Qg
ZnJvbSBOZWFsOgo+Pj4+Cj4+Pj4gaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3Qv
dHJlZS9ib2FyZC96eW5xbXAvemN1MTA2L3BtX2NmZ19vCj4+Pj4gYgo+Pj4+IGouYwo+Pj4+Cj4+
Pj4gU28gd2hhdCBleGFjdGx5IG5lZWRzIHRvIGNoYW5nZT8KPj4+Cj4+Pj4gSSBkb24ndCBoYXZl
IHRoaXMgYm9hcmQgaGVyZSB0aGF0J3Mgd2h5IGxpa2VseSB0YWtlbiBmcm9tIGFueSBvbGQKPj4+
PiBkZXNpZ24gYmVmb3JlIHRoaXMgY2hlY2sgd2FzIGFkZGVkIHRvIExpbnV4Lgo+Pj4+IFUtQm9v
dCBwc3VfaW5pdF9ncGwuYyBzaG91bGQgYmUgdXBkYXRlZC4KPj4+Cj4+PiBDb3VsZCB5b3UgcGxl
YXNlIHNoYXJlIGV4YWN0bHkgd2hpY2ggcmVnaXN0ZXIgd3JpdGVzIGluIHRoZQo+Pj4gcHN1X2lu
aXRfZ3BsLmMgbmVlZCB0byBjaGFuZ2U/Cj4+PiBQZXJoYXBzIHlvdSBjYW4gcG9pbnQgbWUgdG8g
YSBrbm93biBnb29kIG9uZSwgc28gdGhhdCBJIGNhbiBjb21wYXJlCj4+PiB0aG9zZSBzcGVjaWZp
YyByZWdpc3RlciB3cml0ZXMgd2l0aCB0aGUgenlucW1wLXpjdTEwNi1yZXZBIGZpbGU/Cj4+Cj4+
PiBJJ20gT0sgd2l0aCBlaXRoZXIgc29sdXRpb24sIGJ1dCBJIHdvbmRlciB3aGV0aGVyIGl0IHdv
dWxkIGJlIGEKPj4+IGJldHRlciBpZGVhIHRvIHJlZ2VuZXJhdGUgcHN1X2luaXRfZ3BsLmMgKGFu
ZCBwbV9jZmdfb2JqLmMgd2hpbGUKPj4+IHRoZXJlKSB1c2luZyBWaXZhZG8gMjAyMiBhbmQgbWFp
bmxpbmUgdGhlbSBpbiBVLUJvb3QuIFdvdWxkIHRoYXQgZml4Cj4+PiB0aGUgaXNzdWUgYXMgd2Vs
bD8gVml2YWRvIGlzIGFzc3VtZWQgdG8gZ2VuZXJhdGUgPiBjb3JyZWN0IGZpbGVzLCBpZgo+Pj4g
aXQgZGlkbid0IGluIHRoZSBwYXN0LCBjaGFuY2VzIGFyZSBpdCBoYXMgYmVlbiBmaXhlZCBpbiB0
aGUgbWVhbnRpbWUuCj4+Cj4+IEluIHRoZSBjYXNlIG9mIHRoZSBwbV9jZmdfb2JqLmMgZmlsZSwg
d2UgYXJlIHVzaW5nIHRoZSBmaWxlIHRoYXQgaXMKPj4gZ2VuZXJhdGVkIGJ5IFZpdGlzLgo+PiBJ
IGhhdmUgY29uZmlybWVkIHRoYXQgVml0aXMgMjAyMi4xIGFuZCAyMDIxLjIgYm90aCBnZW5lcmF0
ZSB0aGUgZXhhY3QKPj4gc2FtZSBwbV9jZmdfb2JqLmMgZmlsZXMgZm9yIHRoZSB6Y3UxMDIgYW5k
IHpjdTEwNiBib2FyZHMuCj4+IEFuZCB0aGVzZSBhcmUgdGhlIGZpbGVzIHRoYXQgYXJlIGN1cnJl
bnRseSBwYXJ0IG9mIHRoZSBidWlsZHJvb3QKPj4gc291cmNlcyBpbiB0aGUgYm9hcmQvenlucW1w
IGRpcmVjdG9yeS4KPj4KPj4gQnV0IHRoZSBwc3VfaW5pdF9ncGwuYyBmaWxlIGlzIGNvbWluZyBm
cm9tIHUtYm9vdCwgc28gaWYgdGhpcyBpcyBub3QKPj4gcHJvcGVybHkgdXBkYXRlZCwgdGhhdCBj
b3VsZCBiZSBhbiBpc3N1ZS4KPj4gUGx1cywgdGhlIHBsbCBjb25maWd1cmF0aW9ucyBhbGwgaGFw
cGVuIGluIHRoZSBwc3VfaW5pdCByb3V0aW5lIG9mIHRoZQo+PiBwc3VfaW5pdF9ncGwuYy4KPj4K
Pj4gSSBhZ3JlZSB3aXRoIEx1Y2EgdGhhdCBpdCB3b3VsZCBiZSBiZXN0IHRvIHJlZnJlc2ggYWxs
IG9mIHRoZQo+PiBwc3VfaW5pdF9ncGwuYyBmaWxlcyBpbiB1LWJvb3QgbWFpbmxpbmUgd2l0aCBW
aXZhZG8gZ2VuZXJhdGVkIHZlcnNpb25zLgo+PiBUaGF0IHNob3VsZCBmaXggYW55IGlzc3Vlcy4K
PiAKPiBOb3QgYSBwcm9ibGVtIHdpdGggaXQgYnV0IHBsZWFzZSBtYWtlIHN1cmUgeW91IGRlc2Ny
aWJlIGluIGNvbW1pdAo+IG1lc3NhZ2Ugd2hhdCBoYXMgcmVhbGx5IGNoYW5nZWQuIFRoYXQgY29k
ZSB3aGljaCBnZW5lcmF0ZXMgaXQgZG8gYSBsb3QKPiBvZiBjaGFuZ2VzIHdpdGhvdXQgc2F5aW5n
IHdoeSB0aGV5IGFyZSB0aGVyZS4KPiBJdCBtZWFucyBJIHdhbnQgdG8gc2VlIGNsZWFyIGRlc2Ny
aXB0aW9uIHdoYXQgaGFzIHJlYWxseSBjaGFuZ2Ugbm90IHRoYXQKPiB3ZSBoYXZlIG1vdmVkIGZy
b20gYW55IG9sZCB2aXZhZG8gdmVyc2lvbiB0byAyMDIyLjEgb3Igc28uCgpBbmQgaWYgeW91IGNo
b3NlIHRvIHJlZ2VuZXJhdGUgdGhlIGZpbGUgZnJvbSBWaXZhZG8gZG9uJ3QgZm9yZ2V0IHRvIHJ1
bgppdCB0aHJvdWdoIHRvb2xzL3p5bnFtcF9wc3VfaW5pdF9taW5pbWl6ZS5zaCAoaW4gdGhlIFUt
Qm9vdCBzb3VyY2VzKSBhbmQKdGhlbiBmaXggYW55IHJlbWFpbmluZyBjaGVja3BhdGNoIGZpeGVz
LgoKLS0gCkx1Y2EKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
