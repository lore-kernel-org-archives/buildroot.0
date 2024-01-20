Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7F1C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FEFA4046B;
	Sat, 20 Jan 2024 23:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FEFA4046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n52TLSCQJ7pU; Sat, 20 Jan 2024 23:13:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4520C40A8B;
	Sat, 20 Jan 2024 23:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4520C40A8B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 806111BF27E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F9F40A8B
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57F9F40A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aHRIkOByPhsN for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:13:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 846D24046B
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 846D24046B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D96986356; Sat, 20 Jan 2024 23:13:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 00:11:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69ff7d8ed2a3befae3e1291739153c2344d82083
X-Git-Newrev: 5159c5c730dc490aced7bc17477f951786f4c405
X-Patchwork-Hint: ignore
Message-Id: <20240120231311.6D96986356@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: fix NLS build
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

commit: https://git.buildroot.net/buildroot/commit/?id=5159c5c730dc490aced7bc17477f951786f4c405
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following NLS build failure on musl raised commit
bf9583a50276f52edbc37d9f85df5f2cc7fdb5dc:

/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/mips64el-buildroot-linux-musl/13.2.0/../../../../mips64el-buildroot-linux-musl/bin/ld: discover/pb_discover-pb-discover.o: undefined reference to symbol 'libintl_textdomain'

Fixes:
 - http://autobuild.buildroot.org/results/6d440d96e811674041b5a1fdae96d4c377824c2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
