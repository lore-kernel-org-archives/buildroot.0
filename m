Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19752C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEAC481FCD;
	Sun,  3 Mar 2024 16:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pOcuA1NjgU8; Sun,  3 Mar 2024 16:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3107B81FF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3107B81FF0;
	Sun,  3 Mar 2024 16:48:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A100D1BF8C7
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98B8040766
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQONZSpyzNWI for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D834072D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8D834072D
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8581887FD6; Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 17:29:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e97cd704c58c133a226f109337ae4d83b124b780
X-Git-Newrev: 7781cdca3163035f3f89df90605cde7c5b7cd3c5
X-Patchwork-Hint: ignore
Message-Id: <20240303164812.8581887FD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: drop
 BR2_PACKAGE_SHADOW_UTMPX
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7781cdca3163035f3f89df90605cde7c5b7cd3c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

utmpx is not available since bump to version 4.14.3 in commit
8a01774d9897310c00a0945865f5a6d5167dfca3 and
https://github.com/shadow-maint/shadow/commit/3be7b9d75a6b73fe24394d7ac1e315d60d45b5ee:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --enable-utmpx

Fixes: 8a01774d9897310c00a0945865f5a6d5167dfca3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Config.in.legacy         | 6 ++++++
 package/shadow/Config.in | 5 -----
 package/shadow/shadow.mk | 6 ------
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a869279af7..576148c4af 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.02"
 
+config BR2_PACKAGE_SHADOW_UTMPX
+	bool "shadow utmpx removed"
+	select BR2_LEGACY
+	help
+	  UTMPX has been dropped by upstream.
+
 config BR2_PACKAGE_TINYMEMBENCH
 	bool "tinymembench removed"
 	select BR2_LEGACY
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index e85e5884d2..230271af7d 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -31,11 +31,6 @@ comment "account-tools-setuid needs a toolchain w/ dynamic library, wchar, local
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
 		!BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
-config BR2_PACKAGE_SHADOW_UTMPX
-	bool "utmpx"
-	help
-	  Enable loggin in utmpx / wtmpx.
-
 config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
 	bool "subordinate-ids"
 	help
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 03eb16a3f4..1e7ada6148 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -43,12 +43,6 @@ else
 SHADOW_CONF_OPTS += --disable-account-tools-setuid
 endif
 
-ifeq ($(BR2_PACKAGE_SHADOW_UTMPX),y)
-SHADOW_CONF_OPTS += --enable-utmpx
-else
-SHADOW_CONF_OPTS += --disable-utmpx
-endif
-
 ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
 SHADOW_CONF_OPTS += --enable-subordinate-ids
 define SHADOW_SUBORDINATE_IDS_PERMISSIONS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
