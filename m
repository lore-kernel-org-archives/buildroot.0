Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05176C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 18:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A75160E97;
	Mon,  7 Feb 2022 18:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B14A-oqF6zxJ; Mon,  7 Feb 2022 18:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF34F60E8F;
	Mon,  7 Feb 2022 18:24:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5CA1BF299
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58FE140129
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKJH5Qi6ssc5 for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 18:24:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B350D403C7
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 18:24:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8A84582DC2; Mon,  7 Feb 2022 18:17:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 19:19:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7162d69194d606734e7148f009dd034b31d1302a
X-Git-Newrev: 92a1b71204d6cccd2e1c4f4c67d4f0d17edc1adb
X-Patchwork-Hint: ignore
Message-Id: <20220207181734.8A84582DC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpwquality: support python
 bindings with python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=92a1b71204d6cccd2e1c4f4c67d4f0d17edc1adb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python bindings support python3 as well, so enable it if python3 is
enabled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpwquality/libpwquality.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index 7c0c5df38e..54a03be453 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -12,9 +12,9 @@ LIBPWQUALITY_INSTALL_STAGING = YES
 LIBPWQUALITY_DEPENDENCIES = cracklib
 LIBPWQUALITY_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 LIBPWQUALITY_CONF_OPTS += --enable-python-bindings
-LIBPWQUALITY_DEPENDENCIES += python
+LIBPWQUALITY_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
 LIBPWQUALITY_MAKE_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
 else
 LIBPWQUALITY_CONF_OPTS += --disable-python-bindings
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
