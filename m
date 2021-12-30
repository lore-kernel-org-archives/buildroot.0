Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502E5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF55060C1C;
	Thu, 30 Dec 2021 22:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykBl9H54vBKt; Thu, 30 Dec 2021 22:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B8B860AC5;
	Thu, 30 Dec 2021 22:30:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEE4D1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD84760AC5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yaFlR_HuqPiC for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:30:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1131960A94
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:30:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4E5FA82D9E; Thu, 30 Dec 2021 22:24:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 23:28:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25b1fc2898d68ddf2674b14c738045875fc5a2dc
X-Git-Newrev: b328a6a852abfb1ec713292e0ea0fd8f887b3461
X-Patchwork-Hint: ignore
Message-Id: <20211230222441.4E5FA82D9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: drop duplicate
 variable definition
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

commit: https://git.buildroot.net/buildroot/commit/?id=b328a6a852abfb1ec713292e0ea0fd8f887b3461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As part of commit
4d2ca2be49fecb68a988662a27d31278408614d2 ("package/python-setuptools:
bump to version 59.8.0 and split python2 version"), the
HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON was moved next to the other
HOST_* variables, but it was also re-added at the original location
during an (incorrect) review process. Fix that up by dropping the
duplicate definition.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools/python-setuptools.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 30f0f255ed..d83336b909 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -29,7 +29,6 @@ PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
 PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
-HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON = python2
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 define PYTHON_SETUPTOOLS_EXTRACT_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
