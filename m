Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6D5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0366F41174;
	Thu, 26 May 2022 08:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qugltJ0cT9QP; Thu, 26 May 2022 08:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F312241171;
	Thu, 26 May 2022 08:21:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4D11BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 834F942551
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCSZWRI5LG8D for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 676A74255C
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CFC3C864D6; Thu, 26 May 2022 08:09:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 10:14:07 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3ea6d6dd9c7d93f391b85d0abefabe49b472fdc3
X-Git-Newrev: bb62363012653011a88ea522845b838ba0d1e97b
X-Patchwork-Hint: ignore
Message-Id: <20220526080925.CFC3C864D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libarchive:
 security bump to version 3.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb62363012653011a88ea522845b838ba0d1e97b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

- 7zip reader: fix PPMD read beyond boundary (#1671)
- ZIP reader: fix possible out of bounds read (OSS-Fuzz 38766 #1672)
- ISO reader: fix possible heap buffer overflow in read_children() (OSS-Fuzz 38764, #1685)
- RARv4 redaer: fix multiple issues in RARv4 filter code (introduced in libarchive 3.6.0)
  - fix heap use after free in archive_read_format_rar_read_data() (OSS-Fuzz 44547, 52efa50)
  - fix null dereference in read_data_compressed() (OSS-Fuzz 44843, 1271f77)
  - fix heap user after free in run_filters() (OSS-Fuzz 46279, #1715)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a33130d964af5ca07315f118dca7964c38b13f4d)
[Peter: adjust commit message to make it clear that this is a security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libarchive/libarchive.hash | 2 +-
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 5dd8e5c167..ca580b4977 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  5cac725dd4be31c4a10b65d30f29dc957ea29ef3d758df6e46e8ae90a996a19a  libarchive-3.5.3.tar.xz
+sha256  5a411aceb978f43e626f0c2d1812ddd8807b645ed892453acabd532376c148e6  libarchive-3.6.1.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index cf16c27e67..865f605e2f 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.5.3
+LIBARCHIVE_VERSION = 3.6.1
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
