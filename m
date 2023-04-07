Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC20C6FD1D
	for <buildroot@archiver.kernel.org>; Fri,  7 Apr 2023 05:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E10061602;
	Fri,  7 Apr 2023 05:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E10061602
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2C5OnDuFc_S; Fri,  7 Apr 2023 05:21:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5137E615FF;
	Fri,  7 Apr 2023 05:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5137E615FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B61361C2DFB
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 05:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B93D402C3
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 05:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B93D402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pv6tw2Ks9op0 for <buildroot@lists.busybox.net>;
 Fri,  7 Apr 2023 05:21:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7CAE400C1
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn20818.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::818])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7CAE400C1
 for <buildroot@buildroot.org>; Fri,  7 Apr 2023 05:21:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glo4Rztf+cZeEyQkbaGbFOj4qeRX9jsU8dGtF5ilXGJ+yWXVr0BmLx8I7HBj+Vl+BFHDhdiJz2QgOFjNABvIP7St+45ge462PkSONN+P1OcteN3Fcm+eUvXZCu4w9QsFRJ2LV1/L5Rk/F2PoLFs/MrOPK7Vor+8vUco4d/cmClTPS/fLTZx03OUe20SQXICK9X4nmkn0Y93KPmjKs87l0d9YnGOnNHismVEcfBuK37S2Xym0EFT9IX7kZVL8sB4XEn16t8aHajVd/J8Hu02Wbdz2V4wrk5iZr4S1QmfGCtYb1o+jAmpVKL5jJZcWJUlOwpcA6g5Ab+MLGcN5a9DIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ys9py/cSRJv5IPCn/U8/nnJzD063Q+ukCOuIbc1yuM=;
 b=cKrl/yztTO9pW4FdaP368hTgK+eFYFizeaSRaK5oGqOrpDtPzrZo6AnorlkkjgJARuV5Dxjs8+28DuKQtGGej9ahEGE9favnldpfGZTJw0iIr7sRuAYAyF5x4rtux1UjbAwcU/tEqjCZsQoYzuZ0GEb0DAXvh6bxqnMQ2u4MzN6XCSRWocW/HZWNkjkIcl0UkRpqZ5VXYVVzPsksQiXYUCrud0EA8Ffu3ydIS0r/1di5xc12i9ybv7wptvr/9GbOx4jrXQydfeettzfBrEZuQFb9LQ1kmKAZUv2sjdXQxFziWX7WGoloWwlCEVeT/P+6LbuVQ4m3QcJePIRlx3DlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by PH8P221MB1016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:1c4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Fri, 7 Apr
 2023 05:21:30 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 05:21:30 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Fri,  7 Apr 2023 01:21:08 -0400
