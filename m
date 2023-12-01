Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2CEC4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 17:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A1E64370C;
	Fri,  1 Dec 2023 17:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A1E64370C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vhy9tkD5Fhod; Fri,  1 Dec 2023 17:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F421C43730;
	Fri,  1 Dec 2023 17:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F421C43730
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74AD31BF301
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 17:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CD4260BAF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 17:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD4260BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBYbaVpjXWPe for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 17:06:10 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30F4460BAE
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 17:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F4460BAE
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1FpeBL001405; Fri, 1 Dec 2023 17:06:07 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3uqeyuu6xx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Dec 2023 17:06:07 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 3B1H65fD025268
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Dec 2023 17:06:06 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 3B1H641N001771
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 1 Dec 2023 17:06:05 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 5DE5620076;
 Fri,  1 Dec 2023 11:06:04 -0600 (CST)
To: buildroot@buildroot.org
Date: Fri,  1 Dec 2023 17:05:52 +0000
Message-ID: <20231201170552.18210-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127224139.35969-1-brandon.maier@collins.com>
References: <20231127224139.35969-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_15,2023-11-30_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_15,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010115
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010115
X-Proofpoint-GUID: _osSQzyXxss2NXgT7v9YWpy9XL06heJD
X-Proofpoint-ORIG-GUID: _osSQzyXxss2NXgT7v9YWpy9XL06heJD
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010115
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=POD051818;
 bh=j2F+J4XR6P7Pm7u4BpW4JF+mZeOGTL0ZeOu0gmTviVc=;
 b=pUn0f62fy6063CnRKnFFr+RRS6+F4pW2yExDNSj23LKOO4SiSG2rO7nmNkYoY1TL/cIs
 RV5Gp8Bz3AavU3GrogLFigtaNutGmARzigTbQIfUCGOGUmArEZ4vnQ69TDiIYR0RxT2F
 Hn01yh6I+BwTmZkPeqqM2QRc3pRdsdjZSJFSSOQf8TEzOHXoZhkf3Dk3G1PBbvzYiedr
 R+s9ORWLuW7XsDHmzgnKUiMwHNt8SAm7aA1EyzYAcm6meqN0DQb5P5vK/XFjVAslln80
 tPhoUWUExRYAxZH5uqNDziwqoA20XkJpdzsMd9suqLTfttQX/XcdLoBK4T065S4LInmT MQ== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=pUn0f62f
