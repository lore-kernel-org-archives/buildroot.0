Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88FAC76196
	for <buildroot@archiver.kernel.org>; Fri,  7 Apr 2023 05:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF1B6160A;
	Fri,  7 Apr 2023 05:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CF1B6160A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QdDQaEDC5_Aa; Fri,  7 Apr 2023 05:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4AA8615FC;
	Fri,  7 Apr 2023 05:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4AA8615FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 341911C2E20
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 05:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0020C400C1
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 05:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0020C400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id koTlKpYIoerm for <buildroot@lists.busybox.net>;
 Fri,  7 Apr 2023 05:21:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EBD140162
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn20818.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::818])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EBD140162
 for <buildroot@buildroot.org>; Fri,  7 Apr 2023 05:21:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jk3kk/Ie4rcLUEPR+0EI5/B+EqDjV4DUQqTYGBdV0Vy25prhwbYM7ci7zuDWqxegEPpFNOzKveRlUBruR1ejyNprNTizOPhPt3znTBe7cMnciJQqrWIG2dGkp0fHdTEPSCZLVL1uJNflVvNjNX4CK4ErkgCWFBTinvRMSm/K6/yx2xVjJYC57rHTM7EYUfkLr+pX6vlrxl56B8H81SfEU6NVrnCxuU6kuYa2cFcb8npg0J5XkY/1fN8NTrIV4AoGVH7d05PFnOwR4T5yFVk5a9hLLhCrj3KT+4nuiwYACK+9GNb2kvathPuJ+HSJLiZcIZZr20IC7FnsbNlfLuG6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ymp25/9JW7P3dpMgJybYwpWXThF1VK6jpBTnVmoNNzQ=;
 b=NnWX7U09gfo5UzLE+jtxQ5hymvzZDnnyCsOaD+oXaIhD5+mtQUkXexl0cTMWsUl5Vqnuf58K/by3raqzGWUcW5w89Vk9y5XGko6swVFKgMhhozePryYz908k9+4HxiDJyhwxCaeeVJX/qkeuIZ7UztuZFtcVRxF8RbZDUwZz+PkuyGXg4F7/srHcW/dz+G0D7pkPAV6iAgh/kJQ7ite/B1W7MapjcaUePO07GTNuWFWbqaoqDc8TXvpFo4en9F7RBIUao1JiRMXaKOsVBgPp/lq/qjGc+uN5/44GvqJfyUXSDCpKALnRL/CvuIztcaImBXvpR8S6RJkMYTtQ2dRxWA==
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
Date: Fri,  7 Apr 2023 01:21:07 -0400
Message-ID: <SN4P221MB0682FA7512F62AE3C071BCA8A0969@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230407052108.1696-1-james.d.knight@live.com>
References: <20230407052108.1696-1-james.d.knight@live.com>
X-TMN: [u+XCSS8k7UYiyt28on3XeCznVT/DQeXUTYvOZW+nLuU=]
X-ClientProxiedBy: YQBPR0101CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::13) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230407052108.1696-2-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|PH8P221MB1016:EE_
X-MS-Office365-Filtering-Correlation-Id: 891d0b2d-760d-43e0-72be-08db3727f13e
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9Xmovywdyt6JbrF6Sw9xOtJae/Qqn20gqKwb6fKuucRlKmPdJDbSD+9XBvCsLlSemk5MQy1Jx5bc5kiHDFrxb30RDNW9fYyttqaVwcnjuWf9f3PV7nFI1AgYrfdZ6tCHKMmK74pFXfxozBUFUIEjG2xt2xfKY0zHsOWXHJfCmsgZyX0o1zNKa74ZQk1/UeZmJ4Ap/R1Xum5R2QsWzUdpmhRhdK4tbTEj0+U+xab8dwt3J9qSA8o1GtbzMo8gIsWEI1FRnsc8PK2+5Wj0LYWbxmCc/pNs4KkuXzfkbVOTBofzc5XmtGXi76OP3zK9ZGz4Ny12A6k9ql15W7V2Ef/AODSPbuAiFocsSjtisKBDRLStVcdaqlMAq/78GKNgsMsMlzZijiaEurN9YjZ7ciYlwjkH+7xA0pDaDhHHP5T1vlmHfQqnp85cqcK+VA2oH/YC9YV2iC8FZRpk3Jqvwx2G4kf1ay3/Cd4HLmy/6hlCZ1d3fBWu++8mnrsIOCJnCUoYIUa6sK9KGpBMiD3IfV0SGpd6yDeJcaWQfCBXg1C9JBYZEMDUCPuUDVHyn6BmmJCXlk4Ed8G+fUTvZg3vyRerDQoGTixcsyHF1xfyh+ZmM/EiVbnIooGYwkFPmZXxBSe7nI0r0cdz8feULaTzZkgC/sgTy2xPp6dBlFidZ4QvtEccL0XDOLP2nTp39/xtNNhbQD815IIMbtkvZeuhSF/+8AKy+hHb88koX7oQW3UeSSxIaNJ3NSI3wOWGf6KBw0ENNgHk=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZHzSJbCkypyfeJv8D8+N9DczVdBUEub2BZ0r7bLcwJ3JUl88MBnkpXcTBf6yiNnzW5Rp5Lzuq5O58QJZC5ej/NE1okBnOffUUXyFyBAcyRxxg5KcQuPzQllUIHAmJJo/GIWZvrrF5kBigtktuMQxXY/DFb5WQDjSWeavDtRN99nqygyH+rG2Zha+E82AK8okYct4Wph7waTvGRR0gmZ/ZFmCBuV3p9/tisrMYMo4IoTpauj+iimFmxyRQ8xEUdCCwBD89yPQ1gMhYwIzrfgBd+hZ8eIYR/C7tnRhVUvLfs+A/3A52f9QhiMJ/34xxPGytTfCH4bfCAlQvL3xxZLcKjCE7t1YRdk1a3aIyndY1Wnh9A4YA4tqgnfz3zmk7jInE2oGaG9y6n8VWztXDHWF1kPerSs/uiTAbY04K2HtdOowCPEXqATstkZD8j32CmYGPOFI7b3l0zTaA4tp2SpGaeCEDTs3zALewBlTP2l4ZuBeDHxlJPD7MFMZb0diutfYGfuZtuMbtXm5Lo7Uu3wqE6nkJppdkany85X69yApInVU59H4naAfIpGw94e7lrek21Xt4k+uGP+2INDE8DN56P07IquDJlxbL1aM+dZ23ix95ZGV/XZwQUF0Hne3Ll4c
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YWxTKwZHx6D31MEEuvu5MWzTbK2GP/+ElpW4ZDa9O0ijM2V+ODMBzyqSYEuj?=
 =?us-ascii?Q?o+yEiUN70een0TC4DNQlQ4vSEb9Z5t0Roq/Y8pWidZkGfefJuxpHOWSVf23L?=
 =?us-ascii?Q?GeN11hxUKUKBI/eV/20puBUCaccL02Z+imnUV+hhM4Q2UoRhJSRYrYjGz6r/?=
 =?us-ascii?Q?TmPy2w6Mng0v+CrAuYN+F5uKrpElIKVqTaJKYcu4HRnmb+WP3FkWR9L+/LDB?=
 =?us-ascii?Q?zbGVVkiqTUckETNz1eErD36DUfPUlk1FoKCC5l+x3OqbfVwUMiV+3/ViLO2y?=
 =?us-ascii?Q?Izxr/bBgn5hnscQRf9KMBsT8s2eRhfn0lhxx8twaiJFfv6Frg+2eAuGndtnq?=
 =?us-ascii?Q?/7ZfHdqImheC/k2iwKl4FJYwk9oH95Ve7Yzr6C63llvA2lVNIvj8dN4AqnkJ?=
 =?us-ascii?Q?tWbXyPkNhhMs4Ql6jfUp7fuJaZJyiwhVeUgkdDzIcMYfDmfJMPK1CJidPc7J?=
 =?us-ascii?Q?uHCOk+HDrrmrgYoT+vlvolrKgGGL2XEaS9LJ65HADyPeZI/acAohGOfII6gv?=
 =?us-ascii?Q?zKlroT7LNyym6In6o0AF3TFnkkPTYMFhIB+8hzu+p32k/qcKHL1FvrOFQ+jV?=
 =?us-ascii?Q?luNm4Nkpv4e+0l14sJ63fkuAZWNhYLiKd3+4fLBcFt+xaDQ0kRHfUqR/+uSZ?=
 =?us-ascii?Q?mI1ToYQZfgknP3j26nFdH9Tsl6xvg6jefKp4vRYRmqksfYb4dIy+YSDGul2X?=
 =?us-ascii?Q?uo93cd0NPgrkMUp6zGxD7lBZUHMLft1E0bdBDAnKo2sNGRMis7ZvCj3mynQ/?=
 =?us-ascii?Q?S2sV7ZYhIO+v9TcfLCROvvToBHX8pXdJGzqqJEqZ59k2MWN9k/i/3Ss+pYeQ?=
 =?us-ascii?Q?LigQpv/3Lr3s0DMTMbNhxutv5rODDUNHIr1qomj+oacAgTbw+nGlQ92nTGKp?=
 =?us-ascii?Q?ff5RfOEj5pRyeHpuUY+UO1dUs0Njgo3NDokSd/YOz76V5zal06+mTMFWZD2e?=
 =?us-ascii?Q?UHRZpAWkPWl4X/u+nylD8b+/5Sdr/EgCEtjzgnRscGRS8JCeq6USomBNv9gU?=
 =?us-ascii?Q?KLYatVQY0O1TZBZ6lPjxDfdwVrFJ9uQVHgIRvQ+9G17cJdqX8zGRrYxFFuDP?=
 =?us-ascii?Q?0R/Fk487Tlle9AkP3/WLyHUwK00fmx3Fw7VYGnVfLeiGIwIr/fkXktZKtarp?=
 =?us-ascii?Q?AcVXxcgkAauOdtjC4Si+NKLpqr1aqYcxPKoYxD6/d5ZggkdWl42/egYeIDUM?=
 =?us-ascii?Q?4/8wpx7+3G0ks0QasmJsoimhZajcc1zdusWhgq08A0PR/FzRLTTyqlgw7rU?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 891d0b2d-760d-43e0-72be-08db3727f13e
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 05:21:29.6762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8P221MB1016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ymp25/9JW7P3dpMgJybYwpWXThF1VK6jpBTnVmoNNzQ=;
 b=olEtAOPsLysTx7GdugQGQvEE4oZzlga2pXbWRWSq+J2jK9E74bRCgZbnx92Btmml3zhdk+l0U2q1CpEIufDn7Dy5n61IJM0gSdiz1sOUF/n+pbT8m0wf8fDdnGlo3444RA7w3ZQgywmCqNfHm33VQiPRZTswNujSBvwzJqQe2fFqs28ygPyazZwZeioLHchH+BOe7G1ghCRn5XCThoPlqssgg7Lx+T9x4ShJ6/vmIoNUt4Zh4WR7vlKFKSowBmBwgL521iH9OZAcJ1Dvhk6vY6GVR5FL0JEd9CDTrCYjykYIbIQwn+s+O/Tkq4Onj9NTROKrj6Tbnjlyp4b1GIH8VA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=olEtAOPs
