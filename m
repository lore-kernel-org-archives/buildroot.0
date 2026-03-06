Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5587CFCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D4541F84;
	Fri,  6 Mar 2026 19:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGpwq01yoSva; Fri,  6 Mar 2026 19:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55F3B41F8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826762;
	bh=SHLf1zucaThfeBpm/CHwRr2R2sdfZVhQNj2VRPvlnlk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KG5aUP7Nma1A77pXYJil0M68KJnPCBXeN9p6syVW/9LnLD3jXGzWGF5hN/b/TgrYB
	 XqjLRi5bNb73ihoPDpR2nEtyZf9b7U6s4oQ3SlwRQdlKg03dC/1zoCsSOXBSm0GiJf
	 +Hgptwn/dqMPRJemeCQUrdwhx2CtC/w4sGdG1IcL1JYqVzqlEiW1ZPS2TnKD9G9fhp
	 PhkpLxW9lWxnY++Mt+g0ffQEAtW2IdatLihFVvzLFr6QFLRCKdfOFfZgYIzNjX1zRU
	 EX9bkt4G6sWX5LiVClo13Q8N/xebsxHsoQHkJt3yat0rjM3sPC389dRYdRepB3Bdqo
	 XiVX3XYELaPNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F3B41F8E;
	Fri,  6 Mar 2026 19:52:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2157E39B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E46983478
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbLQxU80MM-Y for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26C0281E88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26C0281E88
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C9947FB67; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:09:50 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 568fd8e6a3ed9a65df08228cd8aab777f2fb80db
X-Git-Newrev: 455af70596923a5eab63b6590a2c69207d5ca68e
X-Patchwork-Hint: ignore
Message-Id: <20260306195223.3C9947FB67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libvirt: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/455af70596923a5eab63b6590a2c69207d5ca68e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
