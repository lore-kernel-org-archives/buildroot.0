Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F12C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09393408C0;
	Mon, 15 Jul 2024 14:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0jYt2RwOrLO; Mon, 15 Jul 2024 14:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12FC040936
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12FC040936;
	Mon, 15 Jul 2024 14:50:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C2E01BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8924340A22
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoLsepjc6wr9 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:50:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1EC240A11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1EC240A11
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1EC240A11
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:50:51 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46FDfB0K018861; Mon, 15 Jul 2024 14:50:51 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bj9re124-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2024 14:50:50 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FEohON013573
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2024 14:50:43 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46FEogLY016063
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 15 Jul 2024 14:50:43 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id C1A2A2005493;
 Mon, 15 Jul 2024 09:50:42 -0500 (CDT)
Date: Mon, 15 Jul 2024 14:50:40 +0000
MIME-Version: 1.0
Message-Id: <20240715-support-testing-fix-testinitsystemnone-v1-2-299145b2d342@collins.com>
References: <20240715-support-testing-fix-testinitsystemnone-v1-0-299145b2d342@collins.com>
In-Reply-To: <20240715-support-testing-fix-testinitsystemnone-v1-0-299145b2d342@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407150117
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407150116
X-Proofpoint-ORIG-GUID: fv-71YohwLSwIDRAHE8thy-moF5bjGzN
X-Proofpoint-GUID: fv-71YohwLSwIDRAHE8thy-moF5bjGzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407150117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=7PklZ4zZRkIeR6U58EVQGmITH1zQSBp4VCQGsCf5cm0=;
 b=pvwopFuC6WKMhSag2SRwV2UUSRobFKvvtSlmMeVowCNPdmdnQrdUNwym+kBlCHnxYkBW
 PvQhH3f/nZb4QR9euSioIzJG/ILlP1irCLYaCQDXgv1yBb5RMWkFYPXugSy1YQM2M4x8
 fSsr5W9i/B5XKmZSXF2RLFS66pYNVzvMwYpMbKylv0KmPVE81C9HDjBFBx7Dp+9jX3Yn
 +zF2AVWIqdJREvuRkIOtdNyjTZM+/ZdmooAdwserLRhvUamK/PkO1w/xbaEeuEfUmwYM
 +pNUESWBl8fnayXpmyPndRSHEwyBzzFqEXK06G5vs2yUXO7cLiOtwO99/qep0YYf6r07 xg== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=pvwopFuC
Subject: [Buildroot] [PATCH 2/2] support/testing: fix TestInitSystemNone for
 non-login shell
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

This test started failing at commit
0cad947b964be5612a182413da136fcf0dc5a1f2
"support/testing/infra/emulator.py: fix qemu prompt detection" with the
error message

  AttributeError: 'NoneType' object has no attribute 'run_command'

This is because we changed emulator.run() so that emulator.login() must
be called first. But this test skips the login and goes directly to a
shell. Use the new emualtor.connect_shell() function which prepares the
shell without logging in.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 support/testing/tests/init/test_none.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/init/test_none.py b/support/testing/tests/init/test_none.py
index fc4a46efd9..5bfcc3d5c9 100644
--- a/support/testing/tests/init/test_none.py
+++ b/support/testing/tests/init/test_none.py
@@ -18,10 +18,8 @@ class TestInitSystemNone(InitSystemBase):
         if index != 0:
             self.emulator.logfile.write("==> System does not boot")
             raise SystemError("System does not boot")
-        index = self.emulator.qemu.expect(["#", pexpect.TIMEOUT], timeout=60)
-        if index != 0:
-            self.emulator.logfile.write("==> System does not boot")
-            raise SystemError("System does not boot")
+
+        self.emulator.connect_shell()
 
         out, exit_code = self.emulator.run("sh -c 'echo $PPID'")
         self.assertEqual(exit_code, 0)

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
