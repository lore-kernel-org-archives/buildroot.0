Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0407DC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6852820A1;
	Sun, 18 May 2025 14:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AM5bUPb9nLIE; Sun, 18 May 2025 14:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D78F582102
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D78F582102;
	Sun, 18 May 2025 14:48:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17116DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FD3C60AB4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JLz77khPaw9 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E841360D73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E841360D73
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4B75869F5; Sun, 18 May 2025 14:47:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:08:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f520ab6aaace2901aaee6268aeba2f44206df18a
X-Git-Newrev: fcdfc1256dba46373694919e7d8d2fba48f33936
X-Patchwork-Hint: ignore
Message-Id: <20250518144710.E4B75869F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libqrencode: fix
 the _SITE package download url
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fcdfc1256dba46373694919e7d8d2fba48f33936
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The qrencode release archive is no longer distributed at [1].
This url now shows a HTTP/404 not found error.

The qrencode homepage [2] states:
"You can download the source packages at Releases[3] page at GitHub."

This commit updates the package download url to use github. The github
archive is not the same as the old release archive: it does not
contain the autotools configure script. For this reason, the hash
archive is updated and "_AUTORECONF = YES" is also added.

This commit also fixes the zbar runtime test [4] which is using
libqrencode to generate a qrcode to test zbar.

Fixes: [4]

[1] http://fukuchi.org/works/qrencode/qrencode-4.1.1.tar.gz
[2] https://fukuchi.org/en/works/qrencode/
[3] https://github.com/fukuchi/libqrencode/releases
[4] https://gitlab.com/buildroot.org/buildroot/-/jobs/9774022888

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 763971cfe3235ede53c6455aa26eb671c51809cb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libqrencode/libqrencode.hash | 4 ++--
 package/libqrencode/libqrencode.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libqrencode/libqrencode.hash b/package/libqrencode/libqrencode.hash
index ffcc537379..4586159420 100644
--- a/package/libqrencode/libqrencode.hash
+++ b/package/libqrencode/libqrencode.hash
@@ -1,5 +1,5 @@
-# From http://fukuchi.org/works/qrencode/qrencode-4.1.1.tar.gz.sha
-sha512  209bb656ae3f391b03c7b3ceb03e34f7320b0105babf48b619e7a299528b8828449e0e7696f0b5db0d99170a81709d0518e34835229a748701e7df784e58a9ce  qrencode-4.1.1.tar.gz
+# Locally computed:
+sha256  5385bc1b8c2f20f3b91d258bf8ccc8cf62023935df2d2676b5b67049f31a049c  libqrencode-4.1.1.tar.gz
 
 # Hash for license file:
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
index 0062a96a39..8698d88611 100644
--- a/package/libqrencode/libqrencode.mk
+++ b/package/libqrencode/libqrencode.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 LIBQRENCODE_VERSION = 4.1.1
-LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
-LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
+LIBQRENCODE_SITE = $(call github,fukuchi,libqrencode,v$(LIBQRENCODE_VERSION))
 LIBQRENCODE_DEPENDENCIES = host-pkgconf
 LIBQRENCODE_INSTALL_STAGING = YES
 LIBQRENCODE_LICENSE = LGPL-2.1+
 LIBQRENCODE_LICENSE_FILES = COPYING
+LIBQRENCODE_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBQRENCODE_CONF_ENV += LIBS='-pthread'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
