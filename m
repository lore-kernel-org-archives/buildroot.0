Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A9EC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDCD640227;
	Thu,  2 May 2024 07:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trmm2KcXmctB; Thu,  2 May 2024 07:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 976DF40792
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 976DF40792;
	Thu,  2 May 2024 07:45:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A47A21BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ED1360DF9
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9dp2z0ZwmMw for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04F2E60E00
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04F2E60E00
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFCB686587; Thu,  2 May 2024 07:45:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 09:44:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c1b31ff1a0793e44a8ab6d057ff2e80c14a1e1f
X-Git-Newrev: 7e3963cb5e0cbabacb27f763c4ad9e283ecae4fe
X-Patchwork-Hint: ignore
Message-Id: <20240502074550.DFCB686587@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: enable on uclibc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7e3963cb5e0cbabacb27f763c4ad9e283ecae4fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package was disabled with commit
8035ea0a712eaa16d2ac96cd29db0e8726b0f685 because of missing features
in uClibc-ng. In uClibc-ng 1.0.47 the missing feature were added,
so enable shadow again.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shadow/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index 987605c7fa..bbbea811ce 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -2,7 +2,6 @@ menuconfig BR2_PACKAGE_SHADOW
 	bool "shadow"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # reallocarray, explicit_bzero
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Utilities to deal with user accounts.
@@ -57,6 +56,5 @@ config BR2_PACKAGE_SHADOW_YESCRYPT
 
 endif # BR2_PACKAGE_SHADOW
 
-comment "shadow needs a glibc or musl toolchain w/ headers >= 4.14, dynamic library"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || \
-		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC
+comment "shadow needs a toolchain w/ headers >= 4.14, dynamic library"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
