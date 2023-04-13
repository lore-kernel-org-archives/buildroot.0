Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ACBC77B6E
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 18:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DCA0400F2;
	Thu, 13 Apr 2023 18:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DCA0400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OemeDIQho9-T; Thu, 13 Apr 2023 18:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 074A24063E;
	Thu, 13 Apr 2023 18:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 074A24063E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 511E01C3E16
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 18:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3753860DC2
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 18:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3753860DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrxJ477ExDKE for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 18:33:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8703E60BBE
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 18:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8703E60BBE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 741CC8408C; Thu, 13 Apr 2023 18:33:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 20:33:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 131cb09c79ffe155c51444b5b86145d9e184c304
X-Git-Newrev: 65849bd96d0de501c109c32fab01a5eb1fd3a629
X-Patchwork-Hint: ignore
Message-Id: <20230413183345.741CC8408C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/localedef: fix fallout after bump
 to glibc 2.37
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

commit: https://git.buildroot.net/buildroot/commit/?id=65849bd96d0de501c109c32fab01a5eb1fd3a629
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a379499f7334 (package/glibc: bump to version 2.37) forgot to
update the pach for localedef.

There is no version check for 'as' now, so drop the related hunk.

Fixes: a379499f7334c2a68d375b1cf9dc35cd59884181

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Tested-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 ...ax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index 297c96cc5e..94fccfa856 100644
--- a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -24,6 +24,8 @@ GCC 6.2+
  https://sourceware.org/git/?p=glibc.git;a=commit;h=4dcbbc3b28aaeafe23e1a30db84055aa6f6fa987
 
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+[yann.morin.1998@free.fr: update for 2.37]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
  configure | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
@@ -32,16 +34,7 @@ diff --git a/configure b/configure
 index 9619c10991..0c481d2339 100755
 --- a/configure
 +++ b/configure
-@@ -4651,7 +4651,7 @@ $as_echo_n "checking version of $AS... " >&6; }
-   ac_prog_version=`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
-   case $ac_prog_version in
-     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
--    2.1[0-9][0-9]*|2.2[5-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
-+    2.1[0-9][0-9]*|2.2[4-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
-        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
-     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
- 
-@@ -4781,7 +4781,7 @@ $as_echo_n "checking version of $LD... " >&6; }
+@@ -4178,7 +4178,7 @@ $as_echo_n "checking version of $LD... " >&6; }
    ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -50,7 +43,7 @@ index 9619c10991..0c481d2339 100755
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
  
-@@ -5189,7 +5189,7 @@ int
+@@ -4589,7 +4589,7 @@ int
  main ()
  {
  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
