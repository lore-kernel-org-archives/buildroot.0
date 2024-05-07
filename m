Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695D1C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 20:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3098F823C6;
	Tue,  7 May 2024 20:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MkEkKnguftTQ; Tue,  7 May 2024 20:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8C698247F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8C698247F;
	Tue,  7 May 2024 20:15:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9495C1BF95F
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BDB541785
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKynIH_Vsd3l for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 20:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B48FF4176D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B48FF4176D
 for <buildroot@buildroot.org>; Tue,  7 May 2024 20:15:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A012286A49; Tue,  7 May 2024 20:15:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 22:14:16 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f357412f131a3200695aa8c8acfcba5b5a3e4f14
X-Git-Newrev: 23337c0674b039cbd16ae9d655f83b2810e7a143
X-Patchwork-Hint: ignore
Message-Id: <20240507201522.A012286A49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/freerdp: security
 bump to version 2.11.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=23337c0674b039cbd16ae9d655f83b2810e7a143
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following CVEs:

- CVE-2024-32041 [Low[ OutOfBound Read in zgfx_decompress_segment
- CVE-2024-32039 [Moderate] Integer overflow & OutOfBound Write in
  clear_decompress_residual_data
- CVE-2024-32040 [Low] integer underflow in nsc_rle_decode
- CVE-2024-32458 [Low] OutOfBound Read in planar_skip_plane_rle
- CVE-2024-32459 [Low] OutOfBound Read in ncrush_decompress
- CVE-2024-32460 [Low] OutOfBound Read in interleaved_decompress

https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1126be70ffb5c2b3255ceb9219362a8a45dd68d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index daf933e0af..9ac9b25066 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.11.5.tar.gz.sha256
-sha256  70785ad9934d75aed1734f8918a05aff95788e58e53081e84651106b24303dc2  freerdp-2.11.5.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.11.6.tar.gz.sha256
+sha256  ad5a0c7761b18af914041ed50902d6c9fd553e65eeba8a1bea41c4149980b84c  freerdp-2.11.6.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 29b33f61c3..8e359cbb4f 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.11.5
+FREERDP_VERSION = 2.11.6
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
