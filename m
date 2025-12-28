Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0246AD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 14:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B1AE40670;
	Sun, 28 Dec 2025 14:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iI2fJCrgdCIv; Sun, 28 Dec 2025 14:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F38240638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766933290;
	bh=kzxZx8zzJBzLY9Wmbzolp046WP+2BdTjZ5tZ8WeUTBU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G8W0GDlf60W3Zq9wH15S9MIXYvUZEIncrzbZ2LNljdLwQ4E0K0369unxm3k42na5N
	 t7fsK5E5+0nHhdpgW14vM8ymYiVH+4TsIS3KY8d1rk+23QjmuyjHxgA/vorFRwbnlt
	 jb6MdzK9ID+Jn2NvoK3sSN23od59uUUonVUlvrRGbRsYZoE9vOXSYex+9dt4xDAMH/
	 NrQaOqukoxjl8Zu8hO2cLqk5H5X1UTu7CVM3B0GUPAzj3CilbIO/ILGh9hhfJF+7GY
	 VKEiQXBqe2fjlpPVWufrZszfGkP0kb53YDp5qniRjGo1YBO7JJv/UX7K6eqEk0I5oR
	 +O6QnJ3ARgNZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F38240638;
	Sun, 28 Dec 2025 14:48:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DD9A1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 849116081F
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItXgrs8w5d8F for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 14:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7FE36075E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7FE36075E
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:48:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7EDF87958; Sun, 28 Dec 2025 14:48:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 15:16:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 814eef2adf1ddb0507b053645918f2f7b92a083e
X-Git-Newrev: 306138d415e493102c00a773b3f5cf32c52f261b
X-Patchwork-Hint: ignore
Message-Id: <20251228144808.A7EDF87958@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yq: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=306138d415e493102c00a773b3f5cf32c52f261b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS           |  1 +
 package/Config.in    |  1 +
 package/yq/Config.in | 10 ++++++++++
 package/yq/yq.hash   |  3 +++
 package/yq/yq.mk     | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0296a28280..c876be2cb6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3194,6 +3194,7 @@ F:	package/vuejs-router/
 N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
 F:	package/libsoup3/
+F:	package/yq/
 
 N:	Thomas Huth <th.huth+br@posteo.eu>
 F:	package/ascii-invaders/
diff --git a/package/Config.in b/package/Config.in
index 297565ab1b..cd8765bbcf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -203,6 +203,7 @@ menu "Development tools"
 	source "package/tree/Config.in"
 	source "package/unifdef/Config.in"
 	source "package/yasm/Config.in"
+	source "package/yq/Config.in"
 endmenu
 
 menu "Filesystem and flash utilities"
diff --git a/package/yq/Config.in b/package/yq/Config.in
new file mode 100644
index 0000000000..d85b3e5601
--- /dev/null
+++ b/package/yq/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_YQ
+	bool "yq"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  A lightweight and portable command-line YAML, JSON, INI
+	  and XML processor, yq uses jq (a popular JSON processor)
+	  like syntax.
+
+	  https://mikefarah.gitbook.io/yq/
diff --git a/package/yq/yq.hash b/package/yq/yq.hash
new file mode 100644
index 0000000000..519d1c9a3e
--- /dev/null
+++ b/package/yq/yq.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  291334bc00863c144098b5b0a723a5c769df115c46938e17920917aa24776591  yq-4.49.2-go2.tar.gz
+sha256  697db34dabb21562fe84487a2ccd031fbd45382b89c2cbdec8ef31682c486040  LICENSE
diff --git a/package/yq/yq.mk b/package/yq/yq.mk
new file mode 100644
index 0000000000..10d0959791
--- /dev/null
+++ b/package/yq/yq.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# yq
+#
+################################################################################
+
+YQ_VERSION = 4.49.2
+YQ_SITE = $(call github,mikefarah,yq,v$(YQ_VERSION))
+YQ_LICENSE = MIT
+YQ_LICENSE_FILES = LICENSE
+YQ_GOMOD = github.com/mikefarah/yq/v4
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
