Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83134CD6E55
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95F7D6F58D;
	Sat, 30 May 2026 14:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mydK-zbkWgTu; Sat, 30 May 2026 14:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5B3661C13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149707;
	bh=6whvMyeRpufXaFKcez23Dpj1HA3X+x9n+t6iJ7n4/+w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fdLlpW969Hf8It6cNglxpugOrqv3R/+KrQ2TrUO/kHv6nKQhEXFl907U3byn9giHn
	 ASnxj67bW2fHCj8Kq5zzlf3aWLrTZCN+Tyr1eKZ9z22tUH11leh+JzI/kbplAtDTds
	 Wqo/Q1VLBBGYHELKiBDd5t93foPnJoIkxXy9T3vS8F78zLlZ5ue4I2x/xhkwHc2fre
	 A3SratvC6JzEtJHrU6H7WoZyHq+l/7lqGd0TFxDRyNXJvyu3hQsitg1UcbAyWWiiFz
	 xRzLifPyzMEC9VIIIHwUpVBMZfUYkEWlmpFe7Q3h8NX987Fkm+QW3rwUnI0cItFMf2
	 APQ7390p+hfmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5B3661C13;
	Sat, 30 May 2026 14:01:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4589712F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36B4B40C09
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0HgjK4kq67Q for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 821FD40BBF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 821FD40BBF
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:01:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 743C78750A; Sat, 30 May 2026 14:01:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 16:01:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8c54ffb3d1b92b7e8744824ca0f28fe0d19440d
X-Git-Newrev: 58b9eb270e47db8ba25ebc703ead84367b36d707
X-Patchwork-Hint: ignore
Message-Id: <20260530140133.743C78750A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectd: fix wchar dependency of
 mariadb
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58b9eb270e47db8ba25ebc703ead84367b36d707
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
