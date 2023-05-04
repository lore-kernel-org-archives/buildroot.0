Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AD5C7EE21
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 19:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E20AC61698;
	Thu,  4 May 2023 19:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E20AC61698
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCA--bjRaFnD; Thu,  4 May 2023 19:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E3D560F42;
	Thu,  4 May 2023 19:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E3D560F42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FB2F1BF863
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 19:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC2F942782
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 19:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC2F942782
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ByZK-LTTRzot for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 19:20:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB02042783
 for <buildroot@buildroot.org>; Thu,  4 May 2023 19:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB02042783
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D915485D5A; Thu,  4 May 2023 19:20:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 21:09:25 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: aa6e00367fecbcc8fda9eeee3c9a288c9cb133e0
X-Git-Newrev: 3232298f1ebc8402b36256a15e37458ec85bff82
X-Patchwork-Hint: ignore
Message-Id: <20230504192056.D915485D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libgtk3: fix cups
 backend
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

commit: https://git.buildroot.net/buildroot/commit/?id=3232298f1ebc8402b36256a15e37458ec85bff82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

When explicitly specifying printing backends libgtk3 requires file
to be one of them on linux.

Fixes:
- output/build/libgtk3-3.24.37/modules/printbackends/meson.build:39:4: ERROR: Problem encountered: 'file' print backed needs to be enabled

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9a0857d734c5fca74915b1cd85b92555fe15fb93)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 18a8a9fa42..b41049b0ee 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -68,7 +68,7 @@ LIBGTK3_DEPENDENCIES += xlib_libXdamage
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
-LIBGTK3_CONF_OPTS += -Dprint_backends=cups
+LIBGTK3_CONF_OPTS += -Dprint_backends=file,cups
 LIBGTK3_DEPENDENCIES += cups
 else
 LIBGTK3_CONF_OPTS += -Dprint_backends=auto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
