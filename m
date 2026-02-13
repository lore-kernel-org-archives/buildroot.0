Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2CAEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED0618195C;
	Fri, 13 Feb 2026 19:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4Sf1JkQKmr1; Fri, 13 Feb 2026 19:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04E0D8176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011573;
	bh=eok6SleG6Vf8kwdzqq33/fXqwj89sE1u9gVUSYVF11Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g+0OPMduvFZW5EDv9Ppi9SlDDhSWL/PcoZUtU+q+AcuaqiVPCshgT8bBzmtpDz65f
	 TK2Tasy+FydIyM3uQ1DLtKKv9LuJfHMCmL7BsuBDxDm+xa4bdxGXNT6PDYMe3+gS8i
	 Xue7IfxtPQBCUDW3XG+El+GllEG6/q85MK4ua1MxYte9RIrae75/LKbM0ReW9B005M
	 ZMGQxdc38wNnSztbDvwgUgw+Me8kd4LbTkUnupkwVPcU3AtyeeXVFXF/g+nl7Znibq
	 lH9zD+8zoGvmIm3DD2w/S185368UzaKrVOMLplENXC8FAGbziX7btTkurj4wHwYkMK
	 v9n8cUJ5C5O0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04E0D8176D;
	Fri, 13 Feb 2026 19:39:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42675EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCAA44035F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otZLxSVT1Q2s for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67BE3413E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67BE3413E5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CCBA83DBC; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:31 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6cb462204ce668f1a884d48aab3962bf0427f1e9
X-Git-Newrev: 0c963c5d31d1465c5411778dbde197d6b65f54bd
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.5CCBA83DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/uclibc: rename
 UCLIBC_INSTALL_UTILS_STAGING to UCLIBC_INSTALL_HOST_UTILS
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c963c5d31d1465c5411778dbde197d6b65f54bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The UCLIBC_INSTALL_UTILS_STAGING is really badly named, as it doesn't
install anything to STAGING_DIR. Instead, it installs the host variant
of ldd and ldconfig into $(HOST_DIR)/bin. Therefore, rename it to
UCLIBC_INSTALL_HOST_UTILS.

This is important as a follow-up commit will re-introduce a
UCLIBC_INSTALL_UTILS_STAGING variable which really installs things
into STAGING_DIR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 026c635508cf9518b20cfd76350a01b2d0f57a5c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/uclibc/uclibc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index e1cf12fa68..dea5445b16 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -463,7 +463,7 @@ endef
 
 # STATIC has no ld* tools, only getconf
 ifeq ($(BR2_STATIC_LIBS),)
-define UCLIBC_INSTALL_UTILS_STAGING
+define UCLIBC_INSTALL_HOST_UTILS
 	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/bin/ldd
 	ln -sf ldd $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ldd
 	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/bin/ldconfig
@@ -478,7 +478,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		install_runtime install_dev
-	$(UCLIBC_INSTALL_UTILS_STAGING)
+	$(UCLIBC_INSTALL_HOST_UTILS)
 endef
 
 # Checks to give errors that the user can understand
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
