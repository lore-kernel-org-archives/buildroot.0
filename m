Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8511C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 16:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5661181858;
	Sat,  5 Mar 2022 16:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jW-d7GUM_x1D; Sat,  5 Mar 2022 16:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E5F181831;
	Sat,  5 Mar 2022 16:31:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8BFC1BF957
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 16:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C773660AAA
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 16:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTEWEC-DqBM0 for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 16:31:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA7FF60A80
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 16:31:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F0267827E3; Sat,  5 Mar 2022 16:23:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Mar 2022 17:27:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 949aee637738341690b3a29a7dc2eb7572c164f1
X-Git-Newrev: 3d7f852ac5afb09f0a9a0b5f441403a98bc0f410
X-Patchwork-Hint: ignore
Message-Id: <20220305162319.F0267827E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: remove override in conditional
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d7f852ac5afb09f0a9a0b5f441403a98bc0f410
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove override of FOO_{CONF_OPTS,DEPENDENCIES} in conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-kernel-module.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-kernel-module.txt b/docs/manual/adding-packages-kernel-module.txt
index b609ecc90a..1d4251333d 100644
--- a/docs/manual/adding-packages-kernel-module.txt
+++ b/docs/manual/adding-packages-kernel-module.txt
@@ -70,11 +70,11 @@ Let's look at a more complex example:
 14: FOO_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
 15: 
 16: ifeq ($(BR2_PACKAGE_LIBBAR),y)
-17: FOO_DEPENDENCIES = libbar
-18: FOO_CONF_OPTS = --enable-bar
+17: FOO_DEPENDENCIES += libbar
+18: FOO_CONF_OPTS += --enable-bar
 19: FOO_MODULE_SUBDIRS += driver/bar
 20: else
-21: FOO_CONF_OPTS = --disable-bar
+21: FOO_CONF_OPTS += --disable-bar
 22: endif
 23: 
 24: $(eval $(kernel-module))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
