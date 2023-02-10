Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9787CC05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDF0860E52;
	Fri, 10 Feb 2023 22:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDF0860E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3d5xAtRJBpT; Fri, 10 Feb 2023 22:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5ACF6077D;
	Fri, 10 Feb 2023 22:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5ACF6077D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0841BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22D8341B36
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22D8341B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKWR8Q-6Fw0a for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F22A441A17
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F22A441A17
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0E9D84FC8; Fri, 10 Feb 2023 22:10:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:05:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 406698de03a9c9e4ded5a50070de2249398380ff
X-Git-Newrev: 0f868e97f6b42ccaa0844880775f86002656227d
X-Patchwork-Hint: ignore
Message-Id: <20230210221004.E0E9D84FC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: bump to version 2.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f868e97f6b42ccaa0844880775f86002656227d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See announce:
https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000477.html

This commit also drop a patch which is now included in the new version.
See:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=7011286ce6e1fb56c2989fdafbd11b931c489faa

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnupg2/0001-ks_ldap_free_state.patch | 21 ---------------------
 package/gnupg2/gnupg2.hash                   | 10 +++++-----
 package/gnupg2/gnupg2.mk                     |  2 +-
 3 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/package/gnupg2/0001-ks_ldap_free_state.patch b/package/gnupg2/0001-ks_ldap_free_state.patch
deleted file mode 100644
index fa55d27c04..0000000000
--- a/package/gnupg2/0001-ks_ldap_free_state.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-
-Fix undefined reference to `ks_ldap_free_state' if OpenLDAP is not
-installed
-
-Backported from: 7011286ce6e1fb56c2989fdafbd11b931c489faa
-
-Signed-off-by: Michael Fischer <mf@go-sys.de>
-
---- a/dirmngr/server.c
-+++ b/dirmngr/server.c
-@@ -3137,8 +3137,10 @@ start_command_handler (assuan_fd_t fd, unsigned int session_id)
-                ctrl->refcount);
-   else
-     {
-+#if USE_LDAP
-       ks_ldap_free_state (ctrl->ks_get_state);
-       ctrl->ks_get_state = NULL;
-+#endif
-       release_ctrl_ocsp_certs (ctrl);
-       xfree (ctrl->server_local);
-       dirmngr_deinit_default_ctrl (ctrl);
diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index f9c071ad45..c642862fe2 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000476.html
-sha1  1f31b7b4c9c9adad97f94ea3acf1aa64c0424bcc  gnupg-2.3.8.tar.bz2
+# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000477.html
+sha1  63dde155a8df0d5e1987efa5fc17438beca83ac1  gnupg-2.4.0.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.8.tar.bz2.sig
-# using key 6DAA6E64A76D2840571B4902528897B826403ADA and AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD
-sha256  540b7a40e57da261fb10ef521a282e0021532a80fd023e75fb71757e8a4969ed  gnupg-2.3.8.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.0.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA
+sha256  1d79158dd01d992431dd2e3facb89fdac97127f89784ea2cb610c600fb0c1483  gnupg-2.4.0.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 9dc29ca99e..5935ce6939 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.3.8
+GNUPG2_VERSION = 2.4.0
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
