Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C8EC4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 23:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1FDE42E31;
	Tue, 31 Oct 2023 23:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1FDE42E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9zHppsj_y1m; Tue, 31 Oct 2023 23:07:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB19D42E33;
	Tue, 31 Oct 2023 23:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB19D42E33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B47351BF279
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 23:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E0F06FA21
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 23:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E0F06FA21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lM5I0pjdmwMD for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 23:07:16 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3013D616CE
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 23:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3013D616CE
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39VN51ft019907; Tue, 31 Oct 2023 23:07:15 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3u34cun0wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Oct 2023 23:07:15 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 39VN7EmD024628
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Oct 2023 23:07:14 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 39VN7DQ7029069
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 31 Oct 2023 23:07:13 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 4E1F960206;
 Tue, 31 Oct 2023 18:07:13 -0500 (CDT)
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 23:07:09 +0000
Message-ID: <20231031230709.60348-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_10,2023-10-31_03,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_10,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 adultscore=0 mlxlogscore=833 mlxscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310310191
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=759
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310310191
X-Proofpoint-GUID: sewdMItK5rLgfAg5lNPQ9kZfrKprfcZm
X-Proofpoint-ORIG-GUID: sewdMItK5rLgfAg5lNPQ9kZfrKprfcZm
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=899 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310310191
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=1jtV6dEFQRJbS9HdZciolOs5NmH1aaNTa5PLwi+AQ6w=;
 b=sU1rL5by/AEgOtdXC4u9x372Lr5Jp8wBrDXPtYHJOtLofHlAoWOPwSoSqpleJDVXa71T
 2mgDmcAd5IE967AkMNsLtPIjNzSp4A+AeAupYQ7+P+JpWbPPQ1ZzBPIMrbz4fccrxJNC
 Plb1FB+dsBmQjbc4FZm3o4fPnyD/KzIixwKLYu2JVCIi8ZuZ2WacvwsKOZuS7vAFDXDY
 DKLYonqnqfGxAzhc49s+YhzBmGYg5DLV00GAbG0t/+ZdsRJCQbnL5R4h30SXqSZ0nemH
 Y6qiIQBgO1JPY1FGssg7r+yxLUuGSpPecDeMc6MNt1tdwQv5lnOIMT8S5oGh+EptFEGi nQ== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=sU1rL5by
Subject: [Buildroot] [PATCH 1/1] package/libgdiplus: bump to version 6.1
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
Cc: Kalpesh Panchal <kalpesh.panchal2@collins.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kalpesh Panchal <kalpesh.panchal2@collins.com>

- bump to version 6.1
- updated makefile to download source from
  https://download.mono-project.com/sources/libgdiplus/
  instead of github to avoid submodule build error
  from ./update_submodules.sh

Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/libgdiplus/libgdiplus.hash | 2 +-
 package/libgdiplus/libgdiplus.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgdiplus/libgdiplus.hash b/package/libgdiplus/libgdiplus.hash
index 11cacc13f6..f6a9b5eaf7 100644
--- a/package/libgdiplus/libgdiplus.hash
+++ b/package/libgdiplus/libgdiplus.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1fd034f4b636214cc24e94c563cd10b3f3444d9f0660927b60e63fd4131d97fa  libgdiplus-6.0.5.tar.gz
+sha256  97d5a83d6d6d8f96c27fb7626f4ae11d3b38bc88a1726b4466aeb91451f3255b  libgdiplus-6.1.tar.gz
 sha256  81317bf837e02a116dc20b032fa1d0cbf9ec357621f141ff2c2daf26c17cbb5d  LICENSE
diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
index 97cb595c71..128270e0d7 100644
--- a/package/libgdiplus/libgdiplus.mk
+++ b/package/libgdiplus/libgdiplus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGDIPLUS_VERSION = 6.0.5
-LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
+LIBGDIPLUS_VERSION = 6.1
+LIBGDIPLUS_SITE = https://download.mono-project.com/sources/libgdiplus
 
 LIBGDIPLUS_LICENSE = MIT
 LIBGDIPLUS_LICENSE_FILES = LICENSE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
