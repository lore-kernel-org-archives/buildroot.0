Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2C0CCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 12:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4862B83DC2;
	Sun, 19 Oct 2025 12:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Inf9Q1nbdUng; Sun, 19 Oct 2025 12:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C89083DDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C89083DDD;
	Sun, 19 Oct 2025 12:05:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F330E43F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA93D41280
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GoCEz3iY36t5 for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 12:05:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24E9C4128D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24E9C4128D
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:05:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 139F08753A; Sun, 19 Oct 2025 12:05:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 14:04:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57e632de2fa5d407c2bfae17d08d3dbed2abceb8
X-Git-Newrev: 622e8683ae12f2cf933717f6781ebcd282cdb353
X-Patchwork-Hint: ignore
Message-Id: <20251019120518.139F08753A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.23.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=622e8683ae12f2cf933717f6781ebcd282cdb353
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.samba.org/samba/history/samba-4.23.0.html
https://www.samba.org/samba/history/samba-4.23.1.html
https://www.samba.org/samba/history/samba-4.23.2.html

Rebased patch 0001 due to upstream commit:
https://gitlab.com/samba-team/samba/-/commit/7a4c8d6f84cabfe9d27fcb795a4030de93a1b8cb#8e3d715f2e6eade6c52748fd46ba94a12e2cec4e

Note: the release notes for 4.23.2 mention it includes security
fixes. Those were already included in the previous samba4 version
4.22.5 in Buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch | 6 +++---
 package/samba4/samba4.hash                                          | 4 ++--
 package/samba4/samba4.mk                                            | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
index 8d223e38a0..b8dd012d41 100644
--- a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
+++ b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
@@ -33,7 +33,7 @@ BUG: https://bugzilla.samba.org/show_bug.cgi?id=14164
 
 Signed-off-by: Uri Simchoni <uri@samba.org>
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: rebased for version 4.11.13, 4.17.7, 4.20.3 & 4.22.1]
+[Bernd: rebased for version 4.23.1]
 ---
  wscript_configure_embedded_heimdal | 11 +++++++++++
  wscript_configure_system_heimdal   | 11 -----------
@@ -43,10 +43,10 @@ diff --git a/wscript_configure_embedded_heimdal b/wscript_configure_embedded_hei
 index 8c55ae2..4fdae80 100644
 --- a/wscript_configure_embedded_heimdal
 +++ b/wscript_configure_embedded_heimdal
-@@ -15,3 +15,14 @@
- conf.define('HAVE_CLIENT_GSS_C_CHANNEL_BOUND_FLAG', 1)
+@@ -16,3 +16,14 @@
  
  conf.define('HAVE_KRB5_INIT_CREDS_STEP', 1)
+ conf.define('HAVE_GSS_KEY_VALUE_SET_DESC', 1)
 +
 +def check_system_heimdal_binary(name):
 +    if conf.LIB_MAY_BE_BUNDLED(name):
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 0668a9e8db..462c3c919b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.22.5.tar.asc
-sha256  d8566a15d3dbfc0b777d1e8fbb2eee988a024ca9c786dcac65dd10347307400d  samba-4.22.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.2.tar.asc
+sha256  2de330647e1486683597e261285d04a9b7514ab5c7da27711736e22c7f2b9c2e  samba-4.23.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 688d5177bc..fb2aab01c6 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.22.5
+SAMBA4_VERSION = 4.23.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
