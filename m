Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B581CC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8325B80F1E;
	Thu, 12 Jun 2025 20:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIQnv6vUFEL4; Thu, 12 Jun 2025 20:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B934D80E8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B934D80E8C;
	Thu, 12 Jun 2025 20:12:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C18027A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7405440983
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFTjGp8wRqe8 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67DE040974
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67DE040974
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 664368354A; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dd9c9b40582086fecda80a585a007b40dcde21a8
X-Git-Newrev: 33e6f2e395fda8aff010ff77864da2daeaa51112
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.664368354A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcamera:
 correct build directory for IPA stripping
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33e6f2e395fda8aff010ff77864da2daeaa51112
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Commit 4e95062f8 ("package/pkg-meson: use buildroot-build for build
directory") changed the build directory for meson packages to
'buildroot-build', so update the find invocation to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c9355a3869e3d735df90fc1c012108fdca72ac78)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcamera/libcamera.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index b5b17a5c94..2712687913 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -131,7 +131,7 @@ endif
 # otherwise the signature won't match the shlib on the rootfs. Since meson
 # install target is signing the shlibs, we need to strip them before.
 LIBCAMERA_STRIP_FIND_CMD = \
-	find $(@D)/build/src/ipa \
+	find $(@D)/buildroot-build/src/ipa \
 	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
 		-not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
 	-type f -name 'ipa_*.so' -print0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
