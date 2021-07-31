Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A99C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:37:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6653C61037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6653C61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E426404CC;
	Tue,  3 Aug 2021 22:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIPUClVVZBxS; Tue,  3 Aug 2021 22:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22F1340475;
	Tue,  3 Aug 2021 22:37:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D5AA1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63EA040473
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-mxXCGpojnG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A59FE40596
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EF47687E2D; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f57920841f6e9dc74416c2cc77e01e41265fc40
X-Git-Newrev: bc5a45c25f590926c7609e766916a838f32258cf
X-Patchwork-Hint: ignore
Message-Id: <20210803211024.EF47687E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmbim: fix static
 build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=bc5a45c25f590926c7609e766916a838f32258cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix static build failure raised since switch to meson in commit
be76508af2b2253f95137a28198139732be2dcb3

Fixes:
 - http://autobuild.buildroot.org/results/8553211d87a2c41d8b47b51bbb193736fce49714

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...libmbim-glib-meson.build-fix-static-build.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch b/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch
new file mode 100644
index 0000000000..6ccad9abf8
--- /dev/null
+++ b/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch
@@ -0,0 +1,34 @@
+From ff1f9d7c9bc163de3117383b7cea9cd99585462a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 31 Jul 2021 23:42:35 +0200
+Subject: [PATCH] src/libmbim-glib/meson.build: fix static build
+
+Replace shared_library by library to fix static build failure with
+toolchains that don't support dynamic library
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8553211d87a2c41d8b47b51bbb193736fce49714
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/merge_requests/83]
+---
+ src/libmbim-glib/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libmbim-glib/meson.build b/src/libmbim-glib/meson.build
+index e3337db..5de3564 100644
+--- a/src/libmbim-glib/meson.build
++++ b/src/libmbim-glib/meson.build
+@@ -76,7 +76,7 @@ version_header = configure_file(
+ 
+ symbol_map = join_paths(meson.current_source_dir(), 'symbol.map')
+ 
+-libmbim_glib = shared_library(
++libmbim_glib = library(
+   libname,
+   version: mbim_glib_version,
+   sources: version_header,
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
