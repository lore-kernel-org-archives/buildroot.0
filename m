Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F81ECD1284
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DD6960034;
	Wed, 10 Apr 2024 21:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mw9RfX8txGZG; Wed, 10 Apr 2024 21:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35FDB605E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35FDB605E8;
	Wed, 10 Apr 2024 21:33:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD631BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68E1540464
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qj7YAIQ10IOl for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A230440473
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A230440473
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:33:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8430085F4D; Wed, 10 Apr 2024 21:33:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 23:26:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f5bbd4458c1307eba7acba2c7f4990973cff115
X-Git-Newrev: f7589fa7add9f88be91b88e59b46754b70506be3
X-Patchwork-Hint: ignore
Message-Id: <20240410213348.8430085F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgit2: bump to version 1.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7589fa7add9f88be91b88e59b46754b70506be3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file was updated for two reasons:
* This version now bundles ntlmclient.  NTLM support is disabled by
  the buildroot package.
* The bundled zlib version (that buildroot does not use) was updated and
  its copyright years changed.

This version also adds support for using the SSH binary (at an hardcoded
/usr/bin/ssh path) instead of using libssh2.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgit2/libgit2.hash | 4 ++--
 package/libgit2/libgit2.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 022fb35a9c..20e6929265 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  de384e29d7efc9330c6cdb126ebf88342b5025d920dcb7c645defad85195ea7f  libgit2-1.7.2.tar.gz
-sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
+sha256  9e1d6a880d59026b675456fbb1593c724c68d73c34c0d214d6eb848e9bbd8ae4  libgit2-1.8.0.tar.gz
+sha256  08041a7e9c4d0e5e84f9711c824a0bd0366ee782ec29c6d7275fdab73e2ca115  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 498b665808..3364841e8f 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.7.2
+LIBGIT2_VERSION = 1.8.0
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
@@ -42,7 +42,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 LIBGIT2_DEPENDENCIES += libssh2
-LIBGIT2_CONF_OPTS += -DUSE_SSH=ON
+LIBGIT2_CONF_OPTS += -DUSE_SSH=libssh2
+else ifeq ($(BR2_PACKAGE_OPENSSH_CLIENT),y)
+LIBGIT2_CONF_OPTS += -DUSE_SSH=exec
 else
 LIBGIT2_CONF_OPTS += -DUSE_SSH=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
