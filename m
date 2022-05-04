Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EF2C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 09:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BBE741858;
	Wed,  4 May 2022 09:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSHKA4ds5vhw; Wed,  4 May 2022 09:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2712641815;
	Wed,  4 May 2022 09:40:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E35461BF239
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF928404C9
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5E8IbL0c1gy for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 09:40:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::71c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED648404A6
 for <buildroot@buildroot.org>; Wed,  4 May 2022 09:40:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NThUUBIL0Cp+I5BtCfSnV7zyIv9GRuMu/Gq66naEpG4+HVhUWfYk92tkjhQqF0B61yi6vaVHa8enq8GY/x2WSvAmpALjTO8mm+MEufUOLGyjo4DpJHrCewyfow2djGvShvgokxzySs6QOIYa99lJXVN/bRx8qmPYVcV1wct3ie9NytbqfpC/KKkf06aq90J+APPbrh/H0qtpr92KVu0qkgP2D/CEyk2e8jCDtQkY/kbAg6lMN+Vmw6ppM/CADSegkgBCKbFMaqG/clhCGU8yeL22DUi3X/p4tURbL6UT9UOXLnAua3Ge/tpJS8JChKflY194HG4GqwKRqUUPODuGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQKr8juB/PNyk6o1iJg3lEDit2AFGnCQPrm+NCxdulc=;
 b=jwOUhaYOfk5Ur0l9eg9Gy5qztDSsAwwq9seaWqbqNrWU12n7onaVA4f9FuUdHktFFrGzwzxdd6L8naOwOFcBAHeSKLVkgaVrdW8YxBE4Px4K5sjzk00S5eHcyS8EJOhf22xk07LFMWQjUAVPHgfmkwttckUlGi3cL0iskyBYqsD9DuTrK5JS4H/IBhE2fiEufqhUuic3W9yRlnvYt5PubE0oEhyNQP9iTsBn/phay3C14Pw5xeI08KzF2MpktnHIxC2/6rDu/ZajPvFgX4m71EgaHx2tE4lzX9eYX45EGGX5G4FEz/Zg5zVWtqDz3FGqz55OV6vpLCCec2ME+Z1tLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=borea-dental.com; dmarc=pass action=none
 header.from=borea-dental.com; dkim=pass header.d=borea-dental.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=borea-dental.com;
Received: from MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::22)
 by PAZP264MB3071.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 09:40:23 +0000
