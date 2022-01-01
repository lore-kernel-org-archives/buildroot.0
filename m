Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7580C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 22:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F43B40291;
	Sat,  1 Jan 2022 22:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTKKeX9TvAnK; Sat,  1 Jan 2022 22:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C4440271;
	Sat,  1 Jan 2022 22:40:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55B811BF957
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 22:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52FF840200
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 22:40:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YikBSYxzsZ1M for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 22:39:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from majs.cnackers.org (vps-1525-1.tilaa.nl [46.19.33.97])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E73401FB
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 22:39:59 +0000 (UTC)
Received: from majs.cnackers.org (localhost [127.0.0.1]) by majs.cnackers.org
 (Postfix) with ESMTPA id DD2E8FEC5
From: Erik Larsson <who+buildroot@cnackers.org>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 23:38:58 +0100
Message-Id: <20220101223900.2970405-1-who+buildroot@cnackers.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/tpm2-tss: remove unused dependency
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
Cc: Erik Larsson <who+buildroot@cnackers.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The last reference of uriparser was removed in:
https://github.com/tpm2-software/tpm2-tss/commit/17a670dd4c0e4effc2ac3cdf021c299fa92df70e

Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>
---
 package/tpm2-tss/tpm2-tss.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 71aa3feb96..060883c377 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -11,7 +11,7 @@ TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_CPE_ID_VENDOR = tpm2_software_stack_project
 TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
 TPM2_TSS_INSTALL_STAGING = YES
-TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
+TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
 
 # 0001-configure-Only-use-CXX-when-fuzzing.patch
 TPM2_TSS_AUTORECONF = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
