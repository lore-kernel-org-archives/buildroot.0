Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E26EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64E9A81E81;
	Mon, 11 Sep 2023 19:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E9A81E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YduXYV2UPqth; Mon, 11 Sep 2023 19:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5D3481E76;
	Mon, 11 Sep 2023 19:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5D3481E76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 902391BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68D934031C
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D934031C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KuQFHdu4tvm for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:33:07 +0000 (UTC)
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A019440199
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A019440199
Received: from localhost.localdomain ([146.241.108.254])
 by Aruba Outgoing Smtp  with ESMTPSA
 id fmebq7Qh82aFxfmecqwWAb; Mon, 11 Sep 2023 21:33:02 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 21:33:01 +0200
Message-Id: <20230911193301.1438190-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfITUCK6UiBndZAk/0cqJyPKomG8cT5DiylC5h6xLLtCzO9MlVUfckykhu8LcTHW8mlm//JNXnVS16cP4s6jH/1w870+0gV2BPOHwUtUKflVn93BAkOxB
 rTWYxuNtwxuz+ehxvqVTAH7upHK1qtF8tMmJTDQPKZCcT2GRmiiRkCuI3Sge+dsc/t/iqulMpJT8zFegR2rL/+tk0E5htGqKNzgUobXnjJEoFP7CAQwHR/YM
 Q7wpIwx2APQjOHYuykd3urvQWDadEAapvYt+lAsrjyOmuPp1TI17sDIMS99HAdq5h7QtZzdRGo2ofQR2yu3rsdi0ir/kX9MMzMwNM8hNcCk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1694460782; bh=S+U+dyvjNfFMG4a8o7E9a1FdHnfGSaL2PH+6K0mAHnc=;
 h=From:To:Subject:Date:MIME-Version;
 b=btAOedEpmbkIJ5Yrl926Z0deE9ov56l+lLCsCjcXXMWF/G7Sr9deIytW1VkjC+KvK
 /70gMaOz5ozpWDFVm0zeWbgzYZdqHLRtPstEYGODioRNMCx5bzTIbRhbA9uGSiPCUy
 Dy2qzhwE1o3QCNBH42KbWP2nnEt0+OE7Pub7SfLV/x/lRPLGOOwmNnF9OXbPKycaul
 Vx6Oxa5MNLjRU95ndv9/tzClkctC9ISLckBUmeBBI0mcMPZAEdn1qIZxSqjlFsi/1Z
 kz/yBrjwnGb6N9ZWwC/fZLNYcgCud3XiIRrPNGKmgW0JO9sUpsz4EFg6zySuBaGDet
 CScDsATRABeDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=btAOedEp
Subject: [Buildroot] [PATCH] package/mmc-utils: bump version to 2023-08-07
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Starting from commit:
https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=958227890690290ee766aaad1b92f3413f67048c
VERSION macro should be defined by mmc-utils Makefile itself but it doesn't
work in Buildroot because it needs to be in a git repository clone. So
let's mimic what they do in the Makefile by picking the first 6 SHA1 git
commit digits and set them to -DVERSION.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 0d0b6ac1b9..1bdb545cbc 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5a8dacf26a178010202c8fa7cb28b01f50fe967da98cdbdf320b2f110920106  mmc-utils-d4c2910981ff99b983734426dfa99632fb81ac6b-br1.tar.gz
+sha256  9ac9718343ffa36ab9ef192728e60cce6504febe29d43fb8003c2e2ef5a7c7d7  mmc-utils-613495ecaca97a19fa7f8f3ea23306472b36453c-br1.tar.gz
 sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 9da9c30293..45c1af89ff 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = d4c2910981ff99b983734426dfa99632fb81ac6b
+MMC_UTILS_VERSION = 613495ecaca97a19fa7f8f3ea23306472b36453c
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
@@ -19,11 +19,14 @@ endif
 # override AM_CFLAGS as the project Makefile uses it to pass
 # -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2, and the latter conflicts
 # with the _FORTIFY_SOURCE that we pass when hardening options are
-# enabled.
+# enabled. Starting from commit:
+# https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=958227890690290ee766aaad1b92f3413f67048c
+# they use AM_CFLAGS to set VERSION to first 6 digit of git SHA1, so let's do this
+# here otherwise it won't be automatically set and build will fail
 define MMC_UTILS_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(MMC_UTILS_CFLAGS)" \
-		AM_CFLAGS=
+		AM_CFLAGS='-DVERSION=\"$(shell echo $(MMC_UTILS_VERSION) | head -c 6)\"'
 endef
 
 define MMC_UTILS_INSTALL_TARGET_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
