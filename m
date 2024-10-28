Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4236AD33980
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 13:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E75A480CC2;
	Mon, 28 Oct 2024 13:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1KYYYJQhYA3; Mon, 28 Oct 2024 13:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 175DB811A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 175DB811A9;
	Mon, 28 Oct 2024 13:53:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD07F112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 13:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAD7D4047E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 13:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vn1LBTgNaZ5K for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 13:53:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04856403E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04856403E5
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04856403E5
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 13:53:48 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SD63VO011399;
 Mon, 28 Oct 2024 13:53:46 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42gre35th6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Oct 2024 13:53:46 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.135])
 by xusxph005rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 49SDri1Y026707
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Oct 2024 13:53:45 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49SDriKJ032468
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 28 Oct 2024 13:53:44 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 42DEE20054AD;
 Mon, 28 Oct 2024 08:53:44 -0500 (CDT)
Mime-Version: 1.0
Date: Mon, 28 Oct 2024 13:53:44 +0000
Message-Id: <D57HN0FMMQD5.CLENQUA9Q7LB@collins.com>
Cc: "Ricardo Martincoski" <ricardo.martincoski@datacom.com.br>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Brandon Maier via
 buildroot" <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20241009-check-package-requirements-v2-0-df3e7b79788b@collins.com>
 <20241009-check-package-requirements-v2-3-df3e7b79788b@collins.com>
 <20241026134400.3621f46b@windsurf>
In-Reply-To: <20241026134400.3621f46b@windsurf>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_04,2024-10-28_02,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_04,2024-10-28_02,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 mlxlogscore=779 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410280112
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=811 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410280111
X-Proofpoint-GUID: Nsdf0WiyvEK4l1nWIbMKpBtHDCfEGHiq
X-Proofpoint-ORIG-GUID: Nsdf0WiyvEK4l1nWIbMKpBtHDCfEGHiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_04,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=885 adultscore=0 clxscore=1011 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2410280112
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=K0DDTq6hF2+r/uw6lhKp/S0o4IbpL3dGqlk9cAMSipg=;
 b=dl2RCEBdV4Ct79IeYMS96Sl8q/QZpTFBP3QpOot9cLaM7TvA7fVXbbWK+CzNT5SC+Kqc
 WsnIoBCQljG9fQMD93SJsORKBocxEokreHtCoMBOvPPsgqOJ4lqoVNwiyTHjntbgTyMu
 71//hMjrikK2PFvBqBGNaNbBYkxWEa15mq52qjp5GGgE/PmLGeJOL+boFi9yl2TwEJNU
 Jgf/QrS1fSK1ZctR6zuIxOBZWaAVVOFjLCL+y5dmtSbsowienWoV8q4rAfSnu5mZvTDy
 DxiuROOJ4nqzfLYG4Mo4tgGUCXyQnNzVMUaM1yM9KeOU8y5qa5mZis0nphlHnmWgMs4/ tA== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=dl2RCEBd
Subject: Re: [Buildroot] [PATCH v2 3/3] docs/manual/adding-packages-tips:
 mention uv
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gU2F0IE9jdCAyNiwgMjAyNCBhdCAxMTo0NCBBTSBVVEMsIFRob21hcyBQ
ZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBPbiBXZWQsIDA5IE9jdCAyMDI0IDE0OjE0
OjU4ICswMDAwCj4gQnJhbmRvbiBNYWllciB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRy
b290Lm9yZz4gd3JvdGU6Cj4KPiA+ICstLS0tCj4gPiArJCB1diBydW4gLXMgLi91dGlscy9jaGVj
ay1wYWNrYWdlCj4gPiArLS0tLQo+Cj4gLXMgZG9lc24ndCBleGlzdCBoZXJlOgo+Cj4g8J+QpyDu
grAgdXYgcnVuIC1zIC4vdXRpbHMvY2hlY2stcGFja2FnZQo+IGVycm9yOiB1bmV4cGVjdGVkIGFy
Z3VtZW50ICctcycgZm91bmQKPgo+IFVzYWdlOiB1diBydW4gW09QVElPTlNdIDxDT01NQU5EPgo+
Cj4gRm9yIG1vcmUgaW5mb3JtYXRpb24sIHRyeSAnLS1oZWxwJy4KPgo+IEkgaGF2ZToKPgo+IPCf
kKcg7oKwIHV2IC0tdmVyc2lvbgo+IHV2IDAuNC4xMAoKSSBjYWxsIHRoaXMgb3V0IGluIHRoZSBw
YXRjaCBkb2N1bWVudGF0aW9uLCBgdXZgIHZlcnNpb24gMC40LjE5IG9yIGxhdGVyCmlzIHJlcXVp
cmVkLiBUaGUgJy1zJyBmbGFnIHdhcyBhZGRlZCBvbmx5IHJlY2VudGx5LgoKVGhlIG90aGVyIG9w
dGlvbiB3b3VsZCBiZSB0byByZW5hbWUgYC4vdXRpbHMvY2hlY2stcGFja2FnZWAgdG8gaGF2ZSB0
aGUKJy5weScgZXh0ZW5zaW9uLiBUaGUgJy1zJyBpcyBvbmx5IHJlcXVpcmVkIHRvIHRlbGwgYHV2
YCBpdCdzIGEgUHl0aG9uCnNjcmlwdC4KClRoYW5rcyBmb3IgcmV2aWV3aW5nIG15IHNlcmllcyEK
QnJhbmRvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
