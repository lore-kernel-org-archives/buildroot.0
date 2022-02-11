Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638A9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 12:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05CC060BEC;
	Fri, 11 Feb 2022 12:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhvdpRW-pmOY; Fri, 11 Feb 2022 12:19:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F827607F0;
	Fri, 11 Feb 2022 12:19:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FEB91BF2CE
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 12:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D452813B2
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 12:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3u4AuOFfen_Y for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 12:19:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 786848125F
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 12:19:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D0B9D81392; Fri, 11 Feb 2022 12:11:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 13:17:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3529b8020a8c8b61d9eadc455f38ce892a7c6f3
X-Git-Newrev: 618c5f7671643516432c1ec6b9f7b203313763a7
X-Patchwork-Hint: ignore
Message-Id: <20220211121158.D0B9D81392@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lzip: use .tar.gz format for source
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

commit: https://git.buildroot.net/buildroot/commit/?id=618c5f7671643516432c1ec6b9f7b203313763a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using a lzip compressed tarball to build host-lzip so lzip compressed
tarballs can be extracted naturally doesn't work.  Use the .tar.gz format
instead.

Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lzip/lzip.hash | 2 +-
 package/lzip/lzip.mk   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 5e285a5ad8..48ee8175ca 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
 # From https://lists.nongnu.org/archive/html/lzip-bug/2022-02/msg00000.html
-sha256  ea02b9e6fb25d0e1a1d3ef4fdeb6ab26b931f1ece66fa1cee2983c95215e930a  lzip-1.23.tar.lz
+sha256  4792c047ddf15ef29d55ba8e68a1a21e0cb7692d87ecdf7204419864582f280d  lzip-1.23.tar.gz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index e3cc86b956..31b5750767 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LZIP_VERSION = 1.23
-LZIP_SOURCE = lzip-$(LZIP_VERSION).tar.lz
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
