Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF7DC4332F
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 03:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25CE060FCF;
	Fri, 15 Dec 2023 03:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25CE060FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bFiqtWtCljAy; Fri, 15 Dec 2023 03:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F3A560C02;
	Fri, 15 Dec 2023 03:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F3A560C02
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 084B31BF977
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 03:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D59DA60FB5
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 03:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D59DA60FB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2tyBQ_VIFMp for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 03:11:00 +0000 (UTC)
X-Greylist: delayed 848 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 15 Dec 2023 03:11:00 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A981960BD9
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A981960BD9
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 03:11:00 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BF1BtQq015090
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 18:56:51 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7dh5hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 18:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zi8ZxlFFLfYXLgfU5Eq6KKvZQZcqxmU3yNxIyPo/kHDpMWCFcMyBIHbF+z6fqg3+IYxowcXbUxE2LjMkmWkTdFz//sp9bYoVztYI5aWE9YtI4v+Skl3iMTgsuqsMIbd9IXV4NUDWbn0h1V7qJD6qPQeJY3Lb7qqDZLVmXvyvyAj8PcGVsS7IiI4zUrtsWADoNeUEEmaRVaIysE+vq8nR3+Z72bRCLThIBSqJKZ9G22yVFiP6FMjkuXrjKIUzHh1q8FiBd8EWb7IA7xKROWbdWfUxaTe+Fi2ElZuJcLRGfv74y5CBFxThZOCYn2vcuwaAxWApYbvuEPMvDtCURf8+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VC/5Jl1gbi/teRaUwr55wo/qCZ7QQ3lAxFxlYc2QGiM=;
 b=DcMslTRAlx3swSqU86SDLFdpfzlxV+9vql1rbFPNwDF8EgVc3vmJB1hZiHhtEu3Drox9xuyTn0f5O0Nf9zDU8xXF3ANobKFk5wevQj3VAe/7L6k0Tx857UkXPI3ul6Agtq5Tj3IP/BQ/DeDlyCjR03naCq6J/eUzCweaXceIy0yhjiMeZdWg1xf6clTc1/p0eFnyyoTaSW1ekjfRnScg/Qjl3b2qpcNihysmu6F+HD686tMS+G9rXAkNZSeZ/stNuT5A/SoguOLgux3Z1OrLXi09hwmP8xrU3UBrbaCrCW0OvWfoNDX4B/9eYYab8w+XeLHUqoMoQuTTaO8Hm5yXmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 02:56:44 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 02:56:43 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: buildroot@buildroot.org
