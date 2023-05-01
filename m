Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AF4C77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 17:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68AFC613E5;
	Mon,  1 May 2023 17:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68AFC613E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTpUgn9UNYBo; Mon,  1 May 2023 17:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EF3C613E8;
	Mon,  1 May 2023 17:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EF3C613E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 825271BF41C
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 17:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68EB260AA6
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 17:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68EB260AA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id raeke21dFtOw for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 17:42:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AC8D613D8
 for <buildroot@buildroot.org>; Mon,  1 May 2023 17:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AC8D613D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 296F985232; Mon,  1 May 2023 17:42:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 19:41:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 082244179dcbdfbbf60f8cbf3e24ee7c3c736ae1
X-Git-Newrev: 8520da532b5ce366c10eb22dbbe65bf2f85ff072
X-Patchwork-Hint: ignore
Message-Id: <20230501174248.296F985232@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: update help links
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8520da532b5ce366c10eb22dbbe65bf2f85ff072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When browsing the help references for various systemd features, it was
observed that the `systemd-rfkill` link was dead (originally pointing to
`systemd-rfkill@.service.html`; now `systemd-rfkill.service.html`). This
commit corrects this link, as well as updates all other links to https
(since freedesktop.org now force redirects to https).

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 9f4d933779..bea717a456 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -100,7 +100,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  the apropriate ones (e.g. e2fsck, from the e2fsprogs
 	  package) according to the system configuration.
 
-	  http://freedesktop.org/wiki/Software/systemd
+	  https://freedesktop.org/wiki/Software/systemd/
 
 if BR2_PACKAGE_SYSTEMD
 
@@ -185,7 +185,7 @@ config BR2_PACKAGE_SYSTEMD_BACKLIGHT
 	  systemd-backlight is a service that restores the display
 	  backlight brightness at early boot and saves it at shutdown.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-backlight@.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-backlight@.service.html
 
 config BR2_PACKAGE_SYSTEMD_BINFMT
 	bool "enable binfmt tool"
@@ -202,7 +202,7 @@ config BR2_PACKAGE_SYSTEMD_COREDUMP
 	  kernel when a user space program receives a fatal signal and
 	  dumps core.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-coredump.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-coredump.html
 
 config BR2_PACKAGE_SYSTEMD_PSTORE
 	bool "enable pstore support"
@@ -220,7 +220,7 @@ config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 	  systemd-firstboot initializes the most basic system settings
 	  interactively on the first boot.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-firstboot.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-firstboot.html
 
 config BR2_PACKAGE_SYSTEMD_HIBERNATE
 	bool "enable hibernation support"
@@ -229,7 +229,7 @@ config BR2_PACKAGE_SYSTEMD_HIBERNATE
 	  When this features is enabled, additional tools and services
 	  are built to support suspending and resuming the system.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-sleep.html
 
 config BR2_PACKAGE_SYSTEMD_HOMED
 	bool "enable home daemon"
@@ -261,7 +261,7 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	  systemd-hostnamed is a system service that may be used as a
 	  mechanism to change the system's hostname.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
 
 config BR2_PACKAGE_SYSTEMD_HWDB
 	bool "enable hwdb installation"
@@ -286,7 +286,7 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 	  machine and container images for systemd-machined and
 	  machinectl.
 
-	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
+	  https://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
 config BR2_PACKAGE_SYSTEMD_CATALOGDB
 	bool "enable journal catalog database installation"
@@ -309,14 +309,14 @@ config BR2_PACKAGE_SYSTEMD_LOCALED
 	  mechanism to change the system locale settings, as well as
 	  the console key mapping and default X11 key mapping.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
 
 config BR2_PACKAGE_SYSTEMD_LOGIND
 	bool "enable login daemon"
 	help
 	  systemd-logind is a system service that manages user logins.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
 
 config BR2_PACKAGE_SYSTEMD_MACHINED
 	bool "enable machine daemon"
@@ -325,7 +325,7 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 	  virtual machines and containers, and processes belonging to
 	  them.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
 
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
@@ -336,7 +336,7 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	  primarily providing hostname resolution for the locally
 	  configured system hostname as returned by gethostname(2).
 
-	  http://www.freedesktop.org/software/systemd/man/nss-myhostname.html
+	  https://www.freedesktop.org/software/systemd/man/nss-myhostname.html
 
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
@@ -349,7 +349,7 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 	  This simple network configuration solution is an alternative
 	  to dhcpcd or ISC dhcp.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
 config BR2_PACKAGE_SYSTEMD_OOMD
 	bool "enable out-of-memory killer"
@@ -373,7 +373,7 @@ config BR2_PACKAGE_SYSTEMD_POLKIT
 	  useful for allowing unprivileged processes to speak to
 	  systemd's many privileged processes.
 
-	  http://wiki.freedesktop.org/www/Software/polkit/
+	  https://wiki.freedesktop.org/www/Software/polkit/
 
 comment "polkit support needs a toolchain with threads, wchar, gcc >= 7"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
@@ -408,7 +408,7 @@ config BR2_PACKAGE_SYSTEMD_QUOTACHECK
 	  file systems are mounted. It is pulled in only if at least
 	  one file system has quotas enabled.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
 
 config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 	bool "enable random-seed support"
@@ -418,7 +418,7 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 	  shutdown. Saving/restoring the random seed across boots
 	  increases the amount of available entropy early at boot.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
 
 config BR2_PACKAGE_SYSTEMD_REPART
 	bool "enable repart support"
@@ -440,7 +440,7 @@ config BR2_PACKAGE_SYSTEMD_RESOLVED
 	  caching and validating DNS/DNSSEC stub resolver, as well as
 	  an LLMNR resolver and responder.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-resolved.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-resolved.html
 
 config BR2_PACKAGE_SYSTEMD_RFKILL
 	bool "enable rfkill tools"
@@ -448,7 +448,7 @@ config BR2_PACKAGE_SYSTEMD_RFKILL
 	  systemd-rfkill is a service that restores the RF kill switch
 	  state at early boot and saves it at shutdown.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-rfkill@.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-rfkill.service.html
 
 config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	bool "enable SMACK support"
@@ -503,7 +503,7 @@ config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	  systemd-sysusers creates system users and groups, based on
 	  the file format and location specified in sysusers.d(5).
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
 
 config BR2_PACKAGE_SYSTEMD_TIMEDATED
 	bool "enable timedate daemon"
@@ -513,7 +513,7 @@ config BR2_PACKAGE_SYSTEMD_TIMEDATED
 	  mechanism to change the system clock and timezone, as well
 	  as to enable/disable NTP time synchronization.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
 
 config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	bool "enable timesync daemon"
@@ -526,7 +526,7 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	  This simple NTP solution is an alternative to sntp/ntpd from
 	  the ntp package.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
 
 config BR2_PACKAGE_SYSTEMD_USERDB
 	bool "enable userdb daemon"
@@ -567,6 +567,6 @@ config BR2_PACKAGE_SYSTEMD_VCONSOLE
 	  systemd-vconsole-setup is an early boot service that
 	  configures the virtual console font and console keymap.
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
