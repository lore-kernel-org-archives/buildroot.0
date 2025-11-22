Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BBCCFC51F
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 17:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2384821C4;
	Sat, 22 Nov 2025 17:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQere4Myx2fA; Sat, 22 Nov 2025 17:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C3E821C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C3E821C6;
	Sat, 22 Nov 2025 17:30:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7625B34E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C2624018D
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LxS89P0u8fT for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 17:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5786400F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5786400F8
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:30:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 940F285E4F; Sat, 22 Nov 2025 17:30:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 18:29:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0eab434cb00d615cc4e5999db6ff1f59104de48b
X-Git-Newrev: 37fc95c90a8d519866450c1b4b5c56207785c152
X-Patchwork-Hint: ignore
Message-Id: <20251122173006.940F285E4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fio: link with -latomic if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=37fc95c90a8d519866450c1b4b5c56207785c152
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream commit http://git.kernel.dk/cgit/fio/commit/?h=fio-3.41&id=a9ba7cef70a7fc99d406addbdc6479f633d01ec7
which was first included in version 3.41 and bumped in buildroot with
commit 215133c0fc2819f059fbb35071ab2e0987f5107d added use of atomic
functions causing build errors which are fixed by linking to libatomic.

Fixes:
https://autobuild.buildroot.net/results/c74/c74529b5a3800af269b6819af3cc742ba348d5fe/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fio/fio.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index cb456587b0..38e7aa7967 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -11,6 +11,11 @@ FIO_LICENSE_FILES = COPYING MORAL-LICENSE
 
 FIO_OPTS = --disable-native --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)"
 
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+FIO_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
 FIO_DEPENDENCIES += libaio
 endif
@@ -36,7 +41,7 @@ FIO_DEPENDENCIES += zlib
 endif
 
 define FIO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) ./configure $(FIO_OPTS))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(FIO_CONF_ENV) ./configure $(FIO_OPTS))
 endef
 
 define FIO_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
