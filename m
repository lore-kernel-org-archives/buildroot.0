Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE907C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 16:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA715403C7;
	Sat, 13 Jul 2024 16:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqM33bLThqM4; Sat, 13 Jul 2024 16:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38D1340396
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38D1340396;
	Sat, 13 Jul 2024 16:21:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15A5B1BF2FA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0358460769
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHXRig9SaVKk for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 16:21:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8BB1606E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8BB1606E3
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8BB1606E3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 16:21:27 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46DFxi9Y019459; Sat, 13 Jul 2024 16:21:25 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bjv0jmg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 16:21:24 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DGLMLe019073
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 16:21:23 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DGLMpN013447
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 16:21:22 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 493B4ABD2;
 Sat, 13 Jul 2024 11:21:22 -0500 (CDT)
Mime-Version: 1.0
Date: Sat, 13 Jul 2024 16:21:22 +0000
Message-Id: <D2OJRRC9Z5XN.3I6WU5HEIZB24@collins.com>
To: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240701-versal-xsa-support-prebuilt-v3-1-3d3e9318d181@collins.com>
 <7d46feba-19c0-4cb4-aeb9-898e863691a3@smile.fr>
In-Reply-To: <7d46feba-19c0-4cb4-aeb9-898e863691a3@smile.fr>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130122
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407130122
X-Proofpoint-GUID: iUacJp4ezYITU-0docUUz9xDe9geZQan
X-Proofpoint-ORIG-GUID: iUacJp4ezYITU-0docUUz9xDe9geZQan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2407130122
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=c7JVmt2HezIcvcF6cKbZP2zoxOffJXkzTeURJnmIrqo=;
 b=B09JT9oDqHgi7VXFjlTA/ucjNwfZjgO/hFPCTe/niGu5T8YqGcQyG7vIXOsQ7G0+zkBI
 ux/hdf4z4SnM/tFRe2BZyU4X32hZajlk9J6BjCiNj+fOSBwwc0OPPOEwETmPBmFbTdCg
 /zXoZoQew+MvmiPvAmo5xqk1RVj5A6+Ed9ECAP6pbVk3WeRwyJQ3ji3CwCSb7EjJ6c0v
 jMSQntNnyyPDAv/bzRh+GFkoiEmGO3q1EgK1fdidE14H/PhoEcywa029x/OxiadUlVIT
 P8a0e3jT2DMJyaBkhGicZ7VR0riaCJ203SdlE4GIg+Lb4xwxXodKHsPvZScEdet+Tygs RA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=B09JT9oD
