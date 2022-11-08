Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B56C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFB6A40A6E;
	Tue,  8 Nov 2022 20:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFB6A40A6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qS0J2ehcdVqQ; Tue,  8 Nov 2022 20:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34506408D1;
	Tue,  8 Nov 2022 20:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34506408D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD7231BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9886741746
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9886741746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAw2T7dn7C4Z for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 20:03:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50CE240234
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 20:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50CE240234
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F17980D9C; Tue,  8 Nov 2022 20:03:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 20:59:11 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 17b69b36f00821f2fe78e4ed4dbfd27f0d4482b3
X-Git-Newrev: 09322d970b1f5486aa2f146dcfd9123debbb9de0
X-Patchwork-Hint: ignore
Message-Id: <20221108200321.3F17980D9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/samba4: security
 bump version to 4.15.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=09322d970b1f5486aa2f146dcfd9123debbb9de0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Added patch from Gentoo to fix uClibc build:
access.c:(.text+0x1e8): undefined reference to `innetgr'

Release notes:
https://www.samba.org/samba/history/samba-4.15.8.html

https://www.samba.org/samba/history/samba-4.15.9.html
o CVE-2022-2031:  Samba AD users can bypass certain restrictions associated with
                  changing passwords.
                  https://www.samba.org/samba/security/CVE-2022-2031.html

o CVE-2022-32744: Samba AD users can forge password change requests for any user.
                  https://www.samba.org/samba/security/CVE-2022-32744.html

o CVE-2022-32745: Samba AD users can crash the server process with an LDAP add
                  or modify request.
                  https://www.samba.org/samba/security/CVE-2022-32745.html

o CVE-2022-32746: Samba AD users can induce a use-after-free in the server
                  process with an LDAP add or modify request.
                  https://www.samba.org/samba/security/CVE-2022-32746.html

o CVE-2022-32742: Server memory information leak via SMB1.
                  https://www.samba.org/samba/security/CVE-2022-32742.html

https://www.samba.org/samba/history/samba-4.15.10.html

https://www.samba.org/samba/history/samba-4.15.11.html
o CVE-2022-3437:  There is a limited write heap buffer overflow in the GSSAPI
                  unwrap_des() and unwrap_des3() routines of Heimdal (included
                  in Samba).
                  https://www.samba.org/samba/security/CVE-2022-3437.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8941d02bf1da1574b8db65a104566a080e85308b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...05-samba-4.16.2-fix-build-without-innetgr.patch | 34 ++++++++++++++++++++++
 package/samba4/samba4.hash                         |  4 +--
 package/samba4/samba4.mk                           |  2 +-
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/package/samba4/0005-samba-4.16.2-fix-build-without-innetgr.patch b/package/samba4/0005-samba-4.16.2-fix-build-without-innetgr.patch
new file mode 100644
index 0000000000..b338596d7a
--- /dev/null
+++ b/package/samba4/0005-samba-4.16.2-fix-build-without-innetgr.patch
@@ -0,0 +1,34 @@
+# Gentoo bug 855047
+
+Fixes uClibc build when uClibc was build without netgroup support.
+Upstream enables netgroup support based on getdomainname() being
+present:
+https://github.com/samba-team/samba/commit/f179184a2be2ddd38f463fcc12252f8d24e529f8#diff-b8d1bc25b89846e70ecb61cb296a8f5c50c9a0a1b62e46790fae81aa9d5bfaaeR632
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/net-fs/samba/files/samba-4.16.2-fix-musl-without-innetgr.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/lib/util/access.c
++++ b/lib/util/access.c
+@@ -115,7 +115,7 @@ static bool string_match(const char *tok,const char *s)
+ 			return true;
+ 		}
+ 	} else if (tok[0] == '@') { /* netgroup: look it up */
+-#ifdef HAVE_NETGROUP
++#if defined(HAVE_NETGROUP) && defined(HAVE_INNETGR)
+ 		DATA_BLOB tmp;
+ 		char *mydomain = NULL;
+ 		char *hostname = NULL;
+--- a/source3/auth/user_util.c
++++ b/source3/auth/user_util.c
+@@ -135,7 +135,7 @@ static void store_map_in_gencache(TALLOC_CTX *ctx, const char *from, const char
+
+ bool user_in_netgroup(TALLOC_CTX *ctx, const char *user, const char *ngname)
+ {
+-#ifdef HAVE_NETGROUP
++#if defined(HAVE_NETGROUP) && defined(HAVE_INNETGR)
+ 	char nis_domain_buf[256];
+ 	const char *nis_domain = NULL;
+ 	char *lowercase_user = NULL;
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index ac28c35614..f845a31290 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.15.7.tar.asc
-sha256  76d0096c16ed0265b337d5731f3c0b32eed3adab6fa8b7585c055b287cd05d6b  samba-4.15.7.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.15.11.tar.asc
+sha256  2f305980d49c7723cbef281fff2b81a2eeafae51e58b5172bb43d9693ef8953b  samba-4.15.11.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c90fdd006c..814bf0bbaa 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.15.7
+SAMBA4_VERSION = 4.15.11
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
