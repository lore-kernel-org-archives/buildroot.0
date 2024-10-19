Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC9BD3C92D
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 20:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8DFF4051E;
	Sat, 19 Oct 2024 20:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOhFHomVKkXz; Sat, 19 Oct 2024 20:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A769F40520
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A769F40520;
	Sat, 19 Oct 2024 20:16:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BBD43A23
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1329780D5E
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSpB_WS1pX2m for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 20:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 194F680D5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 194F680D5C
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:16:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0639986085; Sat, 19 Oct 2024 20:16:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Oct 2024 22:07:38 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 3d4930311871bcf7db91080991159d2d8262eb4c
X-Git-Newrev: 57094b432210cd9e543563a87fff7b9074de5897
X-Patchwork-Hint: ignore
Message-Id: <20241019201637.0639986085@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/linux-pam: remove
 flex dependency
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
Content-Type: multipart/mixed; boundary="===============5270768336751366597=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5270768336751366597==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=57094b432210cd9e543563a87fff7b9074de5897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

linux-pam 1.2.0 removed the use of yywrap, so the flex dependency is not
needed now (host-flex is still needed).

Fixes: #47
Signed-off-by: Damien Thébault <damien.thebault@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 600e273487baf76d4469bca43d42bd2c4b364db8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-pam/Config.in    | 1 -
 package/linux-pam/linux-pam.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 1aa9045333..6b08a9c4c2 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LINUX_PAM
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
-	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  A Security Framework that Provides Authentication for
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 1433eb00b3..a5b8c9151f 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -16,7 +16,7 @@ LINUX_PAM_CONF_OPTS = \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
 	--libdir=/lib
-LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf \
+LINUX_PAM_DEPENDENCIES = host-flex host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(TARGET_NLS_DEPENDENCIES)
 LINUX_PAM_LICENSE = BSD-3-Clause

--===============5270768336751366597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5270768336751366597==--
