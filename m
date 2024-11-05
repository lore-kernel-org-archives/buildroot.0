Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA688D2C114
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6994B6089E;
	Tue,  5 Nov 2024 14:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tclUTRKZsF-6; Tue,  5 Nov 2024 14:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5833D608A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5833D608A0;
	Tue,  5 Nov 2024 14:37:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DE133B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E03A80E4A
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4jp96EMC_TH for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 14:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B656C80DC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B656C80DC5
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B656C80DC5
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:37:28 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5E7YUO012661;
 Tue, 5 Nov 2024 14:37:28 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42qha8j66m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Nov 2024 14:37:28 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.135])
 by xusxph008rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5EbRc0016434
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2024 14:37:27 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 4A5EbQBi026393
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 5 Nov 2024 14:37:26 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id A14EC1002A30;
 Tue,  5 Nov 2024 08:37:26 -0600 (CST)
Date: Tue, 05 Nov 2024 14:37:20 +0000
MIME-Version: 1.0
Message-Id: <20241105-support-b4-v1-1-2963298c1a58@collins.com>
References: <20241105-support-b4-v1-0-2963298c1a58@collins.com>
In-Reply-To: <20241105-support-b4-v1-0-2963298c1a58@collins.com>
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411050113
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 mlxscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050113
X-Proofpoint-ORIG-GUID: qUyewUUhoh8DlP0qe-4c-6EXHBiVgKiC
X-Proofpoint-GUID: qUyewUUhoh8DlP0qe-4c-6EXHBiVgKiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411050113
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=5M/C9/hbi33EnLjs6WIJNtviQeFzx5z8H35sjsWlmAw=;
 b=QO47Ebc6G3wNJZ2QBOIIEtB9/PTXN7HzEBYr+rCSNiejyGkoTjbBC/HNfV7ZtPiSe/7h
 MnTdFZEj5sEf/IAw7Fsvu2sGslpSMHi8a6xDhYam1PqIhakWG/bKR6QzK8TLWjmiDtUb
 2ayPQ15dg1/0knhhUtSNzCPbdBv+pnPWDYgLT4ZfGOORxb744Jev3Fqpoq+dvIgVTiOv
 GOkivGylf4zRJBoYFWZyNa0v1cq8k7XFcOH3x5wZ2XpA2+RfxBNQx6gMvmGLo91xg4xG
 uIAvNpeHkFHTRkRTrHRd0Zg/FESzCT8w2lX2+IVe7hupRbjefq3NwiEC6AsP26OwwXic Rw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=QO47Ebc6
Subject: [Buildroot] [PATCH 1/2] utils/check-package: support finding files
 from patches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For the `b4` tool to support check-package, check-package must support
reading patch files from stdin.

It would be complicated to make check-package actually run checks on
patch files. So instead we search the patch files to figure out what
files are modified in the repo, then run check-package on the modified
files directly.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 utils/check-package | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index 6a5e89daa3ce4f173cb21beb75122bcd40b80123..589891310ef6ef610ae9583c48672329560743a6 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -10,6 +10,7 @@
 
 import argparse
 import inspect
+import fileinput
 import magic
 import os
 import re
@@ -91,6 +92,9 @@ def parse_args():
                         "functions that would be called for each file (debug)")
     parser.add_argument("--failed-only", action="store_true", help="print only"
                         " the name of the functions that failed (debug)")
+    parser.add_argument("--patch", "-p", action="store_true",
+                        help="The 'files' are patch files to be sent to the"
+                        " Buildroot mailing list")
 
     parser.add_argument("--test-suite", action="store_true", help="Run the"
                         " test-suite")
@@ -294,6 +298,30 @@ def check_file_using_lib(fname):
     return nwarnings, nlines
 
 
+def patch_modified_files(patches):
+    """
+    Find files modified in a patch file
+
+    :param patches: Patch files to read, as a list of paths or '-' for stdin
+    :returns: List of modified filenames
+    """
+
+    files = []
+    with fileinput.input(files=patches) as fp:
+        # Search for unified-diff to-file lines
+        for line in fp:
+            if line.startswith('+++'):
+                line = line.removeprefix('+++').strip()
+
+                # Remove the prefix git adds to filenames
+                if line.startswith('b/'):
+                    line = line.removeprefix('b/')
+
+                files.append(line)
+    files.sort()
+    return files
+
+
 def __main__():
     global flags
     flags = parse_args()
@@ -301,14 +329,19 @@ def __main__():
     if flags.test_suite:
         return checkpackagelib.base.run_test_suite()
 
+    if flags.patch:
+        files = patch_modified_files(flags.files)
+    else:
+        files = flags.files
+
     if flags.intree_only:
         # change all paths received to be relative to the base dir
         base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
-        files_to_check = [os.path.relpath(os.path.abspath(f), base_dir) for f in flags.files]
+        files_to_check = [os.path.relpath(os.path.abspath(f), base_dir) for f in files]
         # move current dir so the script find the files
         os.chdir(base_dir)
     else:
-        files_to_check = flags.files
+        files_to_check = files
 
     if len(files_to_check) == 0:
         print("No files to check style")

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
