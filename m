Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90292C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 13:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEBDF817D3;
	Tue,  8 Aug 2023 13:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEBDF817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fI3zJ2rTIJNL; Tue,  8 Aug 2023 13:17:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1747481767;
	Tue,  8 Aug 2023 13:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1747481767
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC8701BF2A5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 13:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A643481767
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 13:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A643481767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNfVkpwdGxQL for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 13:17:46 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C381814AB
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 13:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C381814AB
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 15:17:43 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Aug 2023 15:17:43 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 15:17:42 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 08 Aug 2023 15:17:41 +0200
X-IronPort-AV: E=Sophos;i="6.01,156,1684792800"; d="scan'208";a="25153610"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 8 Aug 2023 15:17:41 +0200
Message-ID: <9482506b370da75aba03e07c5d30ad1da45b648e.1691500661.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX601.corporate.adroot.infra.ftgroup
 (10.115.26.29) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1691500666; x=1723036666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IaevF+AtXAVZHA6c4tu3Cw9f73zxRUHnMsgYlHawFyQ=;
 b=Ok8JxIMI7POUVT5j7/Kb2I0jldeJfYg55vpXWLKYTzUP0cW8Yh7xMRHn
 PTE54TB8qKdOAcWdoORd1kSOEcmfqyVaCoKu1eLvV1BxMAgoRTBQDwiYx
 m1/2YA+prZ0UL/Gi7dU2KY0Mofm1yo0xcN/+biixSsTcZc8o38+Ws2DjN
 qNrOE8dLinhzn1NM+Dwcapp2ZIE/u/yln0iVPnU4j2Ryhxg+pFeCSXGza
 4TcS58NauvZQc5iWTPdLcII8hEIx+cK5nLJv2F+mZVi0m0wiSfp8FisOY
 ORQ7CwAgE3L/2lEaBOOttOq1TSlxzKg7NUiUzPi++z06hx7QJV/lHGfvz
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=Ok8JxIMI
Subject: [Buildroot] [PATCH] package/pkg-generic: don't download svn
 externals by default
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Commit 7dd27cbe5b9e (support/download: add support to exclude svn
externals) departed from the usual opt-in scheme, like is done for
git submodule or large files, in an attempt to keep the previous
behaviour unchanged, that is to download externals by default.

As an afterthought, we've concluded that the chances for svn-hosted
packages with externals that are indeed required to do the build,
are relatively slim. For those cases, it even makes sense to explicitly
requested the use of the externals.

So, we change the default to not download svn externals.

Since the generated archives may change, we bump the version suffix.
This will allow users to more easily catch the situation and decide if
they really need the externals or not.

We have a single in-tree package that uses svn, and it does not use
externals, so the generated archive does not change, and we just need
to update the archive filename in the hash file.

Finally, we add a new section to the manual, in the chapter about
migrating Buildroot to a newer version.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 docs/manual/adding-packages-generic.txt |  8 +++-----
 docs/manual/migrating.txt               | 14 ++++++++++++++
 package/libxmlrpc/libxmlrpc.hash        |  2 +-
 package/pkg-download.mk                 |  2 +-
 package/pkg-generic.mk                  |  4 ----
 5 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 299017f9d2..98f822c55c 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -347,11 +347,9 @@ not and can not work as people would expect it should:
   Git LFS to store large files out of band.  This is only available for
   packages downloaded with git (i.e. when +LIBFOO_SITE_METHOD=git+).
 
-+ +LIBFOO_SVN_EXTERNAL+ can be set to +YES+ (the default) to specify
-  whether to retrieve the svn external references, or to +NO+ to avoid
-  retrieving those externals. Note that, contrary to other similar
-  options like +LIBFOO_GIT_SUBMODULES+ or +LIBFOO_GIT_LFS+, the default
-  here is to actually retrieve the externals; this is a legacy heritage.
++ +LIBFOO_SVN_EXTERNALS+ can be set to +YES+ to create an archive with
+  the svn external references. This is only available for packages
+  downloaded with subversion.
 
 * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
   (directories) that tar must strip from file names on extraction.
diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
index cb1f5eacc9..2667aeab96 100644
--- a/docs/manual/migrating.txt
+++ b/docs/manual/migrating.txt
@@ -86,3 +86,17 @@ Whenever a package installs an executable that is linked with a library
 in +$(HOST_DIR)/lib+, it must have an RPATH pointing to that directory.
 
 An RPATH pointing to +$(HOST_DIR)/usr/lib+ is no longer accepted.
+
+[[migrating-svn-externals]]
+=== Migrating to 2023.11
+
+Before Buildroot 2023.11, the subversion download backend unconditionally
+retrieved the external references (objects with an `svn:externals`
+property). Starting with 2023.11, externals are no longer retrieved by
+default; if you need them, set +LIBFOO_SVN_EXTERNALS+ to +YES+. This
+change implies that:
+
+* the generated archive content may change, and thus the hashes may need
+  to be updated appropriately;
+* the archive version suffix has been updated to +-br3+, so the hash
+  files must be updated appropriately.
diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 5d42dc0558..665ee31836 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  626e36295f43b320082bc7bdd961b46f39fbe2719535b5a417975a8e50c8f7f3  libxmlrpc-r3119-br2.tar.gz
+sha256  626e36295f43b320082bc7bdd961b46f39fbe2719535b5a417975a8e50c8f7f3  libxmlrpc-r3119-br3.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 5a311a95c6..e5cd83d859 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -21,7 +21,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 # Version of the format of the archives we generate in the corresponding
 # download backend:
 BR_FMT_VERSION_git = -br1
-BR_FMT_VERSION_svn = -br2
+BR_FMT_VERSION_svn = -br3
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 86b9c1f9d3..3592678235 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -646,10 +646,6 @@ endif
 ifndef $(2)_SVN_EXTERNALS
  ifdef $(3)_SVN_EXTERNALS
   $(2)_SVN_EXTERNALS = $$($(3)_SVN_EXTERNALS)
- else
-  # Legacy: we used to always use externals by default
-  # Only set it when the package is actually hosted on svn
-  $(2)_SVN_EXTERNALS = $$(if $$(filter svn,$$($(2)_SITE_METHOD)),YES)
  endif
 endif
 
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
