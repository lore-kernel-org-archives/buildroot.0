Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937C2C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F3D561355;
	Thu,  9 May 2024 20:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytEAZvon354J; Thu,  9 May 2024 20:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4C80613E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4C80613E7;
	Thu,  9 May 2024 20:47:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFB791BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89ABF83FF4
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3Tf_212_-hA for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EDA783FFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EDA783FFB
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18E1F86A98; Thu,  9 May 2024 20:46:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:45:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de5ed8021269e18070b92def5df10f9157bc2085
X-Git-Newrev: bc71274a347df1168efb0dc0bf77a0600fddda69
X-Patchwork-Hint: ignore
Message-Id: <20240509204629.18E1F86A98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: update archives version
 suffixes
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc71274a347df1168efb0dc0bf77a0600fddda69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since tar *will* generate different archives, virtually all hashes will
change, so drop the blurb that states they usually would not.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Arnout: say explicitly that the has will change]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/migrating.adoc | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 5a09c852c7..ed2be1c6c9 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -138,42 +138,49 @@ The download backends have been extended in various ways.
 * The git download backend now properly expands the `export-subst`
   https://git-scm.com/docs/gitattributes[git attribute] when generating
   archives.
+* A newer +tar+ version, _1.35_, is required to generate the archives.
+  For compatibility reasons, +tar+ 1.35 changes the way it stores some
+  fields (`devmajor` and `devminor`), which has an impact in the metadata
+  stored in the archives (but the content of files is not affected).
 
 To accomodate those changes, the archive suffix has been updated or
 added:
 
-* for git: +-git3+
-* for subversion: +-svn4+
-* for cargo (rust) packages: +-cargo1+
-* for go packages: +-go1+
+* for git: +-git4+
+* for subversion: +-svn5+
+* for cargo (rust) packages: +-cargo2+
+* for go packages: +-go2+
 
 Note that, if two such prefixes would apply to a generated archive, like
 for a cargo package downloaded from git, both suffixes need to be added,
 first the one for the download mechanism, then the one for the vendoring,
-e.g.: +libfoo-1.2.3-git3-cargo1.tar.gz+.
+e.g.: +libfoo-1.2.3-git4-cargo2.tar.gz+.
 
 Because of this, the hash file of any custom packages or custom versions
-for kernel and bootloaders must be updated. In most cases, the hash itself
-will not have changed. In that case, the following sed scripts can automate
-the rename in the hash file (assuming such files are kept under git).
+for kernel and bootloaders must be updated. The following sed scripts can
+automate the rename in the hash file (assuming such files are kept under
+git):
 
 ----
 # For git and svn packages, which originally had -br2 resp. -br3 suffix
-sed -r -i -e 's/-br2/-git3/; s/-br3/-svn4/' $(
+sed -r -i -e 's/-br2/-git4/; s/-br3/-svn5/' $(
     git grep -l -E -- '-br2|-br3' -- '*.hash'
 )
 
 # For go packages, which originally had no suffix
-sed -r -i -e 's/(\.tar\.gz)$/-go1\1/' $(
+sed -r -i -e 's/(\.tar\.gz)$/-go2\1/' $(
     git grep -l -E '\$\(eval \$\((host-)?golang-package\)\)' -- '*.mk' \
     |sed -r -e 's/\.mk$/.hash/' \
     |sort -u
 )
 
 # For cargo packages, which originally had no suffix
-sed -r -i -e 's/(\.tar\.gz)$/-cargo1\1/' $(
+sed -r -i -e 's/(\.tar\.gz)$/-cargo2\1/' $(
     git grep -l -E '\$\(eval \$\((host-)?cargo-package\)\)' -- '*.mk' \
     |sed -r -e 's/\.mk$/.hash/' \
     |sort -u
 )
 ----
+
+Note that the hash _will_ have changed, so that needs to be updated
+(manually) as well.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
