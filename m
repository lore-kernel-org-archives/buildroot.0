Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CDCE80A8A
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 00:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1F5832C6;
	Thu, 28 Sep 2023 00:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE1F5832C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hQhIxloWO-c; Thu, 28 Sep 2023 00:27:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B84E9832E6;
	Thu, 28 Sep 2023 00:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B84E9832E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0218B1BF286
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 00:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3E341C22
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 00:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD3E341C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QO1ZPTWQSiDL for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 00:27:38 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 762E241C0F
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 00:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 762E241C0F
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RJrS1i010532; Thu, 28 Sep 2023 00:27:35 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3tctxva0c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Sep 2023 00:27:35 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 38S0RYBw005881
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Sep 2023 00:27:34 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 38S0RXPd000373
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 28 Sep 2023 00:27:34 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 689B76038B;
 Wed, 27 Sep 2023 19:27:33 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 00:27:27 +0000
Message-ID: <20230928002728.2402-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919172300.9901-1-brandon.maier@collins.com>
References: <20230919172300.9901-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_16,2023-09-27_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_16,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0
 mlxlogscore=964 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309280002
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 mlxlogscore=891 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309280002
X-Proofpoint-GUID: MSFJr5VNoA-n6jgulpktkDnGlSYCuGXw
X-Proofpoint-ORIG-GUID: MSFJr5VNoA-n6jgulpktkDnGlSYCuGXw
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2309280002
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=FPp++fciwN9/WQCfR5ndatP8F9PH+IvXZEi0uBBjGBU=;
 b=p7uAR1Ihd9xh+/Tcwpw7zJ6X8nFiWuGYW+3pu30fuj9NaS3O5qeGFBVETTpXeVtrrFgO
 5IF9ZyXuisx8sprLjLZGIvlccuhXMIxK8RQKGirJDvNjY3gyEkso79uPhvOiCQ+3GTTC
 MavAlBl3rBJMbdwMiQyJ7+Tq0zkhYZW47pCkNFzizv3Is6b+eRMDknWxsrZaHxxm3sRy
 p6p59PBuRIml2b40AObd2AaLWnXEnMC7Vl0GgKGeJZxdDLM6UvsR2FuKNMbpt7Zq068R
 xKEHY1PdaWxaEMVTgsartv1Tq+vylxc7tB2hpmEieM8vTbY6E0HjLgJAUgPazdvy3mv9 Ew== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=p7uAR1Ih
Subject: [Buildroot] [PATCH v2 1/2] unifdef: add missing license
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The COPYING also contains a BSD-3-Clause license. The BSD-3-Clause
applies to "manual page unifdef.1 and the portability support code in
the FreeBSD subdirectory". The BSD-2-Clause applies to everything else.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Thomas Devoogdt <thomas@devoogdt.com>
---
Changes v1 -> v2:
  - No changes
---
 package/unifdef/unifdef.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
index 7d10595d1b..fd74455894 100644
--- a/package/unifdef/unifdef.mk
+++ b/package/unifdef/unifdef.mk
@@ -6,7 +6,7 @@
 
 UNIFDEF_VERSION = 2.12
 UNIFDEF_SITE = https://dotat.at/prog/unifdef
-UNIFDEF_LICENSE = BSD-2-Clause
+UNIFDEF_LICENSE = BSD-2-Clause, BSD-3-Clause
 UNIFDEF_LICENSE_FILES = COPYING
 
 define HOST_UNIFDEF_BUILD_CMDS
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
