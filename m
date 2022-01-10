Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293A7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0CAD812A8;
	Mon, 10 Jan 2022 22:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YINQNQzKcdNN; Mon, 10 Jan 2022 22:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BD85812B8;
	Mon, 10 Jan 2022 22:16:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D90551BF31C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4D1A812A8
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:16:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXEqdogLzjUn for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:16:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1241D8129D
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:16:41 +0000 (UTC)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJBdCr017945; 
 Mon, 10 Jan 2022 21:02:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dgn26arpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 21:02:46 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AKhSMq020582;
 Mon, 10 Jan 2022 21:02:45 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dgn26armb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 21:02:45 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AKrbSv024110;
 Mon, 10 Jan 2022 21:02:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3dfwhhtsu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 21:02:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20AL2c8N43516230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 21:02:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66CAB42045;
 Mon, 10 Jan 2022 21:02:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3165E42052;
 Mon, 10 Jan 2022 21:02:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 10 Jan 2022 21:02:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 921052201C6;
 Mon, 10 Jan 2022 22:02:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 22:02:34 +0100
Message-Id: <20220110210235.817082-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220110210235.817082-1-clg@kaod.org>
References: <20220110210235.817082-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k21f5LEa-_-lUsZczla3FF03snzJ-qLY
X-Proofpoint-ORIG-GUID: F3BlfUt52AirxdlHYPY-3gEn924MjwW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_09,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 phishscore=0 mlxscore=0 clxscore=1034 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=852 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100141
Subject: [Buildroot] [PATCH 2/3] configs/qemu: Add a ppc-bamboo configuration
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIEJhbWJvbyBib2FyZCBpcyBhbiBldmFsdWF0aW9uIGJvYXJkIGZvciBQb3dlclBDIDQ0MEVQ
IENQVXMuCgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgot
LS0KIGJvYXJkL3FlbXUvcHBjLWJhbWJvby9saW51eC5mcmFnbWVudCB8ICA2ICsrKysrCiBib2Fy
ZC9xZW11L3BwYy1iYW1ib28vcmVhZG1lLnR4dCAgICAgfCAgNSArKysrCiBjb25maWdzL3FlbXVf
cHBjX2JhbWJvb19kZWZjb25maWcgICAgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAzIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBi
b2FyZC9xZW11L3BwYy1iYW1ib28vbGludXguZnJhZ21lbnQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBi
b2FyZC9xZW11L3BwYy1iYW1ib28vcmVhZG1lLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZp
Z3MvcWVtdV9wcGNfYmFtYm9vX2RlZmNvbmZpZwoKZGlmZiAtLWdpdCBhL2JvYXJkL3FlbXUvcHBj
LWJhbWJvby9saW51eC5mcmFnbWVudCBiL2JvYXJkL3FlbXUvcHBjLWJhbWJvby9saW51eC5mcmFn
bWVudApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmNjMjcyZDA1NDFm
MAotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL3FlbXUvcHBjLWJhbWJvby9saW51eC5mcmFnbWVu
dApAQCAtMCwwICsxLDYgQEAKKyMgRW5hYmxlIHZpcnRpbyAoYmxrLCBybmcgYW5kIG5ldCBkZXZp
Y2VzKQorQ09ORklHX1ZJUlRJTz15CitDT05GSUdfVklSVElPX1BDST15CitDT05GSUdfSFdfUkFO
RE9NX1ZJUlRJTz15CitDT05GSUdfVklSVElPX0JMSz15CitDT05GSUdfVklSVElPX05FVD15CmRp
ZmYgLS1naXQgYS9ib2FyZC9xZW11L3BwYy1iYW1ib28vcmVhZG1lLnR4dCBiL2JvYXJkL3FlbXUv
cHBjLWJhbWJvby9yZWFkbWUudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uMGI3MGQyZmE1NDQzCi0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvcWVtdS9wcGMtYmFt
Ym9vL3JlYWRtZS50eHQKQEAgLTAsMCArMSw1IEBACitSdW4gdGhlIGVtdWxhdGlvbiB3aXRoOgor
CitxZW11LXN5c3RlbS1wcGMgLW5vZ3JhcGhpYyAtTSBiYW1ib28gLWtlcm5lbCB2bWxpbnV4IC1u
ZXQgbmljLG1vZGVsPXZpcnRpby1uZXQtcGNpIC1uZXQgdXNlciAjIHFlbXVfcHBjX2JhbWJvb19k
ZWZjb25maWcKKworVGhlIGxvZ2luIHByb21wdCB3aWxsIGFwcGVhciBpbiB0aGUgdGVybWluYWwg
dGhhdCBzdGFydGVkIFFlbXUuCmRpZmYgLS1naXQgYS9jb25maWdzL3FlbXVfcHBjX2JhbWJvb19k
ZWZjb25maWcgYi9jb25maWdzL3FlbXVfcHBjX2JhbWJvb19kZWZjb25maWcKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5kNmFiYmViNDUyOTYKLS0tIC9kZXYvbnVsbAor
KysgYi9jb25maWdzL3FlbXVfcHBjX2JhbWJvb19kZWZjb25maWcKQEAgLTAsMCArMSwzNiBAQAor
IyBBcmNoaXRlY3R1cmUKK0JSMl9wb3dlcnBjPXkKK0JSMl9wb3dlcnBjXzQ0MGZwPXkKKworIyBT
eXN0ZW0KK0JSMl9TWVNURU1fREhDUD0iZXRoMCIKKworIyBGaWxlc3lzdGVtCisjIEJSMl9UQVJH
RVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CitCUjJfVEFSR0VUX1JPT1RGU19JTklUUkFNRlM9eQor
CisjIEltYWdlCitCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9xZW11L3Bvc3Qt
aW1hZ2Uuc2giCitCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9IiQoQlIyX0RFRkNPTkZJRyki
CisKKyMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbAorQlIyX1BBQ0tBR0VfSE9TVF9MSU5V
WF9IRUFERVJTX0NVU1RPTV81XzE1PXkKKworIyBLZXJuZWwKK0JSMl9MSU5VWF9LRVJORUw9eQor
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9WRVJTSU9OX1ZBTFVFPSI1LjE1IgorQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9IjQ0eC9i
YW1ib28iCitCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0iYm9hcmQvcWVt
dS9wcGMtYmFtYm9vL2xpbnV4LmZyYWdtZW50IgorQlIyX0xJTlVYX0tFUk5FTF9WTUxJTlVYPXkK
KworIyBTZXJpYWwgcG9ydCBjb25maWcKK0JSMl9UQVJHRVRfR0VORVJJQ19HRVRUWT15CitCUjJf
VEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5UzAiCisKKyMgS2VybmVsIG5lZWRzIG1raW1h
Z2UKK0JSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFM9eQorCisjIGhvc3QtcWVtdSBmb3IgZ2l0
bGFiIHRlc3RpbmcKK0JSMl9QQUNLQUdFX0hPU1RfUUVNVT15CitCUjJfUEFDS0FHRV9IT1NUX1FF
TVVfU1lTVEVNX01PREU9eQotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
