Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0708AC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3510242D72;
	Fri, 28 Feb 2025 16:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOO-clRSYNgY; Fri, 28 Feb 2025 16:47:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA884639D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFA884639D;
	Fri, 28 Feb 2025 16:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 074671DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1400424D8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHGtuAg9vm90 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3BC142562
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3BC142562
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B962C80584; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 11:14:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5d69216cfeccbddc7fbe2e201b3d18aa9776ebae
X-Git-Newrev: 0efc06ed5193d4c18fcafb39daaf693a9e81a73e
X-Patchwork-Hint: ignore
Message-Id: <20250228162949.B962C80584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/scons: bump to 4.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0efc06ed5193d4c18fcafb39daaf693a9e81a73e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The tarball was renamed from SCons-<version>.tar.gz to
scons-<version>.tar.gz.

Changes 4.7.0 -> 4.8.0:
  https://scons.org/scons-480-is-available.html

Changes 4.8.0 -> 4.8.1:
  https://scons.org/scons-481-is-available.html

This change has been tested by building the two Buildroot packages
that use host-scons: benejson and gpsd.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/scons/scons.hash | 4 ++--
 package/scons/scons.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index 8dca99830e..3a8a942ee8 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scons/json
-md5  f5a740e94864408902c62bdb47687d9d  SCons-4.7.0.tar.gz
-sha256  d8b617f6610a73e46509de70dcf82f76861b79762ff602d546f4e80918ec81f3  SCons-4.7.0.tar.gz
+md5  37ad818d24ad2f44d6bee5b0f3838706  scons-4.8.1.tar.gz
+sha256  5b641357904d2f56f7bfdbb37e165ab996b6143c948b9df0efc7305f54949daa  scons-4.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index b6bfaa0237..f1f76f38a6 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-SCONS_VERSION = 4.7.0
-SCONS_SOURCE = SCons-$(SCONS_VERSION).tar.gz
-SCONS_SITE = https://files.pythonhosted.org/packages/7b/68/6895065c86c65a9388eb760a43ea695ec5b9b1c98a9675a3bcd682dbe9c0
+SCONS_VERSION = 4.8.1
+SCONS_SITE = https://files.pythonhosted.org/packages/b9/76/a2c1293642f9a448f2d012cabf525be69ca5abf4af289bc0935ac1554ee8
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE
 SCONS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
