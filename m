Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B17CEE342
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 19:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C1F76076B;
	Wed,  9 Oct 2024 19:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ldj_pb9dA0i; Wed,  9 Oct 2024 19:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E58E600CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E58E600CC;
	Wed,  9 Oct 2024 19:22:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD0E31BF297
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 19:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC77680FFA
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 19:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9d0gje5kBK2o for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 19:22:33 +0000 (UTC)
X-Greylist: delayed 765 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 09 Oct 2024 19:22:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4928280FC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4928280FC1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4928280FC1
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 19:22:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 499J9k9P119334;
 Wed, 9 Oct 2024 14:09:46 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 499J9k88127288
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Oct 2024 14:09:46 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Oct 2024 14:09:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Oct 2024 14:09:45 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 499J9jdB027120;
 Wed, 9 Oct 2024 14:09:46 -0500
Date: Wed, 9 Oct 2024 14:09:45 -0500
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20241009190945.r6ye6anm2cxj7jsv@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241009062631.895124-1-dario.binacchi@amarulasolutions.com>
 <20241009150040.mxnktvztmjzwasyw@bryanbrattlof.com>
 <CABGWkvqAVxoYRPm3=LJsM6QhGF_BOFP=FXiKYtuF4R-RgEyavg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvqAVxoYRPm3=LJsM6QhGF_BOFP=FXiKYtuF4R-RgEyavg@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1728500986;
 bh=sQFAbFx/ABu2170rqW3auyDyS2evSfwBcF2OBp7PCTk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=G/IOoep5tQ2Wz9BjtojXDgO3s7GbJEbGNQlTQSdq6ZtO2jpC3moAiOtmFejBWlQJ7
 zrhFcmQ8wX/0hGO0FP1zJ2l6xo0C5Q6Ik6chmkItAYDcrKMBFYJBivLuGNXSwGneGf
 zIP9iFcvK3RdoIw6AXjV4nMn8pfOfl1Z61bke+WQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=G/IOoep5
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump Linux to
 6.10.13 and U-Boot to 2024.10
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, buildroot@buildroot.org,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gT2N0b2JlciAgOSwgMjAyNCB0aHVzIHNheWV0aCBEYXJpbyBCaW5hY2NoaToKPiBIaSBCcnlh
biwKPiAKPiBPbiBXZWQsIE9jdCA5LCAyMDI0IGF0IDU6MDDigK9QTSBCcnlhbiBCcmF0dGxvZiA8
YmJAdGkuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBEYXJpbyEKPiA+Cj4gPiBPbiBPY3RvYmVyICA5
LCAyMDI0IHRodXMgc2F5ZXRoIERhcmlvIEJpbmFjY2hpOgo+ID4gPiBUaGUgcGF0Y2ggYnVtcHMg
dGhlIExpbnV4IGtlcm5lbCB0byB2ZXJzaW9uIDYuMTAuMTMgYW5kIFUtQm9vdCB0bwo+ID4gPiB2
ZXJzaW9uIDIwMjQuMTAuIEFybSB0cnVzdGVkIGZpcm13YXJlIGlzIGFscmVhZHkgdXAgdG8gZGF0
ZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFj
Y2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGJvYXJkL3RpL2FtNjJ4
LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaCB8IDIgKy0KPiA+ID4gIGJvYXJkL3RpL2FtNjJ4
LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaCB8IDIgKy0KPiA+ID4gIGNvbmZpZ3MvdGlfYW02
Mnhfc2tfZGVmY29uZmlnICAgICAgICAgICAgICB8IDYgKysrLS0tCj4gPiA+ICAzIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAt
LWdpdCBhL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaCBiL2JvYXJk
L3RpL2FtNjJ4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+ID4gPiBpbmRleCA1M2ViMTQz
ODk0NWIuLjcwNmRkYjhkYmJkNCAxMDA2NDQKPiA+ID4gLS0tIGEvYm9hcmQvdGkvYW02Mngtc2sv
cGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4gPiA+ICsrKyBiL2JvYXJkL3RpL2FtNjJ4LXNrL3Bh
dGNoZXMvbGludXgvbGludXguaGFzaAo+ID4gPiBAQCAtMSwyICsxLDIgQEAKPiA+ID4gICMgTG9j
YWxseSBjYWxjdWxhdGVkCj4gPiA+IC1zaGEyNTYgIDc3NDY5ODQyMmVlNTRjNWYxZTcwNDQ1NmYz
N2M2NWMwNmI1MWI0ZTlhOGIwODY2ZjM0NTgwZDg2ZmVmOGUyMjYgIGxpbnV4LTYuMTAudGFyLnh6
Cj4gPiA+ICtzaGEyNTYgIDVmZmNlYjIzNTBkYjE1NDdlNjkyMzFhNjNkZjJkM2JlZWQwMTVhMzEz
ZDdkN2FkZjhiNWNiNzFkZWRhZWIxNmEgIGxpbnV4LTYuMTAuMTMudGFyLnh6Cj4gPiA+IGRpZmYg
LS1naXQgYS9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2ggYi9ib2Fy
ZC90aS9hbTYyeC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKPiA+ID4gaW5kZXggZmU5YjRm
NTNkYzYzLi45MDRmYTU2YzAyYTMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2JvYXJkL3RpL2FtNjJ4LXNr
L3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAo+ID4gPiArKysgYi9ib2FyZC90aS9hbTYyeC1zay9w
YXRjaGVzL3Vib290L3Vib290Lmhhc2gKPiA+ID4gQEAgLTEsMiArMSwyIEBACj4gPiA+ICAjIExv
Y2FsbHkgY2FsY3VsYXRlZAo+ID4gPiAtc2hhMjU2ICBmNTkxZGE5YWI5MGVmM2Q2YjNkMTczNzY2
ZDBkZGZmOTBjNGVkNzMzMDY4MDg5NzQ4NjExN2RmMzkwZDgzYzhmICB1LWJvb3QtMjAyNC4wNy50
YXIuYnoyCj4gPiA+ICtzaGEyNTYgIGIyOGRhZjRhYzE3ZTQzMTU2MzYzMDc4YmY1MTAyOTc1ODQx
MzdmNmRmNTBmY2VkOWIxMmRmMzRmNjFhOTJmYjAgIHUtYm9vdC0yMDI0LjEwLnRhci5iejIKPiA+
ID4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnIGIvY29uZmlncy90
aV9hbTYyeF9za19kZWZjb25maWcKPiA+ID4gaW5kZXggZTExYjgwM2I3M2U0Li42ZDA3MWI0Y2Mx
NDggMTAwNjQ0Cj4gPiA+IC0tLSBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gPiA+
ICsrKyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gPiA+IEBAIC04LDcgKzgsNyBA
QCBCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUX0FSR1M9Ii1jIHR0eVMyLDExNTIwMG44IC1k
IGszLWFtNjI1LXNrLmR0YiAtbCBhbTYyeAo+ID4gPiAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1ND
UklQVF9BUkdTPSItYyBib2FyZC90aS9hbTYyeC1zay9nZW5pbWFnZS5jZmciCj4gPiA+ICBCUjJf
TElOVVhfS0VSTkVMPXkKPiA+ID4gIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+
ID4gPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xMCIKPiA+ID4g
K0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMTAuMTMiCj4gPgo+ID4g
SSd2ZSBub3RpY2VkIHlvdSd2ZSBiZWVuIHBpY2tpbmcgc3RhYmxlIHRhZ3MgYW5kIHdhcyBjdXJp
b3VzIGlmIHlvdQo+ID4gcHJlZmVyIHRvIHN0YXkgb24gc3RhYmxlIHRhZ3M/Cj4gCj4gQXMgZmFy
IGFzIEkga25vdywgaXQgaXMgZ29vZCBwcmFjdGljZS4KPgoKQWxsIGdvb2QuIEl0J3MganVzdCBw
cmVmZXJlbmNlLiBJIHRyeSB0byBydW4gdGhlIGxhdGVzdCBrZXJuZWwgdG8gdHJ5IG91dAphbGwg
dGhlIGxhdGVzdCBmZWF0dXJlcyBhbmQgZml4ZXMgYmVmb3JlIHRoZXkgbmVlZCB0byBiZSBiYWNr
LXBvcnRlZCBhbnl3aGVyZQoKPiAKPiA+IEkgaGF2ZSBwbGFucyB0byBtb3ZlIGV2ZXJ5dGhpbmcg
dG8gdjYuMTEKPiA+IGJ1dCBJIGNvdWxkIGNob29zZSB0aGUgc3RhYmxlIHZlcnNpb24gKHY2LjEx
LjIpIGlmIHRoYXQgaGVscHMgeW91Lgo+IAo+ID4KPiA+ID4gIEJSMl9MSU5VWF9LRVJORUxfVVNF
X0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+ID4gPiAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9S
VD15Cj4gPiA+ICBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0idGkvazMtYW02MjUt
c2siCj4gPiA+IEBAIC0yNywxMiArMjcsMTIgQEAgQlIyX1RBUkdFVF9PUFRFRV9PUz15Cj4gPiA+
ICBCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNPSJrMy1hbTYyeCIKPiA+ID4gIEJSMl9UQVJH
RVRfVElfSzNfUjVfTE9BREVSPXkKPiA+ID4gIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0NV
U1RPTV9WRVJTSU9OPXkKPiA+ID4gLUJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0NVU1RPTV9W
RVJTSU9OX1ZBTFVFPSIyMDI0LjA3Igo+ID4gPiArQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJf
Q1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQuMTAiCj4gPiA+ICBCUjJfVEFSR0VUX1RJX0szX1I1
X0xPQURFUl9CT0FSRF9ERUZDT05GSUc9ImFtNjJ4X2V2bV9yNSIKPiA+ID4gIEJSMl9UQVJHRVRf
VUJPT1Q9eQo+ID4gPiAgQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15Cj4g
PiA+ICBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKPiA+ID4gLUJSMl9UQVJHRVRf
VUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQuMDciCj4gPiA+ICtCUjJfVEFSR0VUX1VC
T09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI0LjEwIgo+ID4KPiA+IE9uZSBvZiB0aGUgbW9y
ZSBpbnRlcmVzdGluZyB0aGluZ3Mgd2UndmUgYmVlbiB3b3JraW5nIG9uIGxhdGVseSBpcyBFRkkK
PiA+IENhcHN1bGUgc3VwcG9ydCB3aGljaCBkZXBlbmRzIG9uIEdudVRMUy4gV2UnbGwgbmVlZCB0
byBjaGVjawo+ID4gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19HTlVUTFMgd2hlbiBtb3ZpbmcgdG8g
dGhpcyB2ZXJzaW9uLiA6KQo+IAo+IERvIEkgaGF2ZSB0byBlbmFibGUgdGhpcyBvcHRpb24/IFdo
ZW4gSSB0ZXN0ZWQsIEkgZGlkbid0IG5vdGljZSBhbnl0aGluZyB1bnVzdWFsCj4gT3IgaXMgdGhl
cmUgc29tZXRoaW5nIEknbSBtaXNzaW5nPwo+IAoKSXQncyBvbiBteSB0b2RvIGxpc3QgdG8gc3Rh
cnQgYnJlYWtpbmcgdXAgdGhlIFUtQm9vdCBkZWZjb25maWcgaW50byAKdmFyaW91cyBmZWF0dXJl
IGZyYWdtZW50cyB0byBzdWl0IGEgbnVtYmVyIG9mIHVzZWNhc2VzIG91ciBTSyBib2FyZHMgCmhh
dmUuIFNhZGx5IHRoaXMgb25lWzBdIGlzIG1hbmRhdG9yeSBpZiB3ZSBtb3ZlIHRvIHRoZSB2MjAy
NC4xMCB0YWcgb3IgCnRoZSBidWlsZCB3aWxsIGNvbXBsYWluIGFib3V0IG1pc3NpbmcgbGlicmFy
aWVzLgoKICAgIHRvb2xzL21rZWZpY2Fwc3VsZS5jOjIxOjEwOiBmYXRhbCBlcnJvcjogZ251dGxz
L2dudXRscy5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CiAgICAgICAyMSB8ICNpbmNsdWRl
IDxnbnV0bHMvZ251dGxzLmg+CiAgICAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
CiAgICBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgogICAgbWFrZVszXTogKioqIFtzY3JpcHRzL01h
a2VmaWxlLmhvc3Q6OTU6IHRvb2xzL21rZWZpY2Fwc3VsZV0gRXJyb3IgMQogICAgbWFrZVszXTog
KioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KICAgIG1ha2VbMl06ICoqKiBbTWFr
ZWZpbGU6MTg5NTogdG9vbHNdIEVycm9yIDIKICAgIG1ha2VbMV06ICoqKiBbcGFja2FnZS9wa2ct
Z2VuZXJpYy5tazoyODk6IC9ob21lL21lL3NyYy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3Vib290
LTIwMjQuMTAvLnN0YW1wX2J1aWx0XSBFcnJvciAyCiAgICBtYWtlOiAqKiogW01ha2VmaWxlOjgz
OiBfYWxsXSBFcnJvciAyCgpbMF0gaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290
Ly0vY29tbWl0LzAwNDBmMDdlNWE1NjNmNjRmNjA5MTVhNmNlZmRmN2IxYmU3YmZlZTgKCj4gVGhh
bmtzIGFuZCByZWdhcmRzLAo+IERhcmlvCj4gCj4gPgo+ID4gfkJyeWFuCj4gCj4gCj4gCj4gLS0g
Cj4gCj4gRGFyaW8gQmluYWNjaGkKPiAKPiBTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVy
Cj4gCj4gZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gCj4gCj4gQW1hcnVsYSBTb2x1dGlvbnMgU1JMCj4g
Cj4gVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCj4gCj4gVC4g
KzM5IDA0MiAyNDMgNTMxMAo+IGluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KPiAKPiB3d3cuYW1h
cnVsYXNvbHV0aW9ucy5jb20KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
