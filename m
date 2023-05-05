Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737C2C77B7F
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 04:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A83460F08;
	Fri,  5 May 2023 04:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A83460F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17OjCcojXRDZ; Fri,  5 May 2023 04:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0250860F14;
	Fri,  5 May 2023 04:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0250860F14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0283B1BF39F
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 04:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D432383EF2
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 04:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D432383EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ql8Et5XPHNZ0 for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 04:30:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0607C83F05
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn20820.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::820])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0607C83F05
 for <buildroot@buildroot.org>; Fri,  5 May 2023 04:30:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKSaJAf3fTFLdmbXiiRwzPzdAVssF2hKisjV3zgoTDkKzIxLl0cUv63hbP7Suyes0SXJtqdTsPZdpYmIFvCWAenZQFt3f5flvr6h5KALx2kHgddi8amPs0rnw9vfLt/yx8t7mNlmnKYVDWCo/oItVhNymyfpfRWyeDOlhuAet/xkxz7o/N0fXOcdEvOTvM6vIRxIOV4/Pb0Y5NsAHNXDMcefmrspSvhU2bqS7pNlOXuJPe27bHWtdwum7pMpU3ZFvbs6f2n46U6/dtOkGLvBTT0cMyBHvCXlQH1RPsKOu0txXn2zUosSVkmoXtn7pLIhIVuicwZUNRWX8JC5pW8RVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kAk1lyRuWF8g9ZiPLXsqUrklbfnXCTZUCfjKUN3czk=;
 b=UcLBC4qFn1ABMaFLM/ZSGKLmp782QPjXeoXTfSeb2+QfzCfr+5B1s/vMXhCxsr22clib1ixoyOmMiCxdwzaJIKY431FMwz4/njRbmFsRW56e4lg3XpdHk1zldKMqxdicKQmF3y+A1iyQEV2SyHL7nzr+vENZvb+XqrobV4N01MofyI60/5lA1q0g+GQ6wn6fAGslJTFEi1OXsFkILJoCsxZHoTrj3awsMKdJE+LZo14z0M53xNP4AbRoj2VyS6GoNQkKi1XmNI9ufswk2/1DkXSuOLIge50gms5VMoUcd1OYUUiXpc1u/oBNXTbw9BzPdPXHfHS4FC7Idzz0jESF8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SJ0P221MB0739.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:3e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 04:30:41 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6363.022; Fri, 5 May 2023
 04:30:41 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Fri,  5 May 2023 00:30:02 -0400