Message-ID: <SN4P221MB06829533040263705CA5B624A0969@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230407052108.1696-1-james.d.knight@live.com>
References: <20230407052108.1696-1-james.d.knight@live.com>
X-TMN: [S96oMZIhwgmFkA40pR3NQropp9Zr37znxrHfzEYM8Jc=]
X-ClientProxiedBy: YQBPR0101CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::13) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230407052108.1696-3-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|PH8P221MB1016:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e60c48b-805e-4626-f030-08db3727f1c3
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9Xmovywdyt6JbrF6Sw9xOtJaeeP5XgUN1ey+4wgFLUyGGd/YPXfgwY8PiqLYdOKDEfk82Ra1GWWFVTJ52E7gCyrSWTsHKO9Lku5eWLmtFAUFP4bKyEpROiqXi1EEFAcX9JY2QVEKKV/ghMncq3gU2HRtEGq7syEIBqMr2dmD4fASigCaf9NyUXlY/Qxu9+WBV2u/X/y2ZKxdqWunFrjmy5+istx4giLROESPWq00RFXwka22rseSfpwwqlLYMph5xUKz1V9HVMyk7ky2tNNkMuP3xkjaKNx9HWCc2pK79jfmlL8bFVNDvX5bN/uprp3shNuCk+0LNs6/E4OSHVj4sAj0oQj325kt6BvqVNS9N1OhU1JAmzelJityeKvlNs+DSChLx/I7L1MW4vG8P+FyFKqDy4fLHxfwHoIHCvjpAkl6wBxZqAZlMRajkoD6A75+sO7gqJ+z1y2ioJjFLkpPyLSWzadicWinHbNWDoj8p2hI4VVMdYyPISINQSzQY0hIFuHIJpG9H071amtGzcuC9i423azq+tAlwaJjF3GGl0OygZAhUbKUnmaKTU+YF1GDJWhhqyiCeJOPsAt2OkT9lpgh2UXwptascmW1WCfHPpG92m817iXwGt0pehWuMu3VCguanU5Dvragx2UIB93Nkj9GOy24MuFAtXQE3JQQ5AByEVCIYJc4JgkU7DlR/uSi9hCE3OgjLTCyqJitPM0lnYUlQLBq0gR6Kqce+ppZx0Il5cVIL4HEVgh+ROAQ1YYr4FEI=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iP0WzQctAIuGSQosDNEgB7W4wDwcl1/U8YqZt9cCm+vI2nD5rUQRKairDTceY/w3PChb8bpMSP1sJRwnCo3qjlsWyR5IZmaKFhIEqpy/Cu9QoQWizaM/fMHY0O0xF+ewRhy/nmGGn0+wJoVBT1R4odsPugDtx/144cXIQYuyBLx8UD9mz3NtdRiyGzTGv7U8h7K8aYAEa2Qd81KKuU/eJVzaYNXV/04cPO5ztER1LXKeZLjgfyPKHH6KPdUT6eOUBHVc2PdpTE3lH4u39pwhJwF6i5hipbio8zkctq16hDPkRDtInbGGJiWAoco7M3dA2hpVMTLrNmKAD/Mua0kjc7iQZeFOch30NNRZmlqmD+HFFn6YCkXr9d2fBd3/rrNjkqFv6zzKrn9amyI/+7Qqldp/OmUxlQy0XpcBVOe7ADNWjsuQqgzTgF9bSrTYUg2UlbdMZqk44D2YnWIdguP1dk6cI4NU3Kg6/BSmO6moPRF8anpB06oigFgFFVspwcgg4oMfDAKYNK5560I22aNfdQ7e0LA3vxpzQDElWfUL58EfrRV4949rL1/x8UTxFxFMFCdcaAQcuNX6agOtLGMBseYTMqUYSfhFszlPs3TJVlR6xQZI2encGVxQ3qhDIXbm
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dCO01i2ziPAXo1KNZcMQyEG8KGinGqMIIziWlB/nkmZSDU7xECV1wjv0SQ2j?=
 =?us-ascii?Q?eLA5xn4oVnxaJiyUUmntPX98efD1hyRyC/fsig0gBPWveKlIBQ1l2+CIIQr0?=
 =?us-ascii?Q?6Vk8sewgMhKLpCH1zI6cAuI65ndPDPVJ6BDBAVlfu0+41i6QH0nVfdBiEL0q?=
 =?us-ascii?Q?lxTVJOrJcG40ZV9cHQ+8fXXLsqJQKeJ3kR+xZzU8kgFJMEuJGKst0gF79ae8?=
 =?us-ascii?Q?KT/B9aF8u90mCbwhCbzTCvfdqvThwUpO8gnlEpwkV6GeJg/FbN2DKe9hkHK9?=
 =?us-ascii?Q?z33944dZyRhLSsXAiI7ZrS1apsNaBK8OnbFI1X08Db/VCokQ2NMIH53gFGn5?=
 =?us-ascii?Q?VZo8GLRh2yC8avG3TIEk8+OyA144Gn5ykrO9j3FthE9G4DjBWiHSNDBXQwWz?=
 =?us-ascii?Q?uUI3tfSjE2E3OAqxgDKCS2HS0RB9U1WcTr294SSJFrB3wTJgrMQUyHJ+JKRk?=
 =?us-ascii?Q?Di/kJxC/pEMoxSMuBzIStoI7tUI80heUzYs5H7QQ0vzk7OqSWOVPjiwfSav3?=
 =?us-ascii?Q?22rlHPFkzwzhN4XPwcAMBLnLA0jYYtxQDb31RZfW1T/InUEpU1DGZgk1fsJR?=
 =?us-ascii?Q?/RuMChjewll4jTqJf/u2FeitraBD4UDAksmRfwvwcKJMMFkEYtmfoABh8Fdb?=
 =?us-ascii?Q?LvgY8Q6TvQUzmRDxxc9vQjcmyxmEWs3drmCyw2wAKffzomQrX8jVwIgu3HI5?=
 =?us-ascii?Q?eEZ5tJ6W2bKgX2wicmdExHZLtwLJabWlSggYEuSUH/W/aOfXTUz6MCgH7G1C?=
 =?us-ascii?Q?3hI2TbSxjNAapLgJXCjqYo/8/Bksidm5kRZzCHWZ7MO3EL9L9FbLVi95EDK9?=
 =?us-ascii?Q?az3EiB4g1JpnSdxKyMtYQkLXzqeV4hoLFAbBBkQ7BR70d6EDEWV4nOVhMg6T?=
 =?us-ascii?Q?ZvN728C496kn3uPv1Vl6gETwtnyrgGqMnsDkXWv2xyZ+bsLugOKe+umbmTew?=
 =?us-ascii?Q?Htx63reaizv+AxAuecA5VMPvs5rOJ4f8kzMrDo3/jzKyNVqJWutL9bNwDr9P?=
 =?us-ascii?Q?ZekDhMBqkxRy1F8GHt7fGtl2PaZE2NTb0lw2Qi3F+xGv23ai3pAUQKbAwFSy?=
 =?us-ascii?Q?akvxZDv9qibqUKYSHxC4iL9+HQEN8Vy2qVstDdrGOujfNmX9klNrLVv8mdCA?=
 =?us-ascii?Q?gJiUg46OL07wGFYn3C+uE09NVhbThkR8LRl1d+KNiBiUgCV5+6IryLqpP3lh?=
 =?us-ascii?Q?NeFdF/YWArKYD1LwV0Q5kGwnrnSJwZvROI0aKwtfx3RTlOOJKQXCCDp/fD0?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e60c48b-805e-4626-f030-08db3727f1c3
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 05:21:30.5229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8P221MB1016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ys9py/cSRJv5IPCn/U8/nnJzD063Q+ukCOuIbc1yuM=;
 b=ZEExhKThUsz/3/+5cTPrz/kb3S89zrAVwVwgs7xz6lZOktvla7UEAtmzKMfwpoopm4z+Duejau1ax2IBGg9RRKOqOFFD22tAabrK/9QGQnIz3tlZIAdoB+Y4mYEENf4Jc7/Vm7KXM4/zkpjNqLgBUgC1YSw7TQgiTCZ/zWS8zR3lKkPLik9TPKpvWZn0pF5a3Ufq3v1q9O8F0g2d7PWQazFvl00qFh9PWn+f99DFGmm6juev0HftxBTTlarSJB9eLkfH26580R8vuaeimxhba2NvVqYmnEhfP6OyJN6WZ7/K69Sm8Kqq9i2IWJ8o7219eILvc6RoTxhsTaSEWwAXag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=ZEExhKTh
