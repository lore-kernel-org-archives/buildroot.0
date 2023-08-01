Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4D4C001E0
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 13:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C8D60DDF;
	Tue,  1 Aug 2023 13:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83C8D60DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70B7ZciYhqWj; Tue,  1 Aug 2023 13:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A53061163;
	Tue,  1 Aug 2023 13:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A53061163
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A50511BF31D
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 13:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B361D40201
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 13:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B361D40201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CyMI4SfCa7q6 for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 13:18:34 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73EE44046A
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 13:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73EE44046A
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 15:11:23 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Aug 2023 15:11:23 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 15:11:22 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 01 Aug 2023 15:11:21 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.01,247,1684792800"; d="scan'208";a="22311538"
To: <buildroot@buildroot.org>
Date: Tue, 1 Aug 2023 15:11:17 +0200
Message-ID: <2281fe5f1a1324621f726080c57b35374ab7bb55.1690895462.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690895462.git.yann.morin@orange.com>
References: <cover.1690895462.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1690895914; x=1722431914;
 h=to:cc:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:from;
 bh=1wetyUuVwN+TWJO5NIZjda1znrlQZjz8L1+48kezJa4=;
 b=dol6WRgJHTbLeMDd/q9aBOeELZ5DYxL5uoqb1MpzDNrb2bf9A3dndjaT
 kTjOYLkBfb74GxFMzIdI+0FzkgGEqr8LufHBnXA7jMdshoR7T0PPzktH6
 0gEdG3yhgEXgjOiI2FZJhBCJDCDXu9MRcHTHoeMAO6GdG3QMy72nwG2uu
 gEOk+4urJeFAqaS2OuZJRVyh43tEW8+8briRri+3ZDyTNziE9eZowsFRO
 nWNqe8TReDIzZuMyx7K7KHPGaxtvwXpQkWFnthDJVQXkownX3vuPn4qcn
 qCNolhL+cG9tQ2VU/26uIJOyxuyPAMtjemMCMtwk8Qma1GSkuIc/NDxkq
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=dol6WRgJ
Subject: [Buildroot] [PATCH 3/3 v2] support/download: add support to exclude
 svn externals
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

Like git which can have submodules, subversion can have externals. The
default behaviour for subversion is to retrieve all the externals,
unless told otherwise.

For some repositories, the externals may be huge (e.g. a dataset or some
assets) and may not be required for building the package. In such a
case, retrieving the externals is both a waste of network bandwitdh and
time, and a waste of disk storage.

Like for git submodules and git lfs, add an option that packages can set
to specify whether they want externals or not.

Since we've so far been retrieving externals, we keep that the default,
and packages can opt-out (rather than the opt-in for git submodules or
git lfs).

We must only set it when the package is actually hosted on svn, to avoid
passing -r when the package is not hosted by svn; otherwise, -r would
also be passed e.g. to a git-hosted package, triggering the download of
git submodules even when they are not requested. We need to do so,
because we have a default value, which we usually do not have in other
download options.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

---
Changes v1 -> v2:
  - don't accidentally force submodules for git-downloaded packages
---
 docs/manual/adding-packages-generic.txt |  6 ++++++
 package/pkg-download.mk                 |  1 +
 package/pkg-generic.mk                  | 10 ++++++++++
 support/download/svn                    |  6 +++++-
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index fbe37f9ca9..299017f9d2 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -347,6 +347,12 @@ not and can not work as people would expect it should:
   Git LFS to store large files out of band.  This is only available for
   packages downloaded with git (i.e. when +LIBFOO_SITE_METHOD=git+).
 
++ +LIBFOO_SVN_EXTERNAL+ can be set to +YES+ (the default) to specify
+  whether to retrieve the svn external references, or to +NO+ to avoid
+  retrieving those externals. Note that, contrary to other similar
+  options like +LIBFOO_GIT_SUBMODULES+ or +LIBFOO_GIT_LFS+, the default
+  here is to actually retrieve the externals; this is a legacy heritage.
+
 * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
   (directories) that tar must strip from file names on extraction.
   The tarball for most packages has one leading component named
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0718f21aad..5a311a95c6 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -119,6 +119,7 @@ define DOWNLOAD
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
+		$(if $(filter YES,$($(2)_SVN_EXTERNALS)),-r) \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(if $($(2)_GIT_LFS),-l) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5d1c1da128..86b9c1f9d3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -643,6 +643,16 @@ ifndef $(2)_GIT_SUBMODULES
  endif
 endif
 
+ifndef $(2)_SVN_EXTERNALS
+ ifdef $(3)_SVN_EXTERNALS
+  $(2)_SVN_EXTERNALS = $$($(3)_SVN_EXTERNALS)
+ else
+  # Legacy: we used to always use externals by default
+  # Only set it when the package is actually hosted on svn
+  $(2)_SVN_EXTERNALS = $$(if $$(filter svn,$$($(2)_SITE_METHOD)),YES)
+ endif
+endif
+
 # Do not accept to download git submodule if not using the git method
 ifneq ($$($(2)_GIT_SUBMODULES),)
  ifneq ($$($(2)_SITE_METHOD),git)
diff --git a/support/download/svn b/support/download/svn
index 3e08a0ef36..1decb2310b 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -16,6 +16,7 @@ set -e
 #   -u URI      Checkout from repository at URI.
 #   -c REV      Use revision REV.
 #   -n NAME     Use basename NAME.
+#   -r          Recursive, i.e. use externals
 #
 # Environment:
 #   SVN      : the svn command to call
@@ -24,6 +25,7 @@ set -e
 . "${0%/*}/helpers"
 
 quiet=
+externals=--ignore-externals
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  quiet=-q;;
@@ -31,6 +33,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     u)  uri="${OPTARG}";;
     c)  rev="${OPTARG}";;
     n)  basename="${OPTARG}";;
+    r)  externals=;;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
@@ -52,7 +55,8 @@ _plain_svn() {
     eval ${SVN} "${@}"
 }
 
-_svn export --ignore-keywords ${quiet} "${@}" "'${uri}@${rev}'" "'${basename}'"
+# shellcheck disable=SC2086 # externals and quiet may be empty
+_svn export --ignore-keywords ${quiet} ${externals} "${@}" "'${uri}@${rev}'" "'${basename}'"
 
 # For 'svn info', we only need the credentials, if any; other options
 # would be invalid, as they are intended for 'svn export'.
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