Subject: [Buildroot] [PATCH v2 2/3] board/qemu/start-qemu.sh.in: rework
 argument handling
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

Provides the ability to forward command line options directly to QEMU.
When invoking `start-qemu.sh`, users can forward arguments by adding a
double dash (`--`) into the argument set, and any trailing arguments
will be forwarded into QEMU. For example, `start-qemu.sh -- --help`.

The original implementation supported a "serial-only" command line
argument to help run in a non-graphical mode for some use cases. These
changes try to promote a newly added `--serial-only` argument to drive
this mode; that being said, a `serial-only` argument will still be
accepted for backwards compatibility.

Since this script is primarily for CI-related testing, a warning is
generated for users if any unsupported options are provided.

Signed-off-by: James Knight <james.d.knight@live.com>
---
Changes v1 -> v2:
  - From the original patch, this second patch now only contains changes
    related to argument processing.
  - Add unsupported warning with custom options (suggested by Romain)
  - Ensure sh compliant in the argument parsing (while condition).
  - Properly handle legacy `serial-only` check in argument processing by
    not cycling just on dash-prefixed arguments.
---
 board/qemu/start-qemu.sh.in | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/board/qemu/start-qemu.sh.in b/board/qemu/start-qemu.sh.in
index c2d77734c7a6b318a5f7adedfd9b0b5875e84f59..dd387507f8867778ec73f49d769679dcd0956fd4 100644
--- a/board/qemu/start-qemu.sh.in
+++ b/board/qemu/start-qemu.sh.in
@@ -3,12 +3,25 @@
 BINARIES_DIR="${0%/*}/"
 cd ${BINARIES_DIR}
 
-if [ "${1}" = "serial-only" ]; then
+mode_serial=0
+while [ "$1" ]; do
+    case "$1" in
+    --serial-only|serial-only) mode_serial=1; shift;;
+    --) shift; break;;
+    *) echo "unknown option: $1" 1>&2; exit 1;;
+    esac
+done
+
+if [ $mode_serial -eq 1 ]; then
     EXTRA_ARGS='VAR_SERIAL_ARGS'
 else
     EXTRA_ARGS='VAR_DEFAULT_ARGS'
 fi
 
+if [ "$*" ]; then
+    echo "(warning) unsupported options: $*"
+fi
+
 export PATH="${HOST_DIR}/bin:${PATH}"
-exec VAR_QEMU_CMD_LINE ${EXTRA_ARGS}
+exec VAR_QEMU_CMD_LINE ${EXTRA_ARGS} "$@"
 )
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
