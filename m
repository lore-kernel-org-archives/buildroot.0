Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CFDFCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D9F741EC9;
	Fri,  6 Mar 2026 19:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nl8Dx2xF13gc; Fri,  6 Mar 2026 19:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03A2941EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826677;
	bh=/EPTZ8A/r0JOVWXjdxWD9em6N7e+rSsVIJfh3eLmXyE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r8HMDiQQmqisdMX1kYnIYMjSwYUIkkAqnVAtfAsFqXMVaJdFTMdZEnbYL1TjmxqOm
	 eM1kaK7wsgShE+7ejIKSiuAJi4GUaBzT5YRNXypgnwyH2ex3Ci0B+jUNWjc6QrPfaA
	 BExDDR4ZxRVc6FRLqreNNz1XaJKGCmsHllTHG2w3djBbjCV9/aJamnPf/PdlceHQY0
	 aWwqXnpoMBmF2h6IAY8E0U62CkPKC5ut4HVmTZYe4/kiitOvnh6kSv4H8zKJydXO10
	 mVn5bkzn8L1x5uZKffMys04OEWEfx1AdPNVoBRnh4V2LZOkr+AMb38Zkz3O4wsfThk
	 CK3iMYSU/wu2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A2941EA1;
	Fri,  6 Mar 2026 19:51:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3CF25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCD36613E2
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOvU1SP8QhQd for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E126F613E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E126F613E5
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 027EE841E4; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:09:53 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 75b021969c4c8bd7187415a4a1a433cd175290fd
X-Git-Newrev: b1ff64b8e8fbb8ad172e690eeba2b3df1d8b49fb
X-Patchwork-Hint: ignore
Message-Id: <20260306195051.027EE841E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libvirt: fix
 dependency of lxc support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1ff64b8e8fbb8ad172e690eeba2b3df1d8b49fb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Buildroot commit ed12e2fbed3d4298ebff9da54fe56b91fa75c41e in 2021 added
BR2_PACKAGE_LIBVIRT_LXC which selects BR2_PACKAGE_LXC but did not add
the dependency !BR2_TOOLCHAIN_USES_UCLIBC which was added to lxc in
2019 by buildroot commit 63aad8a53e33e3fae4793e05662f47637e9e9bfc
causing Kconfig warnings:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LXC
  Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y]
    && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]
    && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y]
  Selected by [y]:
  - BR2_PACKAGE_LIBVIRT_LXC [=y] && BR2_PACKAGE_LIBVIRT [=y]
      && BR2_PACKAGE_LIBVIRT_DAEMON [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 88d1fde405054b2f39a5a12531a3a50b32c254db)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libvirt/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 5664f69dd8..0f73128d09 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -89,12 +89,14 @@ comment "qemu needs a toolchain with gcc >= 8"
 config BR2_PACKAGE_LIBVIRT_LXC
 	bool "lxc"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # lxc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lxc
 	select BR2_PACKAGE_LXC
 	help
 	  Linux Container support
 
-comment "lxc needs a toolchain w/ gcc >= 4.7"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+comment "lxc needs a glibc or musl toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		|| BR2_TOOLCHAIN_USES_UCLIBC
 
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