Received: from MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM
 ([fe80::914:bc08:423d:69ae]) by MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM
 ([fe80::914:bc08:423d:69ae%6]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 09:40:23 +0000
From: Leger Charlie <c.leger@borea-dental.com>
To: buildroot@buildroot.org
Date: Wed,  4 May 2022 11:40:06 +0200
Message-Id: <20220504094006.1541643-1-c.leger@borea-dental.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: PR3PR09CA0004.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::9) To MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb22c995-b878-4f31-be30-08da2db21c5a
X-MS-TrafficTypeDiagnostic: PAZP264MB3071:EE_
X-Microsoft-Antispam-PRVS: <PAZP264MB307143625D8D2A5BDB0F27A6C1C39@PAZP264MB3071.FRAP264.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yga4u7gUs7kSf3rn/xQS5nC3QAsvgTmXqeKkM96nn2ynPAqUp2Gr7rex6G1BmKwk5wb7w849YrrZ7hQ02v1YvPqacpo3rQasy8hDB1xGtnSSTZepOF5DXFJGLZl7wwpMBz80j05Vh5eo1fBPBwjiSCEGnvHRnz083itPC9xFIQB2rt4xKgtW9Z+pFJplW0T10E4zNv8g+p3paBucfbnuD71nQKQIkLWNhIDkG00zn8X9cNZnJehHuWph3IFtmD+gUGz8DzDaYBX+CrAIfyFyFRAJ1ADPW0ONagjbfroNyCsfYy8670RJjd0ALD9BCAINs+x/nzDtNt8mh2sdKeKb6u3dLPS06xTZCm1STjO08LrJ/rsCHnzS9BC4udyW+16mLGULIIO8yv+uC4//uirW/2Ccthd9hQTeqxaDtrVXDH2lPWKNXr2mV45znk+9+6LwVzE/HSiDCUSSp15neENR/FaDQ+0in7D5Uzs4DUU47l7ZDvJjIbQ22XGRCDg8S3cUQ1NsC0tWNaXisImoLoymzlLBHlHX2ex48E3q9oJn5FcOkB67ffe2qIEFctx7eok4sKAlYVANNahwfJOLg4W5hVGaajzLk+idfGrJCn+LnuflIpXjys6i8dOYRNH7Zt+zYJF69EL2PA6E5KzxppwJwppXwzhJJMlvfH8ceANhlbeHEO1I2GJTQK9TMZ5odvSCCKe7Q+HkgRC23plWfurtFVlqPErN8OhoPa1phugyQME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(39830400003)(346002)(376002)(366004)(136003)(396003)(36756003)(4326008)(2906002)(66476007)(66946007)(66556008)(8676002)(6666004)(6512007)(6506007)(316002)(6486002)(6916009)(1076003)(107886003)(86362001)(966005)(186003)(38100700002)(8936002)(508600001)(52116002)(5660300002)(4744005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/RfP0KML7l5CRz6/pQnEe8nt8CJPXk0CNNwQCrTdNVm2LVNYTAcq10w7oSjz?=
 =?us-ascii?Q?Ntc6JYwy8kh7oNQswYajbDFqSef1WVhwKTrQ+ijKcxeGKZaT9XNG0GlQKqiA?=
 =?us-ascii?Q?sl/DKiPoNdToAo+QDH/+b9Q+gDoVsn0L3fnkmBH8b9t6ZzLqubu1zeBXDY4L?=
 =?us-ascii?Q?iYjPR+ywgVVcEKnC8Au5hk6QfaMnDR4nV191k7WKs4DAdTNGhp3d7yWNDjyO?=
 =?us-ascii?Q?jJ+hj1L/w0xLfAn2ji6H/+4VSBUgDiyeMBIvpLPggIzcgDU6Hjk1HU76Kre9?=
 =?us-ascii?Q?A83X/dZPTLh/UT4w7qcI4NWICgDX+S2cvJbDxfXFXBJZ5lKrpuF3SscLLxro?=
 =?us-ascii?Q?+mG4kbtdM6gZi38eSLhDIjH6kNmgDMkMOiv1dV29wgEffl+ljoHUKi5f4y5+?=
 =?us-ascii?Q?8T5DL1FeDcnanO7tKN8aJrot7witpwX7LnhR57aeTjGCQkwuleAE8Vow+Hks?=
 =?us-ascii?Q?XjV/TqQvRVY6AxpqPY0vEVB9L5wr/sbB8WcqC+uNBexxQqk/SYNqMOGK6xCO?=
 =?us-ascii?Q?baUAC5ngaG7NVigElzP2noW3Qw+zD2Px8L5EVerv3ZSiaDSPtcepl5+xrtsu?=
 =?us-ascii?Q?73dTbkJV59QS5fQDtRf9702IJtFYj9yVWv3d3x48jWhvO2szAIrZauYCLlqG?=
 =?us-ascii?Q?OVfT1UhBL/FQdM+M/e++bbWN8y7dSEIDqTH5wRPF5+NyPaU0JQEDTRzoan7g?=
 =?us-ascii?Q?++i0WCXb8hnv41RPRCRVIUTQOQYRl1HazXAJLsZ/LIOBhkIbbGMtX/8In0Rm?=
 =?us-ascii?Q?3iUHK4XSVXzt5/KnfeROBNibu3xepWYV/ysB3prMNHa1cwvsD8w9pCx65ccj?=
 =?us-ascii?Q?1dAYrw8ey247ZBiWCjprICxvEaR+a3bvkFeqdFng8gfXMDViZbedxgzrUwHT?=
 =?us-ascii?Q?Qf38d1odL3cT3k01IWWVzPRd+Ihl0+S2Er5KermZ3377TqRXGvDWEQ9cKSej?=
 =?us-ascii?Q?jCZyseb97wouKmHN0jFNmJQ/1lR1Dr4zeRGeJtDUQWrpbGuP+pVtjj7zQ8I0?=
 =?us-ascii?Q?6qDk0IfyfHLkuC5HD0s2JJuT6/7RkRrVMK34EIOQESKKmSw5U2uH9gbeeScl?=
 =?us-ascii?Q?BYVUs6X5+cqe1UNCAq8iKyrXpFPGOAL/iFPcRZ8peO3nU/TtoROBKGxSiIjK?=
 =?us-ascii?Q?6J9E5BeJmeGoN280aFRTuzGRy+6vmqOru51oxHWEneczUGAlyjcE4etS1HTT?=
 =?us-ascii?Q?z0oBYTihYsAsTL/OK7Un5tEJhULrl7/o5l/+8q/v2vm5H6W6MHuedDTt7etr?=
 =?us-ascii?Q?CZvH9aOOJeWs75do5D5LQeCfy6Dc2EZjj6aYr7SI6ebkjdgjdGdW0A8J67yH?=
 =?us-ascii?Q?CFw99Aomus35H6e0qiH7SviD+EzoC2dR5bq/8rH5/OCKWkMHZPkn7pR/oBgs?=
 =?us-ascii?Q?aQjt/yOqv8snc7OxLIQYobZR8nDc0KMGQCMUZkPIk99dcxbsBP6TvdZGX3Hq?=
 =?us-ascii?Q?f8dWCh9sm9jY05Key1Du3YlmLHFNj/6C9RplMi1+CZagP7+VfkG6bTuuWHu1?=
 =?us-ascii?Q?jw+qeBDz/uSvCH/u6oKyyzGmbUF4kWfKh/k3csa8RZEP0nelkWJv9oZygwdk?=
 =?us-ascii?Q?zHaRyhj0kJTKJOeoFe0jSAOjCvC1VfbjVXHMoZalCIp7Ek31HKUOQM4Jg5nt?=
 =?us-ascii?Q?cxtp4A5WBk+UE33SuK/648hJxclKGiT1QmzhfxZAc8C1G8OdzzX82dEmZyIa?=
 =?us-ascii?Q?cqMitd/oCIA9H8E07YK6Ig9OaZCwYg2JKZ9qS38p0Ap36bGXwNgPlOrDk4ml?=
 =?us-ascii?Q?ChP6wPS48gNPSh0PwxZUZgAD3Ydm2Rp6Smbu8YdRdFugcKbkA7sQy3ppeHBZ?=
