Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ADFC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 18:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C16C60C22;
	Sat, 18 Nov 2023 18:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C16C60C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CECEvWDOZlSN; Sat, 18 Nov 2023 18:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5234A60838;
	Sat, 18 Nov 2023 18:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5234A60838
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDE551BF25F
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 18:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9467E400CB
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 18:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9467E400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srxO6plA3kaJ for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 18:13:19 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52C9E400DA
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 18:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52C9E400DA
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AIHxsau015138; Sat, 18 Nov 2023 18:13:18 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3uepn9t6sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Nov 2023 18:13:18 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 3AIIDGK2021139
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Nov 2023 18:13:17 GMT
Received: from help.localdomain (snat-utc-mailhub.rockwellcollins.com
 [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 3AIIDFDD013755
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 18 Nov 2023 18:13:16 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by help.localdomain (Postfix) with ESMTP id A145220098;
 Sat, 18 Nov 2023 12:13:15 -0600 (CST)
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 18:13:08 +0000
Message-ID: <20231118181308.55690-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-18_14,2023-11-17_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-18_14,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxlogscore=806 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311180138
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=897 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311180139
X-Proofpoint-ORIG-GUID: wTKQZj2AakXPGKFYgbdUS1Ji_xsFywgd
X-Proofpoint-GUID: wTKQZj2AakXPGKFYgbdUS1Ji_xsFywgd
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 mlxlogscore=831 bulkscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311180138
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=rXMik++7ptkTDj4wpi0HVOnH/kKmuJM8+3dLIw9E0nA=;
 b=Y2wC2ITjwWlA4A7yXjbdg9KzUToIHwoieJuht6eXmApQE5K/pDBFED1zYoZNJMUkJfTA
 6idHrZtkqI1ESvcqpVzWzrFwTX3p4UE0k0aRu0dGTpqFjWHeeEFcQep6Geh0JBe4D6VO
 ONAHcRvDReO7aubASQAMdRGQSFia7y1DPU78R17q78iAJq1gaIsHf5Q/L0tl49f9+qeX
 M0wQ0+b4hQI4TclJQ4uN2L70E24Qx87db2HsgO0wwdJkc9YKqcxepj75+R5dEW+Qy/ea
 yWsm7Up98uN1DAoUb3hVmbJSh8kmvdK4UIeA6LuqHQUGmHT/vV9B0TvAOj7t0G2FfaAE 5A== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=Y2wC2ITj
Subject: [Buildroot] [PATCH 1/1] package/Makefile.in: add PARALLEL_JOBS to
 post-build/post-image scripts
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Post-build, post-image, and other build scripts may run some commands in
parallel, for example to parallelize xargs, Makefiles, etc. Export
PARALLEL_JOBS to these scripts so they can enforce the same job limits
that other Buildroot packages use.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 docs/manual/customize-post-image.adoc | 4 ++--
 docs/manual/customize-rootfs.adoc     | 1 +
 docs/manual/debugging-buildroot.adoc  | 1 +
 package/Makefile.in                   | 3 ++-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/docs/manual/customize-post-image.adoc b/docs/manual/customize-post-image.adoc
index 5308093d06..4197cf6710 100644
--- a/docs/manual/customize-post-image.adoc
+++ b/docs/manual/customize-post-image.adoc
@@ -28,8 +28,8 @@ different sets of arguments to each script.
 
 Again just like for the post-build scripts, the scripts have access to
 the environment variables +BR2_CONFIG+, +HOST_DIR+, +STAGING_DIR+,
-+TARGET_DIR+, +BUILD_DIR+, +BINARIES_DIR+, +CONFIG_DIR+ and
-+BASE_DIR+.
++TARGET_DIR+, +BUILD_DIR+, +BINARIES_DIR+, +CONFIG_DIR+, +BASE_DIR+,
+and +PARALLEL_JOBS+.
 
 The post-image scripts will be executed as the user that executes
 Buildroot, which should normally _not_ be the root user. Therefore, any
diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
index d5d8b9288f..43ece5a332 100644
--- a/docs/manual/customize-rootfs.adoc
+++ b/docs/manual/customize-rootfs.adoc
@@ -69,6 +69,7 @@ In addition, you may also use these environment variables:
   - +BINARIES_DIR+: the place where all binary files (aka images) are
     stored
   - +BASE_DIR+: the base output directory
+  - +PARALLEL_JOBS+: the number of jobs to use when running parallel processes.
 
 Below three more methods of customizing the target filesystem are
 described, but they are not recommended.
diff --git a/docs/manual/debugging-buildroot.adoc b/docs/manual/debugging-buildroot.adoc
index f575fc48ee..b9068ead52 100644
--- a/docs/manual/debugging-buildroot.adoc
+++ b/docs/manual/debugging-buildroot.adoc
@@ -41,3 +41,4 @@ The script has access to the following variables:
   - +BINARIES_DIR+: the place where all binary files (aka images) are
     stored
   - +BASE_DIR+: the base output directory
+  - +PARALLEL_JOBS+: the number of jobs to use when running parallel processes.
diff --git a/package/Makefile.in b/package/Makefile.in
index 9fbe960759..796be6fda8 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -341,7 +341,8 @@ EXTRA_ENV = \
 	BR2_DL_DIR=$(BR2_DL_DIR) \
 	BUILD_DIR=$(BUILD_DIR) \
 	CONFIG_DIR=$(CONFIG_DIR) \
-	O=$(CANONICAL_O)
+	O=$(CANONICAL_O) \
+	PARALLEL_JOBS=$(PARALLEL_JOBS)
 
 ################################################################################
 # settings we need to pass to configure
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
