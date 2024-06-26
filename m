Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1BFC27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 16:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E51D80EC3;
	Wed, 26 Jun 2024 16:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBBcuxESPevO; Wed, 26 Jun 2024 16:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F24A380EE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F24A380EE3;
	Wed, 26 Jun 2024 16:49:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F58E1BF3F9
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 16:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8902A40CDF
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 16:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id miENGX407Jrs for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 16:49:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43C2E40CD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43C2E40CD3
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43C2E40CD3
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 16:49:24 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45QG1wTk028368; Wed, 26 Jun 2024 16:49:21 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 400fgrvwjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2024 16:49:21 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QGnKgi025689
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2024 16:49:20 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45QGnJD6000340
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 26 Jun 2024 16:49:19 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 39462300D4F7;
 Wed, 26 Jun 2024 11:49:19 -0500 (CDT)
Date: Wed, 26 Jun 2024 16:49:01 +0000
MIME-Version: 1.0
Message-Id: <20240626-gitignore-output-new-v4-1-fcb3ebc263ca@collins.com>
X-B4-Tracking: v=1; b=H4sIAHxGfGYC/0XMTQ6DIBBA4asY1h2DiFC76j2aLqyOOIkyBrA/M
 d69pJsuv8V7u4gYCKO4FLsI+KRI7DP0qRD91HmHQEO2UFJpaZQBR4mc54DAW1q3BB5f0Dy07VU
 9DlhbkdM14Ejv3/Z2zx4DL5CmgN1/piotbdXKc6laaxoDFXzQcYgzxRSvjtnNuHQ0lz0v4ji+w
 RuZXqsAAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_08,2024-06-25_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_08,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=875 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406260123
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=848
 phishscore=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406260123
X-Proofpoint-GUID: erEV5Bb-rcOUkyAfQmmj0BFd4LZqeLgX
X-Proofpoint-ORIG-GUID: erEV5Bb-rcOUkyAfQmmj0BFd4LZqeLgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_08,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 mlxlogscore=935 phishscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2406260123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=lTqqDtz7Fqad8fvaPQE1fGeOT9S4XyChwzuVl7jQKFU=;
 b=aOB/kPW+QTDp98SihME6WmR22Kj+R95mFERJJFxO+EfqzsxBCYzClySFFJ2c6HrgTTU0
 XBK5H+LVNpnlWF+VgwAYkZR8CKSUY8UHxCJNijaNwnRjHYH7snMYvcMohUYqBiGABXIm
 fosDeq94y2QkKVQavNeqU+0c2/+RgrdCgLaqWyWXsBAOTCpFw0K3KhrEFDLHnylmlBI8
 kMrBb0nFEhFYNdEC+ElUqhRv982oBavZRlBCoEdxw8tshNXHyUDYGhsWZpSKtQ07DU6q
 eTnixFM3xFNgbr13CpI9jxJLZtyn/47mKrE7ktlUFTCeUrPPhlG9P+Rr2RlVcEjPQ5fb 2w== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=aOB/kPW+
Subject: [Buildroot] [PATCH v4] Create a .gitignore file in the CANONICAL_O
 directory
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This .gitignore file ignores all files in an output directory and
hence doesn't change the git status.

Remove "/output" entry from the main .gitignore file as it is already
handled by this general approach.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
This is a resend of the v1 of this patch from Yegor Yefremov, as the
original patch series seems to have stalled.

I'm not familiar with the process for resending someone else's patches,
so let me know if I should redo anything.

I find having the output folders gitignore'd is useful as some newer
tools like fd-find and ripgrep will automatically respect gitignore.
Otherwise the output directories are huge and quick searches can
suddenly take a long time if I have created a few.
---
Changes v2:
- create .gitignore only if $(O) is a subfolder of $(TOPDIR) (Yann E.
  MORIN)
- Link to v1: https://patchwork.ozlabs.org/project/buildroot/patch/20240206132051.2838897-1-yegorslists@googlemail.com/

Changes v3:
- also support nested subdirectories (Yann E. MORIN)
- Link to v2: https://patchwork.ozlabs.org/project/buildroot/patch/20240213143025.274988-1-yegorslists@googlemail.com/

Changes v4:
- Revert to v1 of code (Arnout Vandecappelle)
- Link to v3: https://patchwork.ozlabs.org/project/buildroot/patch/20240214071908.297656-1-yegorslists@googlemail.com/
---
 .gitignore | 1 -
 Makefile   | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index bb02d9f572..14b7ca5040 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,3 @@
-/output
 /dl
 /.auto.deps
 /.config.cmd
diff --git a/Makefile b/Makefile
index 138cfc5f8d..3d930d64a9 100644
--- a/Makefile
+++ b/Makefile
@@ -63,6 +63,9 @@ ifneq ($(findstring @,$(CANONICAL_O)),)
 $(error The build directory can not contain a '@')
 endif
 
+# Create a default .gitignore file that ignores everything
+$(shell echo "*" > "$(CANONICAL_O)/.gitignore")
+
 CANONICAL_CURDIR = $(realpath $(CURDIR))
 
 REQ_UMASK = 0022

---
base-commit: 4f1b7d0ef00af527f6a5c1fcfd18ce204a7d78e8
change-id: 20240626-gitignore-output-new-5b47c23fde37

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
