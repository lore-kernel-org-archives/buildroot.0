Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B428FCA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 06:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 554B041202;
	Mon,  1 Sep 2025 06:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6ehfbDN0p2a; Mon,  1 Sep 2025 06:09:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B76B41175
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B76B41175;
	Mon,  1 Sep 2025 06:09:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A4E10E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 268974019B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36Hc_9UKgbq9 for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 06:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6809B400D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6809B400D7
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:09:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E2FD7FB20; Mon,  1 Sep 2025 06:09:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 Aug 2025 18:16:47 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 5d46fcafe60f216126d3f396f73c60a0df694e6a
X-Git-Newrev: c685f32fb114d18261ff120c53135e140ccc9b7f
X-Patchwork-Hint: ignore
Message-Id: <20250901060919.5E2FD7FB20@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/systemd: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=c685f32fb114d18261ff120c53135e140ccc9b7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since 256.12 systemd-networkd requires kernel >=5.4 due to the inclusion of
the sockios.h header, which uses the SIOCGSTAMP_OLD macro.

The same change has already been applied to master/2025.08 in
7d8d48cd2ba1396ea146e94020939f4dfe08c5cb

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
(cherry picked from commit 74f84ce53181ec5df006150c859a3e76f54b618d)
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
