Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E03C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8068160ACA;
	Fri,  2 May 2025 11:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiX1VgydrpFj; Fri,  2 May 2025 11:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A83AB613F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A83AB613F1;
	Fri,  2 May 2025 11:14:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11432229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D00E41BFC
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dH_hpdHyNrsf for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6E7E41A4B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6E7E41A4B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F628864AD; Fri,  2 May 2025 11:11:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:12:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fb287340b7445ba5ad18e1762b5fd83b491b6523
X-Git-Newrev: 8baf448c9fd83d2f7ef4f51579bb7cc6ad8a0f4e
X-Patchwork-Hint: ignore
Message-Id: <20250502111136.9F628864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/stm32mp135f_dk:
 fix optee hash
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0496366056039821058=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0496366056039821058==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8baf448c9fd83d2f7ef4f51579bb7cc6ad8a0f4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The build command:

make stm32mp135f_dk_defconfig

fails with the errors:

ERROR: No hash found for optee-client-4.3.0.tar.gz
ERROR: No hash found for optee-os-4.3.0.tar.gz

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/9690369624

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Raphaël Gallais-Pou <rgallaispou@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 038826aad67241da74325f42c5dc83f4c7d5dc0f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../common/stm32mp1xx/patches/optee-client/optee-client.hash            | 2 ++
 .../stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash
new file mode 100644
index 0000000000..5423bf93a5
--- /dev/null
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-client/optee-client.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a9a91bdb433df795c87a6d15198effbd648e3671ae611f2a3f8b41229d61cce0  optee-client-4.3.0.tar.gz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
index 73d4e2c4da..2e12a5cdea 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  03b91fd7dfdf890e3966f931f07634a2b6a2911bbee2a02ecc48d4a40cf6a9b8  optee-os-4.3.0-git4.tar.gz
+sha256  390b271905c828d6def9fa6a77bbaa425f3b434d733c8eb18f582ccbc6896096  optee-os-4.3.0.tar.gz

--===============0496366056039821058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0496366056039821058==--
