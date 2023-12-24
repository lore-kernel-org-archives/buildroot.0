Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D672C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 17:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C55E281871;
	Sun, 24 Dec 2023 17:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C55E281871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDxy2qECfnyN; Sun, 24 Dec 2023 17:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22E0A8177C;
	Sun, 24 Dec 2023 17:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22E0A8177C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4011BF398
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F5FE41529
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F5FE41529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxBlInFF3bgF for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 17:52:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C0DA41523
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 17:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C0DA41523
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DE6082765; Sun, 24 Dec 2023 17:52:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 18:51:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8219955118fee56ccd3ca8a13a6350d0e15de418
X-Git-Newrev: cbd06b6ddd20493bf7bb56ee52919ecdd55ec647
X-Patchwork-Hint: ignore
Message-Id: <20231224175212.0DE6082765@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: add option to support
 curses in host-python
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cbd06b6ddd20493bf7bb56ee52919ecdd55ec647
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This can be relevant for host scripts that use Python.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/Config.in.host | 5 +++++
 package/python3/python3.mk     | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 77d608bdc0..88c286c55b 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -12,6 +12,11 @@ config BR2_PACKAGE_HOST_PYTHON3_BZIP2
 	help
 	  bz2 module for host Python3.
 
+config BR2_PACKAGE_HOST_PYTHON3_CURSES
+	bool "curses"
+	help
+	  curses module for host Python3.
+
 config BR2_PACKAGE_HOST_PYTHON3_SSL
 	bool "ssl"
 	select BR2_PACKAGE_HOST_OPENSSL
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b9c5054a21..7a704d81e0 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -22,7 +22,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
-	--disable-curses \
 	--disable-codecs-cjk \
 	--disable-nis \
 	--enable-unicodedata \
@@ -55,6 +54,12 @@ else
 HOST_PYTHON3_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_CURSES),y)
+HOST_PYTHON3_DEPENDENCIES += host-ncurses
+else
+HOST_PYTHON3_CONF_OPTS += --disable-curses
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
 HOST_PYTHON3_DEPENDENCIES += host-openssl
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
