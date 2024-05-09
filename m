Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FCEC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13A6861339;
	Thu,  9 May 2024 20:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBoCxoftWBu5; Thu,  9 May 2024 20:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 868B16133E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 868B16133E;
	Thu,  9 May 2024 20:46:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDF3C1BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E870D41FE2
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ab6qgN_zIkXp for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6EF741FDF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6EF741FDF
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C39B786A98; Thu,  9 May 2024 20:46:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:45:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e527bdd8a918ee90df020e4c78fd97ad76c46000
X-Git-Newrev: c316a83a8e8272cb3e039eb6902042b9468cddf2
X-Patchwork-Hint: ignore
Message-Id: <20240509204628.C39B786A98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: document new archive version
 suffix
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c316a83a8e8272cb3e039eb6902042b9468cddf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Arnout: add sed scripts for hash file update]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/migrating.adoc | 56 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index a6385260a6..5a09c852c7 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -127,9 +127,53 @@ that such patches will most probably not be accepted.
 [[migrating-git-attributes]]
 === Migrating to 2024.05
 
-The git download backend now properly expands the `export-subst`
-https://git-scm.com/docs/gitattributes[git attribute] when generating
-archives. Because of this, the archive version suffix has been updated,
-to +-br2+, so the hash files must be updated accordingly. Since
-`export-subst` is usually not used, the hash itself usually doesn't change,
-so the update can be done with `sed -r -i e 's/-br1/-br2/'`.
+The download backends have been extended in various ways.
+
+* All locally generated tarballs are even more reproducible. Before
+  2024.05, it was possible that the access mode of files in the archives
+  were not consistent when the download directory has specific ACLs (e.g.
+  with the +default+ ACL set). This impacts the archives generated for
+  git and subversion repositories, as well as those for vendored cargo
+  and go packages.
+* The git download backend now properly expands the `export-subst`
+  https://git-scm.com/docs/gitattributes[git attribute] when generating
+  archives.
+
+To accomodate those changes, the archive suffix has been updated or
+added:
+
+* for git: +-git3+
+* for subversion: +-svn4+
+* for cargo (rust) packages: +-cargo1+
+* for go packages: +-go1+
+
+Note that, if two such prefixes would apply to a generated archive, like
+for a cargo package downloaded from git, both suffixes need to be added,
+first the one for the download mechanism, then the one for the vendoring,
+e.g.: +libfoo-1.2.3-git3-cargo1.tar.gz+.
+
+Because of this, the hash file of any custom packages or custom versions
+for kernel and bootloaders must be updated. In most cases, the hash itself
+will not have changed. In that case, the following sed scripts can automate
+the rename in the hash file (assuming such files are kept under git).
+
+----
+# For git and svn packages, which originally had -br2 resp. -br3 suffix
+sed -r -i -e 's/-br2/-git3/; s/-br3/-svn4/' $(
+    git grep -l -E -- '-br2|-br3' -- '*.hash'
+)
+
+# For go packages, which originally had no suffix
+sed -r -i -e 's/(\.tar\.gz)$/-go1\1/' $(
+    git grep -l -E '\$\(eval \$\((host-)?golang-package\)\)' -- '*.mk' \
+    |sed -r -e 's/\.mk$/.hash/' \
+    |sort -u
+)
+
+# For cargo packages, which originally had no suffix
+sed -r -i -e 's/(\.tar\.gz)$/-cargo1\1/' $(
+    git grep -l -E '\$\(eval \$\((host-)?cargo-package\)\)' -- '*.mk' \
+    |sed -r -e 's/\.mk$/.hash/' \
+    |sort -u
+)
+----
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
