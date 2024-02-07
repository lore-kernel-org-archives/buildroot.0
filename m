Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF55C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A532401BB;
	Wed,  7 Feb 2024 19:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZsihVcqHiQH; Wed,  7 Feb 2024 19:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCE3A4022B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCE3A4022B;
	Wed,  7 Feb 2024 19:50:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 876001BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7492C400E7
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-in2oHKwPhn for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 978BD400DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 978BD400DF
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82965876D0; Wed,  7 Feb 2024 19:50:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 20:48:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f7bd4ef67013e3f94f91e0c5be4e2dc950d5bae
X-Git-Newrev: bdcd5adf39186e8c67a2b55c05a67fd45bc04110
X-Patchwork-Hint: ignore
Message-Id: <20240207195030.82965876D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: security bump to version
 2.4.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bdcd5adf39186e8c67a2b55c05a67fd45bc04110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release announce:
https://lists.gnupg.org/pipermail/gnupg-announce/2024q1/000481.html

For the details about the security advisory for GnuPG created
smartcard keys, see:
https://gnupg.org/blog/20240125-smartcard-backup-key.html

This commit also drops the package patch, which is now included in
this new version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
