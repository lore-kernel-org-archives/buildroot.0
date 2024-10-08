Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B35CEFC2A
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 15:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F247E405D5;
	Tue,  8 Oct 2024 15:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FY6jopFiN3EH; Tue,  8 Oct 2024 15:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D76C405D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D76C405D6;
	Tue,  8 Oct 2024 15:58:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E50181BF36F
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 15:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E01B740577
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 15:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6qmAje6EhKj for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 15:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 668514056B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 668514056B
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 668514056B
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 15:57:55 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498DO1Ue019091;
 Tue, 8 Oct 2024 15:57:54 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 424hxy2u6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Oct 2024 15:57:54 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph005rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 498FvrpC019099
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Oct 2024 15:57:53 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 498Fvqrl029845
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Oct 2024 15:57:53 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id A83BD2023697;
 Tue,  8 Oct 2024 10:57:52 -0500 (CDT)
Date: Tue, 08 Oct 2024 15:57:51 +0000
MIME-Version: 1.0
Message-Id: <20241008-check-package-requirements-v1-2-a137acc133e6@collins.com>
References: <20241008-check-package-requirements-v1-0-a137acc133e6@collins.com>
In-Reply-To: <20241008-check-package-requirements-v1-0-a137acc133e6@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_14,2024-10-08_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_14,2024-10-08_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410080101
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410080101
X-Proofpoint-GUID: 6A_8eTxhrHsVFxrgMb2nNSA7Y5LYQ8Z2
X-Proofpoint-ORIG-GUID: 6A_8eTxhrHsVFxrgMb2nNSA7Y5LYQ8Z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_14,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2410080101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=uEf7TmtszqGfKZJwHJD0lUfGUBPLDI5QjOiqg6Z/lPk=;
 b=b6NJ7hvBZg8+OCh6carOzdPLli66/xlH9QkEFUUFOZf52BbhfyvjSelb9wxYCuJZX5Sp
 jyoGf4KAcM900XS4+b+xdGUsYm7G6fQFmwqok7ndxnM0rb/sEtL+4amwXe0Sa9+RN7U3
 NURncp/m9ViuQb6DddOutTgx/aEhMqlYi4hekJpUh/MKtgqq6qjxq+28EJLnKKXtl20+
 JWR9TYhNHxAVoMYlzhR/JscY8HHEFg3JWkcPGlHIMezrM+7/wlErX55ZwVQ+MDX0lcJ9
 ZZo1585kK6VmUTtZy1YzAs9H8l5ecjyRgmI2IhsKEXvIlWwh83JqfECECyy3LDDEhDpl 1w== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=b6NJ7hvB
Subject: [Buildroot] [PATCH 2/3] utils/check-package: add inline script
 requirements
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
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The check-package tool requires some PyPi package to be installed before
it can run. This is typically done by manually installing them into the
user's global Python environment or setting up a virtual environment,
then manually installing each dependency.

Python recently defined a format for managing script dependencies as
inline metadata[1]. This can be used with the `uv` tool to run a Python
script and automatically install the minimum required version of Python
and PyPi dependencies.

With this change, it's now possible to run check-package with

  uv run -s ./utils/check-package

Note that, because check-package does not have the '.py' file extension
we must specify the `-s` or `--script` argument. That argument was added
very recently in release 0.4.19[2].

I set the minimum python to 3.9 as that is the oldest version still
supported[3]. I verified 3.9 works by running

  uv run -p 3.9 -s ./utils/check-package `git ls-tree -r --name-only HEAD` --ignore-list=.checkpackageignore

[1] https://packaging.python.org/en/latest/specifications/inline-script-metadata/#script-type
[2] https://github.com/astral-sh/uv/releases/tag/0.4.19
[3] https://devguide.python.org/versions/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 utils/check-package | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 872e66c126b8ec4d5207235d69f0c02ad1757a06..227d9fee8666636e1b0c7e5b3d89015b8e850c51 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -1,5 +1,12 @@
 #!/usr/bin/env python3
 # See utils/checkpackagelib/readme.txt before editing this file.
+# /// script
+# requires-python = ">=3.8"
+# dependencies = [
+#     "flake8",
+#     "python-magic",
+# ]
+# ///
 
 import argparse
 import inspect

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
