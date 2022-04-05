Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB0CC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 20:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD1583005;
	Tue,  5 Apr 2022 20:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALuz7i3_O_yT; Tue,  5 Apr 2022 20:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48569830A8;
	Tue,  5 Apr 2022 20:06:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 288231BF3A4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 258BB60E74
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTyXL8rGIbJ9 for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 20:06:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F35946101E
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 20:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0CDBD8363F; Tue,  5 Apr 2022 19:57:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Apr 2022 22:05:50 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 99d31b4da16d22a715e3be5183c42a50deec92d6
X-Git-Newrev: 2dc7323ad083df69550e50461835f960d662cb42
X-Patchwork-Hint: ignore
Message-Id: <20220405195717.0CDBD8363F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/upower: add
 gobject-introspection optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=2dc7323ad083df69550e50461835f960d662cb42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

gobject-introspection is an optional dependency which is enabled by
default since
https://gitlab.freedesktop.org/upower/upower/-/commit/0d7bf34ed6702c60028fa80e5d481621e9741d09

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8bcae68f37d2c608e9e151fb983f16c09c11f85e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upower/upower.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/upower/upower.mk b/package/upower/upower.mk
index 8989ca9f5d..a6f39d2f46 100644
--- a/package/upower/upower.mk
+++ b/package/upower/upower.mk
@@ -22,4 +22,11 @@ UPOWER_DEPENDENCIES = \
 
 UPOWER_CONF_OPTS = --disable-man-pages --disable-tests
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+UPOWER_CONF_OPTS += --enable-introspection
+UPOWER_DEPENDENCIES += gobject-introspection
+else
+UPOWER_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
