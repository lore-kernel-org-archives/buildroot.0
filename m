Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0A1C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2830540538;
	Wed,  9 Feb 2022 21:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwqaThhHWUpG; Wed,  9 Feb 2022 21:51:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C66740523;
	Wed,  9 Feb 2022 21:51:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36E6C1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49C0060FE7
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAQotzk9gQ0P for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F7876009C
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3175C8323C; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:10:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d6b607962404e343910b2222ad78553d5485c0e
X-Git-Newrev: cb4ac01d5a282a1edd647b09576379094c5ed1d8
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.3175C8323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: drop python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb4ac01d5a282a1edd647b09576379094c5ed1d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/util-linux/util-linux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 5a4ff64d01..1ca605f3fb 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -241,9 +241,9 @@ HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
 endif
 
 # Install libmount Python bindings
-ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 UTIL_LINUX_CONF_OPTS += --with-python
-UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+UTIL_LINUX_DEPENDENCIES += python3
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
 UTIL_LINUX_CONF_OPTS += --enable-pylibmount
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
