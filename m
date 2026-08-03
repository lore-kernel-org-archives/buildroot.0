Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D18C55843
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 19:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBFF160730;
	Mon,  3 Aug 2026 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLFvy62hfD_z; Mon,  3 Aug 2026 19:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB01B60716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785785732;
	bh=WZC9ZNI1EEQzRezBujXQLbM2DCFQbMkABzrftjkRuKw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e34Hnuorj66H9/mZaz6UpXBHniwhzMV2GLQRq6bE8sGhmJF/MI/Q33gIK5/dWZu6f
	 HrYlD78RA58Gy+e0FekTyu5OqlwcFbJMJu1fPzpfci8jh47YyXV0UPOkiq5TO6JoxS
	 xIRTgX3w+tScVR9OwNrbC+nSQa8TqlxiEhZ5ab/LQ93c0IvoFICJnofnAGcnqu+nh0
	 jI7F/BwKzTCUuGeB/qwOrHUybjCzar+JhnOyCTXj/x+gOHaxYjx1DlFspGWNKa8VSH
	 jIKb5lPTY2HfByPefF7F8f0FPzn2m5/cqegqohUUKU6OCs3xra3prTnC29GFr6S61E
	 P6kq8L+uWFCKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB01B60716;
	Mon,  3 Aug 2026 19:35:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DF1A2DE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FAC16069F
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GN7Ocw9RFm1i for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8512A606B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8512A606B4
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A83CD8B857; Mon,  3 Aug 2026 19:34:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Aug 2026 21:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44d38432343e65ec7a6d898cf982985cc2bc1e88
X-Git-Newrev: 2bcc975125461b092e1d7e5d1ce0664d95d14149
X-Patchwork-Hint: ignore
Message-Id: <20260803193439.A83CD8B857@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hare-ev: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2bcc975125461b092e1d7e5d1ce0664d95d14149
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in            |  1 +
 package/hare-ev/Config.in    |  8 ++++++++
 package/hare-ev/hare-ev.hash |  3 +++
 package/hare-ev/hare-ev.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ee0aadbec1..c502e8b5e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2176,6 +2176,7 @@ menu "Other"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/gumbo-parser/Config.in"
+	source "package/hare-ev/Config.in"
 	source "package/highway/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
diff --git a/package/hare-ev/Config.in b/package/hare-ev/Config.in
new file mode 100644
index 0000000000..5a65e1fbce
--- /dev/null
+++ b/package/hare-ev/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HARE_EV
+	bool "hare-ev"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	help
+	  This package provides an event loop for Hare programs.
+
+	  https://git.sr.ht/~sircmpwn/hare-ev
diff --git a/package/hare-ev/hare-ev.hash b/package/hare-ev/hare-ev.hash
new file mode 100644
index 0000000000..beb0c6f4d4
--- /dev/null
+++ b/package/hare-ev/hare-ev.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c80dc647f3a227259c05dab3b42b4cdfee44c68acd8e7cf31245807a8fa79188  hare-ev-0.26.0.0-git4.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare-ev/hare-ev.mk b/package/hare-ev/hare-ev.mk
new file mode 100644
index 0000000000..0f374f3a35
--- /dev/null
+++ b/package/hare-ev/hare-ev.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hare-ev
+#
+################################################################################
+
+HARE_EV_VERSION = 0.26.0.0
+HARE_EV_SITE_METHOD = git
+HARE_EV_SITE = https://git.sr.ht/~sircmpwn/hare-ev
+HARE_EV_LICENSE = MPL-2.0
+HARE_EV_LICENSE_FILES = COPYING
+HARE_EV_INSTALL_STAGING = YES
+
+$(eval $(hare-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