Subject: [Buildroot] [PATCH v2 3/3] board/qemu/start-qemu.sh.in: support
 launching with host system's qemu
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
Cc: James Knight <james.d.knight@live.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provides the ability to use a host system's QEMU. While a Buildroot
generated QEMU should work for most cases, a developer may wish to use
the system's QEMU for options which may not have been configured in the
Buildroot's QEMU build (e.g. configuring a different display mode).

Signed-off-by: James Knight <james.d.knight@live.com>
---
Changes v1 -> v2:
  - From the original patch, this third patch now only contains changes
    related to permitting a system QEMU usage.
  - Change from `--host` to `--use-system-qemu` (suggested by Romain).
---
 board/qemu/start-qemu.sh.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/board/qemu/start-qemu.sh.in b/board/qemu/start-qemu.sh.in
index dd387507f8867778ec73f49d769679dcd0956fd4..51f15b3ecdfdc8151caeae90582ad1142d122e69 100644
--- a/board/qemu/start-qemu.sh.in
+++ b/board/qemu/start-qemu.sh.in
@@ -4,9 +4,11 @@ BINARIES_DIR="${0%/*}/"
 cd ${BINARIES_DIR}
 
 mode_serial=0
+mode_sys_qemu=0
 while [ "$1" ]; do
     case "$1" in
     --serial-only|serial-only) mode_serial=1; shift;;
+    --use-system-qemu) mode_sys_qemu=1; shift;;
     --) shift; break;;
     *) echo "unknown option: $1" 1>&2; exit 1;;
     esac
@@ -22,6 +24,9 @@ if [ "$*" ]; then
     echo "(warning) unsupported options: $*"
 fi
 
-export PATH="${HOST_DIR}/bin:${PATH}"
+if [ $mode_sys_qemu -ne 1 ]; then
+    export PATH="${HOST_DIR}/bin:${PATH}"
+fi
+
 exec VAR_QEMU_CMD_LINE ${EXTRA_ARGS} "$@"
 )
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
