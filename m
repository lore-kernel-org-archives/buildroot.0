Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D92D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE76F40B9B;
	Tue, 13 Jan 2026 19:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JqAexyoGUgY; Tue, 13 Jan 2026 19:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB6B40C72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333310;
	bh=UlZS1eDn1gYqgE5Um/GFh0T83fqH7NCPFG2+4mXFADE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PcMrpHKT//mjKTrcg/w+CmzenvQpmU6bEDlv9RmukSfIRJl5yf1GmUoO7fmEtnuM0
	 SHhH/vX8e488yY8QEmPwJjFcvaSSeeg6lYEMaHL152CmPWyI/KlkFmVokwaT7oN2Cd
	 5sIldP06rmMP0yfpO3cObqHRUjTmx1MiENL0yPjtm4BXF8uPXM21IFa0BysRSBk9Sd
	 2jBTJ3g4vvxXNNh2Fa6C2y4TYnTIUN/TYqeVwgApZ7RhMDGv4gqE8s7UbsfHJ3gCQC
	 0y0tvIKt718DiVbMRp/A3kI/kLmHTGgFv8mpXfpmXla3OdNygBjIE+vRiXwR4cIUVa
	 60DFITSS9+CbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAB6B40C72;
	Tue, 13 Jan 2026 19:41:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D9B12CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB1CB830FB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkA-j0TF3LVU for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17660831B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17660831B0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 152FC82271; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:22:34 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b8638757b29fee4a2dbcdb4c0ee5cd27dcf67569
X-Git-Newrev: 09e77d09bbc950bbe855db8d64be98b178f7ce1b
X-Patchwork-Hint: ignore
Message-Id: <20260113194035.152FC82271@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 package/mender-update-modules: fix dependencies of
 BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
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

commit: https://git.buildroot.net/buildroot/commit/?id=09e77d09bbc950bbe855db8d64be98b178f7ce1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since this option was introduced in commit
a474642fdcd8c69e12126bbe8304479aa855d916 ("package/mender-update-modules:
new package"), its dependencies have been incorrect. It selects
BR2_PACKAGE_PYTHON3 without replicating all its dependencies, so we
fix that.

Also, it did have the !BR2_STATIC_LIBS dependency propagated, but not
mentioned in the Config.in comment, so we fix that as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7571ee4a3697106b8938a83116a6e305dffbc3aa)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mender-update-modules/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 1158bb42b2..88e0805976 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -173,6 +173,8 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
 	bool "rootfs version check"
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_USE_MMU # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
 	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_PYTHON3 # runtime
@@ -195,8 +197,10 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/rootfs-version-check
 
-comment "rootfs version check needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "rootfs version check needs a toolchain w/ threads, dynamic library, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
 	bool "rpm"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
