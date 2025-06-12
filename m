Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1CFC7114A
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21D7F40BC6;
	Thu, 12 Jun 2025 20:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9dqSoUE6P697; Thu, 12 Jun 2025 20:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39D6D40BC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39D6D40BC9;
	Thu, 12 Jun 2025 20:13:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D7ED183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F392409AF
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_x43d5tmDto for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 222E640933
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 222E640933
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 208AA8354A; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:41:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 776bbc3d1c07a58092434f6c9c6ec04fef402fda
X-Git-Newrev: 86e01fe7ccbc4df14daf8300c61e5702ea6053bc
X-Patchwork-Hint: ignore
Message-Id: <20250612201230.208AA8354A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dovecot: add
 missing mariadb dependencies for mysql support
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

commit: https://git.buildroot.net/buildroot/commit/?id=86e01fe7ccbc4df14daf8300c61e5702ea6053bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Buildroot commit [1] removed mysql and replaced it by mariadb in all
packages, but did not propagated all dependencies.

This commit fixes the issue.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_MARIADB
      Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && (BR2_TOOLCHAIN_HAS_ATOMIC [=n] || BR2_TOOLCHAIN_HAS_SYNC_8 [=n]) && BR2_USE_WCHAR [=y]
      Selected by [y]:
      - BR2_PACKAGE_DOVECOT_MYSQL [=y] && BR2_PACKAGE_DOVECOT [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/8708f3a23a7e28fdb04fc57406e13e6b7ff4a337

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6967ed93b6fcefd5f4cd5ad12ce80dfb63e1200f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dovecot/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 517040fad6..e109ce6be8 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -21,12 +21,16 @@ config BR2_PACKAGE_DOVECOT_MYSQL
 	bool "mysql support"
 	depends on BR2_INSTALL_LIBSTDCPP # mariadb
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mariadb
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mariadb
+	depends on BR2_USE_WCHAR # mariadb
 	select BR2_PACKAGE_MARIADB
 	help
 	  Enable MySQL support.
 
-comment "mysql support needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "mysql support needs a toolchain w/ C++, threads, wchar"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
 
 config BR2_PACKAGE_DOVECOT_SQLITE
 	bool "sqlite support"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