Subject: Re: [Buildroot] [PATCH v3] boot/xilinx-prebuilt: support custom
 boards using XSA
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0IEp1bCAxMywgMjAyNCBhdCA0OjA4IFBNIFVUQywgUm9tYWluIE5hb3VyIHZpYSBidWls
ZHJvb3Qgd3JvdGU6Cj4gSGVsbG8gQnJhbmRvbiwgQWxsLAo+Cj4gTGUgMDEvMDcvMjAyNCDDoCAx
ODo0OCwgQnJhbmRvbiBNYWllciB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gPiBUaGUgeGls
aW54LXByZWJ1aWx0IHBhY2thZ2Ugb25seSBzdXBwb3J0cyBkZXZlbG9wbWVudCBib2FyZHMgdGhh
dCBYaWxpbngKPiA+IGhhcyBwdWJsaXNoZWQgZmlybXdhcmUgZm9yLiBDdXN0b20gZGVzaWducyBi
YXNlZCBvbiB0aGUgWGlsaW54IHBsYXRmb3JtCj4gPiBtdXN0IGdlbmVyYXRlIHRoZWlyIG93biBm
aXJtd2FyZSB1c2luZyB0aGUgQU1EIFZpdmFkbyBEZXNpZ24gU3VpdGUuCj4gPgo+ID4gVml2YWRv
IHByb2R1Y2VzIGFuIFhTQSBmaWxlLCB3aGljaCBpcyBhIFppcCBmaWxlIGNvbnRhaW5pbmcgYWxs
IHRoZQo+ID4gZmlybXdhcmUgbmVlZGVkIGJ5IHhpbGlueC1wcmVidWlsdC4gV2UgZXh0ZW5kIHhp
bGlueC1wcmVidWlsdCB0bwo+ID4gZG93bmxvYWQgY3VzdG9tIFhTQSBmaWxlcyBhbmQgZXh0cmFj
dCB0aGVpciBjb250ZW50cy4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogTmVhbCBGcmFnZXIgPG5lYWwu
ZnJhZ2VyQGFtZC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCcmFuZG9uIE1haWVyIDxicmFuZG9u
Lm1haWVyQGNvbGxpbnMuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gLSBSZWJh
c2Ugb24gdXBzdHJlYW0gY2hhbmdlcyB0byBib290L3hpbGlueC1wcmVidWlsdAo+ID4gLSBMaW5r
IHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNjI2LXZlcnNhbC14c2Etc3Vw
cG9ydC1wcmVidWlsdC12Mi0xLTcyNGIwMGM0NTk2ZEBjb2xsaW5zLmNvbQo+ID4KPiA+IENoYW5n
ZXMgaW4gdjI6Cj4gPiAtIEZpeCBoZWxwIHRleHQgdG8gc2F5IFhTQSBpcyBjcmVhdGVkIGJ5IFZp
dmFkbyBbTmVhbF0KPiA+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI0MDYyNS12ZXJzYWwteHNhLXN1cHBvcnQtcHJlYnVpbHQtdjEtMS1mNjRhN2EzOTZhMzRAY29s
bGlucy5jb20KPiA+IC0tLQo+ID4gIGJvb3QveGlsaW54LXByZWJ1aWx0L0NvbmZpZy5pbiAgICAg
ICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGJvb3QveGlsaW54LXByZWJ1
aWx0L3hpbGlueC1wcmVidWlsdC5tayB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvYm9vdC94aWxpbngtcHJlYnVpbHQvQ29uZmlnLmluIGIvYm9vdC94
aWxpbngtcHJlYnVpbHQvQ29uZmlnLmluCj4gPiBpbmRleCBkM2RmMWMwNmU3Li45NGVmM2RkMTEx
IDEwMDY0NAo+ID4gLS0tIGEvYm9vdC94aWxpbngtcHJlYnVpbHQvQ29uZmlnLmluCj4gPiArKysg
Yi9ib290L3hpbGlueC1wcmVidWlsdC9Db25maWcuaW4KPiA+IEBAIC0zMSw2ICszMSwzMCBAQCBj
b25maWcgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMCj4gPgo+ID4gIGVuZGNob2lj
ZQo+ID4KPiA+ICtjb25maWcgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMX1hTQQo+
ID4gKwlib29sICJkb3dubG9hZCBhIHByZWJ1aWx0IFZlcnNhbCBYU0EiCj4gPiArCWRlcGVuZHMg
b24gQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMCj4gPiArCWhlbHAKPiA+ICsJICBU
aGUgWGlsaW54IFN1cHBvcnQgQXJjaGl2ZSAoWFNBKSBwcm92aWRlcyBjdXN0b20gWGlsaW54Cj4g
PiArCSAgZmlybXdhcmUgZmlsZXMgZ2VuZXJhdGVkIGJ5IHRoZSBBTUQgVml2YWRvIERlc2lnbiBT
dWl0ZS4KPiA+ICsKPiA+ICsJICBodHRwczovL2RvY3MuYW1kLmNvbS9yL2VuLVVTL3VnMTQwMC12
aXRpcy1lbWJlZGRlZC9DcmVhdGluZy1hLUhhcmR3YXJlLURlc2lnbi1YU0EtRmlsZQo+ID4gKwo+
ID4gK2lmIEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTF9YU0EKPiA+ICsKPiA+ICtj
b25maWcgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMX1hTQV9MT0NBVElPTgo+ID4g
KwlzdHJpbmcgIlVSTCBvZiBjdXN0b20gWFNBIgo+ID4gKwloZWxwCj4gPiArCSAgVGhpcyBvcHRp
b24gYWxsb3dzIHRvIHNwZWNpZnkgYSBVUkwgcG9pbnRpbmcgdG8gYW4gWFNBIHNvdXJjZQo+ID4g
KwkgIGZpbGUuIFRoaXMgVVJMIGNhbiB1c2UgYW55IHByb3RvY29sIHJlY29nbml6ZWQgYnkgQnVp
bGRyb290LAo+ID4gKwkgIGxpa2UgaHR0cDovLywgZnRwOi8vLCBmaWxlOi8vIG9yIHNjcDovLy4K
PiA+ICsKPiA+ICsJICBXaGVuIHBvaW50aW5nIHRvIGEgbG9jYWwgWFNBIHVzaW5nIGZpbGU6Ly8s
IHlvdSBtYXkgd2FudCB0bwo+ID4gKwkgIHVzZSBhIG1ha2UgdmFyaWFibGUgbGlrZSAkKFRPUERJ
UikgdG8gcmVmZXJlbmNlIHRoZSByb290IG9mCj4gPiArCSAgdGhlIEJ1aWxkcm9vdCB0cmVlLgo+
ID4gKwo+ID4gK2VuZGlmICMgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMX1hTQQo+
ID4gKwo+ID4gIGNvbmZpZyBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9GQU1JTFkKPiA+ICAJ
c3RyaW5nCj4gPiAgCWRlZmF1bHQgInp5bnFtcCIgaWYgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJ
TFRfWllOUU1QCj4gPiBkaWZmIC0tZ2l0IGEvYm9vdC94aWxpbngtcHJlYnVpbHQveGlsaW54LXBy
ZWJ1aWx0Lm1rIGIvYm9vdC94aWxpbngtcHJlYnVpbHQveGlsaW54LXByZWJ1aWx0Lm1rCj4gPiBp
bmRleCBkMDlmNGIxM2UyLi5jMzAwMGI3ZTQ1IDEwMDY0NAo+ID4gLS0tIGEvYm9vdC94aWxpbngt
cHJlYnVpbHQveGlsaW54LXByZWJ1aWx0Lm1rCj4gPiArKysgYi9ib290L3hpbGlueC1wcmVidWls
dC94aWxpbngtcHJlYnVpbHQubWsKPiA+IEBAIC01LDkgKzUsMjAgQEAKPiA+ICAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+ID4KPiA+ICBYSUxJTlhfUFJFQlVJTFRfVkVSU0lPTiA9ICQoY2FsbCBx
c3RyaXAsJChCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTSU9OKSkKPiA+ICsKPiA+ICtp
ZmVxICgkKEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTF9YU0EpLHkpCj4gPiArWElM
SU5YX1BSRUJVSUxUX0ZJTEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9YSUxJTlhfUFJF
QlVJTFRfVkVSU0FMX1hTQV9MT0NBVElPTikpCj4gPiArWElMSU5YX1BSRUJVSUxUX1NJVEUgPSAk
KHBhdHN1YnN0ICUvLCUsJChkaXIgJChYSUxJTlhfUFJFQlVJTFRfRklMRSkpKQo+ID4gK1hJTElO
WF9QUkVCVUlMVF9TT1VSQ0UgPSAkKG5vdGRpciAkKFhJTElOWF9QUkVCVUlMVF9GSUxFKSkKPiA+
ICtkZWZpbmUgWElMSU5YX1BSRUJVSUxUX0VYVFJBQ1RfQ01EUwo+ID4gKwkkKFVOWklQKSAkKFhJ
TElOWF9QUkVCVUlMVF9ETF9ESVIpLyQoWElMSU5YX1BSRUJVSUxUX1NPVVJDRSkgLWQgJChARCkK
PiA+ICtlbmRlZgo+ID4gK2Vsc2UgIyBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxf
WFNBCj4gPiAgWElMSU5YX1BSRUJVSUxUX1NJVEUgPSAkKGNhbGwgZ2l0aHViLFhpbGlueCxzb2Mt
cHJlYnVpbHQtZmlybXdhcmUsJChYSUxJTlhfUFJFQlVJTFRfVkVSU0lPTikpCj4gPiAgWElMSU5Y
X1BSRUJVSUxUX0xJQ0VOU0UgPSBNSVQKPiA+ICBYSUxJTlhfUFJFQlVJTFRfTElDRU5TRV9GSUxF
UyA9IExJQ0VOU0UKPiA+ICtlbmRpZiAjIEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNB
TF9YU0EKPiA+ICsKPiA+ICBYSUxJTlhfUFJFQlVJTFRfSU5TVEFMTF9UQVJHRVQgPSBOTwo+ID4g
IFhJTElOWF9QUkVCVUlMVF9JTlNUQUxMX0lNQUdFUyA9IFlFUwo+ID4KPiA+IEBAIC0yMCwxMiAr
MzEsMjIgQEAgaWZlcSAoJChCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUwpLHkpCj4g
PiAgIyBXZSBuZWVkIHRoZSAqLnBkaSBnbG9iLCBiZWNhdXNlIHRoZSBmaWxlIGhhcyBkaWZmZXJl
bnQgbmFtZXMgZm9yIHRoZQo+ID4gICMgZGlmZmVyZW50IGJvYXJkcywgYnV0IHRoZXJlIGlzIG9u
bHkgb25lLCBhbmQgaXQgaGFzIHRvIGJlIG5hbWVkCj4gPiAgIyB2cGxfZ2VuX2ZpeGVkLnBkaSB3
aGVuIGluc3RhbGxlZC4KPiA+ICtpZmVxICgkKEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZF
UlNBTF9YU0EpLHkpCj4gPiArWElMSU5YX1BSRUJVSUxUX1BMTSA9ICQoQEQpL3BkaV9maWxlcy9n
ZW5fZmlsZXMvcGxtLmVsZgo+ID4gK1hJTElOWF9QUkVCVUlMVF9QU01GVyA9ICQoQEQpL3BkaV9m
aWxlcy9zdGF0aWNfZmlsZXMvcHNtX2Z3LmVsZgo+Cj4gaXMgJ18nIGNoYXJhY3RlciBpbnRlbmRl
ZCBpbiAicHNtX2Z3LmVsZiIgZmlsZSBuYW1lIGluc3RlYWQgb2YgInBzbWZ3LmVsZiIgYXMKPiBm
b3IgWGlsaW54IGRldiBib2FyZHM/CgpJIGhhZCBub3Qgbm90aWNlZCB0aGF0LiBJIGRvdWJsZS1j
aGVja2VkIGFuZCB0aGUgZmlsZSBkb2VzIGhhdmUgJ18nCmluc2lkZSB0aGUgWFNBLCBidXQgZG9l
cyBub3QgaW4gdGhlIFhpbGlueCBwcmVidWlsdCByZXBvLiBJdCBpcyBzdHJhbmdlLApidXQgdGhp
cyBkb2VzIHdvcmsgYXMgaW50ZW5kZWQuCgpUaGFua3MgZm9yIHNwb3R0aW5nIHRoYXQsCkJyYW5k
b24KCj4KPiA+ICtYSUxJTlhfUFJFQlVJTFRfUERJID0gJChARCkvKi5wZGkKPiA+ICtlbHNlICMg
QlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMX1hTQQo+ID4gK1hJTElOWF9QUkVCVUlM
VF9QTE0gPSAkKFhJTElOWF9QUkVCVUlMVF9CT0FSRF9ESVIpL3BsbS5lbGYKPiA+ICtYSUxJTlhf
UFJFQlVJTFRfUFNNRlcgPSAkKFhJTElOWF9QUkVCVUlMVF9CT0FSRF9ESVIpL3BzbWZ3LmVsZgo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xl5eXl5eXl5eCj4KPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4KPgo+ID4gK1hJTElOWF9QUkVC
VUlMVF9QREkgPSAkKFhJTElOWF9QUkVCVUlMVF9CT0FSRF9ESVIpLyoucGRpCj4gPiArZW5kaWYg
IyBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxfWFNBCj4gPiArCj4gPiAgZGVmaW5l
IFhJTElOWF9QUkVCVUlMVF9JTlNUQUxMCj4gPiAtCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKFhJ
TElOWF9QUkVCVUlMVF9CT0FSRF9ESVIpL3BsbS5lbGYgXAo+ID4gKwkkKElOU1RBTEwpIC1EIC1t
IDA3NTUgJChYSUxJTlhfUFJFQlVJTFRfUExNKSBcCj4gPiAgCQkkKEJJTkFSSUVTX0RJUikvcGxt
LmVsZgo+ID4gLQkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChYSUxJTlhfUFJFQlVJTFRfQk9BUkRf
RElSKS9wc21mdy5lbGYgXAo+ID4gKwkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChYSUxJTlhfUFJF
QlVJTFRfUFNNRlcpIFwKPiA+ICAJCSQoQklOQVJJRVNfRElSKS9wc21mdy5lbGYKPiA+IC0JJChJ
TlNUQUxMKSAtRCAtbSAwNzU1ICQoWElMSU5YX1BSRUJVSUxUX0JPQVJEX0RJUikvKi5wZGkgXAo+
ID4gKwkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChYSUxJTlhfUFJFQlVJTFRfUERJKSBcCj4gPiAg
CQkkKEJJTkFSSUVTX0RJUikvdnBsX2dlbl9maXhlZC5wZGkKPiA+ICBlbmRlZgo+ID4gIGVsc2Ug
IyBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUwKPiA+Cj4gPiAtLS0KPiA+IGJhc2Ut
Y29tbWl0OiA1NWM4YzIzMjhlNzM3MjVlOWFiNDFjOGRjNTY2YjA5ZjQ5ZjJhYWQ1Cj4gPiBjaGFu
Z2UtaWQ6IDIwMjQwNjIxLXZlcnNhbC14c2Etc3VwcG9ydC1wcmVidWlsdC05YzVhZWQ1YmU2ODcK
PiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
