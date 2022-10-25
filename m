Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0474DC04A95
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 10:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92A4881337;
	Tue, 25 Oct 2022 10:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A4881337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mdkrNHbBBEF; Tue, 25 Oct 2022 10:02:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA2F28133A;
	Tue, 25 Oct 2022 10:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA2F28133A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC8211BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 10:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEAE54089E
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 10:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEAE54089E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9cUancUcl2iv for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 10:02:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4182240897
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4182240897
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 10:02:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWokAGoMCngiQoUbH/ZCRECTyLL/5TY7dB0XrFbgzA7E6APHDZFdzLaNXcW7Y+fPlVTdvZDcuZr0y1UuqCregir+VEtKCBrkY2LdkyJ8su2Q3T3f7rtwwqST3EnOEZBF9JpI54qbVP5Y1/WA6P9/1d48mQp9ZbBD8uT01yat8YkDcgxAb+0mIaUUd3MC/411iS2EYUGDMo4vVCdY7EtB97l790UaTAHf3TijzFdSPQUPxR2xAd5sOz+xLD/JSDVxeG7x1KmxJcDFjURnmzMB6Sx2NnGagCaM41yKovbUvFnmFWBC/nKqXPgZUYH9dbQvj17FLkO8+fbUSFoxDpA0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLfrMlkD2NNNT0ZocmJw+yQpXOhA27Fujm/lRCHXx1U=;
 b=DRHqIyJIIYZD5/K4Rqss+k1DJNHP/VLK82FlzjJkuGamr7nyioLea+l9IsC2x8VaHetm5gGES91ZV0D+rnLAEaBfi8CvJceEFMK4mFCrzIu/vn4y99znotFvOuAslhFpliSZZA5Ic4M0Qy0JR4eK3/QoydRVjsqSixVnFriML7VaMdJRyu5FBMIlJWlDxdQ/eWK1+XWaTe6+1oBPlY3ar4oN1eEb1/xCXJnmwadplYPxi7+ijMx4ekKMIg+73/udlKEmRGXSGhXzEwzZN9Fe2JX7KOlWKRQIA02+gLxj65/2Cmb6nMY+yDHpFrPLIj+xZQLHXW9RKPtJhVjNK2qO+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.164.66.30) smtp.rcpttodomain=free.fr smtp.mailfrom=ptwdosimetry.com;
 dmarc=bestguesspass action=none header.from=ptwdosimetry.com; dkim=none
 (message not signed); arc=none
Received: from FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a9::8) by
 VI1PR09MB3856.eurprd09.prod.outlook.com (2603:10a6:803:130::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 10:02:29 +0000
Received: from VE1EUR02FT088.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:d10:a9:cafe::66) by FR0P281CA0098.outlook.office365.com
 (2603:10a6:d10:a9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.12 via Frontend
 Transport; Tue, 25 Oct 2022 10:02:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.164.66.30)
 smtp.mailfrom=ptwdosimetry.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ptwdosimetry.com;
