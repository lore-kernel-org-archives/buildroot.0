Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ADDC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99877404F7;
	Sat, 13 Jul 2024 19:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-RUK0jCbAu7; Sat, 13 Jul 2024 19:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13396404C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13396404C5;
	Sat, 13 Jul 2024 19:56:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9282F1BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8072760753
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsKGQLZOL5Tu for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:56:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A19660718
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A19660718
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A19660718
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:56:49 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46DAtZlD006271; Sat, 13 Jul 2024 19:56:47 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bj9r3e9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:56:47 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DJuikU019527
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:56:45 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DJuUob024492
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 19:56:44 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 7973E2005495;
 Sat, 13 Jul 2024 14:56:30 -0500 (CDT)
Mime-Version: 1.0
Date: Sat, 13 Jul 2024 19:56:30 +0000
Message-Id: <D2OOCH8PNMRR.2A90SMBTA8GG@collins.com>
To: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240701-versal-xsa-support-prebuilt-v3-1-3d3e9318d181@collins.com>
 <7d46feba-19c0-4cb4-aeb9-898e863691a3@smile.fr>
 <D2OJRRC9Z5XN.3I6WU5HEIZB24@collins.com>
 <29dbb9d5-e35d-4ea5-bfda-cb4edac504d9@smile.fr>
In-Reply-To: <29dbb9d5-e35d-4ea5-bfda-cb4edac504d9@smile.fr>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130152
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130152
X-Proofpoint-ORIG-GUID: VIqQwBZLeBs43XP1t0CJwY5DRI-QMNqK
X-Proofpoint-GUID: VIqQwBZLeBs43XP1t0CJwY5DRI-QMNqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=d3830coJFyB+uDkBKsUvezNIDCH0AbiJOPUwMDdqlw4=;
 b=SIS/LE89HYWXOpgCV9DGvgpXYBq4j9tjtssvXFQ1yd4cr2A/WXqWN4hHbMe2DjvOqaz5
 vVpDH8oIa+B0AeUaDWWsq6Nizr2mXrDD71zMhy9yaVA+GuZ2csZSGVIZG/9eOVm+eRU/
 eaeyC8TcSMxp5awrAWIuD94bKqSvkymCVJZH3ylNLdrePc/w/75RwnJfqlI4lgp3niSV
 ZabFXrXzUPXe+GTVQRxO7TLNurkiOjkRT6sTaPnvpvNM58Gf/gdQwK7W/le1HmnpkJRP
 6EtDBagibLR7k5ocFjppe8c+QckAfSuz8he7QbzdlSmwlPhOZAWk8TZdQEX1xgQB33zv Vw== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=SIS/LE89
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

