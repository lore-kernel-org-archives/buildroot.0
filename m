Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72809C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:47:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F92060ED6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F92060ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E28FB4022E;
	Sat,  4 Sep 2021 20:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1SkXq5B8OjWv; Sat,  4 Sep 2021 20:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D78C4021D;
	Sat,  4 Sep 2021 20:46:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02FE41BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7603A4014E
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZMz5DL3xdjU for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:46:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BB1C401D5
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:46:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CE61388488; Sat,  4 Sep 2021 20:44:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:40:44 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 53af97d57779f60175f0033c7a3a32232dca2f10
X-Git-Newrev: f42dd76bc327c55dd74ba0fdcb0d599e67354285
X-Patchwork-Hint: ignore
Message-Id: <20210904204445.CE61388488@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gd: fix
 CVE-2021-38115
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f42dd76bc327c55dd74ba0fdcb0d599e67354285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

read_header_tga in gd_tga.c in the GD Graphics Library (aka LibGD)
through 2.3.2 allows remote attackers to cause a denial of service
(out-of-bounds read) via a crafted TGA file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0eebfba38888209313837bc81a22a4b3bf11ada4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-out-of-bands-in-reading-tga-header-file.patch | 29 ++++++++++++++++++++++
 package/gd/gd.mk                                   |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch b/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
new file mode 100644
index 0000000000..a42bfb402e
--- /dev/null
+++ b/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
@@ -0,0 +1,29 @@
+From 8b111b2b4a4842179be66db68d84dda91a246032 Mon Sep 17 00:00:00 2001
+From: maryam ebrahimzadeh <maryam.ebr@student.sharif.edu>
+Date: Mon, 19 Jul 2021 10:07:13 +0430
+Subject: [PATCH] fix read out-of-bands in reading tga header file
+
+[Retrieved from:
+https://github.com/libgd/libgd/commit/8b111b2b4a4842179be66db68d84dda91a246032]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/gd_tga.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/gd_tga.c b/src/gd_tga.c
+index cae9428da..286febb28 100644
+--- a/src/gd_tga.c
++++ b/src/gd_tga.c
+@@ -191,7 +191,11 @@ int read_header_tga(gdIOCtx *ctx, oTga *tga)
+ 			return -1;
+ 		}
+ 
+-		gdGetBuf(tga->ident, tga->identsize, ctx);
++		
++		if (gdGetBuf(tga->ident, tga->identsize, ctx) != tga->identsize) {
++			gd_error("fail to read header ident");
++			return -1;
++		}
+ 	}
+ 
+ 	return 1;
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index c7037f8dbc..6de7b73836 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -15,6 +15,9 @@ GD_CPE_ID_PRODUCT = libgd
 GD_CONF_OPTS = --without-x --disable-rpath --disable-werror
 GD_DEPENDENCIES = host-pkgconf
 
+# 0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
+GD_IGNORE_CVES += CVE-2021-38115
+
 # gd forgets to link utilities with -pthread even though it uses
 # pthreads, causing linking errors with static linking
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
