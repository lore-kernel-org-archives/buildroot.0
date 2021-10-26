Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54BBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:17:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7882E60EBC
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7882E60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44A8040476;
	Tue, 26 Oct 2021 12:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flT5Niwbe0Ed; Tue, 26 Oct 2021 12:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD6C14026D;
	Tue, 26 Oct 2021 12:17:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 351451BF38D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 242E3401EF
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6o0GPRb5n6yr for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:15:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F3E2401DF
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:15:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0DABA88DBF; Tue, 26 Oct 2021 12:12:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 14:13:24 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 567d261721eed843f72f87f44e18295623b9f36a
X-Git-Newrev: fff3c2c77dc1efe6b3416e0466f8ee649adf1727
X-Patchwork-Hint: ignore
Message-Id: <20211026121226.0DABA88DBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/freerdp: security
 bump to version 2.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fff3c2c77dc1efe6b3416e0466f8ee649adf1727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

- Fix CVE-2021-41159: Improper client input validation for gateway
  connections allows to overwrite memory
- Fix CVE-2021-41160: Improper region checks in all clients allow out of
  bound write to memory

https://github.com/FreeRDP/FreeRDP/releases/tag/2.4.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f5dc5f47f567ff3cfc0e782503d659d462b3d212)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index a6cc16c9ad..637e57e8b0 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.4.0.tar.gz.sha256
-sha256  10ec9b06d74182b354ae288c8e621d94c0fb189b0c3b14a59867ab4c414c08b5  freerdp-2.4.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.4.1.tar.gz.sha256
+sha256  ef75c87926643a0d0041f6556e343ac037380d4260c64885e7cdd20da0147edf  freerdp-2.4.1.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 1ff6feeaa7..40a3904024 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.4.0
+FREERDP_VERSION = 2.4.1
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
