Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87206CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E3A241262;
	Fri,  5 Jun 2026 12:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21AXqJORHWsS; Fri,  5 Jun 2026 12:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E3484129E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663210;
	bh=ElJTgAobZfgJqpboJ/HSJWRCfQu7rM1wSz0o/6rL0/g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Cqd4/FYPSKcjdCdB/1BQ3JWeZ0IK+7V2p/Agz7ZLF84PbIBQG0WXDk2auSHpqS0gc
	 TQwaGiEURS95rAOfmDedFM4gMhz+anbQex+kScwV9Zx1gNXDVK2kUtWcTZ6CEkopuR
	 B3UfFg5E+iQSeS6CQ8b3SWsdaLvTx6tzdwp5k5GffkErWLzV9STU/ajKAmfbRvsVeW
	 +uyOpVQMxwQMGBhWS0fwXVWOWrtLMSMsq/UJVPPMYte4VQJwZEhXmlMPqCOG1pKJLt
	 Qgpr3Mmpj5/NCYABpd8gFLEZvqtdnAysHZ9nfjdRrVSOwbAjF3R4xeqJn2j37oAGhD
	 yQ9SEyWrihC/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E3484129E;
	Fri,  5 Jun 2026 12:40:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3993B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4A054100C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DBDqcN9qozE for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11D6D41021
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11D6D41021
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39F1187B3B; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:06:30 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 81570acfb4f0bca27ace5a8088ab888fa9213853
X-Git-Newrev: 938478b64d6129ae90990d2a4815f427801bb4c0
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.39F1187B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/collectd: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/938478b64d6129ae90990d2a4815f427801bb4c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
index 127bcace6d..d1ed36ef5e 100644
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
