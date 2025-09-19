Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F099CAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 18:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D81C41002;
	Fri, 19 Sep 2025 18:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKtEfottAbJB; Fri, 19 Sep 2025 18:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F2AE41004
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F2AE41004;
	Fri, 19 Sep 2025 18:22:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9E0EE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 18:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FA2940C00
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 18:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVwZ922tgZSo for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 18:22:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3824B40D51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3824B40D51
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3824B40D51
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 18:22:30 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E41D031E09E4; Fri, 19 Sep 2025 20:22:27 +0200 (CEST)
Date: Fri, 19 Sep 2025 20:22:27 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <aM2fY2H8TTWOUdKr@waldemar-brodkorb.de>
References: <20250914042054.771446-1-salvador.joseluis@gmail.com>
 <55c98b57-f4be-47b7-a87c-06f5130df8fe@smile.fr>
 <aMh87DWmal5nH0JK@waldemar-brodkorb.de>
 <bcc3f93b-dfd9-45ea-b668-447b07f3009a@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bcc3f93b-dfd9-45ea-b668-447b07f3009a@smile.fr>
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758306147; bh=iEgqgigQZzvTMbz6O9Wl5gXyH3uXewi9vWJ5X7CNUSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UTh27JKIcnEKyV0blZCdm3oZpGFHEPgV4oLcDCLSZhDgnMyjCCfK5uTl/rR+CJWD1
 DmsQx3PWAGyuz4bDY23UWFfto2Ia2V88aYs6q7J20HLhxBNTAL5FlF8T7EL1q9pVIF
 xdNE5cogSLhuZP9hW44RWDTP2wmZ6WKzk68LldbzU8XQdZWFKxT9XkBEdldfrXLHeR
 Lxagmqth5bU/BGNGDrB5+VbMYSEDqw3hBoXNSjDlE8ekYtukftxpR/gncxG1U7D1Hx
 Mm4yGiCJ+JMBPAK4D+AA0KziHv36ZrJA79EsCmMfxyCBFxVj8mZTiz+sV2o3wmIaao
 8i8/akrYWMrEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=UTh27JKI
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: remove arc_summary
 from ZFS tests
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
Cc: Josss Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksClJvbWFpbiBOYW91ciB3cm90ZSwKCj4gSGVsbG8gV2FsZGVtYXIsIEFsbCwKPiAKPiBMZSAx
NS8wOS8yMDI1IMOgIDIyOjU0LCBXYWxkZW1hciBCcm9ka29yYiBhIMOpY3JpdMKgOgo+ID4gSGks
Cj4gPiBSb21haW4gTmFvdXIgd3JvdGUsCj4gPiAKPiA+PiBIZWxsbyBKb3PDqSwgQWxsLAo+ID4+
Cj4gPj4gTGUgMTQvMDkvMjAyNSDDoCAwNjoyMCwgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIGEg
w6ljcml0wqA6Cj4gPj4+IFRoaXMgcGF0Y2ggcmVwbGFjZSB0aGUgWzFdIHBhdGNoLgo+ID4+Pgo+
ID4+PiBUaGUgUHl0aG9uIDMuMTMgaW50ZXJwcmV0ZXIgaXRzZWxmIHNlZ2ZhdWx0cyBhdCBydW50
aW1lIHdoZW4gY29tcGlsZWQKPiA+Pj4gd2l0aCB1Q2xpYmMgb24gdGhlIGFhcmNoNjQgcGxhdGZv
cm0uCj4gPj4+Cj4gPj4+IFRvIGtlZXAgVGVzdFpmc1VjbGliYywgdGhlIGV4ZWN1dGlvbiBvZiB0
aGUgYXJjX3N1bW1hcnkgY29tbWFuZCBoYXMKPiA+Pj4gYmVlbiByZW1vdmVkIGZyb20gdGhlIFpG
UyB0ZXN0cy4gVGhpcyBjb21tYW5kIG9ubHkgcHJpbnRzIHNvbWUgQVJDCj4gPj4+IHN0YXRzIGFu
eXdheS4KPiA+Pj4KPiA+Pj4gRml4ZXM6Cj4gPj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTEyNzExMjQ4NTkgKFRlc3RaZnNVY2xpYmMpCj4gPj4+
Cj4gPj4+IFsxXSBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9v
dC8yMDI1LVNlcHRlbWJlci83ODYzOTYuaHRtbAo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBK
b3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KPiA+
Pj4gLS0tCj4gPj4+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weSB8
IDIgLS0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBk
aWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQo+ID4+PiBpbmRleCAxYjkw
N2FjNGRlLi45ZmVhZTQ5ZTg2IDEwMDY0NAo+ID4+PiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X3pmcy5weQo+ID4+PiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS90ZXN0X3pmcy5weQo+ID4+PiBAQCAtNTYsOCArNTYsNiBAQCBjbGFzcyBUZXN0WmZz
QmFzZShpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ID4+PiAgICAgICAgICAgICAgInpwb29sIHNj
cnViIC13IHBvb2wiLAo+ID4+PiAgICAgICAgICAgICAgInNoYTI1NnN1bSAtYyAvdG1wL3VyYW5k
b20uc2hhMjU2IiwKPiA+Pj4gICAgICAgICAgICAgICJ6cG9vbCBzdGF0dXMgLXYiLAo+ID4+PiAt
ICAgICAgICAgICAgIyBDaGVjayBQeVpGUwo+ID4+PiAtICAgICAgICAgICAgImFyY19zdW1tYXJ5
IiwKPiA+Pgo+ID4+IEFjdHVhbGx5IHRoZSB0ZXN0IGlzIG5vdCBhYm91dCBBUkMgc3RhdHMgcmVw
b3J0ZWQgYnkgYXJjX3N1bW1hcnkgc2NyaXB0IGJ1dCBhCj4gPj4gY2hlY2sgaWYgUHlaRlMgZG9l
c24ndCB0cmlnZ2VyIHNvbWUgUHl0aG9uIGV4Y2VwdGlvbiBkdWUgdG8gbWlzc2luZyBweXRob24K
PiA+PiBydW50aW1lIGRlcGVuZGVuY3kgKGlmIFB5WkZTIGlzIHdvcmtpbmcgYXMgZXhwZWN0ZWQg
d2hlbiBweXRob24zIGlzIGVuYWJsZWQpLgo+ID4+Cj4gPj4gVGhpcyBhbHNvIHJlbW92ZSB0aGUg
UHlaRlMgdGVzdCBmb3IgbXVzbCBhbmQgR2xpYmMgdGhhdCBhcmUgd29ya2luZyB3ZWxsLgo+ID4+
Cj4gPj4gSWYgYXJjX3N1bW1hcnkgaXMgcmVtb3ZlZCBmcm9tIHRoZSB0ZXN0LCB0aGVuIHdlIHNo
b3VsZCBhbHNvIHJlbW92ZQo+ID4+IEJSMl9QQUNLQUdFX1BZVEhPTjM9eSBmcm9tIFRlc3RaZnNC
YXNlLgo+ID4+Cj4gPj4gVGhlIFRlc3RaZnNCYXNlIGlzIGZpbmUgYXMgaXMsIHdlIHNob3VsZCBu
b3QgdHJ5IHRvIHJlbW92ZSBQeVpGUyB0ZXN0IGZvciB0aGUKPiA+PiBzYWtlIG9mIHVDbGliYy1u
Zy4KPiA+Pgo+ID4+IEFjdHVhbGx5LCBJJ20gd29ycmllZCBhYm91dCB0aGUgYWFyY2g2NCBwb3J0
IG9uIHVDbGliYy1uZy4gSXQncyBwb3NzaWJsZSB0aGF0Cj4gPj4gdGhlIGlzc3VlIHdlIGRpc2Nv
dmVyIG9uIHB5dGhvbjMgcGFja2FnZSBjYW4gaGFwcGVuIGF0IHJ1bnRpbWUgb24gb3RoZXIgcGFj
a2FnZXMuCj4gPj4KPiA+PiBJZiB5b3UgcmVhbGx5IHdhbnQgdG8ga2VlcCBUZXN0WmZzVWNsaWJj
LCB0aGUgUHlaRlMgdGVzdCBzaG91bGQgYmUgb25seSBleGVjdXRlZAo+ID4+IGJ5IFRlc3RaZnNH
bGliYyBhbmQgVGVzdFpmc011c2wuIEknbSBub3Qgc3VyZSBpdCB3b3J0aCB0aGUgZWZmb3J0LiBM
ZXRzIHJlbW92ZQo+ID4+IFRlc3RaZnNVY2xpYmMgZm9yIG5vdyBhbmQgaG9wZSB0aGUgaXNzdWUg
d2lsbCBiZSBmaXhlZCBpbiB1Q2xpYmMtbmcgaW4gdXBjb21pbmcKPiA+PiByZWxlYXNlcy4gVGhl
biBUZXN0WmZzVWNsaWJjIGNhbiBiZSBhZGRlZCBiYWNrLgo+ID4+Cj4gPj4gVGhvdWdodHM/Cj4g
PiAKPiA+IEkgZm91bmQgdGhlIGJ1ZyBpbiB1Q2xpYmMtbmcgbGQuc28gY29kZSBmb3IgYWFyY2g2
NC4gSSB3aWxsIGRvIGEKPiA+IHJlbGVhc2UgdGhpcyB3ZWVrZW5kIHdoZW4gSSBoYXZlIGZpbmlz
aGVkIHRlc3RpbmcuCj4gCj4gTmljZSwgVGhhbmtzIGZvciB0aGUgaGVscC4KPiAKPiBBY3R1YWxs
eSwgSSdtIGhhcHB5IHRvIG1hcmsgdGhpcyBzZXJpZXMgYXMgcmVqZWN0ZWQgZnJvbSBwYXRjaHdv
cmsuIDopCj4gCj4gTGV0IHVzIGtub3cgd2hlbiB5b3VyIHBhdGNoIGlzIHJlYWR5LgoKUGF0Y2gg
c2VudCB0byB0aGUgQlIgbWFpbGluZ2xpc3QuCgpiZXN0IHJlZ2FyZHMKIFdhbGRlbWFyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