T24gU2F0IEp1bCAxMywgMjAyNCBhdCA0OjQ2IFBNIFVUQywgUm9tYWluIE5hb3VyIHZpYSBidWls
ZHJvb3Qgd3JvdGU6Cj4gSGVsbG8gQnJhbmRvbiwKPgo+IExlIDEzLzA3LzIwMjQgw6AgMTg6MjEs
IEJyYW5kb24gTWFpZXIgYSDDqWNyaXTCoDoKPiA+IE9uIFNhdCBKdWwgMTMsIDIwMjQgYXQgNDow
OCBQTSBVVEMsIFJvbWFpbiBOYW91ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+ID4+IEhlbGxvIEJy
YW5kb24sIEFsbCwKPiA+Pgo+ID4+IExlIDAxLzA3LzIwMjQgw6AgMTg6NDgsIEJyYW5kb24gTWFp
ZXIgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+ID4+PiBUaGUgeGlsaW54LXByZWJ1aWx0IHBh
Y2thZ2Ugb25seSBzdXBwb3J0cyBkZXZlbG9wbWVudCBib2FyZHMgdGhhdCBYaWxpbngKPiA+Pj4g
aGFzIHB1Ymxpc2hlZCBmaXJtd2FyZSBmb3IuIEN1c3RvbSBkZXNpZ25zIGJhc2VkIG9uIHRoZSBY
aWxpbnggcGxhdGZvcm0KPiA+Pj4gbXVzdCBnZW5lcmF0ZSB0aGVpciBvd24gZmlybXdhcmUgdXNp
bmcgdGhlIEFNRCBWaXZhZG8gRGVzaWduIFN1aXRlLgo+ID4+Pgo+ID4+PiBWaXZhZG8gcHJvZHVj
ZXMgYW4gWFNBIGZpbGUsIHdoaWNoIGlzIGEgWmlwIGZpbGUgY29udGFpbmluZyBhbGwgdGhlCj4g
Pj4+IGZpcm13YXJlIG5lZWRlZCBieSB4aWxpbngtcHJlYnVpbHQuIFdlIGV4dGVuZCB4aWxpbngt
cHJlYnVpbHQgdG8KPiA+Pj4gZG93bmxvYWQgY3VzdG9tIFhTQSBmaWxlcyBhbmQgZXh0cmFjdCB0
aGVpciBjb250ZW50cy4KPiA+Pj4KPiA+Pj4gUmV2aWV3ZWQtYnk6IE5lYWwgRnJhZ2VyIDxuZWFs
LmZyYWdlckBhbWQuY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBCcmFuZG9uIE1haWVyIDxicmFu
ZG9uLm1haWVyQGNvbGxpbnMuY29tPgo+ID4+PiAtLS0KPiA+Pj4gQ2hhbmdlcyBpbiB2MzoKPiA+
Pj4gLSBSZWJhc2Ugb24gdXBzdHJlYW0gY2hhbmdlcyB0byBib290L3hpbGlueC1wcmVidWlsdAo+
ID4+PiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA2MjYtdmVy
c2FsLXhzYS1zdXBwb3J0LXByZWJ1aWx0LXYyLTEtNzI0YjAwYzQ1OTZkQGNvbGxpbnMuY29tCj4g
Pj4+Cj4gPj4+IENoYW5nZXMgaW4gdjI6Cj4gPj4+IC0gRml4IGhlbHAgdGV4dCB0byBzYXkgWFNB
IGlzIGNyZWF0ZWQgYnkgVml2YWRvIFtOZWFsXQo+ID4+PiAtIExpbmsgdG8gdjE6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNDA2MjUtdmVyc2FsLXhzYS1zdXBwb3J0LXByZWJ1aWx0LXYx
LTEtZjY0YTdhMzk2YTM0QGNvbGxpbnMuY29tCj4gPj4+IC0tLQo+ID4+PiAgYm9vdC94aWxpbngt
cHJlYnVpbHQvQ29uZmlnLmluICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gPj4+ICBib290L3hpbGlueC1wcmVidWlsdC94aWxpbngtcHJlYnVpbHQubWsgfCAyNyArKysr
KysrKysrKysrKysrKysrKysrKystLS0KPiA+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2Jvb3QveGls
aW54LXByZWJ1aWx0L0NvbmZpZy5pbiBiL2Jvb3QveGlsaW54LXByZWJ1aWx0L0NvbmZpZy5pbgo+
ID4+PiBpbmRleCBkM2RmMWMwNmU3Li45NGVmM2RkMTExIDEwMDY0NAo+ID4+PiAtLS0gYS9ib290
L3hpbGlueC1wcmVidWlsdC9Db25maWcuaW4KPiA+Pj4gKysrIGIvYm9vdC94aWxpbngtcHJlYnVp
bHQvQ29uZmlnLmluCj4gPj4+IEBAIC0zMSw2ICszMSwzMCBAQCBjb25maWcgQlIyX1RBUkdFVF9Y
SUxJTlhfUFJFQlVJTFRfVkVSU0FMCj4gPj4+Cj4gPj4+ICBlbmRjaG9pY2UKPiA+Pj4KPiA+Pj4g
K2NvbmZpZyBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxfWFNBCj4gPj4+ICsJYm9v
bCAiZG93bmxvYWQgYSBwcmVidWlsdCBWZXJzYWwgWFNBIgo+ID4+PiArCWRlcGVuZHMgb24gQlIy
X1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMCj4gPj4+ICsJaGVscAo+ID4+PiArCSAgVGhl
IFhpbGlueCBTdXBwb3J0IEFyY2hpdmUgKFhTQSkgcHJvdmlkZXMgY3VzdG9tIFhpbGlueAo+ID4+
PiArCSAgZmlybXdhcmUgZmlsZXMgZ2VuZXJhdGVkIGJ5IHRoZSBBTUQgVml2YWRvIERlc2lnbiBT
dWl0ZS4KPiA+Pj4gKwo+ID4+PiArCSAgaHR0cHM6Ly9kb2NzLmFtZC5jb20vci9lbi1VUy91ZzE0
MDAtdml0aXMtZW1iZWRkZWQvQ3JlYXRpbmctYS1IYXJkd2FyZS1EZXNpZ24tWFNBLUZpbGUKPiA+
Pj4gKwo+ID4+PiAraWYgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMX1hTQQo+ID4+
PiArCj4gPj4+ICtjb25maWcgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMX1hTQV9M
T0NBVElPTgo+ID4+PiArCXN0cmluZyAiVVJMIG9mIGN1c3RvbSBYU0EiCj4gPj4+ICsJaGVscAo+
ID4+PiArCSAgVGhpcyBvcHRpb24gYWxsb3dzIHRvIHNwZWNpZnkgYSBVUkwgcG9pbnRpbmcgdG8g
YW4gWFNBIHNvdXJjZQo+ID4+PiArCSAgZmlsZS4gVGhpcyBVUkwgY2FuIHVzZSBhbnkgcHJvdG9j
b2wgcmVjb2duaXplZCBieSBCdWlsZHJvb3QsCj4gPj4+ICsJICBsaWtlIGh0dHA6Ly8sIGZ0cDov
LywgZmlsZTovLyBvciBzY3A6Ly8uCj4gPj4+ICsKPiA+Pj4gKwkgIFdoZW4gcG9pbnRpbmcgdG8g
YSBsb2NhbCBYU0EgdXNpbmcgZmlsZTovLywgeW91IG1heSB3YW50IHRvCj4gPj4+ICsJICB1c2Ug
YSBtYWtlIHZhcmlhYmxlIGxpa2UgJChUT1BESVIpIHRvIHJlZmVyZW5jZSB0aGUgcm9vdCBvZgo+
ID4+PiArCSAgdGhlIEJ1aWxkcm9vdCB0cmVlLgo+ID4+PiArCj4gPj4+ICtlbmRpZiAjIEJSMl9U
QVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTF9YU0EKPiA+Pj4gKwo+ID4+PiAgY29uZmlnIEJS
Ml9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX0ZBTUlMWQo+ID4+PiAgCXN0cmluZwo+ID4+PiAgCWRl
ZmF1bHQgInp5bnFtcCIgaWYgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfWllOUU1QCj4gPj4+
IGRpZmYgLS1naXQgYS9ib290L3hpbGlueC1wcmVidWlsdC94aWxpbngtcHJlYnVpbHQubWsgYi9i
b290L3hpbGlueC1wcmVidWlsdC94aWxpbngtcHJlYnVpbHQubWsKPiA+Pj4gaW5kZXggZDA5ZjRi
MTNlMi4uYzMwMDBiN2U0NSAxMDA2NDQKPiA+Pj4gLS0tIGEvYm9vdC94aWxpbngtcHJlYnVpbHQv
eGlsaW54LXByZWJ1aWx0Lm1rCj4gPj4+ICsrKyBiL2Jvb3QveGlsaW54LXByZWJ1aWx0L3hpbGlu
eC1wcmVidWlsdC5tawo+ID4+PiBAQCAtNSw5ICs1LDIwIEBACj4gPj4+ICAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ID4+Pgo+ID4+PiAgWElMSU5YX1BSRUJVSUxUX1ZFUlNJT04gPSAkKGNhbGwg
cXN0cmlwLCQoQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0lPTikpCj4gPj4+ICsKPiA+
Pj4gK2lmZXEgKCQoQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMX1hTQSkseSkKPiA+
Pj4gK1hJTElOWF9QUkVCVUlMVF9GSUxFID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfWElM
SU5YX1BSRUJVSUxUX1ZFUlNBTF9YU0FfTE9DQVRJT04pKQo+ID4+PiArWElMSU5YX1BSRUJVSUxU
X1NJVEUgPSAkKHBhdHN1YnN0ICUvLCUsJChkaXIgJChYSUxJTlhfUFJFQlVJTFRfRklMRSkpKQo+
ID4+PiArWElMSU5YX1BSRUJVSUxUX1NPVVJDRSA9ICQobm90ZGlyICQoWElMSU5YX1BSRUJVSUxU
X0ZJTEUpKQo+ID4+PiArZGVmaW5lIFhJTElOWF9QUkVCVUlMVF9FWFRSQUNUX0NNRFMKPiA+Pj4g
KwkkKFVOWklQKSAkKFhJTElOWF9QUkVCVUlMVF9ETF9ESVIpLyQoWElMSU5YX1BSRUJVSUxUX1NP
VVJDRSkgLWQgJChARCkKPiA+Pj4gK2VuZGVmCj4gPj4+ICtlbHNlICMgQlIyX1RBUkdFVF9YSUxJ
TlhfUFJFQlVJTFRfVkVSU0FMX1hTQQo+ID4+PiAgWElMSU5YX1BSRUJVSUxUX1NJVEUgPSAkKGNh
bGwgZ2l0aHViLFhpbGlueCxzb2MtcHJlYnVpbHQtZmlybXdhcmUsJChYSUxJTlhfUFJFQlVJTFRf
VkVSU0lPTikpCj4gPj4+ICBYSUxJTlhfUFJFQlVJTFRfTElDRU5TRSA9IE1JVAo+ID4+PiAgWElM
SU5YX1BSRUJVSUxUX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gPj4+ICtlbmRpZiAjIEJSMl9U
QVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTF9YU0EKPiA+Pj4gKwo+ID4+PiAgWElMSU5YX1BS
RUJVSUxUX0lOU1RBTExfVEFSR0VUID0gTk8KPiA+Pj4gIFhJTElOWF9QUkVCVUlMVF9JTlNUQUxM
X0lNQUdFUyA9IFlFUwo+ID4+Pgo+ID4+PiBAQCAtMjAsMTIgKzMxLDIyIEBAIGlmZXEgKCQoQlIy
X1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMKSx5KQo+ID4+PiAgIyBXZSBuZWVkIHRoZSAq
LnBkaSBnbG9iLCBiZWNhdXNlIHRoZSBmaWxlIGhhcyBkaWZmZXJlbnQgbmFtZXMgZm9yIHRoZQo+
ID4+PiAgIyBkaWZmZXJlbnQgYm9hcmRzLCBidXQgdGhlcmUgaXMgb25seSBvbmUsIGFuZCBpdCBo
YXMgdG8gYmUgbmFtZWQKPiA+Pj4gICMgdnBsX2dlbl9maXhlZC5wZGkgd2hlbiBpbnN0YWxsZWQu
Cj4gPj4+ICtpZmVxICgkKEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTF9YU0EpLHkp
Cj4gPj4+ICtYSUxJTlhfUFJFQlVJTFRfUExNID0gJChARCkvcGRpX2ZpbGVzL2dlbl9maWxlcy9w
bG0uZWxmCj4gPj4+ICtYSUxJTlhfUFJFQlVJTFRfUFNNRlcgPSAkKEBEKS9wZGlfZmlsZXMvc3Rh
dGljX2ZpbGVzL3BzbV9mdy5lbGYKPiA+Pgo+ID4+IGlzICdfJyBjaGFyYWN0ZXIgaW50ZW5kZWQg
aW4gInBzbV9mdy5lbGYiIGZpbGUgbmFtZSBpbnN0ZWFkIG9mICJwc21mdy5lbGYiIGFzCj4gPj4g
Zm9yIFhpbGlueCBkZXYgYm9hcmRzPwo+ID4KPiA+IEkgaGFkIG5vdCBub3RpY2VkIHRoYXQuIEkg
ZG91YmxlLWNoZWNrZWQgYW5kIHRoZSBmaWxlIGRvZXMgaGF2ZSAnXycKPiA+IGluc2lkZSB0aGUg
WFNBLCBidXQgZG9lcyBub3QgaW4gdGhlIFhpbGlueCBwcmVidWlsdCByZXBvLiBJdCBpcyBzdHJh
bmdlLAo+ID4gYnV0IHRoaXMgZG9lcyB3b3JrIGFzIGludGVuZGVkLgo+Cj4gT2ssIHRoYXQgaXMg
c3RyYW5nZSBpbmRlZWQuCj4KPiBNYXliZSBhIGNvbW1lbnQgYWJvdXQgdGhhdCBpbiB0aGUgLm1r
IHdvdWxkIGJlIHVzZWZ1bD8KCk5vIHByb2JsZW0sIEkgc2VudCBhIHY0IHRvIHJld29yZCB0aGUg
Y29tbWVudCBibG9jayBhYm92ZSB0byBjYWxsIG91dAp0aGUgcHNtX2Z3LmVsZgoKVGhhbmtzLApC
cmFuZG9uCgo+Cj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+Cj4gPgo+ID4gVGhhbmtzIGZvciBz
cG90dGluZyB0aGF0LAo+ID4gQnJhbmRvbgo+ID4KPiA+Pgo+ID4+PiArWElMSU5YX1BSRUJVSUxU
X1BESSA9ICQoQEQpLyoucGRpCj4gPj4+ICtlbHNlICMgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJ
TFRfVkVSU0FMX1hTQQo+ID4+PiArWElMSU5YX1BSRUJVSUxUX1BMTSA9ICQoWElMSU5YX1BSRUJV
SUxUX0JPQVJEX0RJUikvcGxtLmVsZgo+ID4+PiArWElMSU5YX1BSRUJVSUxUX1BTTUZXID0gJChY
SUxJTlhfUFJFQlVJTFRfQk9BUkRfRElSKS9wc21mdy5lbGYKPiA+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXgo+ID4+Cj4g
Pj4gQmVzdCByZWdhcmRzLAo+ID4+IFJvbWFpbgo+ID4+Cj4gPj4KPiA+Pj4gK1hJTElOWF9QUkVC
VUlMVF9QREkgPSAkKFhJTElOWF9QUkVCVUlMVF9CT0FSRF9ESVIpLyoucGRpCj4gPj4+ICtlbmRp
ZiAjIEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTF9YU0EKPiA+Pj4gKwo+ID4+PiAg
ZGVmaW5lIFhJTElOWF9QUkVCVUlMVF9JTlNUQUxMCj4gPj4+IC0JJChJTlNUQUxMKSAtRCAtbSAw
NzU1ICQoWElMSU5YX1BSRUJVSUxUX0JPQVJEX0RJUikvcGxtLmVsZiBcCj4gPj4+ICsJJChJTlNU
QUxMKSAtRCAtbSAwNzU1ICQoWElMSU5YX1BSRUJVSUxUX1BMTSkgXAo+ID4+PiAgCQkkKEJJTkFS
SUVTX0RJUikvcGxtLmVsZgo+ID4+PiAtCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKFhJTElOWF9Q
UkVCVUlMVF9CT0FSRF9ESVIpL3BzbWZ3LmVsZiBcCj4gPj4+ICsJJChJTlNUQUxMKSAtRCAtbSAw
NzU1ICQoWElMSU5YX1BSRUJVSUxUX1BTTUZXKSBcCj4gPj4+ICAJCSQoQklOQVJJRVNfRElSKS9w
c21mdy5lbGYKPiA+Pj4gLQkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChYSUxJTlhfUFJFQlVJTFRf
Qk9BUkRfRElSKS8qLnBkaSBcCj4gPj4+ICsJJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoWElMSU5Y
X1BSRUJVSUxUX1BESSkgXAo+ID4+PiAgCQkkKEJJTkFSSUVTX0RJUikvdnBsX2dlbl9maXhlZC5w
ZGkKPiA+Pj4gIGVuZGVmCj4gPj4+ICBlbHNlICMgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRf
VkVSU0FMCj4gPj4+Cj4gPj4+IC0tLQo+ID4+PiBiYXNlLWNvbW1pdDogNTVjOGMyMzI4ZTczNzI1
ZTlhYjQxYzhkYzU2NmIwOWY0OWYyYWFkNQo+ID4+PiBjaGFuZ2UtaWQ6IDIwMjQwNjIxLXZlcnNh
bC14c2Etc3VwcG9ydC1wcmVidWlsdC05YzVhZWQ1YmU2ODcKPiA+Pj4KPiA+Pj4gQmVzdCByZWdh
cmRzLAo+ID4+Cj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiA+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiA+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
