Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4492EC5475B
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 11:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1292E834F5;
	Fri,  8 Mar 2024 11:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wQcQaHuAUZ-W; Fri,  8 Mar 2024 11:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9677A83576
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9677A83576;
	Fri,  8 Mar 2024 11:32:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49A141BF99A
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E0F831EF
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYJ1Yh2j1xw9 for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6129B83145
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6129B83145
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CFDF83B92; Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Mar 2024 12:28:19 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 52106d80350f6e3e52802c320a894dddb20e6e39
X-Git-Newrev: 4714693bebba23f8ccda810f5912b742840f7ade
X-Patchwork-Hint: ignore
Message-Id: <20240308113207.4CFDF83B92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/gnupg2: security
 bump to version 2.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4714693bebba23f8ccda810f5912b742840f7ade
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

See release announce:
https://lists.gnupg.org/pipermail/gnupg-announce/2024q1/000481.html

For the details about the security advisory for GnuPG created
smartcard keys, see:
https://gnupg.org/blog/20240125-smartcard-backup-key.html

This commit also drops the package patch, which is now included in
this new version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bdcd5adf39186e8c67a2b55c05a67fd45bc04110)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ble-the-call-of-ks_ldap_help_variables-wh.patch | 36 ----------------------
 package/gnupg2/gnupg2.hash                         |  4 +--
 package/gnupg2/gnupg2.mk                           |  2 +-
 3 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch b/package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch
deleted file mode 100644
index 53dd39cf47..0000000000
--- a/package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From dc13361524c1477b2106c7385f2059f9ea111b84 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Wed, 5 Jul 2023 09:29:54 +0900
-Subject: [PATCH] dirmngr: Enable the call of ks_ldap_help_variables when
- USE_LDAP.
-
-* dirmngr/server.c [USE_LDAP] (cmd_ad_query): Conditionalize.
-
---
-
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-
-Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=dc13361524c1477b2106c7385f2059f9ea111b84
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- dirmngr/server.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/dirmngr/server.c b/dirmngr/server.c
-index 51a149cb2..ee61f63d6 100644
---- a/dirmngr/server.c
-+++ b/dirmngr/server.c
-@@ -2776,7 +2776,9 @@ cmd_ad_query (assuan_context_t ctx, char *line)
- 
-   if (opt_help)
-     {
-+#if USE_LDAP
-       ks_ldap_help_variables (ctrl);
-+#endif
-       err = 0;
-       goto leave;
-     }
--- 
-2.11.0
-
diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 4b770fa520..c821afb55e 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  79a60c8e415e3daaa33d0546398174252a56f7ac  gnupg-2.4.3.tar.bz2
-sha256  a271ae6d732f6f4d80c258ad9ee88dd9c94c8fdc33c3e45328c4d7c126bd219d  gnupg-2.4.3.tar.bz2
+sha1  228b3984325fdeebc5e3f2d165c6419a5ebc28de  gnupg-2.4.4.tar.bz2
+sha256  67ebe016ca90fa7688ce67a387ebd82c6261e95897db7b23df24ff335be85bc6  gnupg-2.4.4.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index d21c1e242d..986da4790c 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.3
+GNUPG2_VERSION = 2.4.4
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
