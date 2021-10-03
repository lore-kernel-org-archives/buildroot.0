Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A068DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:21:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5834761163
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5834761163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23425848CD;
	Sun,  3 Oct 2021 08:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-v0OvYSIjrF; Sun,  3 Oct 2021 08:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88EFC84862;
	Sun,  3 Oct 2021 08:21:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44B521BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 348F784862
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7K1AQR3VjEDn for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:21:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E20C8485E
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:21:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id ECE4C8D320; Sun,  3 Oct 2021 08:19:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:21:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d24387ef26c2abeaeb0e4e687335fff02673d3b4
X-Git-Newrev: dd817ef6e6c53aed04a7ad97be9c2e0326f583bf
X-Patchwork-Hint: ignore
Message-Id: <20211003081902.ECE4C8D320@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdbm: needs wchar
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd817ef6e6c53aed04a7ad97be9c2e0326f583bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wchar is a mandatoy dependency since bump to version 1.21 in commit
60add404db424e2652673a7b6a3ba2bc80380b42 and
https://git.savannah.gnu.org/cgit/gdbm.git/commit/src/datconv.c?id=0019677be7b751eb2d9b7e9ab25994cb696c7822

datconv.c:18:10: fatal error: wctype.h: No such file or directory
   18 | #include <wctype.h>
      |          ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b35ccdf734a02f0866fba7d86d44a8b452601607

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdbm/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gdbm/Config.in b/package/gdbm/Config.in
index debe5660d7..7c8fcc4e5a 100644
--- a/package/gdbm/Config.in
+++ b/package/gdbm/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_GDBM
 	bool "gdbm"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
 	help
 	  GNU dbm is a set of database routines that use extensible
 	  hashing. It works similar to the standard UNIX dbm routines.
 
 	  https://www.gnu.org/software/gdbm/gdbm.html
+
+comment "gdbm needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