Date: Fri, 15 Dec 2023 10:56:26 +0800
Message-Id: <20231215025626.3465609-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYAPR01CA0002.jpnprd01.prod.outlook.com (2603:1096:404::14)
 To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 709a2887-1921-416f-637d-08dbfd197844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +yii1HHqMwbwG9rdXa92j6eD1cJ6j2/6Zl6Zq1CxzBlwMa2p5sNP3YuDky3CLbEWMLjVYbyQ/WMtivhiS1Itpxqlp2DHFeeaf3eZNVLFbHENS31Erd/bQILvtJ/QRbegPF7BwK5202Q/cdggmMjvumZn6w79Botg3TZQ5ERit2Xy7vP1cRttVnjDO6tqFFWN0kUe9h7vS+ye2o7eK0/8w+LIMKWVHLGLwchXF67NtollSFm9wJFl6eA/MqpXjTMgQpNdXgeiHS8Q+EspD66dZj4gYPsrZtLTbT6eTAcSAXKyJ/4hZLxdRgX78zRD5rtEAvGLZAxsI53ZHFkYCmbx92v55QCqkiQB1+L/b6yBgZ4TNLUIb99AItgvzdgOfK5ZdZfHKZY4IyAMCLwpz2FmalYSYnh+6XBgla/DovQt8rFEk5Rl4A/Par9G0jWU/65z6qOP9dxWGykAp/aCxddNjxc0y4SJwCZMYlBF5CAHdoxdbrvJvkrNQ2AA4NR+pPSjGec+AZpfVMPT+LZG5ifyhcBUy3cpfvKjKcza7OEKpbEIP89CkA0N46B8Bu4Rimc18RQAWgvHwUvHl0PbR+cynCLrePkbV5+HfP6C4uVY6Xs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(39850400004)(136003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(38100700002)(1076003)(26005)(83380400001)(2616005)(38350700005)(83170400001)(52116002)(6486002)(966005)(6666004)(478600001)(6512007)(6506007)(66476007)(6916009)(316002)(66556008)(8676002)(66946007)(44832011)(8936002)(2906002)(5660300002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sFltDGNlQMT3KejcYzxWr5/xcYUc20drsZyYerVeeH5DSDeiju4GadMHQ1Bo?=
 =?us-ascii?Q?S/fdPLKmrvcFK4ieAJbwW4ij97Jts0cncl/XhsMdWByFUqDS+D54fjIx+zCE?=
 =?us-ascii?Q?emhtMkb0xocdyCYG0DJbPZEtJHlMkN/X4bQB8/F+dFWh0+/7Dz/t8byH66h8?=
 =?us-ascii?Q?Byzkr/4/0bPGpYl08RoU6L86ANH69L9lgc08bXSfTvT7UbV3eI+30tGkl2f8?=
 =?us-ascii?Q?VDTCWNPoDx55iqbQvnrTZUbo9kB1LEph12Um6vh3Xz1EwDSAIX/Cf9H0fBij?=
 =?us-ascii?Q?D+lYk4Gq7U0CsYl/MnQKFGRYQ2bB59graZRe1p4jLE1qBhQKuvf7pAyt5lgj?=
 =?us-ascii?Q?IJ3awhdsx7Shq9Rf9/bSGQCORusV1JpAcfarMwhgfkGDiZvjFrKYVd7gVSmy?=
 =?us-ascii?Q?SkHeyrvo4WGsxntzZcOPn3oqEAOfkGZ4QpSYiiQ5++xHS73GX4Jn4xpPhXlK?=
 =?us-ascii?Q?7WZvMCLH1QUQS9QgcLIP5IaeCaoY7pPmN0wTKgn3UowvPN1CIpQfuGmumGUV?=
 =?us-ascii?Q?dGEx2p0G8S2mzCf7HariSBviQayeUx0+nyxAcrBqzU1Tm5tUjm6stI+08w92?=
 =?us-ascii?Q?2PoTrsN4f8FGPenw+r8x7GXopJn10gniIqO2gkPgiKnp80W/2XuRrdWq9M+p?=
 =?us-ascii?Q?16Fjt2bVX4fPdSsCw/Zk4ik3SLT5uYw3JvpGbBGBDAR2NETjs0q51NvE1Oho?=
 =?us-ascii?Q?fYlN6DaJmj5uh/PnaI9OLcmFBdTKkQkldtjdIp+KPdLPGFD7GcMFiM/zdkqg?=
 =?us-ascii?Q?75WCHobY1h0pgYhGyohH+AUK6DRxzI77+AEfIy0IuD9D0DfIVcsqvjr+/88f?=
 =?us-ascii?Q?KFUWOOdwpVRgI7w1NwlruovR3I3hW3v4PZCq/RqLIB0ZpywSqU4QA3+KI7Tk?=
 =?us-ascii?Q?1DlCQaa8/BO1x2l6OhVbAcfsGJqXp72QV7PBBYfG2Sr0eNUW08wRjFBFBvD3?=
 =?us-ascii?Q?O6duXwsMN/MapwuGuNnwTfCbflXPRGWZ1lJgLVFH21ImPgu3qaCeZ6+LMOEz?=
 =?us-ascii?Q?qSjMi1LdViI1zT0s9RmbCHL4p1RKamrzKKxnc9DGW9NeVdyCifPek4/4nt+N?=
 =?us-ascii?Q?2Z1N0+8dSsurCiqqemDW5qATrZNqvw2ypNTvx9NZucjnNjN0GN0cUVmXSVsH?=
 =?us-ascii?Q?Ev+aNwzOc0otX/991e5/cWbrbpZONbGuZQpxMF+hYn3u8tj7gcz8d4HkFg2E?=
 =?us-ascii?Q?ANS0kHs6B0m+7qOeI4DFBicMWk8sSQnZTxMdr8h648UxuphWFfXYt3QitkUQ?=
 =?us-ascii?Q?zgw5B3/LxgZoO8xVL17QMMntFHifQtC8ORF/m5UtWCI8Knnu/spJ6LUmsY8v?=
 =?us-ascii?Q?75A4ekpftr/pnAjULjXtkk8L5uei63kqvlboFGmo4SZPc5iM1xo9yon4MGZF?=
 =?us-ascii?Q?4ugIWvPL5FtUDLYtXu4bmlxlQiL4+VX4FtnIlDgjDvIspZDme7cMHvasWPkO?=
 =?us-ascii?Q?Vx5ri7YWnfbNUnUVpZCQfego83SmJJCvJO+M0AAYRfGbjaaVSqYEtQMWwStB?=
 =?us-ascii?Q?jSwTb4uLBuNEuiFRUwNH2snX63m7pbYPhMQx9su4vS40rmsDstYXgwZ4ZF8F?=
 =?us-ascii?Q?rr6XE7QsryNuL9nLMyzUcqCDinsmFpwyVSaLfGCMDnJ2Z/bap3NutIsMng4Q?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709a2887-1921-416f-637d-08dbfd197844
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 02:56:43.8671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4e4kbxg2NjrBG2G0mbccFL1pUz2cKKq28+wIPaVu23Q1gNg5yHi1o8/xUnKZ4KiTnQEdcn3GyqPqNF23Ir0O8k9qeJxuERnyt3CezGm1GY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7757
X-Proofpoint-ORIG-GUID: qPvuKs3ShHYeJKPlhdUzjeAy8YQ4T8uY
X-Proofpoint-GUID: qPvuKs3ShHYeJKPlhdUzjeAy8YQ4T8uY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150020
Subject: [Buildroot] [PATCH] package/crun: bump to version 1.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Changes:
https://github.com/containers/crun/releases/tag/1.12

Also add a patch to fix crun compile without libseccomp libcap issue

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...ile-error-without-libseccomp-and-lib.patch | 59 +++++++++++++++++++
 package/crun/crun.hash                        |  2 +-
 package/crun/crun.mk                          |  2 +-
 3 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch

diff --git a/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch b/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch
new file mode 100644
index 0000000000..81b08d34b7
--- /dev/null
+++ b/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch
@@ -0,0 +1,59 @@
+From ea27b1363ef709ce4b169138017b67ef624b127b Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Tue, 12 Dec 2023 10:47:42 +0800
+Subject: [PATCH] libcrun: fix compile error without libseccomp and libcap
+
+Fixed compile error without libseccomp and libcap, running
+clang-format to format the code style.
+
+Upstream: https://github.com/containers/crun/commit/ea27b1363ef709ce4b169138017b67ef624b127b
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/libcrun/container.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcrun/container.c b/src/libcrun/container.c
+index 34649f8..ffcdb24 100644
+--- a/src/libcrun/container.c
++++ b/src/libcrun/container.c
+@@ -23,7 +23,9 @@
+ #include "container.h"
+ #include "utils.h"
+ #include "seccomp.h"
+-#include <seccomp.h>
++#ifdef HAVE_SECCOMP
++#  include <seccomp.h>
++#endif
+ #include "scheduler.h"
+ #include "seccomp_notify.h"
+ #include "custom-handler.h"
+@@ -47,7 +49,9 @@
+ #include <sys/signalfd.h>
+ #include <sys/epoll.h>
+ #include <sys/socket.h>
+-#include <sys/capability.h>
++#ifdef HAVE_CAP
++#  include <sys/capability.h>
++#endif
+ #include <sys/ioctl.h>
+ #include <termios.h>
+ #include <grp.h>
+@@ -3829,6 +3833,7 @@ populate_array_field (char ***field, char *array[], size_t num_elements)
+   (*field)[i] = NULL;
+ }
+ 
++#ifdef HAVE_CAP
+ static void
+ populate_capabilities (struct features_info_s *info, char ***capabilities, size_t *num_capabilities)
+ {
+@@ -3876,6 +3881,7 @@ populate_capabilities (struct features_info_s *info, char ***capabilities, size_
+   (*capabilities)[index] = NULL; // Terminate the array with NULL
+   populate_array_field (&(info->linux.capabilities), *capabilities, *num_capabilities);
+ }
++#endif
+ 
+ static void
+ retrieve_mount_options (struct features_info_s **info)
+-- 
+2.34.1
+
diff --git a/package/crun/crun.hash b/package/crun/crun.hash
index bdffb0c6aa..c461d78d97 100644
--- a/package/crun/crun.hash
+++ b/package/crun/crun.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  5b8b5adb1dff7af768b69d2b0b4f2cd785ec931e7aa10138aa29812c46ee09ff  crun-1.8.4.tar.gz
+sha256  a76982ac076a5c9bf9f85bd8d25b1dc6344e252399a7e9231504357fc019f7cc  crun-1.12.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 15438a44b3..a6088c13a0 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUN_VERSION = 1.8.4
+CRUN_VERSION = 1.12
 CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
 CRUN_DEPENDENCIES = host-pkgconf yajl
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
