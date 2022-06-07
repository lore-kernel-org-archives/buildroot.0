Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD3CCCA47C
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 14:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A16E61403;
	Tue,  7 Jun 2022 14:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4qwwHsXMtII; Tue,  7 Jun 2022 14:06:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B110610C4;
	Tue,  7 Jun 2022 14:06:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 675CA1BF397
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64F088438F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sPZrBMvpSOaX for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 14:05:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B95C58435C
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 14:05:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2D24586AC8; Tue,  7 Jun 2022 13:54:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 15:59:12 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: dd935bd447c7284222cb3f69bd9f7f5c9e04c70f
X-Git-Newrev: fb98438cff630d79087b3e0fc38d08711f1c413a
X-Patchwork-Hint: ignore
Message-Id: <20220607135403.2D24586AC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/runc: security
 bump to v1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb98438cff630d79087b3e0fc38d08711f1c413a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes CVE-2022-29162

Minor security issue (which appears to not be exploitable) related to process
capabilities.

A bug was found in runc where runc exec --cap executed processes with ble Linux
process capabilities, creating an atypical Linux environment. For more
information, see GHSA-f3fp-gc8g-vw66 and CVE-2022-29162.

runc spec no longer sets any inheritable capabilities in the created example OCI
spec (config.json) file.

https://github.com/opencontainers/runc/releases/tag/v1.1.2

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0295e9602f22dd11e0e484bf10950354d1febe3b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index fe3c4cc488..f8133d13c1 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  11a34535c108b36fd59de58e7bef3a130444c9ea41e4b8bb8f8d4654c8ad654c  runc-1.1.1.tar.gz
+sha256  0ccce82b1d9c058d8fd7443d261c96fd7a803f2775bcb1fec2bdb725bc7640f6  runc-1.1.2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 2618b71f63..5faa8b683d 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.1
+RUNC_VERSION = 1.1.2
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
