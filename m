Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648CDC3DA7A
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 11:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EBB841B8C;
	Fri,  6 Jan 2023 11:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EBB841B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGz9YPCJObbp; Fri,  6 Jan 2023 11:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DC7E41BC1;
	Fri,  6 Jan 2023 11:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DC7E41BC1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1ECC1BF342
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 11:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C77B84049C
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 11:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C77B84049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4cn52WTjofXW for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 11:11:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44F29402E0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44F29402E0
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 11:11:51 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.3.197])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EDC61B0053E;
 Fri,  6 Jan 2023 12:11:46 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  6 Jan 2023 12:11:41 +0100
Message-Id: <20230106111141.325627-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673003508;
 bh=BCv3EK1RGitXC4FegArE4MCtMpnswHL/MZSpT/CDCvU=;
 h=From:To:Cc:Subject:Date:From;
 b=seayN7myrAeTlNFbiRc81BiVnYy9RQ9KjbgwJR/vQqtHEyrNCJHds752hHN5fDnRL
 dElCU2ealAqJxv8PjjGudrx4GK94/E8+VohCJZQh2JI6rt4j5JjLh9ZludjhvrXfvk
 Wka0eQOpD8petdf5vbIzTR86+VFVfSbwDFr399GS9B819UWuCvYdpsFWWDvxIX7uhW
 jRcSAE6dHDinPErTBBO35YgXhmnSbvcy2jNJqxARUrngJK1+CpbcvhhbNOyVUkmv5q
 MXvUo7cJTTMYB6PRr7mBN1yazw2cnYRiW/C2V3Ey47ddRQHpNH1ycvuwe6Yq4kVJ+z
 bsrox/Ijj2DFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=seayN7my
Subject: [Buildroot] [PATCH v2 1/1] package/gnupg2: bump to version 2.4.0
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See announce:
https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000477.html

This commit also drop a patch which is now included in the new version.
See:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=7011286ce6e1fb56c2989fdafbd11b931c489faa

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Removed GNUPG2_CONF_ENV, as the better fix is:
https://git.buildroot.org/buildroot/commit/?id=3a22b009992883ad57553ffb3f194303f90ad1a4
---
Tested on top of branch master at commit 3a22b00 with commands:

    make check-package
    ...
    0 warnings generated

Also tested with patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20230104222007.43604-1-ju.o@free.fr/

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_gnupg2.TestGnupg2
    ...
    OK
---
 package/gnupg2/0001-ks_ldap_free_state.patch | 21 --------------------
 package/gnupg2/gnupg2.hash                   | 10 +++++-----
 package/gnupg2/gnupg2.mk                     |  2 +-
 3 files changed, 6 insertions(+), 27 deletions(-)
 delete mode 100644 package/gnupg2/0001-ks_ldap_free_state.patch

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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
