Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73447C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 13:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 121F6821B4;
	Sun, 11 Feb 2024 13:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oBySs1VWDvBt; Sun, 11 Feb 2024 13:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 298E482244
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 298E482244;
	Sun, 11 Feb 2024 13:17:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7601BF301
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 13:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67A0340176
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 13:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZB2FtX_6VTBi for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 13:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::700;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=sen@phobosdpl.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E092640106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E092640106
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::700])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E092640106
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 13:17:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKbYaQ500COrm2JbONrvhHL9GyBLhDcLyjtxDlA/x6mTTAA3jOgwi434XGltMaxk7VQm82tbqvx94pm4h+J9sMSEROkNtD9ns8pwaiFZOhTT2mAmJ8viu257gx2V05fbBrCA2z3yshfIrVz3/sHdI6ggufMQJ9MhkW17hp62EY68eT/rZyA8Grbg+EfAj95xTo5713zRjYUDloMjrJflit6fl6XpBeHnu0/wVc6ce2JtUT3cMeF9GM7T/Ssy4viR6LPLxc0Ig/x6a3sMpLmInlTjpqJij7q5cbeQpov2nOib/xuAl8aYezj9BuhvmUFR6+PyoQqFEeyNF34ToB+2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCkb99u3iTXTAX3MuTTPA5JiINEGiF88EPFQSatw65A=;
 b=f17Jq9xns9vGO7T8eVzGc8tlk3HjtkT/aiyzdY7J5IiGmReO8jKwCtZcegIlcpA01vtwiVF1eoGfRJZPcXSbUWAWFULayXcpmjVAquDcpXDKbfGVdTiJZpc6u2MBmMaXcaeUxs6Lg1vSUgFk7CpieuGDQCcF7HHql2869zIYneXHoxk1A6PT9torbvFXbi6+r7ViPsidZ4F7K8lhHVPxAdi8jhL47p+Blekdz6zkVnxhHjPV8dcqFw2yo4kNsmRQekWzj3XtA+v4spzVYjRulUPFwEKG9sUs8ZClLUWZTt7ma9x6OLBfSvXjxGPYAQtWM1Xm4CPQONRexZMfORCvJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from SA1PR17MB4562.namprd17.prod.outlook.com (2603:10b6:806:191::17)
 by MW4PR17MB4420.namprd17.prod.outlook.com (2603:10b6:303:78::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Sun, 11 Feb
 2024 13:17:27 +0000
Received: from SA1PR17MB4562.namprd17.prod.outlook.com
 ([fe80::d6d2:2149:7e07:cbe9]) by SA1PR17MB4562.namprd17.prod.outlook.com
 ([fe80::d6d2:2149:7e07:cbe9%7]) with mapi id 15.20.7270.025; Sun, 11 Feb 2024
 13:17:27 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 13:16:35 +0000
Message-Id: <20240211131635.152044-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: LO6P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::10) To SA1PR17MB4562.namprd17.prod.outlook.com
 (2603:10b6:806:191::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR17MB4562:EE_|MW4PR17MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4f984f-1a77-4f6c-1332-08dc2b03cb0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 50qTU/SJqkY1NmcUFLcOuvXECYWkh8phR/sddR1cPnY3VIzAypHWcp49JTmC/cR0rCqkMPc4HgOFTFXNwADop9yXvFgmiwSWoSy2oA3e7PoP4+xu0xxEK37p/wpqahX0+FdhiXBqGvJiwzwtA3aFrV/+Mc9BSJ8enf/mmAWWnoaj5X4nKp7S9Qw+77YPgLbPFEOXQUcIUpZs8M1BNzLvPlKH7VvaxpZXplLs32mTUrycBAAxQuTMNil/VameSaMfG+Prnva+aXcVTs6GMvAXQMAVk+o4Dfv4JBKEKWfF9rsFnXlIlnkq02Rp6vd0NXtkIdx8v2rUcIVrHMbHt7USO9o6/lYWPs7iYE/8QcDy2utlBpHrNY4fBjB7/SOyGUkLVwFxdsqUKCEBfvsknb1O6oTJczsyZ2SIaU04P4EGZCrcHzMkNRNTZJTDu3dkdHoObeZlWbNjF2nVQxS43BWTY0aVn2iTcqRGuh50fSDyEs9oxxNDHDyaxp00iO2h2prl9aPwfH5+BXz8MdDCwZCtRkv3CJJXvNyb7oynMtEG8L5wtdrdYCb13+wEmzAzMHS3Av2L9WvbO1YhO0cOS0bCwzRLoNogBYnC98xxisY180xFghmGqztcNpX5ma58GmQ3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR17MB4562.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(39830400003)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(4744005)(8936002)(4326008)(8676002)(5660300002)(83380400001)(2616005)(26005)(1076003)(107886003)(38100700002)(36756003)(86362001)(38350700005)(6916009)(66556008)(66476007)(316002)(66946007)(6506007)(52116002)(6666004)(6512007)(478600001)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dXW30EkYEahGEuvWE2LQiysrlthj3Eqeoi7hF/zsNK19JB/I+J6J3bhnB7ap?=
 =?us-ascii?Q?LSvjKC/BGmMrBAOfTYiNejlvAB6Rct/xM0ewX7+CeGwM6uwLUItVnMJpmabU?=
 =?us-ascii?Q?SuLI3tNTknXBD0lByzfIFesPWZJZz79UFoKgYYRRTQLFvrPmOd5Rj28+WpiM?=
 =?us-ascii?Q?Cgt7lZSYoDYEf2tuYNmdY7trEeyaTTUz2Trv8IkCZ9BKWhXMaZyGw4rh27GJ?=
 =?us-ascii?Q?le2yuZRySboeSRuDOXjOoG4eCZT/yY1z36SXtPKXHQozbrWHanhDTOmR5Flt?=
 =?us-ascii?Q?D24wSP14MbfK105cDlexWfaz7zjjP9ugdPbRLH8ybPRDFU3ZJQcyM6+2C4T9?=
 =?us-ascii?Q?wzrTvblScneorumK+xYn67inT77qtmnbSbJJu9ZfVo6e2/1CrmEUgEKgg2Cu?=
 =?us-ascii?Q?7nrX8OvkF5ZM1txwld+DaJaJJoD3ood3G8BvICQrpuCy6hbSJdWkZ1dlj0j8?=
 =?us-ascii?Q?zEKhu9MSoAcOSETN1bfxCnMhs4xMFBtD3TXUa/fgE1NcFYmEepSB+y+t6hcu?=
 =?us-ascii?Q?jUjbv8yRa1pppn/smIiaaeSfsuYZP2ETc8y1cHKuSwZ5Dj8K8vsTMNf5Sr2d?=
 =?us-ascii?Q?h9M3mJnQDQkvigCDDVAoU+GGXLSi42zyn1iMBzQle/iFpkypwQ7H9SXsumDP?=
 =?us-ascii?Q?Y7QkhvCfBZ7IsMnuAwXQ9JbHl0HHQ1tpggInBz+I0jCg2LU5LGSRFrtnQsBq?=
 =?us-ascii?Q?ci4xfFf15rfC30Zum9xJjoO5E99ne8LAa9Hc6eAaGGeb7Zt7PUNGp4/vYMmZ?=
 =?us-ascii?Q?XMwVx16GekjNb8eTVoacfk62q2bi4tkPTI2JsLMqdDnNFpnV5uyxryT5NWQH?=
 =?us-ascii?Q?dnaWyBfnpFKl8YXqxMMIob9BSpuFyXZHmhk6aANWWazwpxhUB8aAL7omFKhk?=
 =?us-ascii?Q?5/NOS2FqDEadv1S/t2DC/hPuKMjEyIk+v7RxbOXKX0sT39MU8YTsqCQQ0YcX?=
 =?us-ascii?Q?K5qVe9cb/l/C/NJ4tfnWI+x43v+d273zihb2qaJFasKbN4kk78uOKVoM/Vcr?=
 =?us-ascii?Q?FbcqK8b2x47SNBLxU6PLYiA1kF9wqSNSGUK12fC+MUqwesn0v8ee1ontiuds?=
 =?us-ascii?Q?H2uU7LNZdzCES6rYuPs5HJexCELGnzOvGNbpmx0KEeGqMZVlbvX/7z8+pSTO?=
 =?us-ascii?Q?3cPASpJ0Ow+zG96KNkEXeYpxgpkTIPepwPnFWW2fMQ5BAycqEKk3Edr3bXiI?=
 =?us-ascii?Q?3RN5U3UR78fa/fSLKU+SsiVbJWx+c0GRROs7h3Xi+sX+UCjvZSa9F3kWhHMb?=
 =?us-ascii?Q?u+oxmKOhiDc06IUxmN/H3hSm3UHngxe5ZRnSXj86pccD+Oke1UVeylh+tpbt?=
 =?us-ascii?Q?gNgNVgYbdh/re2LcawJjOqDtR45QoKOksdL6NStxUUumES9x4pdIMpZe9AI+?=
 =?us-ascii?Q?FlnO5WeYvf4FcaZDf0rTllf04JUfMHZ2YtyBKsyXfw1OBg6BsOBS17QH71sf?=
 =?us-ascii?Q?KZblsN3Qm8JH/TTkONIc9f69LUxfo7+xThK4M4OBC9m5+mc93WYcsP5Lj51f?=
 =?us-ascii?Q?QosQ6LVs1e039jaYETqeFTF2N5Jcz0kAPZerR+TJ+14BEO7+FmRsANzF9nmb?=
 =?us-ascii?Q?px71WJ0RBEe9uuh8S9pfgPxSfcU+ouxbJEBOdvaS?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4f984f-1a77-4f6c-1332-08dc2b03cb0d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR17MB4562.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2024 13:17:27.3433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZ17DdsO6XfSGVPbDLpwQWc/wxy94v1FPlAq+LeASjNmiC7NOtLxuf4W27ZVvTKg5amxcO1/o6RQbB672NdfJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB4420
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCkb99u3iTXTAX3MuTTPA5JiINEGiF88EPFQSatw65A=;
 b=3FRqK8fQGmw4Nv3hGsVBuIubkp6EZ08jOJZ02Z/NwdeCVThtaW1H8u8dIbFtOr1lJ0Zu7rj1uapiCvIO2L3uuj7901IbNRLPnP/uRTInm1vPvHU+Wt1fqOSBbT9/9K+NHdPZZ86fip2GApQBS+LP1A8JEMjJCD2RfWaKVECJfD0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=phobosdpl.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=centc.onmicrosoft.com header.i=@centc.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-centc-onmicrosoft-com
 header.b=3FRqK8fQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 1/1] update sen hastings email in DEVELOPERS file
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
Cc: Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

phobosdpl is an old work email I don't really use anymore,
so I'm changing it to my personal email.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c6c84b05b..1c035eeb8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2765,7 +2765,7 @@ F:	package/libbson/
 F:	package/lua-resty-http/
 F:	package/mpir/
 
-N:	Sen Hastings <sen@phobosdpl.com>
+N:	Sen Hastings <sen@hastings.org>
 F:	package/systemd
 F:	support/scripts/pkg-stats
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
