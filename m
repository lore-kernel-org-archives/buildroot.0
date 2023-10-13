Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185A7CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7BCC408DC;
	Fri, 13 Oct 2023 18:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7BCC408DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EKR61hq_dX7x; Fri, 13 Oct 2023 18:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 862E041892;
	Fri, 13 Oct 2023 18:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 862E041892
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 187D21BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA11542076
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA11542076
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UwUuA4GfaYqE for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0777D41FB4
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0777D41FB4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3C5484FED; Fri, 13 Oct 2023 18:46:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:10:29 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8032a566d5922f8b5a11a70b3b1351866cc4e016
X-Git-Newrev: 0b4c5daf4a3ca3018cf263dd8d407e10768cac41
X-Patchwork-Hint: ignore
Message-Id: <20231013184632.E3C5484FED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mbedtls: bump to
 version 2.28.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0b4c5daf4a3ca3018cf263dd8d407e10768cac41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7dc2462a8e511629e1ea300f32aa43ee1ec74fa1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 2281bd5fe5..6aa6d0235d 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.3:
-sha256  bdf7c5bbdc338da3edad89b2885d4f8668f9a6fffeba6ec17a60333e36dade6f  mbedtls-2.28.3.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.4:
+sha256  578c4dcd15bbff3f5cd56aa07cd4f850fc733634e3d5947be4f7157d5bfd81ac  mbedtls-2.28.4.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 8f09fd72a8..62eda6ec99 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.3
+MBEDTLS_VERSION = 2.28.4
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
