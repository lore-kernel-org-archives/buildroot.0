Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979B4C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DAFE40374;
	Mon,  6 Feb 2023 10:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DAFE40374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3TxTPNBdLy5; Mon,  6 Feb 2023 10:57:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 214A54035D;
	Mon,  6 Feb 2023 10:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 214A54035D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D92B1BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5813E60AA7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5813E60AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gi3v24WZh7s5 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:57:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B2A760A89
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B2A760A89
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6847E838DB; Mon,  6 Feb 2023 10:57:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:57:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bbda72743d39df29dfc91e0f52be02b2d465f6d
X-Git-Newrev: 014180011d4333a73857bbd327c5c2aef7f4b43e
X-Patchwork-Hint: ignore
Message-Id: <20230206105723.6847E838DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunibreak: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=014180011d4333a73857bbd327c5c2aef7f4b43e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduced as optional dependency with libass 0.17.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libunibreak/Config.in        |  8 ++++++++
 package/libunibreak/libunibreak.hash |  3 +++
 package/libunibreak/libunibreak.mk   | 13 +++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3eb7fba339..97c28fbdd8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -395,6 +395,7 @@ F:	package/libsndfile/
 F:	package/libsoundtouch/
 F:	package/libsquish/
 F:	package/libudfread/
+F:	package/libunibreak/
 F:	package/liburiparser/
 F:	package/libutp/
 F:	package/libva/
diff --git a/package/Config.in b/package/Config.in
index f32209db95..7817b51fc2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2157,6 +2157,7 @@ menu "Text and terminal handling"
 	source "package/libestr/Config.in"
 	source "package/libfribidi/Config.in"
 	source "package/libiconv/Config.in"
+	source "package/libunibreak/Config.in"
 	source "package/libunistring/Config.in"
 	source "package/linenoise/Config.in"
 	source "package/ncurses/Config.in"
diff --git a/package/libunibreak/Config.in b/package/libunibreak/Config.in
new file mode 100644
index 0000000000..101d621fd6
--- /dev/null
+++ b/package/libunibreak/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBUNIBREAK
+	bool "libunibreak"
+	help
+	  libunibreak is an implementation of the line breaking and word
+	  breaking algorithms as described in Unicode Standard Annex 14
+	  and Unicode Standard Annex 29.
+
+	  https://github.com/adah1972/libunibreak
diff --git a/package/libunibreak/libunibreak.hash b/package/libunibreak/libunibreak.hash
new file mode 100644
index 0000000000..bb85f21cdc
--- /dev/null
+++ b/package/libunibreak/libunibreak.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  dd1a92d4c5646aa0e457ff41d89812ec5243863be6c20bbcb5ee380f3dd78377  libunibreak-5.1.tar.gz
+sha256  0c57e2ec42ece17791a75d2f9b2f8e0663181be008667a507f765b3ef22522db  LICENCE
diff --git a/package/libunibreak/libunibreak.mk b/package/libunibreak/libunibreak.mk
new file mode 100644
index 0000000000..fa52116c1f
--- /dev/null
+++ b/package/libunibreak/libunibreak.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libunibreak
+#
+################################################################################
+
+LIBUNIBREAK_VERSION = 5.1
+LIBUNIBREAK_SITE = https://github.com/adah1972/libunibreak/releases/download/libunibreak_$(subst .,_,$(LIBUNIBREAK_VERSION))
+LIBUNIBREAK_INSTALL_STAGING = YES
+LIBUNIBREAK_LICENSE = Zlib
+LIBUNIBREAK_LICENSE_FILES = LICENCE
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