Message-ID: <SN4P221MB06825C5F564A59CA4DE16C09A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20230505043002.1956-1-james.d.knight@live.com>
References: <20230505043002.1956-1-james.d.knight@live.com>
X-TMN: [C4vZEomrLr4wH0tq3zifRD/+rk4stScw]
X-ClientProxiedBy: YQBPR0101CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::22) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230505043002.1956-2-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SJ0P221MB0739:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca2c91b-ddf4-4d9e-5785-08db4d217c0c
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvtSuoynPzOBnq86nziGpphYW/xHmrUUnuxdKcSAhxZqgnWC03JKx/AGGL3fooK+3hvoQxdRJCkgOE74tHLZbB0YMD9omtQifA3bzCh1lHn/NkTxF3KJIN9YMto09OBDOuWkfaLpIrQip1EC1xL9QBYrJuIQxmhFyltVO34cKB+fc9BostrnnmRbC1XZkImSvJtZ0dOHv7TufyZbq3Kco/yW+5zIVJ+SzYKkU+1q0+bqkTkCxDQ3c0fOXHuohIzoI2f7KQRVcwdEr4/WH4TnEWlX0Yj4urB4XGEL3rSNxowJaMGDw/QdMBX72oGTW/2kMVLa10a309G1ZlcoNNw/RRsVQiWyoDMZraiH7/01MgOuivr/Oal3gijPg/2ajm35ucVGS45hPGzV9H27u8T4u0TMtDfGd7by4YZOQKYK2Jj0vKSYj/dVRhwgrTLHxJHySjkBfe7vz53izBSmYYZsq2Qf61+7ypMOFsMGomoPwHrGkaSvzZdAak38dUX1HT6sFHynbRdvKrj9+QwP8HjK9a+7XPl9tuaKEYQzzgy7f3gR3gAVvivb3gk4DIgcdYDhkNJI2kPDoi1OTdOvtYHxKfpl0cAgdKiq+FKOIgrsVxm6NAA2Z7IYWH5PA1vUIImsBCyZcKwZLjrLSzpiMss/0ol7Q+CdWbI7hTJmqMYXKqxJwul38xmfXFnlXJXTVn7KLtmrxwjTsNfMTtSqfz8nqHp8dZxxAcMNsGyilqilZkSLQoZ7DL5JwgbMN55yhiWWMYY=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 21UEVuyg9QtBuNZHzxyW/QE/vV4qKCeWaSvaQY2c12fu0Pw4lazWjEPQisA/mSRLkE1cBTs/JTgKBHi3P3pE9n4wSf5+d/dHt17qdiEXA/GTVgmVDfyXuETLZSPDC25wX0x0UaOtv+0HhMkDEyiBaEemvUdASI7pg/618Pa+c6W0JzExkO67oJSyKTXi4k8aW/DL6M3+IKeeCO42/YqI5qPOWWW0K4liH5pirV924iVeTm9ZPF4dmVi7fPSEHmQXKXLcBDyxmMsxjZmK2xJAJrOZSpgDmWBMlLrMjkvT6KdrBqY9i6H3mifCrHaXd/hwIQXYhl4rrXmE5oPYDgJUpHFMYvbt6DV5wTIl1aXAvcBT9CIFqwuQAtKZG4YkMzPgzHV9eUmi9HCHn1wECKFkmOhQJsqUvYFIgnfMMLlmpLkqSMmP9p5q5w0Z0wDpjW2lgLU3fcI0ZwvkW4MmedFUAR3eY/sjme5TO+sE1g1/sFsxv4JPPD2WH4BzAu2Ppqkyy7NdN2PMn9FJAnlHETUPJ+/Z+8H+cQ/adjlSr6n+8x0R5kAeFRWEWJt+Q8/4FYR2ls0HuH6Aal0Gch/wLWIteqVBlXVAo25A4OjLynAK6ziKjssx41z05a1EXGEEWysj
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7feZ4Ae0RC8e9o2kOCV4to2hbze8MTjsnqyl3KhHh8LobPGcPFueq387liT1?=
 =?us-ascii?Q?AYIezg05SqW9lWj7tHkyS2ZrZyoPreY+uzVt9BKAgvFcjz0cTX1smFyBnGA3?=
 =?us-ascii?Q?wl8uj+DE6MKC5yKBxF6mVdMdSNUfcguFqGh4SXSnVhgDOXqdFG+Dz8MYocwG?=
 =?us-ascii?Q?WmHMZknoHLpKUTJVr53XQh1QMHSIH5927cf2+XvclyOoL+TCPxBw2O1G6+eo?=
 =?us-ascii?Q?GBcYwf4VS+kR1IIgLm8VbZio4BaUVsTuN4HbBaoWav5sosfHHspspi8vUF/3?=
 =?us-ascii?Q?TBxoczLTNQ9LzChk9jNuALTW7mkVo/nV7Sr6I7EF2mZ6st6Nbs+AE/fpHJMX?=
 =?us-ascii?Q?lRqk/F1iPEl/3fQLqIyMdei+OQ6ORlGtla9M8BtMK58eczlZekXBfX9AgqXu?=
 =?us-ascii?Q?035DbMu54NeQA9Yx1M7f8m3i9n6kNvPiS5TZjkd/lKNF87Vv5+OynIx8hnL1?=
 =?us-ascii?Q?dBODDVR8VnX83310MnOzBqqiLCBYTjB06Uirm0npu2OAsEccxZ20YGnmUTRE?=
 =?us-ascii?Q?aY6VtW4IpCrsj5u7QJsrGZE7tC65N/jVi0plAiNCdp4Qai3SsuQrSZr6KNIV?=
 =?us-ascii?Q?HaYcwhU63pwoRMJ/FJcI+izCLeavUea9Unqn6C+gjdOvnI1uQ6KsCQy10yiC?=
 =?us-ascii?Q?qETlLPN56AkEQC227FHb6uxiHy1ir/NrWEugu041krxKunRUHK+gR2l2eNkm?=
 =?us-ascii?Q?jsXMgLxjIWPlFzJgo8obnvSZgVUDHojzpVkJBTv+vtGk6chFjb94Py9Owo++?=
 =?us-ascii?Q?zhQkzLmGEFYmHPWFiVIRAtDtrN33LGs8BAKYb9RaJz3HJHBNieabRYWboTGZ?=
 =?us-ascii?Q?eH6eUynxAFR55S65J6RVFnJZZXAIi8rQjM8JQ60eV4mt+4gT9ort+YQnCgj+?=
 =?us-ascii?Q?oxpa12xnBgPA0jxwnHHi68U3hla4EveUO4vgy0/O/E9mpBcq7NZ5FoZSq8vi?=
 =?us-ascii?Q?Hq0xjocs98o3reb6aRMjLjxsRGFB9Jxi2D8XhILaQn4tZgyZ0opSU92NOITR?=
 =?us-ascii?Q?XLRltM4+DcFPkUIUnNhpptHxA1yXnZQEllmnCGXBNdk5hTkf0/2UCQH0Y/Rz?=
 =?us-ascii?Q?C5cpca5ovQMXzbS8FvIK+L5jBNYzSpBiKCVEieZkg79onizSaLjMBPvOe9SR?=
 =?us-ascii?Q?TjG05KnhZ19svgacwRH/ARl0Lf/CRBWIr+SM3IIby2tcviB6ivan6binzIkP?=
 =?us-ascii?Q?lqLba1Sj2cqCS84c7wzkH778sJ56v/SI2Zc1OzD6m+wSY0L2m64DEJuZRm4?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca2c91b-ddf4-4d9e-5785-08db4d217c0c
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 04:30:41.8798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0P221MB0739
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kAk1lyRuWF8g9ZiPLXsqUrklbfnXCTZUCfjKUN3czk=;
 b=doQtnL41jTg9O98pr/H+sKL3Y11JKPWiGEILIA6wB95FpW3LhejY+AM6hkgs2iyvW5b7fpRjyLzUYvIDz6anvFkmvKJXune8XoSv4qBDjvKobPQ72rtET+5VJYKZwR1H1MmaKjjkPfkZgtVrYWRPJ9XSAH4uxhSRsMSo7I98GHnLYvPr0CZ9o0kE6dlcIGv0t+zVSJese8DZ/0s7XxQQRVCIi8jR00oDDf1n8l9goYsdYIlYeOqjoZ8SthQCNAXMeCGpOWSZah/31c7sT0jmv/RK8eaZ5v5SoBqf+Ly7EgABiLu/M3uZLdNVai4Y4CitKhIqcwYXRv04qEp1x8CigQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=doQtnL41
