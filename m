Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FDDCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8FAA40FDC;
	Fri,  5 Jun 2026 12:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNTzKuIg8adv; Fri,  5 Jun 2026 12:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F160240FD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663121;
	bh=KCADK0R0Lm+gii0rCVVRRdJowM+rhNm7Mf++i/UC4nA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zs4gwLIRiVYiQuS0oxvp+QveqzfRUXPoh040LhpgjW/zlUWA6SxdHbI8ZNIoTDYDR
	 Mb+sgJTFV+/oRzRw5ZyJXYnKTOy50YrJdgTfonffwW4Q4b475CQ8YFCo1ebyul/LwU
	 9Kv8iFkusu5iHp2biKrQV6+rhOdBP2i1WwTtM6Cf/BXQe49ZTgLB5PkDM4GSn1wvK1
	 0pyDeckzm7qVX+yGJ1aPznu74ZgzSDgDVyEStO4EyHd2ZE/ZHikxqUPr/XxnT1f7ic
	 cW3EDJIVdHO26crr/endrlfVmjxEe2koHUvuobIYjCUVBr7mFClU/qxWaOiSI9WIfE
	 uFMUspT9GWxaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F160240FD5;
	Fri,  5 Jun 2026 12:38:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FA1FF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CEBA81E9E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KA84ISTkJwlm for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 420F481EA4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 420F481EA4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C51B87B3F; Fri,  5 Jun 2026 12:37:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:06:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1710cacb993510b8fa54d79b509ac1b352cc2cf2
X-Git-Newrev: eeb3e6e13ffae43aa7cdcdba9fde3b99fc5da36c
X-Patchwork-Hint: ignore
Message-Id: <20260605123713.6C51B87B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/collectd: fix
 wchar dependency of mariadb
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eeb3e6e13ffae43aa7cdcdba9fde3b99fc5da36c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fmt depends on BR2_USE_WCHAR since its introduction in 2017 by buildroot
commit 81fe75c855f9a598695f83b7384713820383efe4.

Buildroot commit 821f9dee8112dc02fe58d60273d0dfdabbc46d1f added fmt as
dependency to mariadb in July 2023, including the wchar dependency.

Buildroot commit 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 from March
2024, which replaced the mysql virtual package with mariadb, causes
build errors due to the wchar dependency not being propagated.

Fixes:
https://autobuild.buildroot.net/results/ef2/ef201a7d04330463ce46b93e6d5702dfefc6ad6c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 58b9eb270e47db8ba25ebc703ead84367b36d707)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/collectd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 6568aa1d7b..59ca62867b 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -393,15 +393,17 @@ config BR2_PACKAGE_COLLECTD_MYSQL
 	bool "mysql"
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_USE_MMU # mysql
+	depends on BR2_USE_WCHAR # fmt -> mariadb
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
 	select BR2_PACKAGE_MARIADB
 	help
 	  Connects to a MySQL database and issues a "show status"
 	  command.
 
-comment "mysql needs a toolchain w/ C++, threads"
+comment "mysql needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
 
 config BR2_PACKAGE_COLLECTD_NETLINK
 	bool "netlink"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
