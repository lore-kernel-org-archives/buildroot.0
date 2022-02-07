Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC6EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 18:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A54A460DC2;
	Mon,  7 Feb 2022 18:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHZHEf6pSlIf; Mon,  7 Feb 2022 18:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F168460AFB;
	Mon,  7 Feb 2022 18:25:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF3961BF299
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97DD4403BF
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2meirVDwGCE for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 18:24:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD84C4010F
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 18:24:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9391E82DC5; Mon,  7 Feb 2022 18:17:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 19:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92a1b71204d6cccd2e1c4f4c67d4f0d17edc1adb
X-Git-Newrev: ff44d53b647c20b5221fe960d7411ddf8094a3cc
X-Patchwork-Hint: ignore
Message-Id: <20220207181734.9391E82DC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avahi: drop unneeded
 am_cv_path_PYTHON
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff44d53b647c20b5221fe960d7411ddf8094a3cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is not used by the configure script and refer to PYTHON_TARGET_BINARY
which was dropped back in 2010 by commit e3418f69cf (python: convert to
autotargets, bump to 2.7.1, many improvements), so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 13e2106014..04c4164af6 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -107,7 +107,6 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 AVAHI_CONF_ENV += \
 	am_cv_pathless_PYTHON=python \
-	am_cv_path_PYTHON=$(PYTHON_TARGET_BINARY) \
 	am_cv_python_version=$(PYTHON_VERSION) \
 	am_cv_python_platform=linux2 \
 	am_cv_python_pythondir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
