Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4E7E6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4B1E846F4;
	Fri,  6 Sep 2024 20:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bn1F4ObGh5HV; Fri,  6 Sep 2024 20:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0BF384702
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0BF384702;
	Fri,  6 Sep 2024 20:01:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 303461BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9668461118
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9fD8NXbOR31 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C1C60777
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1C1C60777
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E671F828CC; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 10:57:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6599dbd7dafdf31e1ca101224c0d5aeec597cec
X-Git-Newrev: 5b54c1166b78fa0b36183d58be2fd0ff140ee41f
X-Patchwork-Hint: ignore
Message-Id: <20240906195853.E671F828CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s6-linux-utils: add option to
 build multicall binary
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
Content-Type: multipart/mixed; boundary="===============2504842752105660821=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2504842752105660821==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5b54c1166b78fa0b36183d58be2fd0ff140ee41f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 2.6.1.0, with another bugfix in 2.6.2.0, s6-linux-utils
can be built as a multicall binary, similar to busybox.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-linux-utils/Config.in         | 10 ++++++++++
 package/s6-linux-utils/s6-linux-utils.mk |  1 +
 2 files changed, 11 insertions(+)

diff --git a/package/s6-linux-utils/Config.in b/package/s6-linux-utils/Config.in
index 43e6bb9144..f716e852b9 100644
--- a/package/s6-linux-utils/Config.in
+++ b/package/s6-linux-utils/Config.in
@@ -7,3 +7,13 @@ config BR2_PACKAGE_S6_LINUX_UTILS
 	  system utilities.
 
 	  http://skarnet.org/software/s6-linux-utils/
+
+if BR2_PACKAGE_S6_LINUX_UTILS
+
+config BR2_PACKAGE_S6_LINUX_UTILS_MULTICALL
+	bool "s6-linux-utils multicall binary"
+	help
+	  Build s6-linux-utils as a multicall binary to save disk
+	  space.
+
+endif
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index f83f47ac3e..04e08c3d43 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -17,6 +17,7 @@ S6_LINUX_UTILS_CONF_OPTS = \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(if $(BR2_PACKAGE_S6_LINUX_UTILS_MULTICALL),--enable-multicall,) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
 define S6_LINUX_UTILS_CONFIGURE_CMDS

--===============2504842752105660821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2504842752105660821==--
