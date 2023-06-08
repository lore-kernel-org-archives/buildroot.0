Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E80C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 20:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9412041556;
	Thu,  8 Jun 2023 20:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9412041556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MqbkIKhpTOHm; Thu,  8 Jun 2023 20:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD5D041578;
	Thu,  8 Jun 2023 20:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD5D041578
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9991BF395
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76ECC4154A
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76ECC4154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IeMazqAB4pnz for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D47424011F
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D47424011F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFE3F8219D; Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Jun 2023 22:38:22 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 999e55cea232603157c2ee39fa36bc39a50283e4
X-Git-Newrev: 33127e67f1d5ac0e704ddb5406fc9f0de83bdae4
X-Patchwork-Hint: ignore
Message-Id: <20230608204543.BFE3F8219D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/rpm: bump to
 version 4.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=33127e67f1d5ac0e704ddb5406fc9f0de83bdae4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The most recent release of RPM is v4.18.1 [1].

Adding an upstream patch to prevent build failures for certain
toolchains (0001-fix-var-declare-in-label-error.patch). Fix should be
available next release.

[1]: https://rpm.org/wiki/Releases/4.18.1

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 233be1c216a8f7f923245791c6d9a897e10e5c63)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../rpm/0001-fix-var-declare-in-label-error.patch  | 40 ++++++++++++++++++++++
 package/rpm/rpm.hash                               |  4 +--
 package/rpm/rpm.mk                                 |  2 +-
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/package/rpm/0001-fix-var-declare-in-label-error.patch b/package/rpm/0001-fix-var-declare-in-label-error.patch
new file mode 100644
index 0000000000..648040c663
--- /dev/null
+++ b/package/rpm/0001-fix-var-declare-in-label-error.patch
@@ -0,0 +1,40 @@
+From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00:00:00 2001
+From: Florian Festi <ffesti@redhat.com>
+Date: Thu, 16 Mar 2023 19:05:04 +0100
+Subject: [PATCH] Fix compiler error on clang
+
+Turns out variable declarations are not allowed after a label, even in
+C99. And while some compilers don't seem to care others do.
+
+Moving the declaration of mayopen to the start of the function to avoid
+this problem.
+
+Resolves: #2435
+
+Upstream: b960c0b43a080287a7c13533eeb2d9f288db1414
+Signed-off-by: James Knight <james.d.knight@live.com>
+---
+ lib/fsm.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/fsm.c b/lib/fsm.c
+index 5671ac642d..183293edb0 100644
+--- a/lib/fsm.c
++++ b/lib/fsm.c
+@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+     int nodigest = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOFILEDIGEST) ? 1 : 0;
+     int nofcaps = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOCAPS) ? 1 : 0;
+     int firstlinkfile = -1;
++    int mayopen = 0;
+     char *tid = NULL;
+     struct filedata_s *fdata = xcalloc(fc, sizeof(*fdata));
+     struct filedata_s *firstlink = NULL;
+@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+ 
+ setmeta:
+ 	    /* Special files require path-based ops */
+-	    int mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
++	    mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
+ 	    if (!rc && fd == -1 && mayopen) {
+ 		int flags = O_RDONLY;
+ 		/* Only follow safe symlinks, and never on temporary files */
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index dfe50303f7..fd03f062bc 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.18.0.html
-sha256  2a17152d7187ab30edf2c2fb586463bdf6388de7b5837480955659e5e9054554  rpm-4.18.0.tar.bz2
+# From https://rpm.org/wiki/Releases/4.18.1.html
+sha256  37f3b42c0966941e2ad3f10fde3639824a6591d07197ba8fd0869ca0779e1f56  rpm-4.18.1.tar.bz2
 
 # Hash for license file
 sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 38e4ea2160..2b289fcc9f 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RPM_VERSION_MAJOR = 4.18
-RPM_VERSION = $(RPM_VERSION_MAJOR).0
+RPM_VERSION = $(RPM_VERSION_MAJOR).1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
