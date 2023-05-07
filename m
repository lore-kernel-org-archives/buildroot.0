Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E81C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25AE7813E5;
	Sun,  7 May 2023 21:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25AE7813E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FjSOLUi5xwKn; Sun,  7 May 2023 21:47:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C982812A9;
	Sun,  7 May 2023 21:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C982812A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 994591BF863
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72692613F5
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72692613F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxYwjMV18yU5 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:47:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB1B6613F4
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB1B6613F4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97595860D1; Sun,  7 May 2023 21:47:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 23:45:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38c4621df340ea7a76033f5955be1b277554920f
X-Git-Newrev: aeff26d21dd72eb01a970dd392c06aa52268cfdc
X-Patchwork-Hint: ignore
Message-Id: <20230507214721.97595860D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpm: add readline support
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

commit: https://git.buildroot.net/buildroot/commit/?id=aeff26d21dd72eb01a970dd392c06aa52268cfdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When readline support is detected, enable readline support.

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpm/rpm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 2964c6a512..c66ce6992d 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -89,6 +89,13 @@ else
 RPM_CONF_OPTS += --disable-python
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+RPM_DEPENDENCIES += readline
+RPM_CONF_OPTS += --with-readline
+else
+RPM_CONF_OPTS += --without-readline
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 RPM_DEPENDENCIES += sqlite
 RPM_CONF_OPTS += --enable-sqlite
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
