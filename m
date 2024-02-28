Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EA7C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9F0D416D1;
	Wed, 28 Feb 2024 21:26:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zgYqXClvh7S0; Wed, 28 Feb 2024 21:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0534177A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F0534177A;
	Wed, 28 Feb 2024 21:26:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EC011BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77229416AF
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErSsQ_P4lWkJ for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DC004029B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DC004029B
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C12087CDB; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:01:53 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 47960afe4f47a759cb6a07a7f53e07a085890b51
X-Git-Newrev: 1c93f28c12154478143e2c1757aa44e8f428c172
X-Patchwork-Hint: ignore
Message-Id: <20240228212552.0C12087CDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/syslog-ng: needs
 pcre2, not pcre
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c93f28c12154478143e2c1757aa44e8f428c172
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Syslog-ng-uses pcre2 instead of pcre since 4.3.0 with:
https://github.com/syslog-ng/syslog-ng/commit/cb6de08dc9078644d48ca536b5660e406b1a50d6

No autobuilder failures, as pcre2 is implicitly available through libglib2.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d932f84d9fed1fca22c7bcd1eea382d7c9ea6735)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/Config.in    | 2 +-
 package/syslog-ng/syslog-ng.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index 30ad54a4bf..aa1e71d225 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_OPENSSL
 	help
 	  syslog-ng is an enhanced log daemon, supporting a wide range
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index ff5aaee429..dd02a6e3af 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -12,7 +12,7 @@ SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
 SYSLOG_NG_CPE_ID_VENDOR = oneidentity
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
-	libglib2 openssl pcre
+	libglib2 openssl pcre2
 # We're patching configure.ac
 SYSLOG_NG_AUTORECONF = YES
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
