Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99889C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 18:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47D9B4004A;
	Tue, 23 Jul 2024 18:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QemxP3luMShc; Tue, 23 Jul 2024 18:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 130C4403A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 130C4403A9;
	Tue, 23 Jul 2024 18:43:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76E231BF2F3
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 18:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62D0780E84
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 18:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayy9KVxpeJuA for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 18:43:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A317E80D2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A317E80D2D
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A317E80D2D
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 18:43:39 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46NE28Ur021372; Tue, 23 Jul 2024 18:43:37 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40ht3we2bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2024 18:43:37 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46NIhZtQ013085
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2024 18:43:35 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46NIhY2q012887
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 23 Jul 2024 18:43:35 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id A2718202259C;
 Tue, 23 Jul 2024 13:43:34 -0500 (CDT)
Date: Tue, 23 Jul 2024 18:43:26 +0000
MIME-Version: 1.0
Message-Id: <20240723-gamin-remove-kconfig-v1-1-7d85212f201e@collins.com>
X-B4-Tracking: v=1; b=H4sIAM35n2YC/x3MQQqAIBBA0avErBswC5KuEi0cG22INBQiiO6et
 HyL/x8onIULTM0DmS8pkmJF1zbgNhsDo6zVoJUe1Kh7DPaQiJmPdDHuLkUvAc1IhlbjFVEHNT0
 ze7n/7by87weuN6RRZgAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_09,2024-07-23_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_09,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 mlxlogscore=711 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407230129
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=678 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407230130
X-Proofpoint-GUID: 0gaRy5GkCrA64JMu3w-qVy7JJ1BF8wV6
X-Proofpoint-ORIG-GUID: 0gaRy5GkCrA64JMu3w-qVy7JJ1BF8wV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_09,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=785 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407230129
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=ZqppA8/J/8r78HDALUQfeLVLm+kvwEFJ28K3B6mk5OM=;
 b=KEr9aNFNuLjQseZBqKQoN3GFa5mMby9J6TjvE0mUE17+w7YjewsM9hClA7fMw3LaPznN
 OoCjY9JwAgrioNDIJNypZDMRcqV7Pgz0fW35Ep4KyR/RxPuWr1QegWZ9JKOb7dcDWvRt
 rCbqxC5aoRtTgOrf0PV8t4IjNpFX/BelH7luKpDjXhv1FinEFX420Xgk+4xTrs20/SfU
 sRTjqSs9UPnoR0fVu2P//5jvD5IbINChAM8J0opYpehAupmvd2jgtqYkHOgfXNXpCDK3
 IjJv8GL+NJ+4S8Avr3QrdVJ8/DyMfAJUK2rUgrkRD87SwgYmeqGFI+9oa3gGpNI6HciC MA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=KEr9aNFN
Subject: [Buildroot] [PATCH] package/gamin: remove stale Config.in file
 breaking build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Brandon Maier <brandon.maier@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous commit ce00b93d5 (package/gamin: drop package) forgot to
remove gamin from Kconfig, which triggers the following error.

  package/Config.in:1645: can't open file "package/gamin/Config.in"
  make: *** [Makefile:1027: raspberrypi2_defconfig] Error 1

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 09347f7944..20585d53d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1642,7 +1642,6 @@ endif
 endmenu
 
 menu "Filesystem"
-	source "package/gamin/Config.in"
 	source "package/libconfig/Config.in"
 	source "package/libconfuse/Config.in"
 	source "package/libfuse/Config.in"

---
base-commit: ce00b93d5ad9691b73bba1501847eac8679e3c01
change-id: 20240723-gamin-remove-kconfig-87b8bd8f0bb1

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
