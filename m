Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2944DC27C5F
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAFD784D12;
	Sat,  8 Jun 2024 19:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0hRRZG0QA6d; Sat,  8 Jun 2024 19:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06EB584D30
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06EB584D30;
	Sat,  8 Jun 2024 19:17:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 829BE1BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 789C3409D1
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyggBF14Yigq for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70A7F416AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70A7F416AD
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CB897FC58; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:21:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 97d7a8e9c81dab338d7e5faae47471eeda0109d6
X-Git-Newrev: de9436e29d7ce1f5ce8e7673b52d14d2947649a6
X-Patchwork-Hint: ignore
Message-Id: <20240608191502.6CB897FC58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/vala: bump to
 version 0.56.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=de9436e29d7ce1f5ce8e7673b52d14d2947649a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes:
http://autobuild.buildroot.net/results/f08/f087b879167252690ed198de771292142c6249f8/

Set GI_GIRDIR env variable which is now required for configure
to function.

Details:
https://gitlab.gnome.org/GNOME/vala/-/commit/a9d38070ce86d7994b949f7cb426fbf670a953d8

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: drop spurious reflow of _DEPENDENCIES]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3d4896c52909b43e0c3049f8f79f77b5c502e2dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index b3716f0854..a16875ac6a 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/vala/0.56/vala-0.56.14.sha256sum
-sha256  9382c268ca9bdc02aaedc8152a9818bf3935273041f629c56de410e360a3f557  vala-0.56.14.tar.xz
+# From https://download.gnome.org/sources/vala/0.56/vala-0.56.17.sha256sum
+sha256  26100c4e4ef0049c619275f140d97cf565883d00c7543c82bcce5a426934ed6a  vala-0.56.17.tar.xz
 # Locally computed
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 415d996faa..85f928202a 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.56
-VALA_VERSION = $(VALA_VERSION_MAJOR).14
+VALA_VERSION = $(VALA_VERSION_MAJOR).17
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPL-2.1+
@@ -15,7 +15,9 @@ VALA_CPE_ID_VENDOR = gnome
 HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
 # Yes, the autoconf script understands ':' as "xsltproc is not
 # available".
-HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
+HOST_VALA_CONF_ENV = \
+	ac_cv_path_XSLTPROC=: \
+	GI_GIRDIR="$(STAGING_DIR)/usr/share/gir-1.0"
 HOST_VALA_CONF_OPTS += --disable-valadoc
 
 # We wrap vala, valac and vapigen to point to the proper gir and vapi data dirs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
