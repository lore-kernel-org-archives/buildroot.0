Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1837DC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 22:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF26140A08;
	Sun,  3 Dec 2023 22:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF26140A08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t8Smy_b2dnYe; Sun,  3 Dec 2023 22:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A0DF40A16;
	Sun,  3 Dec 2023 22:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A0DF40A16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17CE91BF3DA
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19E96409D7
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19E96409D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4j6SiVD9nddd for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40A0240A2E
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40A0240A2E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CE8A87934; Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 22:37:14 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 37dfdda3211e3fdf35aa6b996604e32755f32d6d
X-Git-Newrev: ce9b0d50c45ec26b3ab7b9351e5c411f04ba9cf4
X-Patchwork-Hint: ignore
Message-Id: <20231203222432.2CE8A87934@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/speechd: fix NLS
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce9b0d50c45ec26b3ab7b9351e5c411f04ba9cf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following NLS build failure raised since the addition of the
package in commit 9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d:

/home/buildroot/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../../src/common/.libs/libcommon.a(libcommon_la-i18n.o): undefined reference to symbol 'libintl_bindtextdomain'

Fixes:
 - http://autobuild.buildroot.org/results/8ab13cf474d732c95a1da65592d950b24b3d474b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f6a7050d7191b9a534d1d2789ceb72d69f25da83)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/speechd/speechd.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index ae777c6d30..c7c938a454 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -12,8 +12,11 @@ SPEECHD_INSTALL_STAGING = YES
 # speechd source code is released without configure script
 SPEECHD_AUTORECONF = YES
 SPEECHD_AUTOPOINT = YES
-SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
-SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
+SPEECHD_DEPENDENCIES = \
+	host-pkgconf dotconf libglib2 libsndfile $(TARGET_NLS_DEPENDENCIES)
+SPEECHD_CONF_ENV = \
+	ac_cv_prog_HELP2MAN="" \
+	LIBS=$(TARGET_NLS_LIBS)
 SPEECHD_CONF_OPTS = \
 	--disable-python \
 	--without-espeak \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
