Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7E0C433FE
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 23:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1200B4016B;
	Mon, 22 Nov 2021 23:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwFt7eMZ4TeG; Mon, 22 Nov 2021 23:07:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B491400EB;
	Mon, 22 Nov 2021 23:07:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E2DD1BF3E9
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 23:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DE50402B2
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 23:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2x5cjcOZCnEC for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 23:07:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BDB240231
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 23:07:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B36888F010; Mon, 22 Nov 2021 23:02:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 23 Nov 2021 00:06:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2dd2f3751ff2aa60df7de5453e65aa148f64645d
X-Git-Newrev: 6379da58bf74612822c2e8c505cbe7402ba458b7
X-Patchwork-Hint: ignore
Message-Id: <20211122230235.B36888F010@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcr/gcr.mk: enable gtk
 backend for wayland
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
