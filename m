Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A50C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 20:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97EAB60BA6;
	Tue,  6 Feb 2024 20:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G--9mUfXCtrO; Tue,  6 Feb 2024 20:51:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B0160BAD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B0160BAD;
	Tue,  6 Feb 2024 20:51:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD631BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE46741913
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2cFfi18yJEfe for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 20:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 147AC418AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 147AC418AF
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 20:51:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10621873C6; Tue,  6 Feb 2024 20:51:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 21:50:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9add4cbfeaafaf3b1c31140429278cd68bd72150
X-Git-Newrev: 09cc83df9f75cc378e1f2acd418dda50aa0db294
X-Patchwork-Hint: ignore
Message-Id: <20240206205120.10621873C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acl: bump to version 2.3.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=09cc83df9f75cc378e1f2acd418dda50aa0db294
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release announcement [1].

This commit also updates the _SITE variable to match the download URL
published in the release announcement in [1]. The package homepage is
also updated to match the one published at [2]. The main motivation
of those URL updates is to switch to https.

[1] https://lists.nongnu.org/archive/html/acl-devel/2024-01/msg00012.html
[2] https://git.savannah.nongnu.org/cgit/acl.git/tree/README?h=v2.3.2#n4

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acl/Config.in | 2 +-
 package/acl/acl.hash  | 2 +-
 package/acl/acl.mk    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/acl/Config.in b/package/acl/Config.in
index 92f2251878..056a31baa8 100644
--- a/package/acl/Config.in
+++ b/package/acl/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_ACL
 	  directories.
 	  This package also provides libacl.
 
-	  http://savannah.nongnu.org/projects/acl
+	  https://savannah.nongnu.org/projects/acl
diff --git a/package/acl/acl.hash b/package/acl/acl.hash
index 32e904baf3..a6094fb985 100644
--- a/package/acl/acl.hash
+++ b/package/acl/acl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  c0234042e17f11306c23c038b08e5e070edb7be44bef6697fb8734dcff1c66b1  acl-2.3.1.tar.xz
+sha256  97203a72cae99ab89a067fe2210c1cbf052bc492b479eca7d226d9830883b0bd  acl-2.3.2.tar.xz
 
 # Locally calculated
 sha256  a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  doc/COPYING
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index c898421dc5..a5371e1aea 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACL_VERSION = 2.3.1
+ACL_VERSION = 2.3.2
 ACL_SOURCE = acl-$(ACL_VERSION).tar.xz
-ACL_SITE = http://download.savannah.gnu.org/releases/acl
+ACL_SITE = https://download.savannah.nongnu.org/releases/acl
 ACL_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 ACL_CPE_ID_VENDOR = acl_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
