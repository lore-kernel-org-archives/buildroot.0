Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DC2C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 09:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEBB0419DC;
	Sun,  4 Feb 2024 09:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEBB0419DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fcUOpJDBNmZf; Sun,  4 Feb 2024 09:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD6D5419D6;
	Sun,  4 Feb 2024 09:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD6D5419D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 310B71BF34B
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 09:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16E4585061
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 09:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E4585061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXE754unJ1dH for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 09:06:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3932B85039
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 09:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3932B85039
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FA6C867B7; Sun,  4 Feb 2024 09:06:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 10:03:18 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 7750b558a8c8795c8d41f28b9541cc57fa9e0335
X-Git-Newrev: 70ab59e19895eb94083bd43fef32ee0bba31156b
X-Patchwork-Hint: ignore
Message-Id: <20240204090648.1FA6C867B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/petitboot: fix
 NLS build
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

commit: https://git.buildroot.net/buildroot/commit/?id=70ab59e19895eb94083bd43fef32ee0bba31156b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following NLS build failure on musl raised commit
bf9583a50276f52edbc37d9f85df5f2cc7fdb5dc:

/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/mips64el-buildroot-linux-musl/13.2.0/../../../../mips64el-buildroot-linux-musl/bin/ld: discover/pb_discover-pb-discover.o: undefined reference to symbol 'libintl_textdomain'

Fixes:
 - http://autobuild.buildroot.org/results/6d440d96e811674041b5a1fdae96d4c377824c2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5159c5c730dc490aced7bc17477f951786f4c405)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/petitboot/petitboot.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index c4eb20b44d..2087f01b09 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -7,10 +7,18 @@
 PETITBOOT_VERSION = 1.14
 PETITBOOT_SOURCE = petitboot-v$(PETITBOOT_VERSION).tar.gz
 PETITBOOT_SITE = https://github.com/open-power/petitboot/releases/download/v$(PETITBOOT_VERSION)
-PETITBOOT_DEPENDENCIES = elfutils ncurses udev host-bison host-flex lvm2
+PETITBOOT_DEPENDENCIES = \
+	elfutils \
+	ncurses \
+	udev \
+	host-bison \
+	host-flex \
+	lvm2 \
+	$(TARGET_NLS_DEPENDENCIES)
 PETITBOOT_LICENSE = GPL-2.0
 PETITBOOT_LICENSE_FILES = COPYING
 
+PETITBOOT_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 PETITBOOT_CONF_OPTS = \
 	--enable-crypt \
 	--enable-platform-auto \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
