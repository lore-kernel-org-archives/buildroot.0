Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D476E77191
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 08:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 086A1403DA;
	Sat, 28 Dec 2024 08:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGJBL_1BtS0h; Sat, 28 Dec 2024 08:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A6E6404C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A6E6404C6;
	Sat, 28 Dec 2024 08:51:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14616E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3920403FC
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzmS9_mX3jlQ for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 08:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22F240350
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D22F240350
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 08:51:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0087874A5; Sat, 28 Dec 2024 08:51:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 09:42:00 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f62d6af7fd20820c62bf294365b788f064d9ec52
X-Git-Newrev: 41bd9a5839abc69458d0bf7e7263c72436313ac1
X-Patchwork-Hint: ignore
Message-Id: <20241228085107.C0087874A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libsoup3:
 security bump to version 3.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=41bd9a5839abc69458d0bf7e7263c72436313ac1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security vulnerabilities:

CVE-2024-52531: GNOME libsoup before 3.6.1 allows a buffer overflow in
applications that perform conversion to UTF-8 in
soup_header_parse_param_list_strict.  Input received over the network cannot
trigger this.

https://www.cve.org/CVERecord?id=CVE-2024-52531

CVE-2024-52532: GNOME libsoup before 3.6.1 has an infinite loop, and memory
consumption.  during the reading of certain patterns of WebSocket data from
clients.

https://www.cve.org/CVERecord?id=CVE-2024-52532

Changelog: https://gitlab.gnome.org/GNOME/libsoup/-/blob/3.6.1/NEWS

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b9120736a7e1e6c6e685d70a5a93e4d861422d70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 37ecd2db84..23af347903 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.0.sha256sum
-sha256  62959f791e8e8442f8c13cedac8c4919d78f9120d5bb5301be67a5e53318b4a3  libsoup-3.6.0.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.1.sha256sum
+sha256  ceb1f1aa2bdd73b2cd8159d3998c96c55ef097ef15e4b4f36029209fa18af838  libsoup-3.6.1.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index f8a7e26159..f2f96c2def 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP3_VERSION_MAJOR = 3.6
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).0
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).1
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
