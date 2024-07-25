Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8380DC3DA64
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38D0981300;
	Thu, 25 Jul 2024 15:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oGsfZjPxlCJ; Thu, 25 Jul 2024 15:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 250E281DF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 250E281DF1;
	Thu, 25 Jul 2024 15:01:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 275331BF20D
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16C7D60AA0
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIWx0qtxczhr for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E642660A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E642660A9F
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E642660A9F
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:01:27 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46PDCa8Q013543; Thu, 25 Jul 2024 15:01:22 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40kqcx1d9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jul 2024 15:01:21 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PF1KuX012029
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jul 2024 15:01:20 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46PF1JF5017653
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 25 Jul 2024 15:01:20 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id AC02A3004987;
 Thu, 25 Jul 2024 10:01:19 -0500 (CDT)
Mime-Version: 1.0
Date: Thu, 25 Jul 2024 15:01:19 +0000
Message-Id: <D2YPL0DRBIDJ.1IXAMC2W0UE6C@collins.com>
To: "James Hilliard" <james.hilliard1@gmail.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240724-revert-output-gitignore-v1-0-510a2795884c@collins.com>
 <20240724-revert-output-gitignore-v1-1-510a2795884c@collins.com>
 <20240725075112.576a95cf@windsurf>
 <CADvTj4qxPTw_rGV1wLWn6hvFvJ7fL50V=_npzCnQ5qAOrFZkDg@mail.gmail.com>
In-Reply-To: <CADvTj4qxPTw_rGV1wLWn6hvFvJ7fL50V=_npzCnQ5qAOrFZkDg@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_13,2024-07-25_03,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_13,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407250103
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250103
X-Proofpoint-GUID: Nll652jgUcLwJhFkPMhvzYupQQb7c7t4
X-Proofpoint-ORIG-GUID: Nll652jgUcLwJhFkPMhvzYupQQb7c7t4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_13,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 clxscore=1011 mlxlogscore=999 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2407250103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=arCfJjuhx2za/4nIq6/3KxQ2B8a9EmSScZMe4NLg7O0=;
 b=Ky68VXUTBUGt5U4SSaA5GpmemZ5MNRQM9MMORUC0rEpgHL62JMEgh/WYp7CuNy8JABAg
 zNKqfZO7jxl0odMkAa80XTd2t32/UUGBMj2y3XS2F+OU+dmYE9gpd4mfhvPzzAvaKJg3
 6LnuIW5lg2iw2PFoN0h8AR78N46tjJBQsOycrcCOcvftUrmPP/aTHXYYlvtdq1zzCbGd
 KIqwipuIq+MprnVac5v2pdfzYD0QJPxGVHReCpLjgWZd8IxDl1O8taAJdCOhJxGbDkj6
 zp21XVAtqydQYVRsm5lMg6E2l1xZKg73l+md2Pa9o6fuC0hH4Obbnd1XKQf6wCUuY18W OA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=Ky68VXUT
Subject: Re: [Buildroot] [PATCH 1/2] Revert "Create a .gitignore file in the
 CANONICAL_O directory"
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org,
 Bryan Brattlof <bb@ti.com>, "Yann
 E. MORIN" <yann.morin.1998@free.fr>, Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCBKYW1lcywKCk9uIFRodSBKdWwgMjUsIDIwMjQgYXQgNjowNCBBTSBVVEMsIEph
bWVzIEhpbGxpYXJkIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDI0LCAyMDI0IGF0IDExOjUx4oCvUE0g
VGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290Cj4gPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
PiB3cm90ZToKPiA+Cj4gPiBIZWxsbyBCcmFuZG9uLAo+ID4KPiA+IE9uIFdlZCwgMjQgSnVsIDIw
MjQgMjE6MjM6MjAgKzAwMDAKPiA+IEJyYW5kb24gTWFpZXIgPGJyYW5kb24ubWFpZXJAY29sbGlu
cy5jb20+IHdyb3RlOgo+ID4KPiA+ID4gVGhlIHBhY2thZ2VzICdweXRob24tanNvbnNjaGVtYS1z
cGVjaWZpY2F0aW9ucycsICdweWRhbnRpYy1jb3JlJywgYW5kCj4gPiA+IGxpa2VseSBvdGhlciBw
YWNrYWdlcyBiYXNlZCBvbiBQeXRob24gbWF0dXJpbiBzaWxlbnRseSBzdG9wcGVkCj4gPiA+IGlu
c3RhbGxpbmcgZmlsZXMgdG8gdGhlIGhvc3QgYW5kIHRhcmdldCBkaXJlY3RvcmllcyBhZnRlciBj
b21taXQKPiA+ID4gYTE0Yzg2MmMwOC4KPiA+ID4KPiA+ID4gQSBzaW1pbGFyIGlzc3VlIHdhcyBy
ZXBvcnRlZCBieSB0aGUgQ29uZGEgcHJvamVjdFsxXS4gSXQgc2VlbXMgc29tZQo+ID4gPiBidWls
ZCB0b29scyBzY2FuIGZvciBnaXRpZ25vcmUgZmlsZXMgdG8gZGVjaWRlIHdoYXQgZmlsZXMgdG8g
YnVpbGQKPiA+ID4gYW5kIGluc3RhbGwuCj4gPiA+Cj4gPiA+IEkgYXR0ZW1wdGVkIHZhcmlvdXMg
Y29tYmluYXRpb25zIG9mIGdpdGlnbm9yZSBwYXR0ZXJucyBpbmNsdWRpbmcKPiA+ID4gbWltaWNr
aW5nIHRoZSBDb25kYSBwcm9qZWN0J3MgZ2l0aWdub3JlWzJdLCBidXQgdGhlIG9ubHkgdGhpbmcg
dGhhdCBoYXMKPiA+ID4gd29ya2VkIHJlbGlhYmx5IGlzIHRoZSBvcmlnaW5hbCBgL291dHB1dGAg
aWdub3JlIGluIHRoZSByb290IEJ1aWxkcm9vdAo+ID4gPiBkaXJlY3RvcnkuCj4gPgo+ID4gVGhh
bmtzIGZvciB3b3JraW5nIG9uIHRoaXMuIEhvd2V2ZXIsIGl0J3MgcmVhbGx5IG1lc3NlZCB1cC4g
V2h5IHdvdWxkCj4gPiB0aGVzZSB0b29scyBiZSBib3RoZXJlZCBieSBhIC5naXRpZ25vcmUgZmls
ZT8gRG8geW91IGhhdmUgc29tZSBtb3JlCj4gPiBkZXRhaWxzPwo+Cj4gU28gaXQncyB0aGUgZXhh
Y3Qgc2FtZSByZWFzb24gcmlwZ3JlcCBpcyBhZmZlY3RlZCBieSAuZ2l0aWdub3JlIGZpbGVzLAo+
IG1hdHVyaW4gYWN0dWFsbHkgdXNlcyB0aGUgaWdub3JlIGNyYXRlIGZyb20gdGhlIHJpcGdyZXAg
cHJvamVjdDoKPiBodHRwczovL2NyYXRlcy5pby9jcmF0ZXMvaWdub3JlCj4KPiBOb3RlIHRoYXQg
dGhlIGlnbm9yZSBjcmF0ZSBkb2Vzbid0IGVudGlyZWx5IGNvcnJlY3RseSByZXBsaWNhdGUgZ2l0
J3MKPiBpZ25vcmUgbG9naWMgYXMgb3RoZXJ3aXNlIHRoaXMgc2hvdWxkbid0IGhhdmUgdHJpZ2dl
cmVkIGFueSBpc3N1ZXMuCgpJdCBkb2VzIHNlZW0gdG8gcmVwbGljYXRlIGdpdCdzIGlnbm9yZSBs
b2dpYyBjb3JyZWN0bHkuIFRoZSBpc3N1ZSBpcwp0aGF0IHdlIGRvd25sb2FkIHB5dGhvbi1qc29u
c2NoZW1hIGFzIGEgdGFyYmFsbCB3aGljaCBkb2VzIG5vdCBpbmNsdWRlCnRoZSAnLmdpdCcgZGly
ZWN0b3J5LiBTbyB3aGVuIGBtYXR1cmluYCB0cmllcyB0byB1c2UgZ2l0aWdub3JlJ3MsIGl0CmRv
ZXMgZG8gd2hhdCBnaXQgd291bGQgZG8sIGl0IHNlYXJjaGVzIHVwd2FyZHMgdW50aWwgaXQgZmlu
ZHMKQnVpbGRyb290J3MgJy5naXQnIGRpcmVjdG9yeSBhbmQgdHJlYXRzIGl0IGFzIHRoZSByZXBv
LgoKSXQgc2VlbXMgdG8gbWUgdGhlbiB0aGUgZml4IGlzIG9uZSBvZgotIEJ1aWxkcm9vdCBuZWVk
cyB0byBzd2l0Y2ggdG8gdXNpbmcgdGhlIGdpdCByZXBvIGRpcmVjdGx5Ci0gQnVpbGRyb290IG5l
ZWRzIHRvIGNyZWF0ZSBhbiBlbXB0eSBnaXQgcmVwbyBpbiBidWlsZC9weXRob24tanNvbnNjaGVt
YS8KLSBNYXR1cmluIG5lZWRzIHRvIHN0b3Agc2VhcmNoaW5nIGZvciBnaXQgcmVwb3MgYXQgaXRz
IHB5cHJvamVjdAogIGRpcmVjdG9yeSwgd2hpY2ggSmFtZXMnIFB1bGwgUmVxdWVzdCBpcyBkb2lu
ZwoKQW5kIEkgYWdyZWUgZml4aW5nIGl0IGluIE1hdHVyaW4gaXMgdGhlIGNvcnJlY3QgcGxhY2Uu
IEFzIHRoYXQgd2lsbCBhbHNvCmZpeCBpdCBmb3IgYW55b25lIHVzaW5nIHRoZSB0YXJiYWxscywg
bGlrZSBDb25kYS4gVGhvdWdoIGl0IGRvZXMgbWFrZSBtZQpwYXJhbm9pZCBhYm91dCB3aGF0IG90
aGVyIGJ1aWxkIHRvb2xzIG91dCB0aGVyZSBtaWdodCBiZSBleHBlY3RpbmcgYSBnaXQKcmVwbyBh
bmQgdGhlbiBzaWxlbnRseSBmYWxsaW5nIGJhY2sgdG8gdGhlIEJ1aWxkcm9vdCByZXBvLi4uCgpX
aGF0IHdhcyBzdXJwcmlzaW5nIHRvIG1lIGlzIHRoYXQgdGhlIGAvb3V0cHV0YCBwYXR0ZXJuIGlu
IEJ1aWxkcm9vdCdzCnJvb3QgZ2l0aWdub3JlIGRvZXNuJ3QgY2F1c2UgdGhpcyBwcm9ibGVtLiBU
aGlzIGFwcGVhcnMgdG8gYmUgYSBidWcgaW4KcmlwZ3JlcCdzIGxvZ2ljLCBhbmQgSSBmb3VuZCB0
aGlzIGxvbmcgdGhyZWFkIHRoYXQgc2VlbXMgcmVsYXRlZC4gU28gaWYKdGhpcyBldmVyIGdldHMg
Zml4ZWQgdGhlbiB0aGVzZSBwYWNrYWdlcyB3aWxsIGJlIGJyb2tlbiBhZ2Fpbi4KCmh0dHBzOi8v
Z2l0aHViLmNvbS9CdXJudFN1c2hpL3JpcGdyZXAvaXNzdWVzLzgyOQoKPgo+ID4KPiA+IEkgdGhp
bmsgSSdtIGdvaW5nIHRvIGFwcGx5IHRoZSByZXZlcnQgdG8gZml4IHRoZSBpbW1lZGlhdGUgYnVp
bGQKPiA+IGlzc3VlcywgYnV0IEkgd291bGQgcmVhbGx5IHJlYWxseSBsaWtlIHRvIGZpeCB0aGUg
cmVhbCBwcm9ibGVtLCBhbmQKPiA+IGFsbG93IHVzIHRvIGdlbmVyYXRlIHRoaXMgLmdpdGlnbm9y
ZSBmaWxlIGluIHRoZSBvdXRwdXQgZGlyZWN0b3J5Lgo+Cj4gWWVhaCwgSSd2ZSBiZWVuIHdvcmtp
bmcgb24gYSBmaXggYnV0IGl0IGhhcyBzb21lIGlzc3VlcywgbWF5YmUKPiBzb21lb25lIGNhbiBo
ZWxwIGZpeCB0aGUgdGVzdHM6Cj4gaHR0cHM6Ly9naXRodWIuY29tL1B5TzMvbWF0dXJpbi9wdWxs
LzIxNTgKClRoYW5rIHlvdSBKYW1lcyBmb3IgbG9va2luZyBhdCB0aGlzIHNvIHF1aWNrbHksCkJy
YW5kb24KCj4KPiA+Cj4gPiBUaG9tYXMKPiA+IC0tCj4gPiBUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluCj4gPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwo+ID4gaHR0cHM6Ly9ib290bGluLmNvbQo+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
