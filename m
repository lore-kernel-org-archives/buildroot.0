Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61CACA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 06:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62A68607E6;
	Mon,  1 Sep 2025 06:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZjYxq3a3LBq; Mon,  1 Sep 2025 06:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68F50607D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68F50607D8;
	Mon,  1 Sep 2025 06:07:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A57210E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 707264116A
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFXVITR1r7fY for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 06:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D76A41167
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D76A41167
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:07:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C4A27FAD9; Mon,  1 Sep 2025 06:07:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 Aug 2025 18:15:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7bb7c0a231ab9aff6f5802fff21e60afd1d8dd93
X-Git-Newrev: 74f84ce53181ec5df006150c859a3e76f54b618d
X-Patchwork-Hint: ignore
Message-Id: <20250901060700.6C4A27FAD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/systemd: bump
 required toolchain headers for systemd-networkd
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

commit: https://git.buildroot.net/buildroot/commit/?id=74f84ce53181ec5df006150c859a3e76f54b618d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since 256.12 systemd-networkd requires kernel >=5.4 due to the inclusion of
the sockios.h header, which uses the SIOCGSTAMP_OLD macro.

The same change has already been applied to master/2025.08 in
7d8d48cd2ba1396ea146e94020939f4dfe08c5cb

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/systemd/Config.in | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 851b91aeba..320d416203 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -52,9 +52,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  an elaborate transactional dependency-based service control
 	  logic.  It can work as a drop-in replacement for sysvinit.
 
-	  Kernel versions below 4.15 ("recommended baseline") have
+	  Kernel versions below 5.4 ("recommended baseline") have
 	  significant gaps in functionality and are not recommended
-	  for use with this version of systemd.
+	  for use with this version of systemd. (e.g. lack race-free
+	  process tracking by pidfd, systemd-networkd, and new mount
+	  API support).
 
 	  Systemd requires a Linux kernel >= 3.15 with the following
 	  options enabled:
@@ -354,7 +356,8 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
-	default y
+	default y if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	help
 	  systemd-networkd is a system service that manages networks.
 	  It detects and configures network devices as they appear, as
@@ -365,6 +368,9 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
+comment "systemd-networkd needs a toolchain with kernel headers >= 5.4"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
 config BR2_PACKAGE_SYSTEMD_OOMD
 	bool "enable out-of-memory killer"
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
