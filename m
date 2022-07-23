Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7985AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10AB68176C;
	Sat, 23 Jul 2022 16:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10AB68176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brDKcBpbhptp; Sat, 23 Jul 2022 16:58:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0973281751;
	Sat, 23 Jul 2022 16:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0973281751
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C21101BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9604260F90
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9604260F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hWXLpatBeMxm for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDD1260FD7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDD1260FD7
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8076984849; Sat, 23 Jul 2022 16:44:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:57:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cffd1d68bfeb30c2e4aa826550d5f5aeb7b4678
X-Git-Newrev: 22ee597f52ceab4eb3f0820bd743a44f9e8e8873
X-Patchwork-Hint: ignore
Message-Id: <20220723164412.8076984849@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkrb5: bump to 1.20
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
Content-Type: multipart/mixed; boundary="===============4223760885976031935=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4223760885976031935==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=22ee597f52ceab4eb3f0820bd743a44f9e8e8873
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License text for the AES implementation was changed from something
resembling BSD-3-Clause to something resembling BSD-2-Clause.

Signed-off-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-null-deref-on-TGS-inner-body-null-server.patch | 47 ----------------------
 package/libkrb5/libkrb5.hash                       |  4 +-
 package/libkrb5/libkrb5.mk                         |  8 +---
 3 files changed, 4 insertions(+), 55 deletions(-)

diff --git a/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch b/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
deleted file mode 100644
index ec6f623380..0000000000
--- a/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From d775c95af7606a51bf79547a94fa52ddd1cb7f49 Mon Sep 17 00:00:00 2001
-From: Greg Hudson <ghudson@mit.edu>
-Date: Tue, 3 Aug 2021 01:15:27 -0400
-Subject: [PATCH] Fix KDC null deref on TGS inner body null server
-
-After the KDC decodes a FAST inner body, it does not check for a null
-server.  Prior to commit 39548a5b17bbda9eeb63625a201cfd19b9de1c5b this
-would typically result in an error from krb5_unparse_name(), but with
-the addition of get_local_tgt() it results in a null dereference.  Add
-a null check.
-
-Reported by Joseph Sutton of Catalyst.
-
-CVE-2021-37750:
-
-In MIT krb5 releases 1.14 and later, an authenticated attacker can
-cause a null dereference in the KDC by sending a FAST TGS request with
-no server field.
-
-ticket: 9008 (new)
-tags: pullup
-target_version: 1.19-next
-target_version: 1.18-next
-
-[Retrieved from:
-https://github.com/krb5/krb5/commit/d775c95af7606a51bf79547a94fa52ddd1cb7f49]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/kdc/do_tgs_req.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/kdc/do_tgs_req.c b/src/kdc/do_tgs_req.c
-index 582e497cc9..32dc65fa8e 100644
---- a/src/kdc/do_tgs_req.c
-+++ b/src/kdc/do_tgs_req.c
-@@ -204,6 +204,11 @@ process_tgs_req(krb5_kdc_req *request, krb5_data *pkt,
-         status = "FIND_FAST";
-         goto cleanup;
-     }
-+    if (sprinc == NULL) {
-+        status = "NULL_SERVER";
-+        errcode = KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN;
-+        goto cleanup;
-+    }
- 
-     errcode = get_local_tgt(kdc_context, &sprinc->realm, header_server,
-                             &local_tgt, &local_tgt_storage, &local_tgt_key);
diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 860f828793..2fce24b45b 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  66085e2f594751e77e82e0dbf7bbc344320fb48a9df2a633cfdd8f7d6da99fc8  krb5-1.18.4.tar.gz
+sha256  7e022bdd3c851830173f9faaa006a230a0e0fdad4c953e85bff4bf0da036e12f  krb5-1.20.tar.gz
 
 # Hash for license file:
-sha256  7fba8b076bdc2cfef1d0813c5d4067d76d5be60c32d84de22d5d1cf451744feb  NOTICE
+sha256  cfadcf7b2ead2f3af793c25c00638c9908ac0023b101695f40cb9a03b16811dc  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index ea2d71a8cc..5e547470ed 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBKRB5_VERSION_MAJOR = 1.18
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).4
-LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
+LIBKRB5_VERSION = 1.20
+LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
 LIBKRB5_LICENSE = MIT, BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, others
@@ -16,9 +15,6 @@ LIBKRB5_CPE_ID_PRODUCT = kerberos_5
 LIBKRB5_DEPENDENCIES = host-bison $(TARGET_NLS_DEPENDENCIES)
 LIBKRB5_INSTALL_STAGING = YES
 
-# 0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
-LIBKRB5_IGNORE_CVES += CVE-2021-37750
-
 # The configure script uses AC_TRY_RUN tests to check for those values,
 # which doesn't work in a cross-compilation scenario. Therefore,
 # we feed the configure script with the correct answer for those tests

--===============4223760885976031935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4223760885976031935==--
