Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3667BC46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D64F440192;
	Wed,  3 Jan 2024 00:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D64F440192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_F-bXXT6ta8; Wed,  3 Jan 2024 00:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C9E540A98;
	Wed,  3 Jan 2024 00:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C9E540A98
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60E451BF977
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E715040A5F
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E715040A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57XdOmTAON6T for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:28:30 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::703])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2631E405FB
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2631E405FB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/92V5ULQHIqB9Oj8ed9XvSwnOVeNrWq7Cg8J3QLKW2OLnBC4t3qyI+zrO9P5FfyasRmtstOj4anMds+WfIHBCZwnkjM/qCcFA0mx8p2Nc+9slOk9GYe4wNql1+As3U9vV8xFb2JAfDt1/WfcDFNC7RtsF75LRezNVF4W+HuY03eVrL7K5Iu40Kge6ix3yrCEe9SMjks3hXNqGE5XBFEuhm2D2e0Ob6VWenKlfzs6L5QIk8kAEdZssSqGoQWsekFIXvob2mV62Nbux+b6Zu7deUtiKmQU/SH4WB5FHQp4uT+wEo/XdXg/DgYGUw3JgjSUVZMINleuy+wgc3Z+UkvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HTlRBurPU3+xlPT/D6gsD57y7hNx4QvLUh51g/UFTQ=;
 b=jAhN6U1kCtbUEv5/SopZ3OghncayKihi/9Oh9gLx0FZ4lAAz98e0h2J3o6jI2RCQNmdo4OC5qzL17i0cW7XBT+ZDH6mBI6R/aL4kmfQ54WN26IJamWhsOsvpL/MjuHsfZlX4Ltni71oIGnFSgWtSqVPOmL33uAB/+fCsGBeth8IXmXK0fnSk4nFW07mZs6Cg9Wwpz+AfRxctsA3m53LFjixrgowJQZhvVlCII7sEVWta1FLdfi8kNYjXbJSysxg99C/gHpncuKhfsuPZvlQ7LIOz1XITuTryBXMZyIUNTH4bpzshHCbjD6Dshp6WGXU2yfBcF0IZGxCmX+pYu+aQCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by MW4PR10MB6346.namprd10.prod.outlook.com (2603:10b6:303:1ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 00:28:25 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::5a20:2f52:3e09:72b3]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::5a20:2f52:3e09:72b3%6]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 00:28:25 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 18:28:09 -0600
