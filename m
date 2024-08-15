Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CB4C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 08:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EBD360A69;
	Thu, 15 Aug 2024 08:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocqcTt_cd1Sr; Thu, 15 Aug 2024 08:58:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47D5E60A6E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47D5E60A6E;
	Thu, 15 Aug 2024 08:58:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 793481BF2B6
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7294E407A3
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-UBECLV_8Jt for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 08:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7249B40228
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7249B40228
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 08:58:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CDDA85E29; Thu, 15 Aug 2024 08:58:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 10:57:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ef8ed5ccfec1cced0132f03df26b94d656b6ce72
X-Git-Newrev: a6599dbd7dafdf31e1ca101224c0d5aeec597cec
X-Patchwork-Hint: ignore
Message-Id: <20240815085802.5CDDA85E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/s6-portable-utils: add
 option to build multicall binary
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9103011484407278308=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9103011484407278308==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a6599dbd7dafdf31e1ca101224c0d5aeec597cec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since version 2.3.0.0, with another bugfix in 2.3.0.3, s6-portable-utils
can be built as a multicall binary, similar to busybox.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-portable-utils/Config.in            | 10 ++++++++++
 package/s6-portable-utils/s6-portable-utils.mk |  1 +
 2 files changed, 11 insertions(+)

diff --git a/package/s6-portable-utils/Config.in b/package/s6-portable-utils/Config.in
index 8521ecfa8a..d4ecfcc38b 100644
--- a/package/s6-portable-utils/Config.in
+++ b/package/s6-portable-utils/Config.in
@@ -10,3 +10,13 @@ config BR2_PACKAGE_S6_PORTABLE_UTILS
 	  they work everywhere.
 
 	  http://skarnet.org/software/s6-portable-utils/
+
+if BR2_PACKAGE_S6_PORTABLE_UTILS
+
+config BR2_PACKAGE_S6_PORTABLE_UTILS_MULTICALL
+	bool "s6-portable-utils multicall binary"
+	help
+	  Build s6-portable-utils as a multicall binary to save disk
+	  space.
+
+endif
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index c40100b06c..826750f387 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -17,6 +17,7 @@ S6_PORTABLE_UTILS_CONF_OPTS = \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(if $(BR2_PACKAGE_S6_PORTABLE_UTILS_MULTICALL),--enable-multicall,) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
 define S6_PORTABLE_UTILS_CONFIGURE_CMDS

--===============9103011484407278308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9103011484407278308==--
