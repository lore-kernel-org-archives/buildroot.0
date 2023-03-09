Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6191C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9978D605EA;
	Thu,  9 Mar 2023 20:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9978D605EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72Tz3tGcWqL0; Thu,  9 Mar 2023 20:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C51CB61795;
	Thu,  9 Mar 2023 20:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C51CB61795
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7018A1BF97A
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 586E2403D6
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 586E2403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lyfJ_ehc9coS for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:29:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E89340386
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E89340386
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B7DA86B71; Thu,  9 Mar 2023 20:29:03 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 21:15:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a5686823dbe83be74f819227bfefe4edca35e48
X-Git-Newrev: 9cdccfdaae3395a8f3de0712175b1e60c2e62a2c
X-Patchwork-Hint: ignore
Message-Id: <20230309202903.6B7DA86B71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speechd: add default configure
 options
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cdccfdaae3395a8f3de0712175b1e60c2e62a2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add default configure options for all optional speechd features/
  output modules (disable all with additional library dependencies, enable
  oss)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/speechd/speechd.mk | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index b545863035..5944ea3a28 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -14,7 +14,22 @@ SPEECHD_AUTORECONF = YES
 SPEECHD_GETTEXTIZE = YES
 SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
 SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
-SPEECHD_CONF_OPTS = --without-kali
+SPEECHD_CONF_OPTS = \
+	--disable-python \
+	--without-espeak \
+	--without-espeak-ng \
+	--without-flite \
+	--without-ibmtts \
+	--without-voxin \
+	--without-ivona \
+	--without-pico \
+	--without-baratinoo \
+	--without-kali \
+	--without-pulse \
+	--without-libao \
+	--without-alsa \
+	--with-oss \
+	--without-nas
 
 # fix missing config.rpath (needed for autoreconf) in the codebase
 define SPEECHD_TOUCH_CONFIG_RPATH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