Received-SPF: Pass (protection.outlook.com: domain of ptwdosimetry.com
 designates 213.164.66.30 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.164.66.30;
 helo=RichterS02-Lin.Freiburg.PTW.de; pr=C
Received: from RichterS02-Lin.Freiburg.PTW.de (213.164.66.30) by
 VE1EUR02FT088.mail.protection.outlook.com (10.152.13.221) with Microsoft SMTP
 Server id 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 10:02:29
 +0000
From: Simon Richter <simon.richter@ptwdosimetry.com>
To: yann.morin.1998@free.fr
Date: Tue, 25 Oct 2022 12:02:00 +0200
Message-Id: <20221025100200.78438-1-simon.richter@ptwdosimetry.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221021163133.GO2503@scaer>
References: <20221021163133.GO2503@scaer>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR02FT088:EE_|VI1PR09MB3856:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f42b34-8ec9-40a0-1cee-08dab67006b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OAKt7DnKyw3vHy9vWmfi7tGKvM5ZoVKBn7CNflt+OYPwdf6rRxYD+EBllNwZ6aT4mYR9aFzBBXMhuf2puuB/eFPNHGzq7ixrJo/NLdtwOxUk68WWurvLyaeArmDOS8DS+hc7h52OqZAXOXcUM7XFbMXCGSFPnhmW7p8WgtPNvO+6eS5qaIG7UIEzc/IIke89iRBaFF8vr9REAVwFMgCvVKZl9zLUNOx22wMu8u8wWuepiDdtf5AjO69YhN/mu9IH9bcaB00gouy5XDrsWyx0L4zcOv4cLIqXoGtghHJCPguzmM5LQ+xi8XQdBFuPQ6L2UA6F3jgW9jro5rCw4+Of+FoDkCnY82b2wLboM8UrAa2s3VcY6xYSfyKLUhXtcJjy6GN5XaMpvuYtuGyWdyjGIkOXpK/iHRp1nqwwT2QN7DxPxmFaDWEEawM3pjyeqtkEV+wcu3kT4/dWSu9KkUS167SCgv5BiRLHZPMug96Nr5vy13DykgAW4ozYFTPxISfsp/iF0NUE02wS77W58IY4jO0fqB+FsMvxFORnAgijEHxIo+oVw+RNzrcjjmZf0IMolU/TGHWXaxwih/V2fRJdnxkCiDP+83hVgckJEhwpsEq1fkL5B58KUid/IFIYzOQPqVg0/t7TghQU2MOt8XV+lRPDrn+llzFZN98B1jNFuTsCAJcVkPd+soVImSnDlpf5PumXHwJdt0IwYQcvi1RZ/6IhJx4dUKrlRZ+zGXyrDsMyRBNFH4Ghllelfi06ab+QWZ2nCQXdp8U6iAk1Bqdg1GwrkMLMFNJCD/Orz3iyYZRItxKcGIAjoUdWNSdSi3lBpPcRK67iWoA8thQqMP8k5A==
X-Forefront-Antispam-Report: CIP:213.164.66.30; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:RichterS02-Lin.Freiburg.PTW.de; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39840400004)(396003)(346002)(451199015)(46966006)(36840700001)(83380400001)(47076005)(86362001)(44832011)(36860700001)(81166007)(5660300002)(70206006)(70586007)(8936002)(4326008)(41300700001)(8676002)(2906002)(9316004)(82310400005)(6506007)(6666004)(186003)(107886003)(26005)(2616005)(1076003)(966005)(6512007)(956004)(6916009)(36736006)(316002)(478600001)(118246002)(336012)(40480700001)(36756003)(356005)(6486002)(41080700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ptwdosimetry.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 10:02:29.0377 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f42b34-8ec9-40a0-1cee-08dab67006b5
X-MS-Exchange-CrossTenant-Id: f4f5a489-21cd-415a-a6df-b7670e99ad80
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f4f5a489-21cd-415a-a6df-b7670e99ad80; Ip=[213.164.66.30];
 Helo=[RichterS02-Lin.Freiburg.PTW.de]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT088.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB3856
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ptwfreiburg.onmicrosoft.com; s=selector2-ptwfreiburg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLfrMlkD2NNNT0ZocmJw+yQpXOhA27Fujm/lRCHXx1U=;
 b=SeopVEjVhq1l5wmrpBsmQ0ggeuZJyympGLxkcHtLfwA7vQfzdVR07OUPXLTNyJf414kxs+vz+UL8aswVH+vkuHqxrNGYMLMHCyEo3liHaOSMcqvR1RYzWKtwaZ2aoSPXF0FNZ9oEQfTvTsqLtbR6PHJM+Dqpk2TW6vDzk9tGx8U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ptwfreiburg.onmicrosoft.com
 header.i=@ptwfreiburg.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-ptwfreiburg-onmicrosoft-com header.b=SeopVEjV
Subject: [Buildroot] [PATCH v2] support/download/cargo-post-process: cargo
 output for vendor config
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
Cc: simon.richter@ptwdosimetry.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the output of `cargo vendor` to generate the vendor configuration.

Fixes the need to patch the generated configuration if there are
non-crates.io dependencies.

Note:
  `cargo vendor` currently prints a newline before it prints the
  needed configuration.

  This is fixed in +nightly, will end up in +stable soon and must
  be considered when updating cargo.
  See: https://github.com/rust-lang/cargo/pull/11273

  Until then it is needed to remove this first line to make sure
  that the contents of .cargo/config will be the same as they were
  generated with the earlier version of the script. Thus, the
  hashes of the packages that use this script remain the same.

Signed-off-by: Simon Richter <simon.richter@ptwdosimetry.com>
---
 support/download/cargo-post-process | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index a4a4718a2a..186e9eb69b 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -1,6 +1,7 @@
 #!/usr/bin/env bash
 
 set -e
+set -o pipefail
 
 . "${0%/*}/helpers"
 
@@ -22,17 +23,28 @@ post_process_unpack "${base_name}" "${output}"
 
 # Do the Cargo vendoring
 pushd "${base_name}" > /dev/null
-cargo vendor --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} --locked VENDOR
 
 # Create the local .cargo/config with vendor info
+#
+# The first line of the output to stdout is empty.
+# So skip it to have the file start with the vendoring
+# configuration (`tail --lines=+2`).
+#
+# NOTE:
+#   There is  a patch for cargo to remove the first empty line:
+#   See: https://github.com/rust-lang/cargo/pull/11273
+#
+#   The patch already landed in +nightly and will end up
+#   in +stable soon.
+#
+# ->  When updating rust/cargo, the call to `tail` must be removed.
+#
 mkdir -p .cargo/
-cat <<EOF >.cargo/config
-[source.crates-io]
-replace-with = "vendored-sources"
+cargo vendor \
+    --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
+    --locked VENDOR \
+    | tail --lines=+2 | tee .cargo/config
 
-[source.vendored-sources]
-directory = "VENDOR"
-EOF
 popd > /dev/null
 
 post_process_repack "$(pwd)" "${base_name}" "${output}"
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