X-MS-Exchange-AntiSpam-MessageData-1: hEe1/RYlbunwNaUoWHm/IgARN6uwYA+rHGE=
X-OriginatorOrg: borea-dental.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb22c995-b878-4f31-be30-08da2db21c5a
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2698.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 09:40:23.1046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43aede4d-89da-4f78-a51f-69f6b16d8910
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpAx1LYVhgILV1d9HRYefbclokOb+97xLy/k2meGKcvuTBFg7fAqapj2a0ZT8asdrrPB2YS8szMA9uxvBqONBE+dfa+JV/YrjywTlZ9eJEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3071
Subject: [Buildroot] [PATCH 1/1] linux:linux.mk: Add "firmware-imx"
 dependency if needed
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
Cc: Leger Charlie <c.leger@borea-dental.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since SDMA firmwares for imx[6,7,8] are now provided only by firmware-imx package and not linux-firmware package [1].
Linux build can failed if depending on firmware imx, so add firmware-imx dependency on linux if package is checked.

[1] http://lists.busybox.net/pipermail/buildroot/2021-January/603807.html

Signed-off-by: Leger Charlie <c.leger@borea-dental.com>
---
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7ff7b05042..e40672ceca 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -73,6 +73,7 @@ LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES = host-kmod \
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
 	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
+	$(if $(BR2_PACKAGE_FREESCALE_IMX),firmware-imx) \
 	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
