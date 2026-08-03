Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643CFC55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 19:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 694CF606E8;
	Mon,  3 Aug 2026 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xiXh3bO22dE5; Mon,  3 Aug 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A1D6069F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785785727;
	bh=RQ718JUi06QBYphwoiRz0Yk16VQAWhp2iybw+U4YbjU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KClImat+R///osxPWXywayB15DST8wAGYQSIDLVFXhtjrxRDqWQ1fbbXMI3aFU3vH
	 OuDd7L+xlqFzM74DVp2pHK9XAKnyRa6iQqDQi9khMaDjhUvK3s6ILhdIvHrphYW/ZU
	 xGWQnc7wDNXEmWRiMlJMWWGxbq81yRHqmVc8YXyTwAN63LC5qoLTOJB8kNhIkKfu45
	 mjxa1AaSQU9Mb49HQv9OiApAjFuPYK6ERycVv9OF+24LB/zftmwAAPG1qKo6gAsCuC
	 Hd2UV3ZKeYh5z1kCE1WflJprLStRi8HYXE943hiZNMJ68oUamTmIwoYBxCYRHL1uxI
	 D36/GsVIq6lhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A1D6069F;
	Mon,  3 Aug 2026 19:35:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D80536E
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3A5F405DD
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46HttWligJmg for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44BFC405D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44BFC405D3
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F1058B857; Mon,  3 Aug 2026 19:34:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Aug 2026 21:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce991648466d4de2704ea02286a01f9d5aed4f64
X-Git-Newrev: cfba7bc570a02f4a27f1589532fdcc6b44cf7c98
X-Patchwork-Hint: ignore
Message-Id: <20260803193439.7F1058B857@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/scdoc: new host package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cfba7bc570a02f4a27f1589532fdcc6b44cf7c98
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS               |  1 +
 package/scdoc/scdoc.hash |  3 +++
 package/scdoc/scdoc.mk   | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f2d999bbd8..d9b2715f22 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1206,6 +1206,7 @@ F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
 F:	package/quickjs/
 F:	package/rings/
+F:	package/scdoc/
 F:	package/wsapi/
 F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
diff --git a/package/scdoc/scdoc.hash b/package/scdoc/scdoc.hash
new file mode 100644
index 0000000000..8917b40386
--- /dev/null
+++ b/package/scdoc/scdoc.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e1a9c2000f855123a1a50c8f897073e0ee95fc41787431efe3864c2f1c2e7092  1.11.4.tar.gz
+sha256  ad227c56bf22c9fa35be3d383789d065698904b61161f6a8339b91bde5a3e48b  COPYING
diff --git a/package/scdoc/scdoc.mk b/package/scdoc/scdoc.mk
new file mode 100644
index 0000000000..ab6e1b4541
--- /dev/null
+++ b/package/scdoc/scdoc.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# scdoc
+#
+################################################################################
+
+SCDOC_VERSION = 1.11.4
+SCDOC_SITE = https://git.sr.ht/~sircmpwn/scdoc/archive
+SCDOC_SOURCE = $(SCDOC_VERSION).tar.gz
+SCDOC_LICENSE = MIT
+SCDOC_LICENSE_FILES = COPYING
+
+define HOST_SCDOC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define HOST_SCDOC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
