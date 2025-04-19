Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6B1C369CA
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 16:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EABED60705;
	Sat, 19 Apr 2025 16:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pbg6i1KhQc1; Sat, 19 Apr 2025 16:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2929A606BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2929A606BE;
	Sat, 19 Apr 2025 16:36:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB6B122F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9190D405DC
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CljNSei38430 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 16:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF95E405F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF95E405F6
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:36:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAE1085C5F; Sat, 19 Apr 2025 16:36:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 18:34:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1012b363a286125978de529eacf9d187d95907f
X-Git-Newrev: 038826aad67241da74325f42c5dc83f4c7d5dc0f
X-Patchwork-Hint: ignore
Message-Id: <20250419163627.BAE1085C5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32mp135f_dk: fix optee hash
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1399591568990849517=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1399591568990849517==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=038826aad67241da74325f42c5dc83f4c7d5dc0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build command:

make stm32mp135f_dk_defconfig

fails with the errors:

ERROR: No hash found for optee-client-4.3.0.tar.gz
ERROR: No hash found for optee-os-4.3.0.tar.gz

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/9690369624

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Raphaël Gallais-Pou <rgallaispou@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============1399591568990849517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1399591568990849517==--
