Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DA8ECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 11:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AF478132A;
	Tue,  6 Sep 2022 11:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AF478132A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJXiDH6UwoDz; Tue,  6 Sep 2022 11:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72091812F4;
	Tue,  6 Sep 2022 11:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72091812F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAF461BF337
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 11:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 858B4812F4
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 11:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 858B4812F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgbjgYfa3pQC for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 11:45:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA65B812E6
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 11:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA65B812E6
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 939E481309; Tue,  6 Sep 2022 11:30:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 13:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73dedf735ed769e8dd2c6057b02ddf9fea0121e8
X-Git-Newrev: 40bb409a53d45170922987880544e42454b15ca0
X-Patchwork-Hint: ignore
Message-Id: <20220906113039.939E481309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: remove
 host-python-pillow support
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

commit: https://git.buildroot.net/buildroot/commit/?id=40bb409a53d45170922987880544e42454b15ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-python-pillow was needed to build optee-os from STMicroelecronics
during its rc versions but is is not needed anymore in the release.
It is then useless to keep this support.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pillow/python-pillow.mk | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 7cff54e9ea..31725a3e46 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -71,18 +71,4 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
 endif
 
-HOST_PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
-HOST_PYTHON_PILLOW_BUILD_OPTS = \
-	build_ext \
-	--disable-freetype \
-	--disable-jpeg \
-	--disable-lcms \
-	--disable-xcb \
-	--disable-jpeg2000 \
-	--disable-tiff \
-	--disable-webp \
-	--disable-webpmux
-HOST_PYTHON_PILLOW_INSTALL_OPTS = $(HOST_PYTHON_PILLOW_BUILD_OPTS)
-
 $(eval $(python-package))
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