Message-Id: <20240103002810.1055951-3-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103002810.1055951-1-colin.foster@in-advantage.com>
References: <20240103002810.1055951-1-colin.foster@in-advantage.com>
X-ClientProxiedBy: CH0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:610:e5::8) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|MW4PR10MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 18828421-41c3-40c4-d6ff-08dc0bf2e64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TYiZPwshu9iMdRucdpRBYO7ufSatDRRkCEprEwDT2C5qapSE0gn7VDAYj+XA+CemYB7k++eXBEftHCE+D3Mr7fqUDfCSqjctQnzbEgo02x/dicSDJwl5jmwMCkx47L1MU5fSQXExSMzFK/kiQQ9g3wtJbo9V5TjqCTP7Zq1mKeu+fcqGXGTi7h8u2gz0WeBMiqq9bEt/BLuzFgEblVOsRjjOw9YamoIVKkjuWLifJ7AaveXd2c2yjl6xp+h4g+jMRxCvU2nPoeaRD5sc4+Ii92QcBAx8Gio9fz2xL4Klcg87+DHmk4knVVpWDLr/M3bqT/RKhVGVhIyL3vqIRzV746KJ/O4E1pDpm7f6C7miggccs2QraN/5cYvyRFEvYWkG92ZrdCyu++vVHkDhAesV06jcAp61fPqONHkFgPzGhu/k3i0V4IDhFSz2m/3u/YtQTxwnPUMDqHU2tK5FHmEvdRlNZ3obG2gOiCY8nAk9pxngIq9CaGA1yVLFtDNAQ8Sq0Ht3Me8245uD4iNJnM5TwP8to91J+y4jmMKWHcAnzykje5jRMkBLSz2rQuXeNN2ywqOPl98Oydjc+OrspRAEXGMhhW7pYfNUrO8cV13nPHSlCVfFqDrhxzLro0wDbMASgLnWazJhHKw5wBO//JcYrk+3VzUpuFp6i/ultxaP4rZGR+iZ+mrZv7ZwngCSZlOb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39830400003)(346002)(136003)(366004)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(4326008)(2906002)(8676002)(8936002)(316002)(6916009)(66476007)(66556008)(66946007)(52116002)(54906003)(2616005)(44832011)(6512007)(26005)(1076003)(83380400001)(41300700001)(38100700002)(36756003)(86362001)(6506007)(6666004)(478600001)(6486002)(38350700005)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ykp4GGx1b8SiklJmaK4EWdgvhdyxIp0Wy14kaxO5iZGvWZSN/JcjESI9p7eu?=
 =?us-ascii?Q?JapEuFWD6vmgrL6/4Kofc7G0ydtSH6dV1lrQcEP+EZrXVu9bzeH1lDFbhpLH?=
 =?us-ascii?Q?BsmL5OoFAbWzngLB9HaBSczhJUA6jbOmCIWPi+aumFEkTBRSaRLcZTo1o73H?=
 =?us-ascii?Q?/q+0t0lcB3qbTpNFn0rW2rboKeSsnVT1DJm7qgoqIbn43L5/JtZLfzM7Hbeg?=
 =?us-ascii?Q?kJWEaA9Qkdyi609qoPU+Y7mnD05zdR9Wn2YY4InVUGOCxdsX++HdTahRxV22?=
 =?us-ascii?Q?4OeS9EKX22oOi+wEfkmyS+ZbkRYNnNMH8FmfNOl3EaBa290NHHxne0PUD/Jp?=
 =?us-ascii?Q?YoJDV+wbYGNzwNUKrcfwf1zo8P/KUfoYsGESlPhHVrCbWp7ARaCeXThSZzUX?=
 =?us-ascii?Q?U1OwF8szoybyUW/gNnsGywP/s5ZWjZjS11JGJ/KqwkZt4/oRklX/vX0TQWmk?=
 =?us-ascii?Q?hn5lDvwM/5uEZj6FkjY6iwC/C0SauvucX5Q7dI7o7Rv+lEH90X3NC3VDHpCe?=
 =?us-ascii?Q?3v05PTEqtzvxZQdwW/5KLgotUOpvfqhsi5LwLzlWsCKFLp0OhoHS9rvDwoyI?=
 =?us-ascii?Q?1LV+QFRNUPdXN670OuIWV4schvi8TvnWFs3xNxQNlydLBWUCnhGOqfCTBeMv?=
 =?us-ascii?Q?Vzx0btv/vMw/9BSkcr8JE41HWW+n1fmqBkRLjETOanItbijD7/ejYh2CCbM0?=
 =?us-ascii?Q?FDLZBWnQIeRra3ZIwnO3FJkB+tpzhDMGIWnPvF+mjN1kim8ikRIHoWnqcYyH?=
 =?us-ascii?Q?Qg5OT5tyO3rNIU65QueKxOLI5Zo/ISwkzlCJT0QaXoFt9SEkofdjjCRFw/iY?=
 =?us-ascii?Q?Z60KnpEOwTJyFLYo3kbWhLKcFfZyjB+tz5aGbkzshXV73eB/RKFD02gE7e4a?=
 =?us-ascii?Q?kupuXqbCfpG7Ez/gktZyFazsMrcC/Om2ekGPqffQ6kFTg8SODAteCbK9gtHZ?=
 =?us-ascii?Q?PffdkLmJ5F4hlsYTDYOxtySpcBWc54vcgH0XD1WPG6mlsZkuAlcqfiLvZqox?=
 =?us-ascii?Q?cM59moQANm65dXPcIpwdxiZqWpCHreY6KCxiNvZ5ZugKg0oGi28PuR4o5lXK?=
 =?us-ascii?Q?yZlHmhCSTOFELAoYViYBRWCss6WyvBB6R88O7uAWKV1/ZYD47onkJVO28i0Q?=
 =?us-ascii?Q?8RzpVepp+vBlB9gvXnf3barvb8JuRSBRrDNbxa6oEv2LLAdW5T1Rg1utYSm6?=
 =?us-ascii?Q?Ln233wXqAS18BUcdZxHxJvuUtWO8B/6iYewZSSlqufr/LUCtzIY89rdi5X69?=
 =?us-ascii?Q?AvpB/fN/Ostzogtx5fCHg3DLZ+MBtJfHQIA3pThx74ht/ArGX8dvcntfTUs5?=
 =?us-ascii?Q?aCYVK4i01yoRlmoYfJ3gfkvKuh5datfkwaWMFUOUiP2gi050sTqfXXuxyzJo?=
 =?us-ascii?Q?9qAsFS3DcWft/ConBGY/lP1g97A60bhfliMb8Mv2BTMCoPkhbo2i6M+k13f6?=
 =?us-ascii?Q?Fae5QJkPDqRk6udCM9ZWYxbRtWCZohZ9Zg6pjUnxt40QE9dgIhAjusd12dJY?=
 =?us-ascii?Q?jO/2lCi0h8AXRw0c/UVKCdlBTipjm5c4WWznMnD3YSnhIEyzfRf4ZCN4FFDZ?=
 =?us-ascii?Q?HGoUM9ewz0KBJA1XUZc3c+x8vBDo8aZwjl7pDDEtAKQZRNmk/l9Vjh9Z1ZRd?=
 =?us-ascii?Q?y9ycCS7lg4A2dw+K4Kr/Q1M=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18828421-41c3-40c4-d6ff-08dc0bf2e64f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 00:28:25.6310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jphIyjIOy1FcVqYWzzeunHNxU+M1RGPTJtfmIcbJ1guwXlzZriGVQCcMPZIN2Ix5qQxpSH0O+E0quiQJJGpCtJA+a7gnQjHj1JA+ymV6fA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6346
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HTlRBurPU3+xlPT/D6gsD57y7hNx4QvLUh51g/UFTQ=;
 b=cg5VgmsZVSnVLpwaJcSzp2nex+Mfx6gDHWZ9WHbnGEhPJsYIA9TgpR9TBVcTbn5rCXAIc66fjIiA11J2+HMmo0v0q1gksL3M8wPQcNlkdY7+uwUurtcVq0aOxcVHuBAWmeN3UwlElCYYHTpZwVOYz3VKUxNBzYy/zKzvmh0jW/I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=cg5VgmsZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [RFC v2 2/3] support/testing/run-tests: run tests from
 temp directory
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building with the BR2_EXTERNAL environment variable set, it becomes
desirable to have a place where tests from buildroot as well as
externals can live together.

In lieu of having two branches - one where tests are run internally and
one where they're copied to a temp directory - utilize a temp directory
for running all tests.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---

v2: New patch

---
 support/testing/run-tests | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 9d1174cb3b..dedb487ffd 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -3,6 +3,8 @@ import argparse
 import multiprocessing
 import os
 import sys
+import tempfile
+import shutil
 
 import nose2
 
@@ -40,7 +42,11 @@ def main():
     args = parser.parse_args()
 
     script_path = os.path.realpath(__file__)
-    test_dir = os.path.dirname(script_path)
+    script_dir = os.path.dirname(script_path)
+
+    temp_dir = tempfile.TemporaryDirectory()
+    shutil.copytree(script_dir, temp_dir.name, dirs_exist_ok=True)
+    test_dir = temp_dir.name
 
     try:
         if args.stdout:
@@ -132,8 +138,7 @@ def main():
         nose2.discover(argv=nose2_args)
 
     finally:
-        # Placeholder for try, to be undone shortly
-        pass
+        shutil.rmtree(temp_dir.name)
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