Subject: [Buildroot] [PATCH v2 1/1] ppd-merge: speed up per-package-rsync
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBlci1wYWNrYWdlLXJzeW5jIHN0YWdlIGNhbiBhZGQgYSBzaWduaWZpY2FudCBhbW91bnQg
b2YgdGltZSB0bwpidWlsZHMuIFRoZXkgY2FuIGFsc28gYmUgYW5ub3lpbmcgYXMgdGhlIHRhcmdl
dC1maW5hbGl6ZSBhbmQKaG9zdC1maW5hbGl6ZSB0YXJnZXRzIGFyZSB0aGUgc2xvd2VzdCBhbmQg
cnVuIG9uIGV2ZXJ5IGBtYWtlIGFsbGAsIHdoaWNoCmlzIHVzZWQgZnJlcXVlbnRseSBmb3IgcGFy
dGlhbCByZWJ1aWxkcy4KClRoZSBwZXItcGFja2FnZS1yc3luYyBpcyBzbG93IGJlY2F1c2UgaXQg
bGF1bmNoZXMgYSBuZXcgcnN5bmMgZm9yIGVhY2gKc291cmNlIHRyZWUsIGFuZCBlYWNoIHJzeW5j
IG11c3QgcmVzY2FuIHRoZSBkZXN0aW5hdGlvbiBkaXJlY3RvcnkgYW5kCnBvdGVudGlhbGx5IG92
ZXJ3cml0ZSBmaWxlcyBtdWx0aXBsZSB0aW1lcy4gV2UgY2FuIGluc3RlYWQgbWVyZ2UgYWxsIHRo
ZQpyc3luYyBjYWxscyBkb3duIGludG8gb25lIGNhbGwsIGFuZCByc3luYyBpcyBzbWFydGVyIGFi
b3V0IHNjYW5uaW5nIGFsbAp0aGUgc291cmNlIGRpcmVjdG9yaWVzIGFuZCBvbmx5IGNvcHlpbmcg
b3ZlciB0aGUgZmlsZXMgaXQgbmVlZHMgdG8uCgpXZSBmZWVkIHRoZSBzb3VyY2UgdHJlZXMgdG8g
cnN5bmMgaW4gcmV2ZXJzZS1vcmRlciwgYXMgdGhpcyBwcmVzZXJ2ZXMKdGhlIG9yaWdpbmFsIGJl
aGF2aW91ci4gSS5lLiB3aGVuIHVzaW5nIG11bHRpcGxlIHJzeW5jcywgdGhlIGxhc3Qgc291cmNl
CnRyZWUgd291bGQgb3ZlcndyaXRlIGFueXRoaW5nIGluIHRoZSBkZXN0aW5hdGlvbi4gTm93IHdo
ZW4gdXNpbmcgYQpzaW5nbGUgcnN5bmMsIHdlIHB1dCB0aGUgbGFzdCB0cmVlIGZpcnN0IGFzIHJz
eW5jIHdpbGwgc2VsZWN0IHRoZSBmaXJzdApmaWxlIGl0IGZpbmRzLgoKVGhpcyBvbmx5IHN1cHBv
cnRzIHRoZSAnY29weScgbW9kZSwgd2hpY2ggaXMgdXNlZCBpbiB0aGUgZmluYWxpemUgc3RlcC4K
VGhlICdoYXJkbGluaycgbW9kZSByZXF1aXJlcyBzcGVjaWZ5aW5nIGVhY2ggc291cmNlIHRyZWUg
d2l0aCB0aGUKLS1saW5rLWRlc3QgZmxhZyBidXQgZW5mb3JjZXMgYSBtYXhpbXVtIG9mIDIwIHRy
ZWVzLgoKQmVsb3cgaXMgYSBiZW5jaG1hcmsgcnVubmluZyB0aGUgaG9zdC1maW5hbGl6ZSB0YXJn
ZXQgZm9yIGEgYnVpbGQgd2l0aAoyMDAgcGFja2FnZXMuCgpCZW5jaG1hcmsgMTogYmVmb3JlIGNv
cHkKICBUaW1lIChtZWFuIMKxIM+DKTogICAgIDI3LjE3MSBzIMKxICAwLjc3NyBzICAgIFtVc2Vy
OiA2LjE3MCBzLCBTeXN0ZW06IDE0LjgzMCBzXQogIFJhbmdlIChtaW4g4oCmIG1heCk6ICAgMjYu
MzQzIHMg4oCmIDI4LjU2NiBzICAgIDEwIHJ1bnMKCkJlbmNobWFyayAyOiBhZnRlciBjb3B5CiAg
VGltZSAobWVhbiDCsSDPgyk6ICAgICAgNi4yOTYgcyDCsSAgMC4xOTYgcyAgICBbVXNlcjogMi44
NzQgcywgU3lzdGVtOiA1LjYwMCBzXQogIFJhbmdlIChtaW4g4oCmIG1heCk6ICAgIDYuMDk0IHMg
4oCmICA2LjcwOSBzICAgIDEwIHJ1bnMKClN1bW1hcnkKICBhZnRlciBjb3B5IHJhbgogICAgNC4z
MiDCsSAwLjE4IHRpbWVzIGZhc3RlciB0aGFuIGJlZm9yZSBjb3B5CgpDYzogSGVydmUgQ29kaW5h
IDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+CkNjOiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmlu
LjE5OThAZnJlZS5mcj4KQ2M6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9v
dGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6IEJyYW5kb24gTWFpZXIgPGJyYW5kb24ubWFpZXJAY29s
bGlucy5jb20+Ci0tLQp2MTogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1
aWxkcm9vdC9wYXRjaC8yMDIzMTEyNzIyNDEzOS4zNTk2OS0xLWJyYW5kb24ubWFpZXJAY29sbGlu
cy5jb20vCgp2MjoKLSBTaW1wbGlmeSBsb2dpYyBmb3IgJ2NvcHknIG1vZGUKLSBEcm9wIHN1cHBv
cnQgZm9yICdoYXJkbGluaycgbW9kZQoKU2lnbmVkLW9mZi1ieTogQnJhbmRvbiBNYWllciA8YnJh
bmRvbi5tYWllckBjb2xsaW5zLmNvbT4KLS0tCiBwYWNrYWdlL3BrZy11dGlscy5tayB8IDE4ICsr
KysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctdXRpbHMubWsgYi9wYWNrYWdlL3Br
Zy11dGlscy5tawppbmRleCAwNTllODZhZTBhLi5iYWRhMzI4ODI5IDEwMDY0NAotLS0gYS9wYWNr
YWdlL3BrZy11dGlscy5taworKysgYi9wYWNrYWdlL3BrZy11dGlscy5tawpAQCAtMjE3LDE4ICsy
MTcsMTIgQEAgaWZlcSAoJChCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVMpLHkpCiAjICQ0OiBs
aXRlcmFsICJjb3B5IiBvciAiaGFyZGxpbmsiIHRvIGNvcHkgb3IgaGFyZGxpbmsgZmlsZXMgZnJv
bSBzcmMgdG8gZGVzdAogZGVmaW5lIHBlci1wYWNrYWdlLXJzeW5jCiAJbWtkaXIgLXAgJCgzKQot
CSQoZm9yZWFjaCBwa2csJCgxKSxcCi0JCXJzeW5jIC1hIFwKLQkJCS0taGFyZC1saW5rcyBcCi0J
CQkkKGlmICQoZmlsdGVyIGhhcmRsaW5rLCQoNCkpLCBcCi0JCQkJLS1saW5rLWRlc3Q9JChQRVJf
UEFDS0FHRV9ESVIpLyQocGtnKS8kKDIpLywgXAotCQkJCSQoaWYgJChmaWx0ZXIgY29weSwkKDQp
KSwgXAotCQkJCQkkKGVtcHR5KSwgXAotCQkJCQkkKGVycm9yIHBlci1wYWNrYWdlLXJzeW5jIGNh
biBvbmx5ICJjb3B5IiBvciAiaGFyZGxpbmsiLCBub3QgIiQoNCkiKSBcCi0JCQkJKSBcCi0JCQkp
IFwKLQkJCSQoUEVSX1BBQ0tBR0VfRElSKS8kKHBrZykvJCgyKS8gXAotCQkJJCgzKSQoc2VwKSkK
KwkkKGlmICQoZmlsdGVyIGhhcmRsaW5rLCQoNCkpLCBcCisJCSQoZm9yZWFjaCBwa2csJCgxKSxc
CisJCQlyc3luYyAtYSAtLWhhcmQtbGlua3MgLS1saW5rLWRlc3Q9JChQRVJfUEFDS0FHRV9ESVIp
LyQocGtnKS8kKDIpLyBcCisJCQkJJChQRVJfUEFDS0FHRV9ESVIpLyQocGtnKS8kKDIpLyAkKDMp
JChzZXApKSwgXAorCQlwcmludGYgIiVzLyQoMikvXG4iICQoMSkgfCB0YWMgXAorCQkJfCByc3lu
YyAtYSAtLWhhcmQtbGlua3MgLS1maWxlcy1mcm9tPS0gLS1uby1SIC1yICQoUEVSX1BBQ0tBR0Vf
RElSKSAkKDMpKQogZW5kZWYKIAogIyBwcmVwYXJlcyB0aGUgcGVyLXBhY2thZ2UgSE9TVF9ESVIg
YW5kIFRBUkdFVF9ESVIgb2YgdGhlIGN1cnJlbnQKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
