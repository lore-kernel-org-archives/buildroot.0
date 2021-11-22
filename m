Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7F1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ADA860D6E;
	Mon,  6 Dec 2021 18:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwwVj8vS64Iw; Mon,  6 Dec 2021 18:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3C6B60D6D;
	Mon,  6 Dec 2021 18:29:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3D01BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5511560D62
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xxb4HIBUUZE2 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5FE660D73
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 62B3281504; Mon,  6 Dec 2021 18:07:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 00:06:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dd2f3751ff2aa60df7de5453e65aa148f64645d
X-Git-Newrev: 6379da58bf74612822c2e8c505cbe7402ba458b7
X-Patchwork-Hint: ignore
Message-Id: <20211206180741.62B3281504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcr/gcr.mk: enable gtk backend for
 wayland
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

commit: https://git.buildroot.net/buildroot/commit/?id=6379da58bf74612822c2e8c505cbe7402ba458b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcr has supported wayland since commit
685e1da9642b7a3fb0dbe1afda482f7bd5b05f33.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcr/gcr.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index d51e853f3f..ef253b4ef9 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -30,10 +30,12 @@ else
 GCR_CONF_OPTS += -Dintrospection=false
 endif
 
-# Only the X11 backend is supported for the simple GUI
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 GCR_DEPENDENCIES += libgtk3
 GCR_CONF_OPTS += -Dgtk=true
+else ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
+GCR_DEPENDENCIES += libgtk3
+GCR_CONF_OPTS += -Dgtk=true
 else
 GCR_CONF_OPTS += -Dgtk=false
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
