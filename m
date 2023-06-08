Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94861C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 20:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46F0141583;
	Thu,  8 Jun 2023 20:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46F0141583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tvepHRMa-NIG; Thu,  8 Jun 2023 20:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F2944157E;
	Thu,  8 Jun 2023 20:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F2944157E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 032D21BF395
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBF75611B9
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBF75611B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdFLeqUK7Zjs for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF0F460F7B
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF0F460F7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8FBF82195; Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Jun 2023 22:37:23 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2246f8f10ba104f7c3ccd24fa3402815664a0f78
X-Git-Newrev: 5288721e8d059bc46ee9a87dfcdc710f47a2bc71
X-Patchwork-Hint: ignore
Message-Id: <20230608204543.A8FBF82195@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/rpm: drop
 remnants of custom CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=5288721e8d059bc46ee9a87dfcdc710f47a2bc71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Drops the use of `RPM_CFLAGS`, which their use has been obsolete when
this package bumped to v4.17 [1].

[1]: 429e247b869027f6ecd4efa0f31bccd2765e3875

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b7de8417e1b8f36da2b002a7adb9a633cdcc0ac4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/rpm.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index fc57a14fd6..08bcb85ae4 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -104,7 +104,6 @@ endif
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
-	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)" \
 	LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
