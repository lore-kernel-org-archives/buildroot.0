Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD8BC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C564FC42;
	Fri, 28 Feb 2025 17:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSzPlhqkG1PX; Fri, 28 Feb 2025 17:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AADB5086D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AADB5086D;
	Fri, 28 Feb 2025 17:13:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EA0568
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60D8F42F4F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQhpQIfuaxEu for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8724042FCA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8724042FCA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D44F86780; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 18:13:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1c386996012b46205b096617474719c03633550d
X-Git-Newrev: 689aff3df426d234abb7b4608ae65124bbffe72f
X-Patchwork-Hint: ignore
Message-Id: <20250228163032.7D44F86780@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pcre2: bump version to
 10.44
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

commit: https://git.buildroot.net/buildroot/commit/?id=689aff3df426d234abb7b4608ae65124bbffe72f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- enable PCRE2_AUTORECONF to fix the following buildi/relink failure:

    x86_64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used
    in cross-compilation: '-L/usr/lib'

For details see [1].

[1] https://github.com/PCRE2Project/pcre2/blob/master/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcre2/pcre2.hash | 4 ++--
 package/pcre2/pcre2.mk   | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index f2e17df753..8b22040ba7 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.43/pcre2-10.43.tar.bz2.sig
-sha256  e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096cc9bf1b728c350bcb  pcre2-10.43.tar.bz2
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.44/pcre2-10.44.tar.bz2.sig
+sha256  d34f02e113cf7193a1ebf2770d3ac527088d485d4e047ed10e5d217c6ef5de96  pcre2-10.44.tar.bz2
 # Locally computed
 sha256  030087e2e8dd7c1bdd26057d25d4ded8f45bbf01ad458d68665ad04b8b0fbedf  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 9641f22e81..191596181a 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.43
+PCRE2_VERSION = 10.44
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
@@ -12,6 +12,9 @@ PCRE2_LICENSE_FILES = LICENCE
 PCRE2_CPE_ID_VENDOR = pcre
 PCRE2_INSTALL_STAGING = YES
 PCRE2_CONFIG_SCRIPTS = pcre2-config
+# Fixes build/relink failure ("ERROR: unsafe header/library path used in
+# cross-compilation: '-L/usr/lib'")
+PCRE2_AUTORECONF = YES
 
 PCRE2_CONF_OPTS += --enable-pcre2-8
 PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_16),--enable-pcre2-16,--disable-pcre2-16)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
