Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCF3C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 19:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 323AA6070B;
	Mon,  3 Aug 2026 19:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rt4vTpbNFeot; Mon,  3 Aug 2026 19:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D5DB60711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785785731;
	bh=05k8aRBUoRKYTurjd7k3IehnQQNE2C/UaXITo4FCoD4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=am4iOf4Ufv60xLAD8S9JoE3ABXtcgNNiaJ72QL5iwv5cBXL+RQz5gXuCcPuGUU+DA
	 OgnmzKBooWVUPUUId5RtgDJAmsLpU5m/YiLBbplC2AD30YpBJrIC/S4yvuhRU5dFMq
	 aT7bJ89zuvy63iK8BEkr7cCBPNWhFV8welJPSpagfLBDnXeMuiiYGRXDV9nBqHofOR
	 9mCeBd3HDckufVycicWgPED9S7waXXnYnI+HkyuepKO4vIvcWLECZHjb32bQ56YJUv
	 7OiSCVsIZDkgX/DKgTh9XmrX339MM44VFkcAhCDlnm1q91Xju1Zy7v6EiZ1RZzfsmK
	 gVyBOHXXXyTzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D5DB60711;
	Mon,  3 Aug 2026 19:35:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 572812DE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 480006069F
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3E7bVuY3Ams for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80704606B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80704606B0
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B15908B858; Mon,  3 Aug 2026 19:34:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Aug 2026 21:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bcc975125461b092e1d7e5d1ce0664d95d14149
X-Git-Newrev: d5b1b7b1b63dcaf8c8b4fea164255567d821d19c
X-Patchwork-Hint: ignore
Message-Id: <20260803193439.B15908B858@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hare-xml: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5b1b7b1b63dcaf8c8b4fea164255567d821d19c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in              |  1 +
 package/hare-xml/Config.in     |  8 ++++++++
 package/hare-xml/hare-xml.hash |  3 +++
 package/hare-xml/hare-xml.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c502e8b5e1..2a749f9415 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1890,6 +1890,7 @@ menu "JSON/XML"
 	source "package/benejson/Config.in"
 	source "package/cjson/Config.in"
 	source "package/expat/Config.in"
+	source "package/hare-xml/Config.in"
 	source "package/jansson/Config.in"
 	source "package/jose/Config.in"
 	source "package/jsmn/Config.in"
diff --git a/package/hare-xml/Config.in b/package/hare-xml/Config.in
new file mode 100644
index 0000000000..469a9907a9
--- /dev/null
+++ b/package/hare-xml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HARE_XML
+	bool "hare-xml"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	help
+	  This package provides XML support for Hare.
+
+	  https://git.sr.ht/~sircmpwn/hare-xml
diff --git a/package/hare-xml/hare-xml.hash b/package/hare-xml/hare-xml.hash
new file mode 100644
index 0000000000..25c1f3c1d7
--- /dev/null
+++ b/package/hare-xml/hare-xml.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  56703cc20f70878a02f37967385e9af3659733b31c91c5f34cf819d235a20a28  hare-xml-0.25.2.0-git4.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare-xml/hare-xml.mk b/package/hare-xml/hare-xml.mk
new file mode 100644
index 0000000000..be30fd9343
--- /dev/null
+++ b/package/hare-xml/hare-xml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hare-xml
+#
+################################################################################
+
+HARE_XML_VERSION = 0.25.2.0
+HARE_XML_SITE_METHOD = git
+HARE_XML_SITE = https://git.sr.ht/~sircmpwn/hare-xml
+HARE_XML_LICENSE = MPL-2.0
+HARE_XML_LICENSE_FILES = COPYING
+HARE_XML_INSTALL_STAGING = YES
+
+$(eval $(hare-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
