Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA8AC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 17:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87B6560626;
	Fri, 12 Jul 2024 17:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOdCePkSbvxx; Fri, 12 Jul 2024 17:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A8FB60750
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A8FB60750;
	Fri, 12 Jul 2024 17:58:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72E1D1BF5A4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 17:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D26660750
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 17:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_FFmARQispD for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 17:58:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3061560626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3061560626
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3061560626
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 17:58:56 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46CEBC9Q016740; Fri, 12 Jul 2024 17:58:54 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40b61eafa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2024 17:58:53 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46CHwqVX020251
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2024 17:58:52 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46CHwp6R031465
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 12 Jul 2024 17:58:51 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 699AE30041FB;
 Fri, 12 Jul 2024 12:58:51 -0500 (CDT)
Mime-Version: 1.0
Date: Fri, 12 Jul 2024 17:58:51 +0000
Message-Id: <D2NR7UR65IZD.28H7Y4Y4Z34GJ@collins.com>
To: "Arnout Vandecappelle" <arnout@mind.be>, "Julien Olivain" <ju.o@free.fr>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240522154616.1265769-1-brandon.maier@collins.com>
 <a27d5bf51fad0eb68dfbc1faee805b8d@free.fr>
 <1e5e26ad-a563-4198-bdd4-769e5fbf0d62@mind.be>
In-Reply-To: <1e5e26ad-a563-4198-bdd4-769e5fbf0d62@mind.be>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407120120
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407120121
X-Proofpoint-GUID: GKpkX_8Mg1eDTcwzpiLCdH9T9KJMRo79
X-Proofpoint-ORIG-GUID: GKpkX_8Mg1eDTcwzpiLCdH9T9KJMRo79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 phishscore=0 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2407120121
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=EyWqxNi536yF6iuYI/aJ3t+lilaLGsg2XAQmMOG9o84=;
 b=RLxbyf1Ceur3IYhP3QSUJCX15LtOfydakg71UFZIkCwNOtVggh42yZ0IzlgF0MXqm2lT
 0t+skeNS486pyAtGp1se9N8HMse+D7/tRR9z7F9UIB/1fMza/3k08veT6/16yaIEpo98
 rNZn7zYs6dXCpRj2kuraFN2NxCXUt715q4l8uPlhbAJ/+UVW24zkJevD2bT7wrKzGjQS
 ieUYjBaoO+/V4O34qtkKEWYScMGze+cI8wvReiqd7pydqbglOyfajcquQojcbtjPcrul
 p30R+jwpu5sVcBF0svypwoW8TstM8t7pTIX+fqOaX15WgIxkLrT1ei5QeAZ9c7pkpjJE Dg== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=RLxbyf1C
