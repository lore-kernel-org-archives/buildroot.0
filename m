Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9844BC25B5F
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59F8440356;
	Mon, 13 May 2024 21:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHku8Pj_4EV8; Mon, 13 May 2024 21:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03B4F407FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03B4F407FA;
	Mon, 13 May 2024 21:30:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10C0D1BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0950D407FA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqJGHF1nJj5h for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:30:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5F4840356
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5F4840356
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5F4840356
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:30:42 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44DG9Itg010016; Mon, 13 May 2024 21:30:41 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3y3p4u2vem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 May 2024 21:30:41 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44DLUdTQ013430
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 May 2024 21:30:40 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44DLUdJL013788
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 13 May 2024 21:30:39 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 289553026D67;
 Mon, 13 May 2024 16:30:39 -0500 (CDT)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 21:30:35 +0000
Message-ID: <20240513213035.1738493-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_15,2024-05-10_02,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_15,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405130148
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405130147
X-Proofpoint-GUID: 9A_nZ-fwkmJvS777Bsbnjd7_1NlditaL
X-Proofpoint-ORIG-GUID: 9A_nZ-fwkmJvS777Bsbnjd7_1NlditaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_15,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405130147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=0coiovmW8DljP4a8rBCgYWS57A43ZLeAKTpBxRfVfW0=;
 b=Swm5vXH+Xow6Rt+Q7z+XGFqRf5OYHItBIwu7pe7NWXZR55+bkiD92L9I9FnC7jpjjUn7
 cqm8djURHEn/GOyABRTT6Aja/wgOQWHM91pwXjAxtcwEohRSXMBC5Ag1pdDzC/8Nhs/x
 3DL0TsmhmDhPppufFBupbHqik96MtSJe+WPNHJtlpulPkhIzMabofQevGk3r+tZKYTon
 4VDgXsB7NI/fiCyiGSAoWuBYVbleM07g+GEHjSin6ajw3UrnZYbi1LuKC+Uj+Ro3M5tS
 0dStq71WYXflyI4G23Eruz0fL0jXZi9UIWHeSuQwwHT3lAvlnTBWHVGTNppVCUGcugAp bg== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=Swm5vXH+
Subject: [Buildroot] [PATCH] support/testing/infra/builder.py: fix missing
 $HOME during build
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

When running a test that uses host-python-setuptools using the Buildroot
Docker image, for example running the following command,

> ./utils/docker-run ./support/testing/run-tests -o output -s -k tests.package.test_python_pytest.TestPythonPy3Pytest

The build fails with the following error,

>   File "/home/blmaier/buildroot/output/TestPythonPy3Pytest/build/host-python-setuptools-69.2.0/setuptools/_distutils/dist.py", line 354, in _gen_paths
>     yield pathlib.Path('~').expanduser() / filename
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/blmaier/buildroot/output/TestPythonPy3Pytest/host/lib/python3.11/pathlib.py", line 1385, in expanduser
>     raise RuntimeError("Could not determine home directory.")
> RuntimeError: Could not determine home directory.
>
> ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel

Python setuptools is looking for $HOME but failing to find it.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 support/testing/infra/builder.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index a2abb9ed89..295bc7b83d 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -52,7 +52,10 @@ class Builder(object):
                            "> end defconfig\n")
         self.logfile.flush()
 
-        env = {"PATH": os.environ["PATH"]}
+        env = {
+            "PATH": os.environ["PATH"],
+            "HOME": os.environ["HOME"]
+        }
         env.update(make_extra_env)
 
         cmd = ["make",
@@ -79,7 +82,11 @@ class Builder(object):
         in the environment that calls make.
         e.g. make_extra_env={"BR2_DL_DIR": "/path"}
         """
-        env = {"PATH": os.environ["PATH"]}
+        env = {
+            "PATH": os.environ["PATH"],
+            "HOME": os.environ["HOME"]
+        }
+
         if "http_proxy" in os.environ:
             self.logfile.write("Using system proxy: " +
                                os.environ["http_proxy"] + "\n")
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
