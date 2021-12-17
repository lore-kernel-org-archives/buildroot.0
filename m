Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF72C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 22:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB8D060F2B;
	Fri, 17 Dec 2021 22:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rnq_6GmPGzdN; Fri, 17 Dec 2021 22:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB086118C;
	Fri, 17 Dec 2021 22:05:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9E01BF5AA
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D65C84D78
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UT8_T5w_sjDg for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 22:05:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E378384D62
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 22:05:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CFF6B81292; Fri, 17 Dec 2021 22:00:30 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 23:04:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 494807e28dd4c7a0ad87224ac8d60910c8dabf43
X-Git-Newrev: c4b36ba4b6adb2840cd9a9bbab00fd9b09dbc06a
X-Patchwork-Hint: ignore
Message-Id: <20211217220030.CFF6B81292@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: select videorate when
 building with media-stream support
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4b36ba4b6adb2840cd9a9bbab00fd9b09dbc06a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
ERROR GST_PIPELINE gst/parse/grammar.y:857:priv_gst_parse_yyparse: no element "videorate"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 8357051e93..36523bdb41 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -109,6 +109,7 @@ if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 
 config BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM
 	bool "media-stream support"
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE
 	help
 	  This option enables media-stream support.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
