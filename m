Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E73D49780
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 17:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FB707066E;
	Sun,  1 Dec 2024 17:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTpAQqPuDMqj; Sun,  1 Dec 2024 17:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 223E46F614
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 223E46F614;
	Sun,  1 Dec 2024 17:46:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AEF5A6C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9648A84C43
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0siGerAxpS7x for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 17:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1006A84E50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1006A84E50
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0ED9867CA; Sun,  1 Dec 2024 17:45:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Dec 2024 18:42:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f47195d540f63543728fd4982f2e6ae8aac2b2b
X-Git-Newrev: 24bad65295ff697e83fc90fcebb8278e880e407d
X-Patchwork-Hint: ignore
Message-Id: <20241201174550.F0ED9867CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sway: bump to version
 1.10
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=24bad65295ff697e83fc90fcebb8278e880e407d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: [1] [2].

Also, upstream commit [3], included in v1.10, removed the "xwayland"
build time option. This commit removes the corresponding
SWAY_CONF_OPTS.

[1] https://github.com/swaywm/sway/releases/tag/1.10
[2] https://github.com/swaywm/sway/releases/tag/1.9
[3] https://github.com/swaywm/sway/commit/970415241497ceccfb013b6f8cb2395abee74e5c

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Julien:
  - add new line before S-o-b
  - add link justifying the removal of xwayland option
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sway/sway.hash | 6 ++++--
 package/sway/sway.mk   | 8 +-------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/sway/sway.hash b/package/sway/sway.hash
index 86b6581f1c..379180b0de 100644
--- a/package/sway/sway.hash
+++ b/package/sway/sway.hash
@@ -1,3 +1,5 @@
-# Locally computed, tarball verified with GPG signature
-sha256  73f08fd2cf7948e8af900709efe44eae412ae11c5773960e25c9aa09f73bad41  sway-1.8.1.tar.gz
+# Locally calculated after checking pgp signature
+# https://github.com/swaywm/sway/releases/download/1.10/sway-1.10.tar.gz.sig
+# with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
+sha256  7472a7f11150212e0bed0bd0af9f591c9caac9f9ea87c35486e475a21f5ce81f  sway-1.10.tar.gz
 sha256  bd35722bff46327f5eded1d211207277bbe043d2a22048b282c42ef801593b8b  LICENSE
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 0aad9de712..74614b0c7f 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWAY_VERSION = 1.8.1
+SWAY_VERSION = 1.10
 SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
@@ -16,12 +16,6 @@ SWAY_CONF_OPTS = \
 	-Dman-pages=disabled \
 	-Dsd-bus-provider=libsystemd
 
-ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
-SWAY_CONF_OPTS += -Dxwayland=enabled
-else
-SWAY_CONF_OPTS += -Dxwayland=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
 SWAY_CONF_OPTS += -Dgdk-pixbuf=enabled
 SWAY_DEPENDENCIES += gdk-pixbuf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