Subject: Re: [Buildroot] [PATCH] support/testing/infra/emulator.py: fix qemu
 prompt detection
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0IGFuZCBKdWxpZW4sCgpPbiBGcmkgSnVsIDEyLCAyMDI0IGF0IDg6MTMgQU0gVVRD
LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+ICAgSGkgQnJhbmRv
biwgSnVsaWVuLAo+Cj4gT24gMjIvMDUvMjAyNCAyMTowNCwgSnVsaWVuIE9saXZhaW4gd3JvdGU6
Cj4gPiBIaSBCcmFuZG9uLCBBbGwsCj4gPgo+ID4gT24gMjIvMDUvMjAyNCAxNzo0NiwgQnJhbmRv
biBNYWllciB2aWEgYnVpbGRyb290IHdyb3RlOgo+ID4+IFRoZSBxZW11LnJ1bigpIG1ldGhvZCBj
YW4gYnJlYWsgd2hlbiBhIGNvbW1hbmQgaGFwcGVucyB0byBvdXRwdXQgdGhlCj4gPj4gc3RyaW5n
ICIjICIgdG8gc3Rkb3V0LiBUaGlzIGlzIGJlY2F1c2UgcWVtdS5ydW4oKSBkZXRlY3RzIHdoZW4g
YSBjb21tYW5kCj4gPj4gaGFzIGNvbXBsZXRlZCBieSBzZWFyY2hpbmcgZm9yIHRoZSBzaGVsbCBw
cm9tcHQsIHdoaWNoIGJ5IGRlZmF1bHQgaXMKPiA+PiAiIyAiLiBJdCB0aGVuIGNhcHR1cmVzIGV2
ZXJ5dGhpbmcgYmVmb3JlIHRoZSAiIyAiIGFzIHRoZSBjb21tYW5kcwo+ID4+IG91dHB1dCwgY2F1
c2luZyB0aGUgcmVzdCBvZiBvdXRwdXQgdG8gYmUgbG9zdC4KPiA+Pgo+ID4+IFRvIHdvcmsgYXJv
dW5kIHRoZSBpc3N1ZSBzZXQgdGhlIHByb21wdCB0byBzb21ldGhpbmcgbW9yZSB1bmlxdWUuIFRo
aXMKPiA+PiBtYWtlcyBpdCBsZXNzIGxpa2VseSB0byBhcHBlYXIgaW4gY29tbWFuZCBvdXRwdXQu
Cj4gPgo+ID4gSSBwcm9wb3NlZCBhIHNpbWlsYXIgcGF0Y2ggbGFzdCB5ZWFyOgo+ID4gaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9MzYy
NzYxCj4gPgo+ID4gQ2hhbmdpbmcgdGhpcyBwcm9tcHQgcmVxdWlyZXMgdG8gYWxzbyBwYXRjaCB0
aGUgImJhc2giIHJ1bnRpbWUgdGVzdCwKPiA+IHdoaWNoIGlzIGZhaWxpbmcgaWYgdGhlIHByb21w
dCBpcyBjaGFuZ2VkIGluIHRoZSBlbXVsYXRvci4KPgo+ICAgSW5zdGVhZCBvZiByb2xsaW5nIG91
ciBvd24sIHdvdWxkbid0IGl0IGJlIGJldHRlciB0byBzaW1wbHkgdXNlIHJlcGx3cmFwIFsxXT8K
PiBXZSdyZSBhbHJlYWR5IHVzaW5nIHBleHBlY3Qgc28gSSBleHBlY3QgKHB1biBpbnRlbmRlZCkg
c3dpdGNoaW5nIGZyb20gc3Bhd24gdG8KPiByZXBsd3JhcCBzaG91bGQgYmUgcXVpdGUgdHJpdmlh
bC4uLgoKSSB0ZXN0ZWQgcmVwbHdyYXAsIGFuZCBpdCBkb2VzIGhhbmRsZSBzb21lIG9mIHRoZSBj
b21wbGV4aXR5IG9mIHRoaXMuCgo+Cj4KPiA+IEkgdGhpbmsgbXkgcGF0Y2hlcyB3ZXJlIG5vdCBp
bmNsdWRlZCBkdWUgdG8gbG9zdCAzLzQgYW5kIDQvNCBwYXRjaGVzCj4gPiBpbiB0aGUgc2VyaWVz
IGZyb20gbXkgZW1haWwgcHJvdmlkZXIuIFRob3NlIHBhdGNoZXMgd2VyZSBvcmlnaW5hbGx5Cj4g
PiBpbiB0aGUgdjIuIFNlZToKPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTM1OTE4NSZzdGF0ZT0qCj4KPiAgIFBlcmhhcHMgeW91
IGd1eXMgY2FuIHN5bmMgYmV0d2VlbiB0aGUgdHdvIG9mIHlvdSB3aG8gd2lsbCB0YWtlIHRoaXMg
d29yayBhbmQKPiB0aGVuIHJlc2VuZCB0aGUgZW50aXJlIHNlcmllcz8KCkkgY2FuIHNlbmQgYSB2
MiB1c2luZyByZXBsd3JhcCBmb3IgY29tcGFyaXNvbi4gU2luY2UgaXQgdXNlcyBhIGRpZmZlcmVu
dApiYWNrZW5kIGl0IHNlZW1zIHRvIG9ic29sZXNjZSBib3RoIG9mIG91ciBwYXRjaCBzZXJpZXMu
CgpUaGFua3MsCkJyYW5kb24KCj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5vdXQKPgo+IFsxXSBodHRw
czovL3BleHBlY3QucmVhZHRoZWRvY3MuaW8vZW4vc3RhYmxlL2FwaS9yZXBsd3JhcC5odG1sCj4K
PiA+Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBCcmFuZG9uIE1haWVyIDxicmFuZG9uLm1haWVy
QGNvbGxpbnMuY29tPgo+ID4+IC0tLQo+ID4+IMKgc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxh
dG9yLnB5IHwgMTEgKysrKysrKysrLS0KPiA+PiDCoDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0
aW5nL2luZnJhL2VtdWxhdG9yLnB5Cj4gPj4gYi9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0
b3IucHkKPiA+PiBpbmRleCA2MjQ3NDBmY2IxLi5hYTU3OTQ0M2E2IDEwMDY0NAo+ID4+IC0tLSBh
L3N1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weQo+ID4+ICsrKyBiL3N1cHBvcnQvdGVz
dGluZy9pbmZyYS9lbXVsYXRvci5weQo+ID4+IEBAIC0xMDAsNiArMTAwLDEzIEBAIGNsYXNzIEVt
dWxhdG9yKG9iamVjdCk6Cj4gPj4gwqDCoMKgwqDCoMKgwqDCoCBpbmRleCA9IHNlbGYucWVtdS5l
eHBlY3QoWyIjICIsIHBleHBlY3QuVElNRU9VVF0pCj4gPj4gwqDCoMKgwqDCoMKgwqDCoCBpZiBp
bmRleCAhPSAwOgo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYWlzZSBTeXN0ZW1FcnJv
cigiQ2Fubm90IGxvZ2luIikKPiA+PiArCj4gPj4gK8KgwqDCoMKgwqDCoMKgICMgU2V0IGEgcHJv
bXB0IHRoYXQgaXMgdW5saWtlbHkgdG8gYXBwZWFyIGluIGNvbW1hbmQgb3V0cHV0Cj4gPj4gK8Kg
wqDCoMKgwqDCoMKgIHNlbGYucWVtdS5zZW5kbGluZSgiUFMxPSdici1xZW11LXRlc3QjICciKQo+
ID4+ICvCoMKgwqDCoMKgwqDCoCBpbmRleCA9IHNlbGYucWVtdS5leHBlY3QoWyJcclxuYnItcWVt
dS10ZXN0IyAiLCBwZXhwZWN0LlRJTUVPVVRdKQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBpZiBpbmRl
eCAhPSAwOgo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJhaXNlIFN5c3RlbUVycm9yKCJD
YW5ub3Qgc2V0IHRlc3QgcHJvbXB0IikKPiA+PiArCj4gPj4gwqDCoMKgwqDCoMKgwqDCoCBzZWxm
LnJ1bigiZG1lc2cgLW4gMSIpCj4gPj4gwqDCoMKgwqDCoMKgwqDCoCAjIFByZXZlbnQgdGhlIHNo
ZWxsIGZyb20gd3JhcHBpbmcgdGhlIGNvbW1hbmRzIGF0IDgwIGNvbHVtbnMuCj4gPj4gwqDCoMKg
wqDCoMKgwqDCoCBzZWxmLnJ1bigic3R0eSBjb2x1bW5zIDI5OTk5IikKPiA+PiBAQCAtMTEwLDEz
ICsxMTcsMTMgQEAgY2xhc3MgRW11bGF0b3Iob2JqZWN0KToKPiA+PiDCoMKgwqDCoMKgwqDCoMKg
IHNlbGYucWVtdS5zZW5kbGluZShjbWQpCj4gPj4gwqDCoMKgwqDCoMKgwqDCoCBpZiB0aW1lb3V0
ICE9IC0xOgo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aW1lb3V0ICo9IHNlbGYudGlt
ZW91dF9tdWx0aXBsaWVyCj4gPj4gLcKgwqDCoMKgwqDCoMKgIHNlbGYucWVtdS5leHBlY3QoIiMg
IiwgdGltZW91dD10aW1lb3V0KQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBzZWxmLnFlbXUuZXhwZWN0
KCJici1xZW11LXRlc3QjICIsIHRpbWVvdXQ9dGltZW91dCkKPiA+PiDCoMKgwqDCoMKgwqDCoMKg
ICMgUmVtb3ZlIGRvdWJsZSBjYXJyaWFnZSByZXR1cm4gZnJvbSBxZW11IHN0ZG91dCBzbyBzdHIu
c3BsaXRsaW5lcygpCj4gPj4gwqDCoMKgwqDCoMKgwqDCoCAjIHdvcmtzIGFzIGV4cGVjdGVkLgo+
ID4+IMKgwqDCoMKgwqDCoMKgwqAgb3V0cHV0ID0gc2VsZi5xZW11LmJlZm9yZS5yZXBsYWNlKCJc
clxyIiwgIlxyIikuc3BsaXRsaW5lcygpWzE6XQo+ID4+Cj4gPj4gwqDCoMKgwqDCoMKgwqDCoCBz
ZWxmLnFlbXUuc2VuZGxpbmUoImVjaG8gJD8iKQo+ID4+IC3CoMKgwqDCoMKgwqDCoCBzZWxmLnFl
bXUuZXhwZWN0KCIjICIpCj4gPj4gK8KgwqDCoMKgwqDCoMKgIHNlbGYucWVtdS5leHBlY3QoImJy
LXFlbXUtdGVzdCMgIikKPiA+PiDCoMKgwqDCoMKgwqDCoMKgIGV4aXRfY29kZSA9IHNlbGYucWVt
dS5iZWZvcmUuc3BsaXRsaW5lcygpWzJdCj4gPj4gwqDCoMKgwqDCoMKgwqDCoCBleGl0X2NvZGUg
PSBpbnQoZXhpdF9jb2RlKQo+ID4+Cj4gPj4gLS0KPiA+PiAyLjQ1LjEKPiA+Pgo+ID4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+ID4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPgo+ID4gQmVz
dCByZWdhcmRzLAo+ID4KPiA+IEp1bGllbi4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