Subject: [Buildroot] [PATCH 2/2] package/skeleton-init-systemd: flexible
 reinstalls
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following commit tweaks the `skeleton-init-systemd` package to
gracefully handle if a user invokes a reinstall for the package (e.g.
when performing development tweaks to the initial skeleton).

Signed-off-by: James Knight <james.d.knight@live.com>
---
Only a suggestion; feel free to drop.
---
 .../skeleton-init-systemd.mk                   | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index 4076821c0c0429cf90681f4b16be114c44bde282..18ae91f2eea30277805ee82791c62d53f24dca1e 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -18,13 +18,23 @@ SKELETON_INIT_SYSTEMD_PROVIDES = skeleton
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 
 define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
-	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
+	if ! grep -q "/dev/root" $(TARGET_DIR)/etc/fstab; then \
+		echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab; \
+	else \
+		sed -i "s|/dev/root.*|/dev/root / auto rw 0 1|g" \
+			$(TARGET_DIR)/etc/fstab; \
+	fi
 endef
 
 else
 
 define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
-	echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
+	if ! grep -q "/dev/root" $(TARGET_DIR)/etc/fstab; then \
+		echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab; \
+	else \
+		sed -i "s|/dev/root.*|/dev/root / auto ro 0 1|g" \
+			$(TARGET_DIR)/etc/fstab; \
+	fi
 endef
 
 # On a R/O rootfs, /var is a tmpfs filesystem. So, at build time, we
@@ -78,9 +88,9 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/home
 	mkdir -p $(TARGET_DIR)/srv
 	mkdir -p $(TARGET_DIR)/var
-	ln -s ../run $(TARGET_DIR)/var/run
+	ln -sf ../run $(TARGET_DIR)/var/run
 	# prevent install scripts to create var/lock as directory
-	ln -s ../run/lock $(TARGET_DIR)/var/lock
+	ln -sf ../run/lock $(TARGET_DIR)/var/lock
 	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
 	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
 endef
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
