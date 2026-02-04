Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D35DE9D417
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA7B60EBD;
	Wed,  4 Feb 2026 16:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMXFW1IVISPO; Wed,  4 Feb 2026 16:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D21660F69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224344;
	bh=rdi6FnvgHYUj4hE52SOK79JSPp4XE8Lpdgx4KkXu8po=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sd7MZ8npMhnglrqhu6MKkkmSxyO07WNA/kFojVfmUmiiDx9fEN6soU/bo5Up0qfHd
	 G6E607JBDuSrjU/4A7T8jACjbZwLLSqWXNhTP1KhVIpPb2GyLydxP/DbTvMDHncOoz
	 qjz+3biOcaE2yKrN4jzSxHcIr5MC4TRHA9G/3S799/zohw/fftk36mYJ1YtqONhEEo
	 0axPrDqWy1YwcakmbmGB9Wr83OhS8KStQMgOfOSKI8j7xlPv9CH28IYja40fPeW4Ee
	 z+07uKvDjGWahMJrtzIaZuFKIg6zDxqxHgEMWdVF0YpE2hxWWlIS4Nx7C3iUTzxCFZ
	 n07vI5GeFqhDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D21660F69;
	Wed,  4 Feb 2026 16:59:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E615EF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB22460AE8
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_JjErFHbHOz for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE33607B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEE33607B3
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 829408696D; Wed,  4 Feb 2026 16:58:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:55:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 026c635508cf9518b20cfd76350a01b2d0f57a5c
X-Git-Newrev: 272d281ba9a06cfdb802ff13d5ca32ef06166cce
X-Patchwork-Hint: ignore
Message-Id: <20260204165858.829408696D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: also install utils to
 STAGING_DIR
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/272d281ba9a06cfdb802ff13d5ca32ef06166cce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When BR2_UCLIBC_INSTALL_UTILS is enabled, utils such as getconf, ldd,
locale get installed to TARGET_DIR. However, they do not get installed
to STAGING_DIR, which is annoying as it means that they are not part
of external toolchains built by Buildroot.

This commit adjusts the uclibc package to make sure those tools also
get installed to STAGING_DIR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index dea5445b16..69eb73510e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -449,6 +449,14 @@ define UCLIBC_INSTALL_UTILS_TARGET
 		PREFIX=$(TARGET_DIR) \
 		utils install_utils
 endef
+
+define UCLIBC_INSTALL_UTILS_STAGING
+	$(MAKE1) -C $(@D) \
+		CC="$(TARGET_CC)" CPP="$(TARGET_CPP)" LD="$(TARGET_LD)" \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
+		PREFIX=$(STAGING_DIR) \
+		utils install_utils
+endef
 endif
 
 define UCLIBC_INSTALL_TARGET_CMDS
@@ -479,6 +487,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
 		RUNTIME_PREFIX=/ \
 		install_runtime install_dev
 	$(UCLIBC_INSTALL_HOST_UTILS)
+	$(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
 # Checks to give errors that the user can understand
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
