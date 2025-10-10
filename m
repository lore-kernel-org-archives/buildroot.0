Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D8BCCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 08:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8859C607CC;
	Fri, 10 Oct 2025 08:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72tsp_Hjmmzg; Fri, 10 Oct 2025 08:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2F5760BE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2F5760BE9;
	Fri, 10 Oct 2025 08:01:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81CFE226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 08:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67A4560BE9
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 08:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myhpprcejwjn for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 08:01:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BB47607CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BB47607CC
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BB47607CC
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 08:01:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 046CD1595;
 Fri, 10 Oct 2025 01:01:41 -0700 (PDT)
Received: from debian (MacBookPro.nice.arm.com [10.34.128.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91BDA3F66E;
 Fri, 10 Oct 2025 01:01:48 -0700 (PDT)
Date: Fri, 10 Oct 2025 10:01:45 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
Message-ID: <aOi9aehsauNaVtWI@debian>
Mail-Followup-To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20251009152813.1690704-1-vincent.stehle@arm.com>
 <13eefae6-0fb5-4e32-bca1-0ff35d13a5a0@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13eefae6-0fb5-4e32-bca1-0ff35d13a5a0@bubu1.eu>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: Re: [Buildroot] [PATCH] utils/brmake: filter output for parallel
 build
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBPY3QgMDksIDIwMjUgYXQgMDc6NDI6MTdQTSArMDIwMCwgTWFyY3VzIEhvZmZtYW5u
IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gSGkgVmluY2VudCEKCkhpIE1hcmN1cywKClRoYW5rcyBm
b3IgaGF2aW5nIGEgbG9vay4KCj4gCj4gT24gMTAvOS8yNSAxNzoyOCwgVmluY2VudCBTdGVobMOp
IHdyb3RlOgo+ID4gV2hlbiBidWlsZGluZyBpbiBwYXJhbGxlbCB3aXRoIHBlci1wYWNrYWdlIGRp
cmVjdG9yaWVzCj4gPiAoQlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTPXkpLCBicm1ha2Ugb3V0
cHV0IGlzIG9mdGVuIGdhcmJsZWQ6Cj4gCj4gVGhpcyBoYXMgYm90aGVyZWQgbWUgZm9yIHNvb28g
bG9uZywgYnV0IEkgbmV2ZXIgZm91bmQgb3V0IHdoeSB0aGlzIGlzIGdvaW5nCj4gd3JvbmcuIERv
IHlvdSBrbm93IHdoeSB0aGlzIHNwZWNpZmljYWxseSBmYWlscyB3aXRoIFBQRHMgKHdoaWNoIEkg
YWx3YXlzCj4gZW5hYmxlLCBzbyBJIG5ldmVyIGtuZXcgdGhpcyB3YXMgbm90IGJyb2tlbiB3aXRo
b3V0IHRoZW0pPwoKWWVzLCB0aGlzIGlzIGEgbGltaXRhdGlvbiBvZiBtYWtlIHBhcmFsbGVsIGJ1
aWxkcy4gSWYgd2UgbG9vayBhdCB0aGUgYnJtYWtlCiJwaXBlbGluZSI6CgogICAgbWFrZSAiJHtA
fSIgXAoKQXQgdGhpcyBwb2ludCB3ZSBhbHJlYWR5IGhhdmUgYWxsIHRoZSBtZXNzYWdlcyBmcm9t
IGFsbCB0aGUgdGhyZWFkcywgb2Z0ZW4gbWl4ZWQKb24gdGhlIHNhbWUgbGluZToKCiAgY2hlY2tp
bmcgZm9yIHN0ZGludC5oLi4uID4+PiBob3N0LWR0YyAxLjcuMiBJbnN0YWxsaW5nIHRvIGhvc3Qg
ZGlyZWN0b3J5CgpUaGUgcmVzdCBvZiB0aGUgcGlwZWxpbmUganVzdCBhZGRzIHRoZSB0aW1lc3Rh
bXAsIGNvcGllcyBhbGwgdGhlIG1lc3NhZ2VzIHRvIHRoZQpici5sb2cgYW5kIGtlZXBzIG9ubHkg
dGhlIG1lc3NhZ2VzIHdpdGggdGhlICI+Pj4iIG1hcmtlcnMgZm9yIHRoZSBjb25zb2xlCm91dHB1
dDoKCiAgICAmPiA+KCB3aGlsZSByZWFkIC1yIGxpbmU7IGRvCiAgICAgICAgICAgICBwcmludGYg
IiUoJVktJW0tJWRUJUg6JU06JVMpVCAlc1xuIiAtMSAiJHtsaW5lfSIKICAgICAgICAgZG9uZSBc
CiAgICAgICAgIHx0ZWUgLWEgYnIubG9nIFwKICAgICAgICAgfGdyZXAgLS1jb2xvdXI9bmV2ZXIg
LUUgJz4+PicKICAgICAgICkKClRoZSBzaW1wbGVzdCB0aGluZyB3ZSBjYW4gZG8gYXQgdGhpcyBw
b2ludCBpcyB0byBjbGVhbnVwIGEgYml0ICJhZnRlciB0aGUgZmFjdCIuCgpUaGlzIGlzIG5vdCBw
ZXJmZWN0LCBidXQgdGhpcyBpcyBmYXIgc2ltcGxlciB0aGFuIHdoYXQgYWlhaWFpIGlzIGRvaW5n
IGZvcgpleGFtcGxlLCB3aXRoIGludGVybWVkaWF0ZSBsb2dmaWxlcyBhbmQgYSBsb2NrOgoKaHR0
cHM6Ly9naXQuaW5mcmFkZWFkLm9yZy8/cD11c2Vycy9kZWRla2luZC9haWFpYWkuZ2l0O2E9Ymxv
YjtmPWhlbHBlcnMvYWlhaWFpLW1ha2Uta2VybmVsO2g9NDMzOGEyNzY0YTA5NGYyOWY0ZmViMzhj
YzNjY2RkMjYzMzZiMWJhNjtoYj1lYWRmYjRkNWM4OGQyZGVjMjg0MmJhODk4NmRmNDJmMTExZDRh
N2E4I2wxMTkKCj4gCj4gPiAKPiA+ICAgIDIwMjUtMTAtMDhUMTg6Mzk6MTAgPj4+IGhvc3QtZHRj
IDEuNy4yIEJ1aWxkaW5nCj4gPiAgICAyMDI1LTEwLTA4VDE4OjM5OjExIGNoZWNraW5nIGZvciBz
dGRpbnQuaC4uLiA+Pj4gaG9zdC1kdGMgMS43LjIgSW5zdGFsbGluZyB0byBob3N0IGRpcmVjdG9y
eQo+ID4gICAgMjAyNS0xMC0wOFQxODozOToxMiBjaGVja2luZyBmb3IgbGltaXRzLmguLi4gPj4+
IGhvc3QtZ21wIDYuMy4wIEluc3RhbGxpbmcgdG8gaG9zdCBkaXJlY3RvcnkKPiA+IAo+ID4gUmVt
b3ZlIHRoZSBzcHVyaW91cyBzdHJpbmcgYmV0d2VlbiB0aGUgdGltZXN0YW1wIGFuZCB0aGUgIj4+
PiIgbWFya2VyIHRvCj4gPiBmaXggdGhpcy4KPiA+IFdlIG5lZWQgc29tZSBleHRyYSBjYXJlIHRv
IHByZXNlcnZlIHRoZSBwcmVjZWRpbmcgInRlcm0gYm9sZCIgc3BlY2lhbAo+ID4gY2hhcmFjdGVy
cyBzZXF1ZW5jZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5j
ZW50LnN0ZWhsZUBhcm0uY29tPgo+ID4gQ2M6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5
OEBmcmVlLmZyPgo+ID4gLS0tCj4gPiAgIHV0aWxzL2JybWFrZSB8IDMgKystCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL3V0aWxzL2JybWFrZSBiL3V0aWxzL2JybWFrZQo+ID4gaW5kZXggYTRiOWU3ZmE3MS4u
MmE3NGQ1ODE2NyAxMDA3NTUKPiA+IC0tLSBhL3V0aWxzL2JybWFrZQo+ID4gKysrIGIvdXRpbHMv
YnJtYWtlCj4gPiBAQCAtMTIsNyArMTIsOCBAQCBtYWluKCkgewo+ID4gICAgICAgICAgICAgICAg
cHJpbnRmICIlKCVZLSVtLSVkVCVIOiVNOiVTKVQgJXNcbiIgLTEgIiR7bGluZX0iCj4gPiAgICAg
ICAgICAgIGRvbmUgXAo+ID4gICAgICAgICAgICB8dGVlIC1hIGJyLmxvZyBcCj4gPiAtICAgICAg
ICAgfGdyZXAgLS1jb2xvdXI9bmV2ZXIgLUUgJz4+PicKPiA+ICsgICAgICAgICB8Z3JlcCAtLWxp
bmUtYnVmZmVyZWQgLS1jb2xvdXI9bmV2ZXIgLUUgJz4+PicgXAo+IAo+IENvdWxkIHlvdSBleHBs
YWluIHdoYXQgLS1saW5lLWJ1ZmZlcmVkIGRvZXMgaGVyZSBhbmQgd2h5IHdlIG5lZWQgdGhpcz8g
KFRoZQo+IG1hbiBwYWdlIHdhc24ndCB0b28gaGVscGZ1bCBpbiBqdXN0IHNwZWNpZnlpbmcgIlVz
ZSBsaW5lIGJ1ZmZlcmluZyBvbgo+IG91dHB1dCIuCgpUaGlzIHRlbGxzIGdyZXAgdG8gb3V0cHV0
IGl0cyByZXN1bHRzIGxpbmUgYnkgbGluZSBpbnN0ZWFkIG9mIGJ1ZmZlcmluZyBmb3IgdG9vIGxv
bmcuCldpdGhvdXQgdGhpcyBvcHRpb24sIGJybWFrZSBvdXRwdXQgaXMgcHJpbnRlZCBpbiAiYnVy
c3RzIiwgYW5kIG9ubHkgZnJvbSB0aW1lcwp0byB0aW1lczsgbm90IHZlcnkgImxpdmUiLgoKWW91
IGNhbiBqdXN0IHJlbW92ZSBpdCBhbmQgdHJ5IHRvIHNlZSB0aGUgZGlmZmVyZW5jZSwgYXMgdGhp
cyBpcyBvdGhlcndpc2UKZnVuY3Rpb25hbGx5IGlkZW50aWNhbC4KCkJlc3QgcmVnYXJkcywKVmlu
Y2VudC4KCj4gCj4gPiArICAgICAgICAgfHNlZCAtRSAncy9eKFswLTlUOi1dezE5fSkgW1s6cHJp
bnQ6XV0qKC4qPj4+ICkvXDEgXDIvJwo+ID4gICAgICAgICAgKQo+ID4gICAgICAgcmV0PSR7P30K
PiAKPiBCZXN0LAo+IE1hcmN1cwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
