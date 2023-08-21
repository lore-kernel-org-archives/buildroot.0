Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C74EC8734
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A249A80B87;
	Thu,  7 Sep 2023 15:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A249A80B87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJeTwv5VAhGX; Thu,  7 Sep 2023 15:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E94CB8200D;
	Thu,  7 Sep 2023 15:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94CB8200D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 187521BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59D1041D9B
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D1041D9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LU-tEunS0y2m for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70F5141DF7
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F5141DF7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CA7586A1F; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 00:14:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1ddc9177723f8126b460a85bc48de03c742d0d5
X-Git-Newrev: 64024ec57ea8249014e90aedb30533ddc6905e68
X-Patchwork-Hint: ignore
Message-Id: <20230907145131.5CA7586A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnftnl: bump to version 1.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=64024ec57ea8249014e90aedb30533ddc6905e68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://www.netfilter.org/projects/libnftnl/files/changes-libnftnl-1.2.6.txt

This commit also adds comments in hash file:
- that pgp signature was verified with links
- that the license file hash was locally computed

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnftnl/libnftnl.hash | 7 ++++++-
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 0cb3917f2d..5d1aad15d1 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,8 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256  966de0a8120c8a53db859889749368bfb2cba0c4f0b4c1a30d264eccc45f1226  libnftnl-1.2.5.tar.xz
+# Checked pgp signature:
+# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.2.6.tar.xz.sig
+# with key:
+# https://www.netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
+sha256  ceeaea2cd92147da19f13a35a7f1a4bc2767ff897e838e4b479cf54b59c777f4  libnftnl-1.2.6.tar.xz
+# Locally computed:
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index a7045337d0..18be55a17d 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.2.5
+LIBNFTNL_VERSION = 1.2.6
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
 LIBNFTNL_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
